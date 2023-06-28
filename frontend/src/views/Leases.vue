<template>
  <div>
    <nav aria-label='breadcrumb' style='--bs-breadcrumb-divider: &apos;>&apos;'>
      <ol class='breadcrumb'>
        <li class='breadcrumb-item'><a href='/'>Home</a></li>
        <li aria-current='page' class='breadcrumb-item active'>Leases</li>
      </ol>
    </nav>
    <h3>Leases</h3>
    <p>
      The following list contains all leases for all properties and units.
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
            Leases
          </button>
        </h2>
        <div
            id='collapseOne'
            class='accordion-collapse collapse show'
            data-bs-parent='#accordionExample'
        >
          <div class='accordion-body'>
            <LeaseTable />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import LeaseTable from '../components/tables/LeaseTable.vue'

export default (await import('vue')).defineComponent({
  components: {
    LeaseTable
  }
})
</script>

<style lang="scss" scoped></style>
