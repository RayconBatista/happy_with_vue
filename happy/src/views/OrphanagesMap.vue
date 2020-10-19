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
    <div v-for="orphanage in orphanages" :key="orphanage.index">

        <l-map :zoom="zoom" :center="[orphanage.latitude, orphanage.longitude]">
            <l-tile-layer :url="url"></l-tile-layer>

            <l-marker :lat-lng="[orphanage.latitude, orphanage.longitude]" :icon="icon">
                <l-popup closeButton="false" min-width="240" max-width="240" class="map-popup">

                    <router-link :to="{name: 'OrphanageID'}" class="fas fa-arrow-right" style="text-decoration: none;"></router-link>
                </l-popup>
            </l-marker>

        </l-map>
    </div>

</div>
</template>

<script>
import {
    LMap,
    LTileLayer,
    LMarker,
    LIcon,
    LPopup
} from 'vue2-leaflet';
import 'leaflet/dist/leaflet.css';
import axios from 'axios';
import iconUrl from '../../src/assets/images/local.png'

export default {
    components: {
        LMap,
        LTileLayer,
        LMarker,
        LIcon,
        LPopup
    },
    data() {
        return {
            zoom: 15,
            center: [-2.9755775, -60.0277209],
            positionAtual: [-2.9755571, -60.0300486],
            url: `https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/256/{z}/{x}/{y}@2x?access_token=${process.env.VUE_APP_MAPBOX_TOKEN}`,
            icon: L.icon({
                iconUrl: iconUrl,
                iconSize: [58, 68],
                iconAnchor: [29, 68],
                popupAnchor: [160, 2]
            }),
            orphanages: {
                latitude: '',
                longitude: ''
            },
        }
    },
    created() {
        axios
            .get(`http://localhost:3333/orphanages`)
            .then(response => {
                console.log(response.data)
                this.orphanages = response.data

            })
            .catch(error => {
                console.log(error)
                this.errored = true
            })
    },
}
</script>

<style scoped>
@import url('../../src/assets/css/orphanage-map.css');
</style>
