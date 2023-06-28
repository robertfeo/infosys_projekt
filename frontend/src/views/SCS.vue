<template>
  <div>
    <nav aria-label='breadcrumb' style='--bs-breadcrumb-divider: &apos;>&apos;'>
      <ol class='breadcrumb'>
        <li class='breadcrumb-item'><a href='/'>Home</a></li>
        <li class='breadcrumb-item'><a href='/scs'>Service charge settlements</a></li>
        <li aria-current='page' class='breadcrumb-item active'>#{{ scsId }}</li>
      </ol>
    </nav>
    <div class='container header-btn m-0' style='--bs-columns: 2'>
      <div class='row justify-content-between'>
        <div class='col text-start p-0'>
          <h3 class=''>Service charge settlement - #{{ scsId }}</h3>
        </div>
        <div class='col text-end p-0'>
          <button class='btn btn-primary' type='button' @click='exportAsPDF'>
            Download service charge settlement
          </button>
        </div>
      </div>
    </div>
    <div class='container text-left mx-0'>
      <div class='row'>
        <TenantDetails :leaseId='leaseId' class='col-md-4 ps-0' />
        <UnitDetails :unitId='unitId' class='col-md-4 ps-0' />
      </div>
    </div>
    <p>
      The following list contains all service charges of the service charge settlement #{{ scsId }}.
    </p>
    <p></p>
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
            Service charges
          </button>
        </h2>
        <div
            id='collapseOne'
            class='accordion-collapse collapse show'
            data-bs-parent='#accordionExample'
        >
          <div class='accordion-body'>
            <SCTable :scsId='scsId' />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import html2pdf from 'html2pdf.js'
import SCTable from '../components/tables/SCTable.vue'
import UnitDetails from '../components/details/UnitDetails.vue'
import TenantDetails from '../components/details/TenantDetails.vue'
import {getAllServiceChargeSettlements, getLeaseDetails} from '../db-SDK'
import {generateHTMLContent} from '../reports/SCSReport'

export default {
  components: {
    SCTable,
    UnitDetails,
    TenantDetails
  },
  data() {
    return {
      scsId: null,
      unitId: null,
      leaseId: null
    }
  },
  async created() {
    try {
      this.scsId = this.$route.params.scsId

      const scss = await getAllServiceChargeSettlements()
      const scs = scss.find((scs) => scs.scs_id === this.scsId)
      this.leaseId = scs.lease_id

      const leases = await getLeaseDetails(this.leaseId)
      const lease = leases[0]
      this.unitId = lease.unit_id.toString()
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    async exportAsPDF() {
      const htmlContent = await generateHTMLContent(this.scsId)

      const options = {
        filename: 'report.pdf',
        html2canvas: {scale: 2},
        jsPDF: {format: 'a4', orientation: 'portrait', compressPDF: true}
      }
      html2pdf().set(options).from(htmlContent).save()
    }
  }
}
</script>

<style lang="scss" scoped></style>
