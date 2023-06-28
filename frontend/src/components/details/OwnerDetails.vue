<template>
  <div>
    <h5>Owner details</h5>
    <p v-if='property !== null'>
      {{ property.ownerName }}
      <br />
      {{ property.ownerStreet }}
      <br />
      {{ property.ownerZip }} {{ property.ownerCity }}
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
import {getPropertiesDetails} from '../../db-SDK'

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
        const properties = await getPropertiesDetails(propertyId)
        this.property = properties[0]
      } catch (error) {
        console.error(error)
      }
    }
  }
}
</script>

<style lang="scss" scoped></style>
