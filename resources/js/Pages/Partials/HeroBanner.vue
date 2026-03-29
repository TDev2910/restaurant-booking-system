<template>
    <div class="hero-banner">
        <div class="hero-banner-bg | set-bg-img" :style="$getBgStyle(bannerImg)"></div>
        <div class="hero-banner-content | flow" style="--flow-spacer:1em">
            <h1 class="hero-banner-title">Thực đơn đặt món</h1>
            <p data-width="wide">
                Khám phá thực đơn đa dạng và hấp dẫn của chúng tôi,
                với những món ăn ngon miệng được chế biến từ nguyên liệu tươi ngon và chất lượng.
            </p>
            <Button label="Đặt món ngay" class="button"></Button>
        </div>
    </div>
</template>

<style scoped>
.hero-banner {
    height: 800px;
    position: relative;
}

.hero-banner-bg {
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-size: cover;
}

.hero-banner-bg::before {
    content: "";
    position: absolute;
    inset: 0;
    background-color: var(--overlay-medium);
    z-index: 1;
    pointer-events: none;
}

.hero-banner-content {
    z-index: 2;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: var(--primary-color-600);
    border-radius: var(--size-400);
}

.hero-banner-content p {
    margin-inline: auto;
    font-size: var(--fs-body);
}

.hero-banner-title {
    font-size: var(--fs-primary-heading);
    font-weight: var(--fw-semibold);
    text-transform: uppercase;
}
</style>

<script setup>
import { ref } from 'vue';
import Button from 'primevue/button';
const bannerImg = ref('/img/hero-banner.jpeg');
</script>