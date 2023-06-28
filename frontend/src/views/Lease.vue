<template>
  <div>
    <nav aria-label='breadcrumb' style='--bs-breadcrumb-divider: &apos;>&apos;'>
      <ol class='breadcrumb'>
        <li class='breadcrumb-item'><a href='/'>Home</a></li>
        <li class='breadcrumb-item'><a href='/leases'>Leases</a></li>
        <li aria-current='page' class='breadcrumb-item active'>#{{ leaseId }}</li>
      </ol>
    </nav>
    <h3>Lease Details - #{{ leaseId }}</h3>
    <div class='container text-left mx-0'>
      <div class='row'>
        <LeaseDetails :leaseId='leaseId' class='col-md-4 ps-0' />
        <UnitDetails :unitId='unitId' class='col-md-4 ps-0' />
        <TenantDetails :leaseId='leaseId' class='col-md-4 ps-0' />
      </div>
    </div>
    <p>
      The following list contains all service charge settlements for this lease.
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
            <SCSTable :leaseId='leaseId' />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import SCSTable from '../components/tables/SCSTable.vue'
import UnitDetails from '../components/details/UnitDetails.vue'
import LeaseDetails from '../components/details/LeaseDetails.vue'
import TenantDetails from '../components/details/TenantDetails.vue'
import {getLeaseDetails} from '@/db-SDK'

export default (await import('vue')).defineComponent({
  components: {
    SCSTable,
    UnitDetails,
    LeaseDetails,
    TenantDetails
  },
  data() {
    return {
      leaseId: null,
      unitId: null
    }
  },
  async beforeMount() {
    try {
      this.leaseId = this.$route.params.leaseId

      const leases = await getLeaseDetails(this.leaseId)
      const lease = leases[0]
      this.unitId = lease.unit_id.toString()
    } catch (error) {
      console.error(error)
    }
  }
})
</script>

<style lang="scss" scoped></style>
