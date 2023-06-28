<template>
  <div class='container header-btn m-0' style='--bs-columns: 2'>
    <div class='row justify-content-between'>
      <div class='col text-start p-0'>
        <h3>Add Property</h3>
      </div>
      <div class='col text-end p-0'>
        <button class='btn btn-primary me-2 w-25' type='button' @click='navigateBack'>Cancel</button>
        <button :disabled='!isPropertyFormComplete || !isOwnerFormComplete || !isUnitNotNull'
                class='btn btn-primary w-25' type='button'
                @click='handleSave'>
          Save
        </button>
      </div>
    </div>
  </div>
  <form>
    <div class='form-group'>
      <h4>Owner details</h4>
      <div class='row align-items-baseline'>
        <div class='form-check form-switch col-sm-3 ms-3'>
          <input id='ownerToggle' v-model='useExistingOwner' class='form-check-input' role='switch' type='checkbox'>
          <label class='form-check-label' for='ownerToggle'>Use Existing Owner</label>
        </div>
        <div class='col-sm-6'>
          <label for='existingOwner'>Registered owners:</label>
          <select id='existingOwner' v-model='selectedOwnerId' :disabled='!useExistingOwner' class='form-control'>
            <option v-for='owner in owners' :value='owner.id'>{{ owner.id }}: {{ owner.name }}</option>
          </select>
        </div>
      </div>
      <div>
        <div class='form-group'>
          <label for='newOwnerName'>Name:</label>
          <input id='newOwnerName' v-model='newOwner.name' :disabled='useExistingOwner' class='form-control'
                 type='text'>
        </div>
        <div class='form-group'>
          <label for='newOwnerStreet'>Street:</label>
          <input id='newOwnerStreet' v-model='newOwner.street' :disabled='useExistingOwner' class='form-control'
                 type='text'>
        </div>
        <div class='form-group'>
          <label for='newOwnerZip'>Zip:</label>
          <input id='newOwnerZip' v-model='newOwner.zip' :disabled='useExistingOwner' class='form-control'
                 type='number'>
        </div>
        <div class='form-group'>
          <label for='newOwnerCity'>City:</label>
          <input id='newOwnerCity' v-model='newOwner.city' :disabled='useExistingOwner' class='form-control'
                 type='text'>
        </div>
      </div>
    </div>
    <div class='mt-4'>
      <div class='form-group'>
        <h4>Property address</h4>
        <div class='form-group'>
          <label for='propertyStreet'>Street:</label>
          <input id='propertyStreet' v-model='newProperty.street' class='form-control' type='text'>
        </div>
        <div class='form-group'>
          <label for='propertyZip'>Zip:</label>
          <input id='propertyZip' v-model='newProperty.zip' class='form-control' type='number'>
        </div>
        <div class='form-group'>
          <label for='propertyCity'>City:</label>
          <input id='propertyCity' v-model='newProperty.city' class='form-control' type='text'>
        </div>
      </div>
    </div>
    <div class='mt-4'>
      <div class='form-group'>
        <h4>Units</h4>
        <div class='form-group row'>
          <div class='col-sm-3'>
            <label for='unitSize'>Size:</label>
            <input id='unitSize' v-model='newUnit.size' class='form-control' type='number'>
          </div>
          <div class='col-sm-3'>
            <label for='unitApartmentNo'>Apartment Number:</label>
            <input id='unitApartmentNo' v-model='newUnit.apartNo' class='form-control' type='number'>
          </div>
          <div class='col-sm-6'>
            <button :disabled='!isUnitFormComplete' class='btn btn-primary mt-4' type='button' @click='addUnit'>
              Create
              Unit
            </button>
          </div>
        </div>
        <div v-if='units.length > 0' class='mt-4'>
          <h4>Added units:</h4>
          <ul>
            <li v-for='unit in units' :key='unit.apartNo'>
              Apartment Number: {{ unit.apartNo }} - Size: {{ unit.size }}
              <span class='ml-2 text-danger' @click='removeUnit(unit)'>
                  <svg class='bi bi-x' fill='currentColor' height='16' viewBox='0 0 16 16' width='16'
                       xmlns='http://www.w3.org/2000/svg'>
                    <path
                        d='M4.354 4.354a.5.5 0 1 1 .708-.708L8 7.293l3.938-3.647a.5.5 0 0 1 .708.708L8.707 8l3.647 3.938a.5.5 0 1 1-.708.708L8 8.707l-3.938 3.647a.5.5 0 1 1-.708-.708L7.293 8 3.646 4.354a.5.5 0 0 1 .708-.708z' />
                  </svg>
                </span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </form>
</template>

<script>
import {createOwner, createProperty, createUnit, getOwners, getProperties} from "@/db-SDK";

export default (await import('vue')).defineComponent({
  data() {
    return {
      owners: [],
      newOwner: {
        name: "",
        street: "",
        city: "",
        zip: null,
      },
      newProperty: {
        street: "",
        zip: null,
        city: ""
      },
      newUnit: {
        size: null,
        apartNo: null
      },
      useExistingOwner: true,
      selectedOwnerId: null,
      units: [],
      isFormValid: false,
      ownerId: null,
      propertyId: null
    };
  },
  computed: {
    isOwnerFormComplete() {
      if (this.useExistingOwner) {
        return this.selectedOwner !== '';
      } else {
        return (
            this.newOwner.name !== '' &&
            this.newOwner.street !== '' &&
            this.newOwner.zip !== '' &&
            this.newOwner.city !== ''
        );
      }
    },
    isPropertyFormComplete() {
      return (
          this.newProperty.street !== '' &&
          this.newProperty.zip !== '' &&
          this.newProperty.city !== ''
      )
    },
    isUnitFormComplete() {
      return (
          this.newUnit.size !== null &&
          this.newUnit.apartNo !== null
      )
    },
    isUnitNotNull() {
      return this.units.length !== 0
    }
  },
  async created() {
    this.owners = await getOwners();
    this.selectedOwnerId = this.owners[0].id
  },
  methods: {
    async handleSave() {
      try {
        if (!this.useExistingOwner) {
          this.ownerId = await this.createOwner();
        } else {
          this.ownerId = this.selectedOwnerId;
        }
        this.propertyId = await this.createNewProperty()
        await this.createUnits()
        this.navigateBack();
      } catch (error) {
        console.error(error)
      }
    },
    navigateBack() {
      this.$emit('togglePropertiesView');
    },
    addUnit() {
      const existingUnit = this.units.find(unit => unit.apartNo === this.newUnit.apartNo);
      if (existingUnit) {
        console.log("Unit with the same apartNo already exists.");

        return;
      }

      const unit = {
        apartNo: this.newUnit.apartNo,
        size: this.newUnit.size
      };
      this.units.push(unit);

      this.newUnit.size = null;
      this.newUnit.apartNo = null;
    },
    removeUnit(unit) {
      const index = this.units.indexOf(unit);
      if (index > -1) {
        this.units.splice(index, 1);
      }
    },
    async createOwner() {
      try {
        await createOwner(this.newOwner);

        return this.findLastOwner()
      } catch (error) {
        console.error(error)
      }
    },
    async findLastOwner() {
      try {
        const owners = await getOwners();
        const owner = owners[owners.length - 1];

        return owner.id;
      } catch (error) {
        console.error(error);
      }
    },
    async createNewProperty() {
      try {
        const propertyToAdd = {}
        propertyToAdd.owner_id = this.ownerId
        propertyToAdd.street = this.newProperty.street
        propertyToAdd.city = this.newProperty.city
        propertyToAdd.zip = this.newProperty.zip

        await createProperty(propertyToAdd)

        return this.findLastProperty();
      } catch (error) {
        console.error(error)
      }
    },
    async findLastProperty() {
      try {
        const properties = await getProperties()
        const property = properties[properties.length - 1]

        return property.id
      } catch (error) {
        console.error(error)
      }
    },
    async createUnits() {
      try {
        for (const unit of this.units) {
          const unitToAdd = {}

          unitToAdd.property_id = this.propertyId
          unitToAdd.apartNo = unit.apartNo
          unitToAdd.size = unit.size

          await createUnit(unitToAdd)
        }
      } catch (error) {
        console.error(error)
      }
    },
  }
});
</script>

<style lang="scss" scoped>

</style>