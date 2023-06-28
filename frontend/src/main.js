import {createApp} from 'vue'
import router from './router.js'
import App from './App.vue'
import 'bootstrap/dist/css/bootstrap.css'
import './styles/main.scss'
import 'bootstrap/dist/js/bootstrap.js'

const app = createApp(App)

app.use(router)

router.isReady().then(() => {
    app.mount('#app')
})
