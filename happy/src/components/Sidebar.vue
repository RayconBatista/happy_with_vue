<template>
    <aside>
        <img src="../assets/images/local.png" alt="Happy">

        <footer>
            <button type="button" @click="$router.go(-1)">
                <i class="fas fa-arrow-left" style="color: #fff; size: 24"></i>

            </button>
        </footer>
    </aside>
</template>
<style scoped>
@import url('../../src/assets/css/sidebar.css');
</style>