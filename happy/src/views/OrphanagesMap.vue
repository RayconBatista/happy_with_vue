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

        <router-link :to="{name: ''}" class="create-orphanage">
            <i class="fas fa-plus" style="font-size: 32px; color: #fff"></i>
        </router-link>
        <l-tile-layer :url="url"></l-tile-layer>
    </l-map>

</div>
</template>

<script>
import {
    LMap,
    LTileLayer
} from 'vue2-leaflet';
export default {
    components: {
        LMap,
        LTileLayer,
    },
    data() {
        return {
            url: `https://https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/256/{z}/{x}/{y}@2x?access_token=${process.env.VUE_APP_MAPBOX_TOKEN}`,
            zoom: 15,
            center: [-2.9752219, -60.018212],
            bounds: null
        };
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
