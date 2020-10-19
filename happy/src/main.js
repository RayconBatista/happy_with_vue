import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { LMap, LTileLayer, LMarker, LIcon, LPopup } from 'vue2-leaflet';
import 'leaflet/dist/leaflet.css';
// import 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'
Vue.config.productionTip = false

Vue.component('l-map', LMap);
Vue.component('l-tile-layer', LTileLayer);
Vue.component('l-marker', LMarker);
Vue.component('l-icon', LIcon);
Vue.component('l-popup', LPopup);

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
