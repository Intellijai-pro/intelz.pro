<?php

namespace App\Trait;

use App\Models\User;
use App\Jobs\BulkNotification;

trait DashboardTrait{


    public function sendNotificationOnrechargeReminder($type,$response){
        
        $data = mail_footer($type, $response);   

        $data['recharge'] = $response;
        
        BulkNotification::dispatch($data);
    }

}