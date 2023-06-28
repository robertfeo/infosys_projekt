<template>
  <div>
    <nav aria-label='breadcrumb' style='--bs-breadcrumb-divider: &apos;>&apos;'>
      <ol class='breadcrumb'>
        <li class='breadcrumb-item'><a href='/'>Home</a></li>
        <li aria-current='page' class='breadcrumb-item active'>Properties</li>
      </ol>
    </nav>
    <div v-if='showOverview'>
      <PropertiesOverview @togglePropertiesView='togglePropertiesView' />
    </div>
    <div v-else>
      <AddProperty @togglePropertiesView='togglePropertiesView' />
    </div>
  </div>
</template>

<script>
import AddProperty from "@/components/dataManipulation/AddProperty.vue";
import PropertiesOverview from "@/views/PropertiesOverview.vue";

export default {
  components: {
    PropertiesOverview,
    AddProperty,
  },
  data() {
    return {
      showOverview: true,
    };
  },
  methods: {
    togglePropertiesView() {
      this.showOverview = !this.showOverview;
    },
  },
};
</script>