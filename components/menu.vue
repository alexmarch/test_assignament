<template>
    <a-menu theme="dark" mode="horizontal" :style="{ lineHeight: '64px' }" :default-selected-keys="['1']">
    <a-menu-item key="1">
       <NuxtLink to="/"> <a-icon type="table" /> Rules</NuxtLink>
    </a-menu-item>
    <a-menu-item key="2">
       <NuxtLink to="/soft-alarms"> <a-icon type="table" /> Soft Alarms</NuxtLink>
    </a-menu-item>
    <a-menu-item key="3">
      <NuxtLink to="/alarms"> <a-icon type="table" /> Alarms</NuxtLink>
    </a-menu-item>
  </a-menu>
</template>

<script>
export default {
  component: 'app-menu',
  data() {
    return {
      current: ['rules']
    }
  }
}
</script>
