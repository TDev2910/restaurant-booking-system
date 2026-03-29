<template>
    <header class="header">
        <div class="custom-container">
            <div class="nav-wrapper">
                <div class="header-logo">
                    <img src="../../../public/img/logo.png" alt="" class="logo">
                </div>
                <div class="header-nav">
                    <ul class="nav-list" role="list">
                        <li><a href="">Trang chủ</a></li>
                        <li><a href="">Thực đơn</a></li>
                        <li><a href="">Album</a></li>
                        <li><a href="">Tin tức</a></li>
                        <li><a href="">Liên hệ</a></li>
                    </ul>
                </div>

                <Button class="button toggle-mobile-nav" size="small" icon="pi pi-bars"
                    @click="visibleSidebar = true"></Button>

                <div class="header-button">
                    <button class="button">Đặt lịch nhanh</button>
                </div>
            </div>
        </div>
    </header>
    <!-- sidebar mobile nav -->
    <Drawer v-model:visible="visibleSidebar">
        <template #container="{ closeCallback }">
            <div class="sidebar | flex flex-col gap-2 h-full">
                <div class="sidebar-header | flex items-center justify-between px-6 py-4 shrink-0">
                    <div class="sidebar-logo">
                        <img src="../../../public/img/logo.png" class="logo">
                    </div>
                    <Button class="button" size="small" data-type="inverted" @click="closeCallback" icon="pi pi-times"
                        rounded></Button>
                </div>
                <div class="sidebar-nav | flex-1 | overflow-y-auto">
                    <ul class="nav-list | p-4 m-0 h-full">
                        <li>
                            <a href="#about-us">Trang chủ</a>
                        </li>
                        <li>
                            <a href="#ve-chung-toi">Thực đơn</a>
                        </li>
                        <li>
                            <a href="#services">Album</a>
                        </li>
                        <li>
                            <a href="#cam-ket">Tin tức</a>
                        </li>
                        <li>
                            <a href="#customer-experience">Liên hệ</a>
                        </li>
                    </ul>
                </div>
            </div>
        </template>
    </Drawer>
</template>

<style scoped>
.header {
    background-color: var(--overlay-dark);
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
}

.header .nav-wrapper {
    padding: var(--size-400) 0;
}

.header-logo {
    height: 72px;
    display: flex;
}

.header-nav {
    text-transform: uppercase;
}

@media(max-width: 48em) {
    .header-nav {
        display: none;
    }
}

/* toggle mobile nav */
.toggle-mobile-nav {
    display: flex;
}

@media(min-width: 48em) {
    .toggle-mobile-nav {
        display: none;
    }
}

/* sidebar mobile nav */
.sidebar {
    background: var(--neutral-color-800);
}

.sidebar-header {
    padding: var(--size-300);
}

.sidebar-logo {
    height: 64px;
    display: flex;
}

.sidebar-nav .nav-list {
    flex-direction: column;
    gap: .5em;
}

.sidebar-menu li {
    padding: .75em 1em;
    cursor: pointer;
}
</style>

<script setup>
import { ref } from 'vue';
import Button from 'primevue/button';
import Drawer from 'primevue/drawer';
const visibleSidebar = ref(false);
</script>