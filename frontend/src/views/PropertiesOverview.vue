<template>
  <div>
    <div class='container header-btn m-0' style='--bs-columns: 2'>
      <div class='row justify-content-between'>
        <div class='col text-start p-0'>
          <h3>Properties</h3>
        </div>
        <div class='col text-end p-0'>
          <button class='btn btn-primary' type='button' @click='$emit(&apos;togglePropertiesView&apos;)'>Add new property</button>
        </div>
      </div>
    </div>
    <p>
      The following list contains all properties.
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
            Properties
          </button>
        </h2>
        <div
            id='collapseOne'
            class='accordion-collapse collapse show'
            data-bs-parent='#accordionExample'
        >
          <div class='accordion-body'>
            <PropertyTable />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import PropertyTable from '../components/tables/PropertyTable.vue'

export default (await import('vue')).defineComponent({
  components: {
    PropertyTable
  }
})
</script>

<style lang="scss" scoped></style>
