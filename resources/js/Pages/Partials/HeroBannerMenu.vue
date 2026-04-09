<template>
    <div class="hero-banner">
        <div class="hero-banner-bg | set-bg-img" :style="$getBgStyle(bannerImg)"></div>
        <div class="hero-banner-content | flow" style="--flow-spacer:1em">
            <h1 class="hero-banner-title">Thực đơn đặt món</h1>
            <p data-width="wide">
                Khám phá thực đơn đa dạng và hấp dẫn của chúng tôi,
                với những món ăn ngon miệng được chế biến từ nguyên liệu tươi ngon và chất lượng.
            </p>
        </div>
    </div>
</template>

<style scoped src="@css/partials/HeroBannerMenu.css"></style>

<script setup>
import { ref } from 'vue';
const bannerImg = ref('/img/hero-banner.png');
</script>