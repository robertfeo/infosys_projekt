import {createRouter, createWebHistory} from 'vue-router'
import Home from './views/Home.vue'
import Properties from './views/Properties.vue'
import Property from './views/Property.vue'
import Unit from './views/Unit.vue'
import Lease from './views/Lease.vue'
import Leases from './views/Leases.vue'
import SCS from './views/SCS.vue'
import SCSs from './views/SCSs.vue'

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {path: '/', name: 'home', component: Home, props: true},
        {
            path: '/properties',
            name: 'properties',
            component: Properties,
            props: true
        },
        {
            path: '/properties/:propertyId',
            name: 'property',
            component: Property,
            props: true
        },
        {
            path: '/properties/:propertyId/units/:unitId',
            name: 'unit',
            component: Unit,
            props: true
        },
        {
            path: '/leases',
            name: 'leases',
            component: Leases,
            props: true
        },
        {
            path: '/leases/:leaseId',
            name: 'lease',
            component: Lease,
            props: true
        },
        {
            path: '/scs',
            name: 'scss',
            component: SCSs,
            props: true
        },
        {
            path: '/scs/:scsId',
            name: 'scs',
            component: SCS,
            props: true
        }
    ]
})

export default router
