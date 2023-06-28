<template>
  <div class='container header-btn m-0' style='--bs-columns: 2'>
    <div class='row justify-content-between'>
      <div class='col text-start p-0'>
        <h3>Edit Property - #{{ propertyId }}</h3>
      </div>
      <div class='col text-end p-0'>
        <button class='btn btn-primary me-2 w-25' type='button' @click='navigateBack'>Cancel</button>
        <button class='btn btn-primary w-25' type='button' @click='handleSave'>Save</button>
      </div>
    </div>
  </div>
  <form>
    <div class='form-group'>
      <h4>Owner details</h4>

      <div class='col-sm-6'>
        <label for='existingOwner'>Registered owners:</label>
        <select id='existingOwner' v-model='selectedOwnerId' class='form-control'>
          <option v-for='owner in owners' :value='owner.id'>{{ owner.id }}: {{ owner.name }}</option>
        </select>
      </div>
    </div>
    <div class='mt-4'>
      <div class='form-group'>
        <h4>Property address</h4>
        <div class='form-group'>
          <label for='propertyStreet'>Street:</label>
          <input id='propertyStreet' v-model='propertyToUpdate.street' class='form-control' type='text'>
        </div>
        <div class='form-group'>
          <label for='propertyZip'>Zip:</label>
          <input id='propertyZip' v-model='propertyToUpdate.zip' class='form-control' type='number'>
        </div>
        <div class='form-group'>
          <label for='propertyCity'>City:</label>
          <input id='propertyCity' v-model='propertyToUpdate.city' class='form-control' type='text'>
        </div>
      </div>
    </div>
  </form>
</template>

<script>
import {getOwnerById, getOwners, getPropertyById, updateProperty} from "@/db-SDK";

export default (await import('vue')).defineComponent({
  props: {
    propertyId: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      useExistingOwner: true,
      selectedOwnerId: null,
      owners: [],
      propertyToUpdate: {},
      propertiesOwner: {}
    }
  },
  async created() {
    this.propertyToUpdate = await getPropertyById(this.propertyId)
    this.owners = await getOwners();
    this.propertiesOwner = await getOwnerById(this.propertyToUpdate.owner_id)
    this.selectedOwnerId = this.propertyToUpdate.owner_id
  },
  methods: {
    async handleSave() {
      await this.updateProperty()
      this.navigateBack();
    },
    navigateBack() {
      this.$emit('togglePropertyView');
    },
    async updateProperty() {
      this.propertyToUpdate.owner_id = this.selectedOwnerId
      await updateProperty(this.propertyId, this.propertyToUpdate)
    }
  }
});
</script>

<style lang="scss" scoped>

</style>