<template>
  <div>
    <h5>Tenant details</h5>
    <p v-if='lease !== null'>
      {{ lease.tenantName }}
      <br />
      Apartment No.: {{ lease.apartNo }}
      <br />
      {{ lease.street }}
      <br />
      {{ lease.zip }} {{ lease.city }}
    </p>
    <p v-else-if='lease === null'>
      Error:
      <br />
      Tenant details could
      <br />
      not be retrieved.
    </p>
  </div>
</template>

<script>
import {getLeaseDetails, getLeasesOfUnit} from '../../db-SDK'

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
      lease: null,
      property: null
    };
  },
  async created() {
    await this.fetchData();
  },
  watch: {
    unitId(newUnitId, oldUnitId) {
      if (newUnitId !== oldUnitId) {
        this.fetchData();
      }
    },
    leaseId(newLeaseId, oldLeaseId) {
      if (newLeaseId !== oldLeaseId) {
        this.fetchData();
      }
    }
  },
  methods: {
    async fetchData() {
      try {
        if (this.unitId && !this.leaseId) {
          const leases = await getLeasesOfUnit(this.unitId);
          const leaseToGet = leases[0];
          this.leaseId = leaseToGet.lease_id;
        }
        const lease = await getLeaseDetails(this.leaseId);
        this.lease = lease[0];
      } catch (error) {
        console.error(error);
      }
    }
  }
};

</script>


<style lang="scss" scoped></style>
