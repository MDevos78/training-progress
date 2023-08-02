import { createRouter, createWebHistory } from "vue-router"
import Welcome from '../components/Welcome.vue'

const router = createRouter ({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        {
            path: '/',
            name: 'Welcome',
            component: Welcome
        },
        {
            path: '/Record',
            name: 'Record',
            component: ()=> import ('../components/Record.vue')
        },       
        {
            path: '/Connexion',
            name: 'Connexion',
            component: ()=> import ('../components/Connexion.vue')
        }
    ]
})

export default router