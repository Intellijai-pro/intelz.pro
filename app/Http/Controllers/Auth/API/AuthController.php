<?php

namespace App\Http\Controllers\Auth\API;

use App\Http\Controllers\Auth\Trait\AuthTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Resources\LoginResource;
use App\Http\Resources\RegisterResource;
use App\Http\Resources\SocialLoginResource;
use App\Models\User;
use App\Models\UserProfile;
use Auth;
use Hash;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Password;
use Modules\Subscriptions\Models\Plan;
use Modules\Subscriptions\Models\Subscription;
use Modules\Subscriptions\Models\SubscriptionTransactions;


class AuthController extends Controller
{
    use AuthTrait;

    public function register(Request $request)
    {

      
        $user = $this->registerTrait($request);
     
        $success['token'] = $user->createToken(setting('app_name'))->plainTextToken;
        $success['name'] = $user->name;

        $userResource = new RegisterResource($user);

        return $this->sendResponse($userResource, __('messages.register_successfull'));

     
    }

    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(LoginRequest $request)
    {
        $user = User::where('email', request('email'))->with('subscriptionPackage')->first();
 
        if ($user == null) {
            return response()->json(['status' => false, 'message' => __('messages.register_before_login')]);
        }
   
        if (Auth::attempt(['email' => request('email'), 'password' => request('password')])) {
            $user = Auth::user();
    
          
            if ($user->is_banned == 1 ) {
                return response()->json(['status' => false, 'message' => __('messages.login_error')]);
            }

            $user['api_token'] = $user->createToken(setting('app_name'))->plainTextToken;



            $loginResource = new LoginResource($user);
            $message = __('messages.user_login');

            return $this->sendResponse($loginResource, $message);
        } else {
            return $this->sendError(__('messages.not_matched'), ['error' => __('messages.unauthorised')], 200);
        }
    }

    public function socialLogin(Request $request)
    {

    
        $input = $request->all();


        if ($input['login_type'] === 'mobile') {
            $user_data = User::where('username', $input['username'])->where('login_type', 'mobile')->first();
        } else {
            $user_data = User::where('email', $input['email'])->first();
        }

     
        if ($user_data != null) {

            if (!isset($user_data->login_type) || $user_data->login_type == '') {
                if ($request->login_type === 'google') {
                    $message = __('validation.unique', ['attribute' => 'email']);
                } else {
                    $message = __('validation.unique', ['attribute' => 'username']);
                }

                return $this->sendError($message, 400);
            }
            $message = __('messages.login_success');
        } else {

            if ($request->login_type === 'google' ||$request->login_type === 'apple') {
                $key = 'email';
                $value = $request->email;
            } else {
                $key = 'username';
                $value = $request->username;
            }

            $trashed_user_data = User::where($key, $value)->whereNotNull('login_type')->withTrashed()->first();

            if ($trashed_user_data != null && $trashed_user_data->trashed()) {
                if ($request->login_type === 'google') {
                    $message = __('validation.unique', ['attribute' => 'email']);
                } else {
                    $message = __('validation.unique', ['attribute' => 'username']);
                }

                return $this->sendError($message, 400);
            }

            if ($request->login_type === 'mobile' && $user_data == null) {
                $otp_response = [
                    'status' => true,
                    'is_user_exist' => false,
                ];

                return $this->sendError($otp_response);
            }

            if ($request->login_type === 'mobile' && $user_data != null) {
                $otp_response = [
                    'status' => true,
                    'is_user_exist' => true,
                ];

                return $this->sendError($otp_response);
            }

            $password = !empty($input['accessToken']) ? $input['accessToken'] : $input['email'];

            $input['user_type'] = $request->user_type;
            $input['display_name'] = $input['first_name'] . ' ' . $input['last_name'];
            $input['password'] = Hash::make($password);
            $input['user_type'] = isset($input['user_type']) ? $input['user_type'] : 'user';
           
            $user = User::create($input);

            $usertype = $user->user_type;

            $user->assignRole($usertype);

            $user->save();

            $plan=Plan::where('identifier','free')->first();

            if($plan){
         
             $start_date = date('Y-m-d H:i:s');
     
             $end_date = $this->get_plan_expiration_date($start_date, $plan['type'],0, $plan['duration']);
     
             $status = config('constant.SUBSCRIPTION_STATUS.PENDING');
     
             $subscribed_plan_data = [
     
                 'plan_id' => $plan->id,
                 'user_id' => $user->id,
                 'start_date' => $start_date,
                 'end_date' => $end_date,
                 'status' => $status,
                 'amount' => $plan['amount'],
                 'name' => $plan['name'],
                 'identifier' => $plan['identifier'],
                 'type' => $plan['type'],
                 'duration' => $plan['duration'],
                 'plan_type' => $plan['planlimitation'],
     
             ];
     
            
             $result = Subscription::create($subscribed_plan_data);
             
             if ($result) {
                 $payment_data = [
                     'subscriptions_id' => $result->id,
                     'user_id' => $result->user_id,
                     'amount' => $result->amount,
                     'payment_status' => 'paid',
                     'payment_type' => 'free',
                     'transaction_id' => null,
                 ];
                 $payment = SubscriptionTransactions::create($payment_data);
            }
     
          if ($payment->payment_status == 'paid') {
             $result->status = config('constant.SUBSCRIPTION_STATUS.ACTIVE');
             $result->payment_id = $payment->id;
             $result->save();
     
             $user->is_subscribe = 1;
     
             $user->save(); 
     
           }

         }
     
            \Illuminate\Support\Facades\Artisan::call('view:clear');
            \Illuminate\Support\Facades\Artisan::call('cache:clear');
            \Illuminate\Support\Facades\Artisan::call('route:clear');
            \Illuminate\Support\Facades\Artisan::call('config:clear');
            \Illuminate\Support\Facades\Artisan::call('config:cache');

            if (!empty($input['profile_image'])) {
                $media = $user->addMediaFromUrl($input['profile_image'])->toMediaCollection('profile_image');
                $user->avatar = $media->getUrl();
            }
            $user_data = User::where('id', $user->id)->with('subscriptionPackage')->first();

            $message = trans('messages.save_form', ['form' => $input['user_type']]);
        }

        $user_data['api_token'] = $user_data->createToken('auth_token')->plainTextToken;

        $socialLogin = new SocialLoginResource($user_data);

        return $this->sendResponse($socialLogin, $message);
    }

    public function logout(Request $request)
    {

        $user = Auth::guard('sanctum')->user();

        if ($request->is('api*')) {
            $user->save();

            return response()->json(['status' => true, 'message' => __('messages.user_logout')]);
        }
    }

    public function forgotPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);

        // We will send the password reset link to this user. Once we have attempted
        // to send the link, we will examine the response then see the message we
        // need to show to the user. Finally, we'll send out a proper response.
        $response = Password::sendResetLink(
            $request->only('email')
        );
        $user = User::where('email', $request->email)->first();
        if ($user == null) {
            return $response == Password::RESET_LINK_SENT
                ? response()->json(['message' => __($response), 'status' => true], 200)
                : response()->json(['message' => __($response), 'status' => false], 200);
        }

        return $response == Password::RESET_LINK_SENT
            ? response()->json(['message' => __($response), 'status' => true], 200)
            : response()->json(['message' => __($response), 'status' => false], 400);
    }

    public function changePassword(Request $request)
    {
        $user = \Auth::user();
        $user_id = !empty($request->id) ? $request->id : $user->id;
        $user = User::where('id', $user_id)->first();
        if ($user == '') {
            return response()->json([
                'status' => false,
                'message' => __('messages.user_notfound'),
            ], 400);
        }

        $hashedPassword = $user->password;

        $match = Hash::check($request->old_password, $hashedPassword);

        $same_exits = Hash::check($request->new_password, $hashedPassword);

        if($match){
            if ($same_exits) {
                $message = __('messages.old_new_pass_same');

                return response()->json([
                    'status' => false,
                    'message' => __('messages.same_pass'),
                ], 400);
            }

            $user->fill([
                'password' => Hash::make($request->new_password),
            ])->save();

            $success['api_token'] = $user->createToken(setting('app_name'))->plainTextToken;
            $success['name'] = $user->name;
            $message =  __('messages.pass_successfull');

        }else{
           
            $success['name'] = $user->name;
            $message = __('messages.not_same');
         }

        return response()->json([
            'status' => true,
            'data' => $success,
            'message' => $message,
        ], 200);
    }

    public function updateProfile(Request $request)
    {
        $user = \Auth::user();
        if ($request->has('id') && !empty($request->id)) {
            $user = User::where('id', $request->id)->first();
        }
        if ($user == null) {

            return response()->json([
                'message' => __('messages.no_record'),
            ], 400);
        }
        $user->fill($request->all())->update();

        $user_data = User::find($user->id);
        if ($request->has('profile_image')) {

            $request->file('profile_image');

            storeMediaFile($user_data, $request->file('profile_image'), 'profile_image');
        }     

        $user_profile = UserProfile::where('user_id', $user->id)->first();


         if(!$user_profile) {
   
            $user_profile = new UserProfile();
            $user_profile->user_id = $user->id;
         }

     
        if ($request->has('expert')) {
            $user_profile->expert = $request->expert;
        }
        if ($request->has('about_self')) {
            $user_profile->about_self = $request->about_self;
        }
        if ($request->has('facebook_link')) {
            $user_profile->facebook_link = $request->facebook_link;
        }
        if ($request->has('instagram_link')) {
            $user_profile->instagram_link = $request->instagram_link;
        }
        if ($request->has('twitter_link')) {
            $user_profile->twitter_link = $request->twitter_link;
        }
        if ($request->has('dribbble_link')) {
            $user_profile->dribbble_link = $request->dribbble_link;
        }

        if($user_profile !=''){

            $user_profile->save();
   
         }

        $user_data->save();

        $message = __('messages.profile_update');
        $user_data['user_role'] = $user->getRoleNames();
        $user_data['profile_image'] = $user->profile_image;

        $user_data['about_self'] = $user->profile->about_self ?? null;
        $user_data['expert'] = $user->profile->expert ?? null;
        $user_data['facebook_link'] = $user->profile->facebook_link ?? null;
        $user_data['instagram_link'] = $user->profile->instagram_link ?? null;
        $user_data['twitter_link'] = $user->profile->twitter_link ?? null;
        $user_data['dribbble_link'] = $user->profile->dribbble_link ?? null;

        unset($user_data['roles']);
        unset($user_data['media']);

        return response()->json([
            'status' => true,
            'data' => $user_data,
            'message' => $message,
        ], 200);
    }

    public function userDetails(Request $request)
    {
        $userID = $request->id;
        $user = User::find($userID);
        $user['about_self'] = $user->profile->about_self ?? null;
        $user['expert'] = $user->profile->expert ?? null;
        $user['facebook_link'] = $user->profile->facebook_link ?? null;
        $user['instagram_link'] = $user->profile->instagram_link ?? null;
        $user['twitter_link'] = $user->profile->twitter_link ?? null;
        $user['dribbble_link'] = $user->profile->dribbble_link ?? null;

        if (!$user) {
            return response()->json(['status' => false, 'message' => __('messages.user_notfound')], 404);
        }

        return response()->json(['status' => true, 'data' => $user, 'message' => __('messages.user_details_successfull')]);
    }

    public function deleteAccount(Request $request)
    {
        $user_id = \Auth::user()->id;
        $user = User::where('id', $user_id)->first();
        if ($user == null) {
            $message = __('messages.user_not_found');

            return response()->json([
                'status' => false,
                'message' => $message,
            ], 200);
        }
        
        $user->forceDelete();
        $message = __('messages.delete_account');

        return response()->json([
            'status' => true,
            'message' => $message,
        ], 200);
    }
}
