<template>
  <a-layout>
    <a-layout-header class="header">
      <app-menu />
    </a-layout-header>
    <a-layout-content style="padding: 12px 50px">
      <Nuxt />
    </a-layout-content>
    <a-layout-footer>
      <p style="text-align: center">&copy; 2021</p>
    </a-layout-footer>
  </a-layout>
</template>

<script>
import menu from '../components/menu.vue'
export default {
  components: { 'app-menu': menu },
}
</script>
