<template>
<div id="page-orphanage">
    <Sidebar />

    <main>
        <div class="orphanage-details" v-bind="orphanage" :key="orphanage.id">
            <img :src="orphanage.images[image].url" :alt="orphanage.name" />

            <div class="images">
                <div v-for="(orphanage, index) in orphanage.images" :key="index">
                    <button 
                        :class="image == index ? 'active' : ''"
                        type="button"
                        @click="setImageIndex(index)"
                    >
                        <img :src="orphanage.url" :alt="orphanage.name" :title="orphanage.name" />
                    </button>
                </div>
            </div>

            <div class="orphanage-details-content" >
                <!-- <h1>Lar das meninas</h1> -->
                <h1>{{ orphanage.name}}</h1>
                <p>{{ orphanage.about }}</p>

                <div class="map-container" v-if="Object.keys(orphanage).length">
                    <l-map :zoom="zoom" :center="[orphanage.latitude, orphanage.longitude]" style="width: 100%; height:280px">
                        <l-tile-layer :url="url"></l-tile-layer>
                        <l-marker :lat-lng="[orphanage.latitude, orphanage.longitude]" :icon="icon">
                            <l-popup closeButton="false" min-width="240" max-width="240" class="map-popup">
                                {{orphanage.name }}
                                <router-link :to="{name: 'OrphanageID'}" class="fas fa-arrow-right" style="text-decoration: none;"></router-link>
                            </l-popup>
                        </l-marker>
                    </l-map>

                    <footer>
                        <a target="_blank" :href="`https://www.google.com/maps/dir/?api=1&destination=${orphanage.latitude},${orphanage.longitude}`">Ver rotas no Google Maps</a>
                    </footer>
                </div>

                <hr />

                <h2>Instruções para visita</h2>
                <p>{{ orphanage.instructions }}.</p>

                <div class="open-details">
                    <div class="hour">
                        <i class="fas fa-clock" style="color: #15B6D6; size: 32"></i>
                        Segunda à Sexta <br />
                        {{ orphanage.open_hours}}
                    </div>
                    
                    <div v-if="orphanage.open_on_weekends == 1" class="open-on-weekends">
                        
                        <i class="fas fa-info-circle" style="color: #39CC83; size: 32"></i>
                        Atendemos no <br />
                        fim de semana
                    </div>

                    <div  v-if="orphanage.open_on_weekends == 0" class="open-on-weekends dont-open">

                        <i class="fas fa-info-circle" style="color: #FF6690; size: 32"></i>
                        Não atendemos no <br />
                        fim de semana
                    </div>
                </div>

                <button type="button" class="contact-button">
                    <i class="fab fa-whatsapp" style="color: #FFF; size: 20"></i>

                    Entrar em contato
                </button>
            </div>
        </div>
    </main>
</div>
</template>

<script>

import Sidebar from './../components/Sidebar'
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
        LPopup,
        Sidebar
    },
    data() {
        return {
            zoom: 15,
            url: `https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/256/{z}/{x}/{y}@2x?access_token=${process.env.VUE_APP_MAPBOX_TOKEN}`,
            icon: L.icon({
                iconUrl: iconUrl,
                iconSize: [58, 68],
                iconAnchor: [29, 68],
                popupAnchor: [160, 2]
            }),
            orphanage: {
                images: [{
                    url: ''
                }],
                latitude: '',
                longitude: ''
            },
            image: 0,
            open_on_weekends: false,
            
        }

    },
    created() {
        axios
            .get(`http://localhost:3333/orphanage/${this.$route.params.id}`)
            .then(response => {
                this.orphanage = response.data['result']
                 console.log(orphanage);
            })
            .catch(error => {
                this.errored = true
            })
           
    },
    methods: {
        setImageIndex(index) {
            
            this.image = index;
        }
    }

}

</script>

<style scoped>
    @import url('../../src/assets/css/orphanage.css');
</style>
