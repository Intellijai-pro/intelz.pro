<template>
    <form @submit="formSubmit">
      <div>
        <CardTitle title="App Configuration Settings" icon="fa-solid fa-sliders"></CardTitle>
      </div>
    


      <div class="form-group">
        <div class="d-flex justify-content-between align-items-center">
          <label class="form-label" for="category-enable_user_push_notification">{{ $t('setting_integration_page.lbl_enable_user_push_notification') }} </label>
          <div class="form-check form-switch">
            <input class="form-check-input" :true-value="1" :false-value="0" :value="is_user_push_notification" :checked="is_user_push_notification == 1 ? true : false" name="is_user_push_notification" id="category-is_user_push_notification" type="checkbox" v-model="is_user_push_notification" />
          </div>
        </div>
      </div>

      

      <div class="form-group">
        <div class="d-flex justify-content-between align-items-center">
          <label class="form-label" for="category-enable_chat_gpt">{{ $t('setting_integration_page.lbl_enable_chat_gpt') }} </label>
          <div class="form-check form-switch">
            <input class="form-check-input" :true-value="1" :false-value="0" :value="enable_chat_gpt" :checked="enable_chat_gpt == 1 ? true : false" name="enable_chat_gpt" id="category-enable_chat_gpt" type="checkbox" v-model="enable_chat_gpt" />
          </div>
        </div>
      </div>
      <div v-if="enable_chat_gpt == 1">
        <!-- <div class="form-group">
          <div class="d-flex justify-content-between align-items-center d-none">
            <label class="form-label" for="category-test_without_key">{{ $t('setting_integration_page.lbl_test_without_key') }} </label>
            <div class="form-check form-switch">
              <input class="form-check-input" :true-value="1" :false-value="0" :value="test_without_key" :checked="test_without_key == 1 ? true : false" name="test_without_key" id="category-test_without_key" type="checkbox" v-model="test_without_key" />
            </div>
          </div>
        </div> -->
        <div>
          <div class="form-group">
            <label class="form-label" for="category-chatgpt_key">{{ $t('setting_integration_page.key') }}</label>
            <input type="text" class="form-control" placeholder="ChatGPT key" v-model="chatgpt_key" id="chatgpt_key" name="chatgpt_key" :errorMessage="errors.chatgpt_key" :errorMessages="errorMessages.chatgpt_key" />
            <p class="text-danger" v-for="msg in errorMessages.chatgpt_key" :key="msg">{{ msg }}</p>
            <span class="text-danger">{{ errors.chatgpt_key }}</span>
          </div>
        </div>
      </div>

      
      <div class="form-group">
        <div class="d-flex justify-content-between align-items-center">
          <label class="form-label" for="enable_ads">{{ $t('setting_integration_page.enable_ads') }} </label>
          <div class="form-check form-switch">
            <input class="form-check-input" :true-value="1" :false-value="0" :value="enable_ads"
              :checked="enable_ads == 1 ? true : false" name="enable_ads" id="enable_ads"
              type="checkbox" v-model="enable_ads" />
          </div>
        </div>
      </div>
      <div v-if="enable_ads == 1" class="bg-body mt-3 px-5 py-4 mb-5">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group mb-0">
              <label class="form-label" for="interstitial_ad_id">{{ $t('setting_integration_page.lbl_interstitial_ad_id') }}</label>
              <input type="text" class="form-control" v-model="interstitial_ad_id" id="interstitial_ad_id"
                name="interstitial_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="native_ad_id">{{ $t('setting_integration_page.lbl_native_ad_id') }}</label>
              <input type="text" class="form-control" v-model="native_ad_id" id="native_ad_id"
                name="native_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="banner_ad_id">{{ $t('setting_integration_page.lbl_banner_ad_id') }}</label>
              <input type="text" class="form-control" v-model="banner_ad_id" id="banner_ad_id"
                name="banner_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="open_ad_id">{{ $t('setting_integration_page.lbl_open_ad_id') }}</label>
              <input type="text" class="form-control" v-model="open_ad_id" id="open_ad_id"
                name="open_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="rewarded_ad_id">{{ $t('setting_integration_page.lbl_rewarded_ad_id') }}</label>
              <input type="text" class="form-control" v-model="rewarded_ad_id" id="rewarded_ad_id"
                name="rewarded_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="rewardinterstitial_ad_id">{{ $t('setting_integration_page.lbl_rewardinterstitial_ad_id') }}</label>
              <input type="text" class="form-control" v-model="rewardinterstitial_ad_id" id="rewardinterstitial_ad_id"
                name="rewardinterstitial_ad_id" />
            </div>
          </div>

        </div>
      </div>

      <!-- ios adds -->
      <div class="form-group">
        <div class="d-flex justify-content-between align-items-center">
          <label class="form-label" for="enable_ios_ads">{{ $t('setting_integration_page.enable_ios_ads') }} </label>
          <div class="form-check form-switch">
            <input class="form-check-input" :true-value="1" :false-value="0" :value="enable_ios_ads"
              :checked="enable_ios_ads == 1 ? true : false" name="enable_ios_ads" id="enable_ios_ads"
              type="checkbox" v-model="enable_ios_ads" />
          </div>
        </div>
      </div>
      <div v-if="enable_ios_ads == 1" class="bg-body mt-3 px-5 py-4 mb-5">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group mb-0">
              <label class="form-label" for="ios_interstitial_ad_id">{{ $t('setting_integration_page.lbl_interstitial_ad_id') }}</label>
              <input type="text" class="form-control" v-model="ios_interstitial_ad_id" id="ios_interstitial_ad_id"
                name="ios_interstitial_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="ios_native_ad_id">{{ $t('setting_integration_page.lbl_native_ad_id') }}</label>
              <input type="text" class="form-control" v-model="ios_native_ad_id" id="ios_native_ad_id"
                name="ios_native_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="ios_banner_ad_id">{{ $t('setting_integration_page.lbl_banner_ad_id') }}</label>
              <input type="text" class="form-control" v-model="ios_banner_ad_id" id="ios_banner_ad_id"
                name="ios_banner_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="ios_open_ad_id">{{ $t('setting_integration_page.lbl_open_ad_id') }}</label>
              <input type="text" class="form-control" v-model="ios_open_ad_id" id="ios_open_ad_id"
                name="ios_open_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="ios_rewarded_ad_id">{{ $t('setting_integration_page.lbl_rewarded_ad_id') }}</label>
              <input type="text" class="form-control" v-model="ios_rewarded_ad_id" id="ios_rewarded_ad_id"
                name="ios_rewarded_ad_id" />
            </div>
          </div>

          <div class="col-md-6">
            <div class="form-group">
              <label class="form-label" for="ios_rewardinterstitial_ad_id">{{ $t('setting_integration_page.lbl_rewardinterstitial_ad_id') }}</label>
              <input type="text" class="form-control" v-model="ios_rewardinterstitial_ad_id" id="ios_rewardinterstitial_ad_id"
                name="ios_rewardinterstitial_ad_id" />
            </div>
          </div>

        </div>
      </div>



      <div class="form-group">
        <div class="d-flex justify-content-between align-items-center">
          <label class="form-label" for="enable_picsart">{{ $t('setting_integration_page.enable_picsart') }} </label>
          <div class="form-check form-switch">
            <input class="form-check-input" :true-value="1" :false-value="0" :value="enable_picsart"
              :checked="enable_picsart == 1 ? true : false" name="enable_picsart" id="enable_picsart"
              type="checkbox" v-model="enable_picsart" />
          </div>
        </div>
      </div>
      <div v-if="enable_picsart == 1" class="bg-body mt-3 px-5 py-4 mb-5">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group mb-0">
              <label class="form-label" for="picsart_key">{{ $t('setting_integration_page.lbl_picsart_key') }}</label>
              <input type="text" class="form-control" v-model="picsart_key" id="picsart_key"
                name="picsart_key" :errorMessage="errors.picsart_key"
                :errorMessages="errorMessages.picsart_key" />
              <p class="text-danger" v-for="msg in errorMessages.picsart_key" :key="msg">{{ msg }}</p>
              <span class="text-danger">{{ errors.picsart_key }}</span>
            </div>
          </div>
        </div>
      </div>

      <div class="form-group">
        <div class="d-flex justify-content-between align-items-center">
          <label class="form-label" for="enable_cutoutpro">{{ $t('setting_integration_page.enable_cutoutpro') }} </label>
          <div class="form-check form-switch">
            <input class="form-check-input" :true-value="1" :false-value="0" :value="enable_cutoutpro"
              :checked="enable_cutoutpro == 1 ? true : false" name="enable_cutoutpro" id="enable_cutoutpro"
              type="checkbox" v-model="enable_cutoutpro" />
          </div>
        </div>
      </div>
      <div v-if="enable_cutoutpro == 1" class="bg-body mt-3 px-5 py-4 mb-5">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group mb-0">
              <label class="form-label" for="cutoutpro_key">{{ $t('setting_integration_page.lbl_cutoutpro_key') }}</label>
              <input type="text" class="form-control" v-model="cutoutpro_key" id="cutoutpro_key"
                name="cutoutpro_key" :errorMessage="errors.cutoutpro_key"
                :errorMessages="errorMessages.cutoutpro_key" />
              <p class="text-danger" v-for="msg in errorMessages.cutoutpro_key" :key="msg">{{ msg }}</p>
              <span class="text-danger">{{ errors.cutoutpro_key }}</span>
            </div>
          </div>
        </div>
      </div>

      <!-- <div class="form-group">
        <div class="d-flex justify-content-between align-items-center">
          <label class="form-label" for="enable_gemini">{{ $t('setting_integration_page.enable_gemini') }} </label>
          <div class="form-check form-switch">
            <input class="form-check-input" :true-value="1" :false-value="0" :value="enable_gemini"
              :checked="enable_gemini == 1 ? true : false" name="enable_gemini" id="enable_gemini"
              type="checkbox" v-model="enable_gemini" />
          </div>
        </div>
      </div>
      <div v-if="enable_gemini == 1">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label for="gemini_key">{{ $t('setting_integration_page.lbl_gemini_key') }}</label>
              <input type="text" class="form-control" v-model="gemini_key" id="gemini_key"
                name="gemini_key" :errorMessage="errors.gemini_key"
                :errorMessages="errorMessages.gemini_key" />
              <p class="text-danger" v-for="msg in errorMessages.gemini_key" :key="msg">{{ msg }}</p>
              <span class="text-danger">{{ errors.gemini_key }}</span>
            </div>
          </div>
        </div>
      </div> -->


      <div class="form-check col-md-6 mb-5">
        <input class="form-check-input" type="radio" name="notification" v-model="notification" id="firebase_notification" value="firebase_notification"
          :checked="notification == 'firebase_notification'" />
        <label class="form-check-label" for="firebase_notification"> {{ $t('setting_integration_page.lbl_firebase_notification') }} </label>

        <div v-if="notification =='firebase_notification'" class="bg-body mt-3 px-5 py-4 mb-5">
          <div class="form-group mb-0">
            <label class="form-label" for="category-chatgpt_key">{{ $t('setting_integration_page.lbl_firebase_key') }}</label>
            <input type="text" class="form-control" v-model="firebase_key" id="firebase_key" name="firebase_key" :errorMessage="errors.firebase_key" :errorMessages="errorMessages.firebase_key" />
            <p class="text-danger" v-for="msg in errorMessages.firebase_key" :key="msg">{{ msg }}</p>
            <span class="text-danger">{{ errors.firebase_key }}</span>
          </div>
        </div>
      </div>

      <div class="form-group">
        <div class="d-flex justify-content-between align-items-center">
          <label class="form-label" for="in_app_purchase">{{ $t('setting_integration_page.enable_in_app_purchase') }} </label>
          <div class="form-check form-switch">
            <input class="form-check-input" :true-value="1" :false-value="0" :value="in_app_purchase"
              :checked="in_app_purchase == 1 ? true : false" name="in_app_purchase" id="in_app_purchase"
              type="checkbox" v-model="in_app_purchase" />
          </div>
        </div>
      </div>


    <div class="form-group">

      <div class="form-group  mt-3">
        <label class="form-label" for="category-chatgpt_key">{{ $t('setting_integration_page.lbl_daily_limit') }}</label>
        <input type="text" class="form-control" v-model="daily_limit" id="daily_limit" name="daily_limit" :errorMessage="errors.daily_limit" :errorMessages="errorMessages.daily_limit" />
        <p class="text-danger" v-for="msg in errorMessages.daily_limit" :key="msg">{{ msg }}</p>
        <span class="text-danger">{{ errors.daily_limit }}</span>
      </div>
     
    </div>
    
  
      <SubmitButton :IS_SUBMITED="IS_SUBMITED"></SubmitButton>
    </form>
  </template>
  <script setup>
  import { ref, watch } from 'vue'
  import CardTitle from '@/Setting/Components/CardTitle.vue'
  import * as yup from 'yup'
  import { useField, useForm } from 'vee-validate'
  import { STORE_URL, GET_URL } from '@/vue/constants/setting'
  import { useRequest } from '@/helpers/hooks/useCrudOpration'
  import { onMounted } from 'vue'
  import { createRequest } from '@/helpers/utilities'
  import SubmitButton from './Forms/SubmitButton.vue'
  import InputField from '@/vue/components/form-elements/InputField.vue'
  const { storeRequest } = useRequest()
  const IS_SUBMITED = ref(false)
  //  Reset Form
  const setFormData = (data) => {
    resetForm({
      values: {

        is_user_push_notification: data.is_user_push_notification || 0,
        enable_chat_gpt: data.enable_chat_gpt || 0,
        // test_without_key: data.test_without_key || 0,
        chatgpt_key: data.chatgpt_key || '',
        notification:data.notification ||'',
        firebase_key:data.firebase_key||'',
        enable_ads: data.enable_ads || 0,
        interstitial_ad_id: data.interstitial_ad_id || '',
        native_ad_id: data.native_ad_id || '',
        banner_ad_id: data.banner_ad_id || '',
        open_ad_id: data.open_ad_id || '',
        rewarded_ad_id: data.rewarded_ad_id || '',
        rewardinterstitial_ad_id: data.rewardinterstitial_ad_id || '',
        enable_ios_ads: data.enable_ios_ads || 0,
        ios_interstitial_ad_id: data.ios_interstitial_ad_id || '',
        ios_native_ad_id: data.ios_native_ad_id || '',
        ios_banner_ad_id: data.ios_banner_ad_id || '',
        ios_open_ad_id: data.ios_open_ad_id || '',
        ios_rewarded_ad_id: data.ios_rewarded_ad_id || '',
        ios_rewardinterstitial_ad_id: data.ios_rewardinterstitial_ad_id || '',
        enable_picsart: data.enable_picsart || 0,
        picsart_key: data.picsart_key || '',
        enable_cutoutpro: data.enable_cutoutpro || 0,
        cutoutpro_key: data.cutoutpro_key || '',
        // enable_gemini: data.enable_gemini || 0,
        // gemini_key: data.gemini_key || '',
        in_app_purchase: data.in_app_purchase || 0,
        daily_limit: data.daily_limit || '',
       
      }
    })
  }
  //validation
  const validationSchema = yup.object({
    chatgpt_key: yup.string().test('chatgpt_key', 'Must be a valid ChatGPT key', function (value) {
      if (this.parent.enable_chat_gpt == '1' && !value) {
        return false;
      }
      return true
    }),

    firebase_key: yup.string().test('firebase_key', 'Must be a valid Firebase API key', function (value) {
      if (this.parent.notification == 'firebase_notification' && !value) {
        return false;
      }
      return true
    }),

    picsart_key: yup.string().test('picsart_key', 'Picsart key is required', function (value) {
      if (this.parent.enable_picsart == '1' && !value) {
        return false;
      }
      return true
    }),

    cutoutpro_key: yup.string().test('cutoutpro_key', 'Cutoutpro key is required', function (value) {
      if (this.parent.enable_cutoutpro == '1' && !value) {
        return false;
      }
      return true
    }),

    // gemini_key: yup.string().test('gemini_key', 'Gemini key is required', function (value) {
    //   if (this.parent.enable_gemini == '1' && !value) {
    //     return false;
    //   }
    //   return true
    // }),
  })
  const { handleSubmit, errors, resetForm, validate } = useForm({validationSchema})
  const errorMessages = ref({})

  const { value: is_user_push_notification } = useField('is_user_push_notification')
  const { value: enable_chat_gpt } = useField('enable_chat_gpt')
  // const { value: test_without_key } = useField('test_without_key')
  const { value: chatgpt_key } = useField('chatgpt_key')
  const { value: notification } = useField('notification')
  const { value: firebase_key } = useField('firebase_key')
  const { value: enable_ads } = useField('enable_ads')
  const { value: interstitial_ad_id } = useField('interstitial_ad_id')
  const { value: native_ad_id } = useField('native_ad_id')
  const { value: banner_ad_id } = useField('banner_ad_id')
  const { value: open_ad_id } = useField('open_ad_id')
  const { value: rewarded_ad_id } = useField('rewarded_ad_id')
  const { value: rewardinterstitial_ad_id } = useField('rewardinterstitial_ad_id')
  const { value: enable_ios_ads } = useField('enable_ios_ads')
  const { value: ios_interstitial_ad_id } = useField('ios_interstitial_ad_id')
  const { value: ios_native_ad_id } = useField('ios_native_ad_id')
  const { value: ios_banner_ad_id } = useField('ios_banner_ad_id')
  const { value: ios_open_ad_id } = useField('ios_open_ad_id')
  const { value: ios_rewarded_ad_id } = useField('ios_rewarded_ad_id')
  const { value: ios_rewardinterstitial_ad_id } = useField('ios_rewardinterstitial_ad_id')
  const { value: enable_picsart } = useField('enable_picsart')
  const { value: picsart_key } = useField('picsart_key')
  const { value: enable_cutoutpro } = useField('enable_cutoutpro')
  const { value: cutoutpro_key } = useField('cutoutpro_key')
  // const { value: enable_gemini } = useField('enable_gemini')
  // const { value: gemini_key } = useField('gemini_key')
  const { value: in_app_purchase } = useField('in_app_purchase')
  const { value: daily_limit } = useField('daily_limit')
  
  watch(() => enable_chat_gpt.value, (value) => {
    if(value == '0') {
      chatgpt_key.value = ''
    }
  }, {deep: true})
  
  watch(() => notification.value, (value) => {

    if(value == 'onesignal_notification') {
      firebase_key.value = ''
    }
  }, {deep: true})

  watch(() => enable_ads.value, (value) => {
    if(value == '0') {
      interstitial_ad_id.value = ''
      native_ad_id.value = ''
      banner_ad_id.value = ''
      open_ad_id.value = ''
      rewarded_ad_id.value = ''
      rewardinterstitial_ad_id.value = ''
    }
  }, {deep: true})

  watch(() => enable_ios_ads.value, (value) => {
    if(value == '0') {
      ios_interstitial_ad_id.value = ''
      ios_native_ad_id.value = ''
      ios_banner_ad_id.value = ''
      ios_open_ad_id.value = ''
      ios_rewarded_ad_id.value = ''
      ios_rewardinterstitial_ad_id.value = ''
    }
  }, {deep: true})
  
  watch(() => enable_picsart.value, (value) => {
    if(value == '0') {
      picsart_key.value = ''
    }
  }, {deep: true})

  watch(() => enable_cutoutpro.value, (value) => {
    if(value == '0') {
      cutoutpro_key.value = ''
    }
  }, {deep: true})

  // watch(() => enable_gemini.value, (value) => {
  //   if(value == '0') {
  //     gemini_key.value = ''
  //   }
  // }, {deep: true})





  // message
  const display_submit_message = (res) => {
    IS_SUBMITED.value = false
    if (res.status) {
      window.successSnackbar(res.message)
    } else {
      window.errorSnackbar(res.message)
      errorMessages.value = res.errors
    }
  }
  
  //fetch data
  const data = [
    'is_user_push_notification',
    'enable_chat_gpt',
    // 'test_without_key',
    'chatgpt_key',
    'notification',
    'firebase_key',
    'enable_ads',
    'interstitial_ad_id',
    'native_ad_id',
    'banner_ad_id',
    'open_ad_id',
    'rewarded_ad_id',
    'rewardinterstitial_ad_id',
    'enable_ios_ads',
    'ios_interstitial_ad_id',
    'ios_native_ad_id',
    'ios_banner_ad_id',
    'ios_open_ad_id',
    'ios_rewarded_ad_id',
    'ios_rewardinterstitial_ad_id',
    'enable_picsart',
    'picsart_key',
    'enable_cutoutpro',
    'cutoutpro_key',
    // 'enable_gemini',
    // 'gemini_key',
    'in_app_purchase',
    'daily_limit'
   
  ]
  
 
  onMounted(() => {
    
    const customData = [
      ...data,

    ].join(",")
  
    createRequest(GET_URL(customData)).then((response) => {
      setFormData(response)
    })
  })
  
  //Form Submit
  const formSubmit = handleSubmit((values) => {
    IS_SUBMITED.value = true
    const newValues = {}
    Object.keys(values).forEach((key) => {
      if(values[key] !== '') {
        newValues[key] = values[key] || ''
      }

      console.log(newValues)
    })
    storeRequest({
      url: STORE_URL, 
      body: newValues
    }).then((res) => display_submit_message(res))
  })
  
  defineProps({
    label: { type: String, default: '' },
    modelValue: { type: String, default: '' },
    placeholder: { type: String, default: '' },
    errorMessage: { type: String, default: '' },
    errorMessages: { type: Array, default: () => [] }
  })
  </script>
  