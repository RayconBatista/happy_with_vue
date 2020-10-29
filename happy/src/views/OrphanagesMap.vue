<template>
<div id="page-map">
    <aside>
        <header>
            <img src="../assets/images/local.png" alt="Happy">
            <h2>Escolha um orfanato no mapa</h2>
            <p>
                Muitas crianças estão esperando a sua visita :)
            </p>
        </header>
        <footer>
            <strong>Manaus</strong>
            <span>Amazonas</span>
        </footer>
    </aside>

    <l-map 
        style="height: 100%; width: 100%" 
        :zoom="zoom" 
        :center="center" 
        @update:zoom="zoomUpdated" 
        @update:center="centerUpdated" 
        @update:bounds="boundsUpdated">

        <l-control position="bottomright" >
            <router-link :to="{name: 'CreateOrphanage'}" class="create-orphanage">
                <i class="fas fa-plus" style="font-size: 32px; color: #fff"></i>
            </router-link>           
        </l-control>

        <l-tile-layer :url="url"></l-tile-layer>
        <l-marker 
            v-for="item in orphanages" 
            :key="item.id" 
            :icon="icon" 
            :lat-lng="[item.latitude, item.longitude]">
            <l-popup :closeButton="false" min-width="240" max-width="240" class="map-popup">
                {{ item.name }}
                <router-link :to="{name: 'OrphanageID', params: {id: item.id} }" class="fas fa-arrow-right" style="text-decoration: none;"></router-link>
            </l-popup>
        </l-marker>
    </l-map>

</div>
</template>

<script>
import {
    LMap,
    LTileLayer,
    LMarker,
    LPopup,
    LIcon,
    LControl
} from 'vue2-leaflet';
import axios from 'axios';
import iconUrl from '../../src/assets/images/local.png'

export default {
    components: {
        LMap,
        LTileLayer,
        LMarker,
        LPopup,
        LIcon,
        LControl
    },
    data() {
        return {
            url: `https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/256/{z}/{x}/{y}@2x?access_token=${process.env.VUE_APP_MAPBOX_TOKEN}`,
            icon: L.icon({
                iconUrl: iconUrl,
                iconSize: [58, 68],
                iconAnchor: [29, 68],
                popupAnchor: [160, 2]
            }),
            zoom: 15,
            center: [-2.9752219, -60.018212],
            
            bounds: null,
            orphanages: []
        };
    },
    created() {
        axios
            .get(`http://localhost:3333/orphanages`)
            .then(response => {
                this.orphanages = response.data['result']
                
            })
            .catch(error => {
                this.errored = true
            })
    },
    methods: {
        zoomUpdated(zoom) {
            this.zoom = zoom;
        },
        centerUpdated(center) {
            this.center = center;
        },
        boundsUpdated(bounds) {
            this.bounds = bounds;
        }
    }
}
</script>

<style scoped>
    @import url('../../src/assets/css/orphanage-map.css');
</style>
