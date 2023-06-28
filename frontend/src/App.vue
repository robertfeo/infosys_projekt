<template>
  <header>
    <Header />
  </header>
  <main>
    <RouterView />
  </main>
  <footer>
    <Footer />
  </footer>
</template>

<script>
import Header from './components/Header.vue'
import Footer from './components/Footer.vue'

export default (await import('vue')).defineComponent({
  components: {
    Header,
    Footer
  }
})
</script>
