<template>
  <CardTitle title="Currency Setting" icon="fa fa-dollar fa-lg mr-2">
    <button class="btn btn-primary d-flex align-items-center gap-1" data-bs-toggle="modal" data-bs-target="#exampleModal" aria-controls="exampleModal" @click="changeId(0)"><i class="icon-add-new"></i>{{  $t('messages.new') }}</button>
  </CardTitle>
  <CurrencyFormOffCanvas :id="tableId" @onSubmit="fetchTableData()"></CurrencyFormOffCanvas>
  <div class="table-responsive">
    <table class="table table-condense">
      <thead>
        <tr>
          <th>{{ $t('currency.lbl_ID') }}</th>
          <th>{{ $t('currency.lbl_currency_name') }}</th>
          <th>{{ $t('currency.lbl_currency_symbol') }}</th>
          <th>{{ $t('currency.lbl_currency_code') }}</th>
          <th>{{ $t('currency.lbl_is_primary') }}</th>
          <th>{{ $t('currency.lbl_action') }}</th>
        </tr>
      </thead>
      <template v-if="tableList !== null && tableList.length !== 0">
        <tbody>
          <tr v-for="(currency, index) in tableList" :key="index">
            <th>{{ index + 1 }}</th>
            <th>{{ currency.currency_name }}</th>
            <th>{{ currency.currency_symbol }}</th>
            <th>{{ currency.currency_code }}</th>
            <th>
              <span v-if="currency.is_primary" class="badge bg-soft-success py-2 px-3">Default</span>
              <span v-else class="badge bg-danger">-</span>
            </th>
            <th>
              <button type="button" class="fs-4 text-primary border-0 bg-transparent me-2" data-bs-toggle="modal" data-bs-target="#exampleModal" @click="changeId(currency.id)" aria-controls="exampleModal"><i class="ph ph-pencil-simple"></i></button>
              <button type="button" class="fs-4 text-danger border-0 bg-transparent" @click="destroyData(currency.id, 'Are you certain you want to delete it?')" data-bs-toggle="tooltip"><i class="ph ph-trash"></i></button>
            </th>
          </tr>
        </tbody>
      </template>
      <template v-else>
        <!-- Render message when tableList is null or empty -->
        <tr class="text-center">
          <td colspan="9" class="py-3">Data is not available in this Table</td>
        </tr>
      </template>
    </table>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import CardTitle from '@/Setting/Components/CardTitle.vue'
import CurrencyFormOffCanvas from './Forms/CurrencyFormOffCanvas.vue'
import { LISTING_URL, DELETE_URL } from '@/vue/constants/currency'
import { useRequest } from '@/helpers/hooks/useCrudOpration'
import { confirmSwal } from '@/helpers/utilities'
import SubmitButton from './Forms/SubmitButton.vue'
const tableId = ref(null)
const changeId = (id) => {
  tableId.value = id
}

// Request
const { getRequest, deleteRequest } = useRequest()

onMounted(() => {
  fetchTableData()
})

// Define variables
const tableList = ref(null)

// fetch all data
const fetchTableData = () => {
  getRequest({ url: LISTING_URL }).then((res) => {
    if (res.status) {
      tableList.value = res.data
      tableId.value = 0
    }
  })
}

// destroy data
const destroyData = (id, message) => {
  confirmSwal({ title: message }).then((result) => {
    if (!result.isConfirmed) return
    deleteRequest({ url: DELETE_URL, id }).then((res) => {
      if (res.status) {
        Swal.fire({
          title: 'Deleted',
          text: res.message,
          icon: 'success'
        })
        fetchTableData()
      }
    })
  })
}
</script>
