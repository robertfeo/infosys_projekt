<template>
  <div>
    <div class='container header-btn m-0' style='--bs-columns: 2'>
      <div class='row justify-content-between'>
        <div class='col text-start p-0'>
          <h3>Property Details - #{{ propertyId }}</h3>
        </div>
        <div class='col text-end p-0'>
          <button class='btn btn-primary' type='button' @click='$emit(&apos;togglePropertyView&apos;)'>Edit property</button>
        </div>
      </div>
    </div>
    <div class='container text-left mx-0'>
      <div class='row'>
        <PropertyDetails :propertyId='propertyId' class='col-md-4 ps-0' />
        <OwnerDetails :propertyId='propertyId' class='col-md-4 ps-0' />
      </div>
    </div>
    <p>
      The following list contains all units for this property.
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
            Units
          </button>
        </h2>
        <div
            id='collapseOne'
            class='accordion-collapse collapse show'
            data-bs-parent='#accordionExample'
        >
          <div class='accordion-body'>
            <UnitTable :propertyId='propertyId' />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import UnitTable from '../components/tables/UnitTable.vue'
import PropertyDetails from '../components/details/PropertyDetails.vue'
import OwnerDetails from '../components/details/OwnerDetails.vue'

export default (await import('vue')).defineComponent({
  components: {
    UnitTable,
    PropertyDetails,
    OwnerDetails
  },
  props: {
    propertyId: {
      type: String,
      required: true
    }
  }
})
</script>

<style lang="scss" scoped></style>
