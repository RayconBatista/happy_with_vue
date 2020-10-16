
<template>
    <div id="page-landing">
        <div class="content-wrapper">
            <img :src="require('../assets/images/logo.png')" style="width: 200" />

            <main>
                <h1>Leve a felicidade para o mundo</h1>
                <p>Visite orfanatos e mude o dia de muitas crianças.</p>
            </main>

            <div class="location">
                <strong>Manaus</strong>
                <span>Amazonas</span>
            </div>

            <router-link :to="{name: 'OrphanagesMap'}" class="enter-app">
                <i class="fas fa-arrow-right" style="font-size: 26px; color: rgba(0,0,0,0.6)"></i>
            </router-link>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style scoped>
    @import url('../../src/assets/css/landing.css');
</style>
