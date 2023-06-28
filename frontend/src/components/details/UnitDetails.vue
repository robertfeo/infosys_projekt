<template>
  <div>
    <h5>Unit details</h5>
    <div v-if='property !== null && unit !== null'>
      <p>
        Apartment No.: {{ unit.apartNo }}
        <br />
        {{ property.street }}
        <br />
        {{ property.zip }} {{ property.city }}
      </p>
      <p>Size: {{ unit.size }}m<sup>2</sup></p>
    </div>
    <p v-else-if='property === null || unit === null'>
      Error:
      <br />
      Unit details could
      <br />
      not be retrieved.
    </p>
  </div>
</template>

<script>
import {getAllUnits, getLeaseDetails, getPropertyById} from '@/db-SDK'

export default {
  props: {
    unitId: {
      type: String,
      default: null
    },
    leaseId: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      unit: null,
      property: null
    }
  },
  async created() {
    try {
      await this.fetchData()
    } catch (error) {
      console.error(error)
    }
  },
  watch: {
    unitId(newUnitId, oldUnitId) {
      if (newUnitId !== oldUnitId) {
        this.fetchData()
      }
    },
    leaseId(newLeaseId, oldLeaseId) {
      if (newLeaseId !== oldLeaseId && !this.unitId) {
        this.fetchUnitIdFromLease()
      }
    }
  },
  async mounted() {
    if (!this.unitId && this.leaseId) {
      await this.fetchUnitIdFromLease()
    }
  },
  methods: {
    async fetchData() {
      try {
        const units = await getAllUnits()
        this.unit = units.find((unit) => unit.id.toString() === this.unitId)
        this.property = await getPropertyById(this.unit.property_id)
      } catch (error) {
        console.error(error)
      }
    },
    async fetchUnitIdFromLease() {
      try {
        const leases = await getLeaseDetails(this.leaseId)
        const lease = leases[0]
        this.unitId = lease.unit_id.toString()
      } catch (error) {
        console.error(error)
      }
    }
  }
}
</script>

<style lang="scss" scoped></style>
