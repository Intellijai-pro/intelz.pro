<template>
  <form @submit="formSubmit">
    <div class="col-md-12 d-flex justify-content-between">
      <CardTitle title="Language Settings" icon="fa fa-language"></CardTitle>
       <button type="submit" class="btn btn-primary d-flex align-items-center gap-1 float-right">Save<i class="ph ph-floppy-disk"></i></button>
    </div>

    <div class="mt-3">
      <div class="row row-cols-1 row-cols-md-2">
        <div class="col">
          <label class="form-label">{{ $t('setting_language_page.lbl_language') }}<span class="text-danger">*</span></label>
          <Multiselect id="language_id" v-model="language_id" v-bind="singleSelectOption" :options="language.options" @select="languageSelect" class="form-group"></Multiselect>
          <span class="text-danger">{{ errors.language_id }}</span>
        </div>
        <div class="col mt-md-0 mt-3">
          <label class="form-label">{{ $t('setting_language_page.lbl_file') }}<span class="text-danger">*</span></label>
          <Multiselect id="file_id" v-model="file_id" v-bind="languageFileOption" :options="file.options" @select="FileSelect" class="form-group"></Multiselect>
          <span class="text-danger">{{ errors.file_id }}</span>
        </div>
      </div>
    </div>

    <div class="container py-3 px-0" v-if="file_id !== '' && language_id !== ''" >
      <div class="row">
        <div class="col">
          <h6>
            <label class="form-label">{{ $t('setting_language_page.lbl_key') }}</label>
          </h6>
        </div>
        <div class="col">
          <h6>
            <label class="form-label">{{ $t('setting_language_page.lbl_value') }}</label>
          </h6>
        </div>
      </div>


        <div>
    <div v-for="item in lang_data" :key="item.key" class="row">
      <div class="col">
        <div class="form-group">
          <input type="text" class="form-control" :value="item.key" disabled />
        </div>
      </div>
      <div class="col">
        <div class="form-group">
          <input type="text" class="form-control" v-model="item.value" />
        </div>
      </div>
    </div>
  </div>


    </div>
  </form>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import CardTitle from '@/Setting/Components/CardTitle.vue'
import { LANGUAGE_LIST, LISTING_URL,STORE_URL,FILE_DATA_URL } from '@/vue/constants/language'
import { useRequest } from '@/helpers/hooks/useCrudOpration'
import { useSelect } from '@/helpers/hooks/useSelect'
import { useForm, useField } from 'vee-validate'
import { buildMultiSelectObject } from '@/helpers/utilities'
import InputField from '@/vue/components/form-elements/InputField.vue'
import * as yup from 'yup'
import SubmitButton from './Forms/SubmitButton.vue'

const singleSelectOption = ref({
  closeOnSelect: true,
  searchable: true,
  clearable: false
})

const languageFileOption = ref({
  searchable: true,
  createOption: true,
  clearable: false
})

const lang_data = ref([])

const { storeRequest, getRequest, listingRequest } = useRequest()

const validationSchema = yup.object({
  language_id: yup.string().required('Language is a required field'),
  file_id: yup.string().required('File is a required field')
})

const { handleSubmit, errors } = useForm({ validationSchema })

const { value: language_id } = useField('language_id')
const { value: file_id } = useField('file_id')

const language = ref([])

onMounted(() => {
  useSelect({ url: LANGUAGE_LIST }, { value: 'id', label: 'name' }).then((data) => (language.value = data))
})

const file = ref([])

const languageSelect = (e) => {
  const lanuageId = language_id.value

  listingRequest({ url: LISTING_URL, data: { language_id: lanuageId } }).then((res) => {

    file.value.options = buildMultiSelectObject(res, {
      value: 'id',
      label: 'name'
    })
  })
}


const FileSelect = (cb = null) => {

     const FileId = file_id.value
     const languageId = language_id.value

  listingRequest({ url: FILE_DATA_URL, data: {file_id: FileId, language_id: languageId} }).then((res) => {
   lang_data.value = res
    if (typeof cb == 'function') {
      cb()
    }
  })
}
//Form Submit
  const formSubmit = handleSubmit((values) => {

    const data = []
     for (let index = 0; index < lang_data.value.length; index++) {
       const element =lang_data.value[index]
       data.push({
        key: element.key,
        value: element.value
      })
    }

    values.data=data

    storeRequest({ url: STORE_URL, body: values }).then((res) => {
      if (res.status) {
        window.successSnackbar(res.message)
      }
    })
  })
</script>
<style>
.multiselect-clear-icon {
  display: none;
}
.form-control:disabled {
  background-color: #fff !important;
}
</style>
