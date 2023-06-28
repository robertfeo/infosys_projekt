<template>
  <div>
    <table class='table table-striped table-hover'>
      <thead>
      <tr>
        <th scope='col'>#</th>
        <th scope='col'>Year</th>
        <th scope='col'>Amount</th>
        <th scope='col'>Lease</th>
        <th scope='col'>Address</th>
        <th scope='col'>Tenant</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for='scs in scss' :key='scs.scs_id' @click='redirectToProperty(scs.scs_id)'>
        <th scope='row'>{{ scs.scs_id }}</th>
        <td>{{ scs.year }}</td>
        <td>{{ scs.totalAmount.toFixed(2) }} €</td>
        <td>{{ scs.lease_id }}</td>
        <td>{{ scs.street }} <br />{{ scss.city }}</td>
        <td>{{ scs.name }}</td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import {getAllServiceChargeSettlements, getLeasesOfUnit, getScssOfLease} from '@/db-SDK'

export default {
  props: {
    leaseId: {
      type: String,
      default: null
    },
    unitId: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      scss: []
    }
  },
  async created() {
    try {
      let leases = []

      if (this.unitId) {
        leases = await getLeasesOfUnit(this.unitId)
      }

      this.scss = await getAllServiceChargeSettlements()

      if (leases.length > 0) {
        this.scss = this.scss.filter(scs => {
          const matchingLease = leases.find(lease => lease.lease_id === scs.lease_id)

          return matchingLease !== undefined
        })
      }

      if (this.leaseId) {
        this.scss = await getScssOfLease(this.leaseId)
      }

    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    redirectToProperty(scsId) {
      this.$router.push(`/scs/${scsId}`)
    }
  }
}
</script>

<style lang="scss" scoped></style>
