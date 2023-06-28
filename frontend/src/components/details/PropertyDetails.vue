<template>
  <div>
    <h5>Property details</h5>
    <p v-if='property !== null'>
      {{ property.street }}
      <br />
      {{ property.zip }} {{ property.city }}
    </p>
    <p v-else-if='property === null'>
      Error:
      <br />
      Property details could
      <br />
      not be retrieved.
    </p>
  </div>
</template>

<script>
import {getPropertyById} from '../../db-SDK'

export default {
  props: {
    propertyId: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      property: null
    }
  },
  watch: {
    propertyId: {
      immediate: true,
      handler(newValue) {
        this.fetchPropertyDetails(newValue)
      }
    }
  },
  methods: {
    async fetchPropertyDetails(propertyId) {
      try {
        this.property = await getPropertyById(propertyId)
      } catch (error) {
        console.error(error)
      }
    }
  }
}
</script>

<style lang="scss" scoped></style>
