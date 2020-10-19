<template>
    <div id="page-create-orphanage">
        <Sidebar />

        <main>
            <form class="create-orphanage-form">
                <fieldset>
                    <legend>Dados</legend>

                    <l-map :zoom="zoom" :center="center" style="width: 100%; height:280px">
                        <l-tile-layer :url="url"></l-tile-layer>
                        <l-marker :lat-lng="positionAtual" :icon="icon">
                            <l-popup closeButton="false" min-width="240" max-width="240" class="map-popup">
                                Instituição Senna
                                <a href="#" class="fas fa-arrow-right" style="text-decoration: none;"></a>
                            </l-popup>
                        </l-marker>
                    </l-map>

                    <div class="input-block">
                        <label htmlFor="name">Nome</label>
                        <input id="name" />
                    </div>

                    <div class="input-block">
                        <label htmlFor="about">Sobre <span>Máximo de 300 caracteres</span></label>
                        <textarea id="name" maxLength={300} />
                    </div>

                    <div class="input-block">
                        <label htmlFor="images">Fotos</label>

                        <div class="uploaded-image">

                        </div>

                        <button class="new-image">
                            <i class="fas fa-plus" style="color: #15b6d6; size: 24"></i>
                        </button>
                    </div>
                </fieldset>

                <fieldset>
                    <legend>Visitação</legend>

                    <div class="input-block">
                        <label htmlFor="instructions">Instruções</label>
                        <textarea id="instructions" />
                    </div>

                    <div class="input-block">
                        <label htmlFor="opening_hours">Nome</label>
                        <input id="opening_hours" />
                    </div>

                    <div class="input-block">
                        <label htmlFor="open_on_weekends">Atende fim de semana</label>

                        <div class="button-select">
                            <button type="button" class="active">Sim</button>
                            <button type="button">Não</button>
                        </div>
                    </div>
                </fieldset>

                <button class="confirm-button" type="submit">
                    Confirmar
                </button>
            </form>
        </main>
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
import Sidebar from './../components/Sidebar';
import 'leaflet/dist/leaflet.css';

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
            center: [-2.9755775, -60.0277209],
            positionAtual: [-2.9755571, -60.0300486],
            url: `https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/256/{z}/{x}/{y}@2x?access_token=${process.env.VUE_APP_MAPBOX_TOKEN}`,
            icon: L.icon({
                iconUrl: iconUrl,
                iconSize: [58, 68],
                iconAnchor: [29, 68],
                popupAnchor: [160, 2]
            }),
            
        }
    },

}
</script>
<style scoped>
@import url('../../src/assets/css/orphanage.css');
@import url('../../src/assets/css/create-orphanage.css');
</style>

