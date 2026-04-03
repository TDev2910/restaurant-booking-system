<template>
    <div class="layout">
        <!-- Header -->
        <Header />

        <!-- Main content -->
        <main class="main-content">
            <slot />
        </main>

        <!-- Footer -->
        <Footer />
    </div>
</template>

<style scoped>
.main-content{
    background: var(--neutral-color-700);
}
</style>

<script setup>
import { Link } from '@inertiajs/vue3';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import Header from "../Components/Header.vue"
import Footer from "../Components/Footer.vue"
</script>
