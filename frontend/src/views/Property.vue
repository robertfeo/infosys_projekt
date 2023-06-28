<template>
  <div>
    <nav aria-label='breadcrumb' style='--bs-breadcrumb-divider: &apos;>&apos;'>
      <ol class='breadcrumb'>
        <li class='breadcrumb-item'><a href='/'>Home</a></li>
        <li class='breadcrumb-item'><a href='/properties'>Properties</a></li>
        <li aria-current='page' class='breadcrumb-item active'>#{{ propertyId }}</li>
      </ol>
    </nav>
    <div v-if='showOverview'>
      <PropertyOverview :propertyId='propertyId' @togglePropertyView='togglePropertyView' />
    </div>
    <div v-else>
      <EditProperty :propertyId='propertyId' @togglePropertyView='togglePropertyView' />
    </div>
  </div>
</template>

<script>
import EditProperty from "@/components/dataManipulation/EditProperty.vue";
import PropertyOverview from "@/views/PropertyOverview.vue";

export default {
  components: {
    PropertyOverview,
    EditProperty,
  },
  data() {
    return {
      showOverview: true,
      propertyId: null

    };
  },
  created() {
    this.propertyId = this.$route.params.propertyId
  },
  methods: {
    togglePropertyView() {
      this.showOverview = !this.showOverview;
    },
  },
};
</script>