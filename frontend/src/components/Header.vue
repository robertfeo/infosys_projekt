<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <nav class='navbar navbar-expand-lg navbar-light'>
    <div class='container-fluid'>
      <RouterLink style='text-decoration: none; color: inherit' to='/'>
        <a class='navbar-brand' href='#'>
          <img alt='' height='36' src='../assets/logo-horizontal-dark.png' />
        </a>
      </RouterLink>
      <button
          aria-controls='navbarSupportedContent'
          aria-expanded='false'
          aria-label='Toggle navigation'
          class='navbar-toggler'
          data-bs-target='#navbarSupportedContent'
          data-bs-toggle='collapse'
          type='button'
      >
        <span class='navbar-toggler-icon'></span>
      </button>
      <div id='navbarSupportedContent' class='collapse navbar-collapse'>
        <ul class='navbar-nav me-auto mb-2 mb-lg-0'>
          <li class='nav-item border-right'>
            <RouterLink style='text-decoration: none; color: inherit' to='/properties'>
              <a aria-current='page' class='nav-link'>Properties</a>
            </RouterLink>
          </li>
          <li class='nav-item border-right'>
            <RouterLink style='text-decoration: none; color: inherit' to='/leases'>
              <a aria-current='page' class='nav-link'>Leases</a>
            </RouterLink>
          </li>
          <li class='nav-item'>
            <RouterLink style='text-decoration: none; color: inherit' to='/scs'>
              <a aria-current='page' class='nav-link'>Service caharge settlements</a>
            </RouterLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
import {defineComponent} from 'vue'

export default defineComponent({
  components: {}
})
</script>

<style lang="scss" scoped>
@import '../styles/variables.scss';
@import '../styles/main.scss';

nav {
  background-color: $color-prime !important;
}

.navbar-nav .nav-link {
  margin-right: 3px;
  color: $color-secondary !important;
}

.border-right {
  border-right: 1px solid #d8d8d8;
}

.navbar-brand {
  color: $color-accent-1 !important;
  margin-left: 15px;
}

.navbar-brand > a:hover {
  background-color: #182747;
}

.navbar-toggler {
  background-color: white !important;
}
</style>
