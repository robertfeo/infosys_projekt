<template>
  <div>
    <table class='table table-striped table-hover'>
      <thead>
      <tr>
        <th scope='col'>Month</th>
        <th scope='col'>Tenant</th>
        <th scope='col'>Rent</th>
        <th scope='col'>Paid Rent</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for='rent in rents' :key='rent.Id'>
        <td>{{ rent.month }}</td>
        <td>{{ rent.tenantName }}</td>
        <td>{{ rent.rent }} €</td>
        <td>{{ rent.payedRent }} €</td>
      </tr>
      <tr>
        <td><strong>Total</strong></td>
        <td></td>
        <td>
          <strong>{{ totalRent }} €</strong>
        </td>
        <td>
          <strong>{{ totalPaidRent }} €</strong>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import {getRentForUnit} from '@/db-SDK'

export default {
  props: {
    unitId: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      rents: []
    }
  },
  computed: {
    totalRent() {
      return this.rents.reduce((total, rent) => total + rent.rent, 0).toFixed(2)
    },
    totalPaidRent() {
      return this.rents.reduce((total, rent) => total + rent.payedRent, 0).toFixed(2)
    }
  },
  async created() {
    try {
      this.rents = await getRentForUnit(this.unitId)
    } catch (error) {
      console.error(error)
    }
  }
}
</script>

<style lang="scss" scoped></style>
