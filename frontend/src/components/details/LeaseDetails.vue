<template>
  <div>
    <h5>Lease details</h5>
    <p v-if='lease !== null'>
      Start: {{ formattedDate(lease.startDate) }}
      <br />
      End: {{ formattedDate(lease.endDate) }}
      <br />
      Rent: {{ lease.rentAmount }}€
      <br />
      Residents: {{ lease.nrResidents }}
    </p>
    <p v-else-if='lease === null'>
      Error:
      <br />
      Lease details could
      <br />
      not be retrieved.
    </p>
  </div>
</template>

<script>
import {getLeaseDetails} from '../../db-SDK'

export default {
  props: {
    leaseId: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      lease: null
    }
  },
  async created() {
    try {
      const leases = await getLeaseDetails(this.leaseId)
      this.lease = leases[0]
    } catch (error) {
      console.error(error)
    }
  },
  computed: {
    formattedDate() {
      return (date) => {
        const formattedDate = new Date(date).toLocaleDateString('de-DE')

        return formattedDate
      }
    }
  }
}
</script>

<style lang="scss" scoped></style>
