<template>
  <div>
    <nav aria-label='breadcrumb' style='--bs-breadcrumb-divider: &apos;>&apos;'>
      <ol class='breadcrumb'>
        <li class='breadcrumb-item'><a href='/'>Home</a></li>
        <li aria-current='page' class='breadcrumb-item active'>Service charge settlements</li>
      </ol>
    </nav>
    <h3>Service charge settlements</h3>
    <p>
      The following list contains all service charge settlements.
      <br />
      Click item to see details.
    </p>
    <div id='accordionExample' class='accordion'>
      <div class='accordion-item'>
        <h2 class='accordion-header'>
          <button
              aria-controls='collapseOne'
              aria-expanded='true'
              class='accordion-button'
              data-bs-target='#collapseOne'
              data-bs-toggle='collapse'
              type='button'
          >
            Service charge settlements
          </button>
        </h2>
        <div
            id='collapseOne'
            class='accordion-collapse collapse show'
            data-bs-parent='#accordionExample'
        >
          <div class='accordion-body'>
            <SCSTable />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SCSTable from '../components/tables/SCSTable.vue'

export default (await import('vue')).defineComponent({
  components: {
    SCSTable
  }
})
</script>

<style lang="scss" scoped></style>
