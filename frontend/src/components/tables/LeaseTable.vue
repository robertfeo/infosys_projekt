<template>
  <div>
    <table class='table table-striped table-hover'>
      <thead>
      <tr>
        <th scope='col'>#</th>
        <th scope='col'>Start</th>
        <th scope='col'>End</th>
        <th scope='col'>Rent</th>
        <th v-if='!unitId' scope='col'>Street</th>
        <th v-if='!unitId' scope='col'>City</th>
        <th v-if='!unitId' scope='col'>Apartment</th>
        <th scope='col'>Tenant</th>
        <th scope='col'>Residents</th>
      </tr>
      </thead>
      <tbody v-if='!this.unitId'>
      <tr v-for='lease in leases' :key='lease.id' @click='redirectToProperty(lease.id)'>
        <th scope='row'>{{ lease.id }}</th>
        <td>{{ formattedDate(lease.startDate) }}</td>
        <td>{{ formattedDate(lease.endDate) }}</td>
        <td>{{ lease.rentAmount }} €</td>
        <td v-if='!unitId'>{{ lease.street }}</td>
        <td v-if='!unitId'>{{ lease.city }}</td>
        <td v-if='!unitId'>{{ lease.apartNo }}</td>
        <td>{{ lease.tenantName }}</td>
        <td>{{ lease.nrResidents }}</td>
      </tr>
      </tbody>
      <tbody v-else-if='this.unitId'>
      <tr v-for='lease in leases' :key='lease.lease_id' @click='redirectToProperty(lease.lease_id)'>
        <th scope='row'>{{ lease.lease_id }}</th>
        <td>{{ formattedDate(lease.startDate) }}</td>
        <td>{{ formattedDate(lease.endDate) }}</td>
        <td>{{ lease.rentAmount }} €</td>
        <td v-if='!unitId'>{{ lease.street }}</td>
        <td v-if='!unitId'>{{ lease.city }}</td>
        <td v-if='!unitId'>{{ lease.apartNo }}</td>
        <td>{{ lease.tenantName }}</td>
        <td>{{ lease.nrResidents }}</td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import {getAllLeases, getLeasesOfUnit} from '@/db-SDK'

export default {
  props: {
    unitId: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      leases: []
    }
  },
  async created() {
    try {
      if (this.unitId) {
        this.leases = await getLeasesOfUnit(this.unitId)
      } else {
        this.leases = await getAllLeases()
      }
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    redirectToProperty(leaseId) {
      this.$router.push(`/leases/${leaseId}`)
    }
  },
  computed: {
    formattedDate() {
      return (date) => {
        return new Date(date).toLocaleDateString('de-DE')
      }
    }
  }
}
</script>

<style lang="scss" scoped></style>
