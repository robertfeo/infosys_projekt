<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <div>
    <nav aria-label='breadcrumb' style='--bs-breadcrumb-divider: &apos;>&apos;'>
      <ol class='breadcrumb'>
        <li aria-current='page' class='breadcrumb-item active'>Home</li>
      </ol>
    </nav>
    <div class='img-div'>
      <img alt='' src='../assets/logo-square.png' />
    </div>
    <div class='container header-btn m-0 mb-3' style='--bs-columns: 2'>
      <div class='row justify-content-between'>
        <div class='col text-start p-0'>
          <h3>Your property manager</h3>
        </div>
      </div>
    </div>
    <p>
      This tool helps you to manage and automatically create service charge settlements from your
      account statement import.
    </p>
    <p>
      The following tables will give you an overview of all properties, leases and service charge
      settlements. For detailed information click items.
    </p>
    <div id='accordionExample' class='accordion'>
      <div class='accordion-item'>
        <h2 class='accordion-header'>
          <button
              aria-controls='collapseOne'
              aria-expanded='true'
              class='accordion-button'
              data-bs-target='#collapseOne'
              data-bs-toggle='collapse'
              type='button'
          >
            Properties
          </button>
        </h2>
        <div
            id='collapseOne'
            class='accordion-collapse collapse show'
            data-bs-parent='#accordionExample'
        >
          <div class='accordion-body'>
            <PropertyTable />
          </div>
        </div>
      </div>
      <div class='accordion-item'>
        <h2 class='accordion-header'>
          <button
              aria-controls='collapseTwo'
              aria-expanded='false'
              class='accordion-button collapsed'
              data-bs-target='#collapseTwo'
              data-bs-toggle='collapse'
              type='button'
          >
            Leases
          </button>
        </h2>
        <div
            id='collapseTwo'
            class='accordion-collapse collapse'
            data-bs-parent='#accordionExample'
        >
          <div class='accordion-body'>
            <LeaseTable />
          </div>
        </div>
      </div>
      <div class='accordion-item'>
        <h2 class='accordion-header'>
          <button
              aria-controls='collapseThree'
              aria-expanded='false'
              class='accordion-button collapsed'
              data-bs-target='#collapseThree'
              data-bs-toggle='collapse'
              type='button'
          >
            Service charge settlements
          </button>
        </h2>
        <div
            id='collapseThree'
            class='accordion-collapse collapse'
            data-bs-parent='#accordionExample'
        >
          <div class='accordion-body'>
            <SCSTable />
          </div>
        </div>
      </div>
    </div>
    <p><input accept='.csv' class='mt-4' type='file' @change='handleFileUpload' /></p>
    <p>
      <button :disabled='!fileSelected' class='btn btn-primary' type='button' @click='uploadData'>
        Import account statement
      </button>
      <a v-if='fileUploaded' class='ms-3 a'>File Uploaded</a>
    </p>
  </div>
</template>

<script>
import PropertyTable from '../components/tables/PropertyTable.vue'
import LeaseTable from '../components/tables/LeaseTable.vue'
import SCSTable from '../components/tables/SCSTable.vue'
import {createStage} from '@/db-SDK'

export default {
  components: {
    PropertyTable,
    LeaseTable,
    SCSTable
  },
  data() {
    return {
      file: null,
      jsonData: null,
      fileUploaded: false,
      fileSelected: false,
    }
  },
  methods: {
    handleFileUpload(event) {
      try {
        this.file = event.target.files[0]
        if (this.file) {
          this.fileSelected = true
        }
      } catch (error) {
        console.error(error)
      }
    },
    convertCSVtoJSON() {
      try {
        return new Promise((resolve, reject) => {
          const reader = new FileReader()

          reader.onload = () => {
            const lines = reader.result.split('\n')
            const jsonData = []

            for (let i = 1; i < lines.length; i++) {
              const values = lines[i].split(';')
              if (values.length >= 6) {
                const entry = {}

                const dateParts = values[0].split('.')
                const day = parseInt(dateParts[0])
                const month = parseInt(dateParts[1])
                const year = parseInt(dateParts[2])
                entry.bookingDay = new Date(year, month, day)

                entry.purpose = values[3]
                entry.payer = values[4]
                entry.payment = parseFloat(values[5].replace(',', '.'))

                jsonData.push(entry)
              } else {
                reject(new Error(`Invalid CSV format at line ${i + 1}`))

                return
              }
            }

            resolve(jsonData)
          }

          reader.onerror = (error) => {
            reject(error)
          }

          reader.readAsText(this.file)
        })
      } catch (error) {
        console.error(error)
      }
    },
    async uploadData() {
      try {
        const jsonArray = await this.convertCSVtoJSON()

        createStage(jsonArray)

        this.file = null
        this.jsonData = null

        this.fileUploaded = true;
      } catch (error) {
        console.error(error)
      }
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../styles/variables.scss';

.img-div {
  display: flex;
  justify-content: center;
  height: 150px;
  margin-bottom: 18px;
}

.a {
  color: $color-accent-2;
  text-decoration: none;
}
</style>
