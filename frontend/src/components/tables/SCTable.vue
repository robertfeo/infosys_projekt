<template>
  <div>
    <table class='table table-striped table-hover'>
      <thead>
      <tr>
        <th scope='col'>#</th>
        <th scope='col'>Date</th>
        <th scope='col'>Amount</th>
        <th scope='col'>Type</th>
        <th scope='col'>Provider</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for='sc in scs' :key='sc.Id'>
        <th scope='row'>{{ sc.Id }}</th>
        <td>{{ formattedDate(sc.Date) }}</td>
        <td>{{ sc.Amount.toFixed(2) }} €</td>
        <td>{{ sc.Type }}</td>
        <td>{{ sc.ServiceProvider }}</td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import {getScofScss} from '@/db-SDK'

export default {
  props: {
    scsId: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      scs: []
    }
  },
  async created() {
    try {
      this.scs = await getScofScss(this.scsId)
    } catch (error) {
      console.error(error)
    }
  },
  computed: {
    formattedDate() {
      return (date) => {
        return new Date(date).toLocaleDateString('de-DE')
      }
    }
  }
}
</script>

<style lang="scss" scoped></style>
