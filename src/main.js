import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import { VuetifyDateAdapter } from 'vuetify/labs/date/adapters/vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'




const vuetify = createVuetify({
  components,
  directives,
  date: {
    adapter: VuetifyDateAdapter, 
  },
  theme: { defaultTheme: 'light' },
})


createApp(App).use(vuetify).use(router).mount('#app')

