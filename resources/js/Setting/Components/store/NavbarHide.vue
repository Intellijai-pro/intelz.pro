<template>
  <div class="d-flex justify-content-between align-items-center">
    <h5 class="mt-4 mb-3">{{$t('setting_general_page.Navbar_Hide')}}</h5>
    <div class="form-check form-switch">
      <checkbox-input btn-name="navbar_show" type="switch" label-title="Mini" label-class="overflow-hidden p-0" id="navbar-hide" :value="store.setting.navbar_show.value == 'iq-navbar' ? 'iq-navbar-none' : 'iq-navbar'" @onChange="onUpdate"> </checkbox-input>
    </div>
  </div>
</template>
<script setup>
import {useSetting} from '@/store/index'
import CheckboxInput from '../store/elements/CheckboxInput.vue'
const store = useSetting()
console.log(store.setting.navbar_show.value)
const onUpdate = (value) => {
  store.navbar_show(value[0])
}
</script>
