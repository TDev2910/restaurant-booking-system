<template>
    <div class="hero-banner">
        <div class="hero-banner-bg | set-bg-img" :style="$getBgStyle(bannerImg)"></div>
        <div class="hero-banner-content | flow" style="--flow-spacer:1em">
            <h1 class="hero-banner-title">Danh Mục Đồ Ăn</h1>
        </div>
    </div>
</template>

<style scoped src="@css/partials/HeroBannerHome.css"></style>

<script setup>
import { ref } from 'vue';
const bannerImg = ref('/img/hero-bannerdanhmucdoan.jpg');
</script>