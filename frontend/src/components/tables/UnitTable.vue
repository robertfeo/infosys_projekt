<template>
  <div>
    <table class='table table-striped table-hover'>
      <thead>
      <tr>
        <th scope='col'>#</th>
        <th scope='col'>Apartment No.</th>
        <th scope='col'>Size</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for='unit in this.units' :key='unit.unit_id' @click='redirectToUnit(unit.unit_id)'>
        <th scope='row'>{{ unit.unit_id }}</th>
        <td>{{ unit.apartNo }}</td>
        <td>{{ unit.size }} m<sup>2</sup></td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import {getPropertiesUnits} from '@/db-SDK'

export default {
  props: {
    propertyId: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      units: []
    }
  },
  async created() {
    try {
      this.units = await getPropertiesUnits(this.propertyId)
    } catch (error) {
      console.error(error)
    }
  },
  methods: {
    redirectToUnit(unitId) {
      this.$router.push(`/properties/${this.propertyId}/units/${unitId}`)
    }
  }
}
</script>

<style lang="scss" scoped></style>
