<template>
    <div class="hero-banner">
        <div class="hero-banner-bg | set-bg-img" :style="$getBgStyle(bannerImg)"></div>
        <div class="hero-banner-content | flow" style="--flow-spacer:1em">
            <span class="hero-banner-subtitle gold-text">TRẢI NGHIỆM ẨM THỰC TINH HOA</span>
            <h1 class="hero-banner-title">LIÊN HỆ & ĐẶT CHỖ</h1>
        </div>
    </div>
</template>

<style scoped src="@css/partials/HeroBannerHome.css"></style>
<style scoped>
.hero-banner-subtitle {
    display: block;
    font-size: var(--fs-300);
    letter-spacing: 0.3em;
    text-transform: uppercase;
    font-weight: var(--fw-bold);
}
.hero-banner-title {
    font-size: var(--fs-900);
    font-family: var(--ff-serif);
}
</style>

<script setup>
import { ref } from 'vue';
const bannerImg = ref('/img/hero-bannercontact.png');
</script>