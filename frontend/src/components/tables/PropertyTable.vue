<template>
  <div>
    <table class='table table-striped table-hover'>
      <thead>
      <tr>
        <th scope='col'>#</th>
        <th scope='col'>Owner</th>
        <th scope='col'>Street</th>
        <th scope='col'>City</th>
      </tr>
      </thead>
      <tbody>
      <tr
          v-for='property in properties'
          :key='property.id'
          @click='redirectToProperty(property.id)'
      >
        <th scope='row'>{{ property.id }}</th>
        <td>{{ property.ownerName }}</td>
        <td>{{ property.street }}</td>
        <td>{{ property.city }}</td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import {getAllProperties} from '@/db-SDK'

export default {
  data() {
    return {
      properties: [],
    }
  },
  async created() {
    try {
      this.properties = await getAllProperties()
    } catch (error) {
      console.error(error)
    }
  },
  methods: {

    redirectToProperty(propertyId) {
      this.$router.push(`/properties/${propertyId}`)
    }
  }
}
</script>

<style lang="scss" scoped></style>
