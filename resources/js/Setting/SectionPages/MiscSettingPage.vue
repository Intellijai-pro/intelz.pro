<template>
  <form @submit="formSubmit">
    
    <CardTitle title="Misc Settings" icon="fa-solid fa-screwdriver-wrench"></CardTitle>

    <div class="row">
      <div class="col-md-4">
        <InputField :label="$t('setting_analytics_page.lbl_name')" placeholder="google analytics" v-model="google_analytics" :errorMessage="errors.google_analytics"></InputField>
      </div>
     
      <div class="col-md-4">
        <div class="form-group">
          <label class="form-label">{{ $t('setting_language_page.lbl_language') }}</label>
          <Multiselect id="default_language" v-model="default_language" :value="default_language" v-bind="singleSelectOption" :options="language.options" class="form-group"></Multiselect>
          <span class="text-danger">{{ errors.default_language }}</span>
        </div>
      </div>

      <div class="col-md-4">
        <div class="form-group">
          <label class="form-label">{{ $t('setting_language_page.lbl_timezone') }} <span class="badge bg-danger">Soon</span></label>
          <Multiselect id="default_time_zone" v-model="default_time_zone" :value="default_time_zone" v-bind="TimeZoneSelectOption" :options="timezone.options" class="form-group"></Multiselect>
          <span class="text-danger">{{ errors.default_time_zone }}</span>
        </div>
      </div>

      <div class="col-md-4">
        <label class="form-label">{{ $t('setting_language_page.lbl_data_table_limit') }}</label>
        <Multiselect id="data_table_limit" v-model="data_table_limit" :value="data_table_limit" v-bind="data_table_limit_data" class="form-group"></Multiselect>
        <span class="text-danger">{{ errors.data_table_limit }}</span>
      </div>
      <!-- <div class="col-md-4">
        <label class="form-label">{{ $t('setting_language_page.lbl_currency') }}</label>
        <Multiselect id="currency" v-model="default_currency" :value="default_currency" v-bind="currencyOption"   :options="currency.options" class="form-group"></Multiselect>
        <span class="text-danger">{{ errors.default_currency }}</span>
      </div> -->
    </div>
    <!-- <p>Time Zone</p>
      <p>Invoice Prefix</p>
      <p>Default Language</p>
      <p>Time Format</p> -->
    <div class="py-4">
      <SubmitButton :IS_SUBMITED="IS_SUBMITED"></SubmitButton>
    </div>
  </form>
</template>
<script setup>
import CardTitle from '@/Setting/Components/CardTitle.vue'
import InputField from '@/vue/components/form-elements/InputField.vue'
import { onMounted, ref } from 'vue'
import { useField, useForm } from 'vee-validate'
import { STORE_URL, GET_URL, TIME_ZONE_LIST,CURRENCY_LIST } from '@/vue/constants/setting'
import { useSelect } from '@/helpers/hooks/useSelect'
import { LANGUAGE_LIST, LISTING_URL } from '@/vue/constants/language'
import { createRequest, buildMultiSelectObject } from '@/helpers/utilities'
import { useRequest } from '@/helpers/hooks/useCrudOpration'

import SubmitButton from './Forms/SubmitButton.vue'



const IS_SUBMITED = ref(false)
const { storeRequest, listingRequest } = useRequest()


const singleSelectOption = ref({
  closeOnSelect: true,
  searchable: true,
  clearable: false
})
const language = ref([])
const timezone = ref([])
const currency= ref([])

const type = 'time_zone'

const getLanguageList = () => {
  useSelect({ url: LANGUAGE_LIST }, { value: 'id', label: 'name' }).then((data) => (language.value = data))
}
const getTimeZoneList = () => {
  listingRequest({ url: TIME_ZONE_LIST, data: { type: type } }).then((res) => {
    timezone.value.options = buildMultiSelectObject(res.results, {
      value: 'id',
      label: 'text'
    })
  })
}

const getCurrencyList = () => {
  useSelect({ url: CURRENCY_LIST }, { value: 'id', label: 'currency_code' }).then((data) => (currency.value = data))
}


const data_table_limit_data = ref({
  searchable: true,
  options: [
    { label: 5, value: 5 },
    { label: 10, value: 10 },
    { label: 15, value: 15 },
    { label: 20, value: 20 },
    { label: 25, value: 25 },
    { label: 50, value: 50 },
    { label: 100, value: 100 },
    { label: 'All', value: -1 }
  ],
  closeOnSelect: true,
  createOption: true
})

//  Reset Form
const setFormData = (data) => {
  resetForm({
    values: {
      google_analytics: data.google_analytics,
      default_language: data.default_language,
      default_time_zone: data.default_time_zone,
      data_table_limit: data.data_table_limit,
      default_currency:data.default_currency
      
    }
  })
}
const { handleSubmit, errors, resetForm } = useForm()
const errorMessage = ref(null)
const { value: google_analytics } = useField('google_analytics')
const { value: default_language } = useField('default_language')
const { value: default_time_zone } = useField('default_time_zone')
const { value: data_table_limit } = useField('data_table_limit')
const { value: default_currency } = useField('default_currency')

const data = 'google_analytics,default_language,default_time_zone,data_table_limit,default_currency'
onMounted(() => {
  createRequest(GET_URL(data)).then((response) => {
    setFormData(response)
  })

  getLanguageList()
  getTimeZoneList()
  getCurrencyList()
})

// message
const display_submit_message = (res) => {
  IS_SUBMITED.value = false
  if (res.status) {
    window.successSnackbar(res.message)
  } else {
    window.errorSnackbar(res.message)
  }
}
//Form Submit
const formSubmit = handleSubmit((values) => {
  IS_SUBMITED.value = true
  const newValues = {}
  Object.keys(values).forEach((key) => {
    newValues[key] = values[key] || ''
  })

  storeRequest({ url: STORE_URL, body: values }).then((res) => display_submit_message(res))
})
</script>
