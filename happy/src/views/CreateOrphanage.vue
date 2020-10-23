<template>
  <div id="page-create-orphanage">
    <Sidebar />

    <main>
      <form class="create-orphanage-form" @submit.prevent="handleSubmit">
        <fieldset>
          <legend>Dados</legend>

          <l-map
            :zoom="zoom"
            :center="center"
            style="width: 100%; height: 280px"
            @click="handleMapClick"
          >
            <l-tile-layer :url="url"></l-tile-layer>
            <l-marker
              v-if="orphanage.latitude"
              :lat-lng="[orphanage.latitude, orphanage.longitude]"
              :icon="icon"
            />
          </l-map>
          <div class="input-block">
            <label for="name">Nome</label>
            <input id="name" v-model="orphanage.name" />
          </div>

          <div class="input-block">
            <label for="about"
              >Sobre <span>Máximo de 300 caracteres</span></label
            >
            <textarea id="name" maxLength="{300}" v-model="orphanage.about" />
          </div>

          <div class="input-block">
            <label for="images">Fotos</label>

            <div class="images-container">
              <div v-for="(img, index) in previewImages" :key="index">
                <img :src="img" alt="" />
              </div>

              <label for="image[]" class="new-image">
                <i class="fas fa-plus" style="color: #15b6d6; size: 24"></i>
              </label>

              <input
                type="file"
                multiple
                id="image[]"
                @change="handleSelectImages"
              />
            </div>
          </div>
        </fieldset>

        <fieldset>
          <legend>Visitação</legend>

          <div class="input-block">
            <label htmlFor="instructions">Instruções</label>
            <textarea id="instructions" v-model="orphanage.instructions" />
          </div>

          <div class="input-block">
            <label htmlFor="opening_hours">Horário de visita</label>
            <input id="opening_hours" v-model="orphanage.open_hours" />
          </div>

          <div class="input-block">
            <label htmlFor="open_on_weekends">Atende fim de semana</label>

            <div class="button-select">
              <button
                type="button"
                :class="orphanage.open_on_weekends ? 'active' : ''"
                @click="orphanage.open_on_weekends = true"
              >
                Sim
              </button>
              <button
                type="button"
                :class="!orphanage.open_on_weekends ? 'active' : ''"
                @click="orphanage.open_on_weekends = false"
              >
                Não</button
              >open
            </div>
          </div>
        </fieldset>

        <button class="confirm-button" type="submit">Confirmar</button>
      </form>
    </main>
  </div>
</template>

<script>
import { LMap, LTileLayer, LMarker, LIcon, LPopup } from "vue2-leaflet";
import { LeafletMouseEvent } from "leaflet";
import Sidebar from "./../components/Sidebar";
import "leaflet/dist/leaflet.css";
import axios from "axios";
import iconUrl from "../../src/assets/images/local.png";

export default {
  name: "OrphanageCreate",
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LIcon,
    LPopup,
    Sidebar,
    LeafletMouseEvent,
  },
  data() {
    return {
      zoom: 15,
      center: [-3.041283, -60.0055628],
      url: `https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/256/{z}/{x}/{y}@2x?access_token=${process.env.VUE_APP_MAPBOX_TOKEN}`,
      icon: L.icon({
        iconUrl: iconUrl,
        iconSize: [58, 68],
        iconAnchor: [29, 68],
        popupAnchor: [160, 2],
      }),
      orphanage: {
        latitude: "",
        longitude: "",
        name: "",
        about: "",
        images: [],
        instructions: "",
        open_hours: "",
        open_on_weekends: false,
      },
      previewImages: [],
    };
  },

  methods: {
    tratarFormDeEnvio() {
      let formData = new FormData();
      Object.entries(this.orphanage).forEach(([key, value]) => {
        if (key == "images") {
          value.forEach((image) => {
            formData.append("images", image);
          });
        } else {
          formData.append(key, value);
        }
      });

      return formData;
    },
    handleSubmit() {
      let formData = this.tratarFormDeEnvio();

      axios.post("http://localhost:3333/orphanage/create", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      }).then(
          response => this.$router.push({name: 'Orphanages'})
      ).catch(
          error => alert("Erro ao cadastrar orfanato")
      );
    },

    handleMapClick(e) {
      this.orphanage.latitude = e.latlng.lat;
      this.orphanage.longitude = e.latlng.lng;
    },

    handleSelectImages(event) {
      if (!event.target.files) {
        return;
      }

      const images = Array.from(event.target.files);

      this.orphanage.images = images;

      const selectedImagesPreview = images.map((img) => {
        return URL.createObjectURL(img);
      });
      this.previewImages = selectedImagesPreview;
    },
  },
};
</script>
<style scoped>
@import url("../../src/assets/css/orphanage.css");
@import url("../../src/assets/css/create-orphanage.css");
</style>

