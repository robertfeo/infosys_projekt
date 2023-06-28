<template>
  <div>
    <nav aria-label='breadcrumb' style='--bs-breadcrumb-divider: &apos;>&apos;'>
      <ol class='breadcrumb'>
        <li class='breadcrumb-item'><a href='/'>Home</a></li>
        <li class='breadcrumb-item'><a href='/properties'>Properties</a></li>
        <li class='breadcrumb-item'>
          <a :href='`/properties/${propertyId}`'>#{{ propertyId }}</a>
        </li>
        <li class='breadcrumb-item'>
          <a>#{{ unitId }}</a>
        </li>
      </ol>
    </nav>
    <h3>Unit Details - #{{ unitId }}</h3>
    <div class='container text-left mx-0'>
      <div class='row'>
        <PropertyDetails :propertyId='propertyId' class='col-md-4 ps-0' />
        <UnitDetails :unitId='unitId' class='col-md-4 ps-0' />
      </div>
      <div class='row'>
        <OwnerDetails :propertyId='propertyId' class='col-md-4 ps-0' />
        <TenantDetails :unitId='unitId' class='col-md-4 ps-0' />
      </div>
    </div>
    <p>
      The following lists contain all leases and service charge settlements for this unit.
      <br />
      Click item to see details.
    </p>
    <div id='accordionExample' class='accordion'>
      <div class='accordion-item'>
        <h2 class='accordion-header'>
          <button
              aria-controls='collapseOne'
              aria-expanded='true'
              class='accordion-button collapsed'
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
          <LeaseTable :unitId='unitId' />
        </div>
      </div>
      <div class='accordion-item'>
        <h2 class='accordion-header'>
          <button
              aria-controls='collapseTwo'
              aria-expanded='false'
              class='accordion-button collapsed'
              data-bs-target='#collapseTwo'
              data-bs-toggle='collapse'
              type='button'
          >
            Service charge settlements
          </button>
        </h2>
        <div
            id='collapseTwo'
            class='accordion-collapse collapse'
            data-bs-parent='#accordionExample'
        >
          <SCSTable :unitId='unitId' />
        </div>
      </div>
      <div class='accordion-item'>
        <h2 class='accordion-header'>
          <button
              aria-controls='collapseThree'
              aria-expanded='false'
              class='accordion-button collapsed'
              data-bs-target='#collapseThree'
              data-bs-toggle='collapse'
              type='button'
          >
            Rent payments
          </button>
        </h2>
        <div
            id='collapseThree'
            class='accordion-collapse collapse'
            data-bs-parent='#accordionExample'
        >
          <RentTable :unitId='unitId' />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import LeaseTable from '../components/tables/LeaseTable.vue'
import SCSTable from '../components/tables/SCSTable.vue'
import RentTable from '../components/tables/RentTable.vue'
import PropertyDetails from '../components/details/PropertyDetails.vue'
import UnitDetails from '../components/details/UnitDetails.vue'
import OwnerDetails from '../components/details/OwnerDetails.vue'
import TenantDetails from '../components/details/TenantDetails.vue'

export default (await import('vue')).defineComponent({
  components: {
    LeaseTable,
    SCSTable,
    RentTable,
    PropertyDetails,
    UnitDetails,
    OwnerDetails,
    TenantDetails
  },
  data() {
    return {
      propertyId: null,
      unitId: null
    }
  },
  beforeMount() {
    try {
      this.propertyId = this.$route.params.propertyId
      this.unitId = this.$route.params.unitId
    } catch (error) {
      console.error(error)
    }
  }
})
</script>

<style lang="scss" scoped></style>
