<template>
    <form @submit="formSubmit">
      <div class="offcanvas offcanvas-end offcanvas-booking" tabindex="-1" id="form-offcanvas" aria-labelledby="form-offcanvasLabel">
        <FormHeader :currentId="currentId" :editTitle="editTitle" :createTitle="createTitle"></FormHeader>
        <div class="offcanvas-body">
  
          <InputField class="col-md-12" type="text" :is-required="true" :label="$t('service.lbl_name')" placeholder="" v-model="name" :error-message="errors['name']" :error-messages="errorMessages['name']"></InputField>
           
          <div class="form-group col-md-12">
              <label class="form-label" for="description">{{$t('service.lbl_description')}}</label>
              <textarea class="form-control" v-model="description" id="description"></textarea>
              <span v-if="errorMessages['description']">
                <ul class="text-danger">
                  <li v-for="err in errorMessages['description']" :key="err">{{ err }}</li>
                </ul>
              </span>
              <span class="text-danger">{{ errors.description }}</span>
        </div>
  
          <div class="form-group">
            <div class="d-flex justify-content-between align-items-center">
              <label class="form-label" for="category-status">{{ $t('pet.lbl_status') }}</label>
              <div class="form-check form-switch">
                <input class="form-check-input" :value="status" :checked="status" name="status" id="pet-status" type="checkbox" v-model="status" />
              </div>
            </div>
          </div>
        </div>
        <FormFooter></FormFooter>
      </div>
    </form>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue'
  import { EDIT_URL, STORE_URL, UPDATE_URL} from '../constant/servicetraining'
  import { useField, useForm } from 'vee-validate'
  import InputField from '@/vue/components/form-elements/InputField.vue'
  
  import { useModuleId, useRequest, useOnOffcanvasHide } from '@/helpers/hooks/useCrudOpration'
  import * as yup from 'yup'
  import flatPickr from 'vue-flatpickr-component'
  import 'flatpickr/dist/flatpickr.css'
  import { buildMultiSelectObject } from '@/helpers/utilities'
  import { readFile } from '@/helpers/utilities'
  import FormHeader from '@/vue/components/form-elements/FormHeader.vue'
  import FormFooter from '@/vue/components/form-elements/FormFooter.vue'
  import FormElement from '@/helpers/custom-field/FormElement.vue'
  
  // props
  const props = defineProps({
    createTitle: { type: String, default: '' },
    editTitle: { type: String, default: '' },
  })
  // const CURRENCY_SYMBOL = ref(window.defaultCurrencySymbol)
  const { getRequest, storeRequest, updateRequest, listingRequest } = useRequest()
  
  // onMounted(() => {
  
  //   setFormData(defaultData())
  // })
  
  
  // Edit Form Or Create Form
  const currentId = useModuleId(() => {
    if (currentId.value > 0) {
      getRequest({ url: EDIT_URL, id: currentId.value }).then((res) => res.status && setFormData(res.data))
    } else {
      setFormData(defaultData())
    }
  })
  
  /*
   * Form Data & Validation & Handeling
   */
  // Default FORM DATA
  const defaultData = () => {
    errorMessages.value = {}
    return {
      name: '',
      description: '',
      status: 1,
    }
  }
  
  //  Reset Form
  const setFormData = (data) => {
    resetForm({
      values: {
        name: data.name,
        description: data.description,
        status: data.status,
      }
    })
  }
  
  // Reload Datatable, SnackBar Message, Alert, Offcanvas Close
  const reset_datatable_close_offcanvas = (res) => {
    if (res.status) {
      window.successSnackbar(res.message)
      renderedDataTable.ajax.reload(null, false)
      bootstrap.Offcanvas.getInstance('#form-offcanvas').hide()
      setFormData(defaultData())
    } else {
      window.errorSnackbar(res.message)
      errorMessages.value = res.all_message
    }
  }
  
  
  const numberRegex = /^\d+$/
  const decimalRegex = /^\d+(\.\d+)?$/
  // Validations
  const validationSchema = yup.object({
    name: yup.string().required('name is a required field'),
      description:yup.string().test('no-script-tags', 'The Description field cannot contain script tags.', function(value) {
      const scriptTagRegex = /<script\b[^>]*>(.*?)/is;
      return !scriptTagRegex.test(value);
    }),
  })
  
  
  const { handleSubmit, errors, resetForm } = useForm({
    validationSchema
  })
  const { value: name } = useField('name')
  const { value: description } = useField('description')
  const { value: status } = useField('status')
  
  const errorMessages = ref({})
  
  onMounted(() => {
    setFormData(defaultData())
  })
  
  // Form Submit
  const formSubmit = handleSubmit((values) => {
    if (currentId.value > 0) {
      updateRequest({ url: UPDATE_URL, id: currentId.value, body: values, type: 'file' }).then((res) => reset_datatable_close_offcanvas(res))
    } else {
      storeRequest({ url: STORE_URL, body: values, type: 'file' }).then((res) => reset_datatable_close_offcanvas(res))
    }
  })
  
  
  useOnOffcanvasHide('form-offcanvas', () => setFormData(defaultData()))
  </script>
  