<template>
    <header class="header">
        <div class="custom-container">
            <div class="nav-wrapper">
                <div class="header-logo">
                    <img src="../../../public/img/logo.png" alt="" class="logo">
                </div>
                <div class="header-nav">
                    <ul class="nav-list" role="list">
                        <li>
                            <Link href="/">Trang chủ</Link>
                        </li>
                        <li>
                            <Link href="/thuc-don">Thực đơn</Link>
                        </li>
                        <li class="has-dropdown">
                            <span class="nav-link-trigger">Hình ảnh <i class="pi pi-chevron-down text-[10px] ml-1"></i></span>
                            <ul class="dropdown-menu">
                                <li>
                                    <Link :href="route('guest.album.tiec')">ẢNH TIỆC</Link>
                                </li>
                                <li>
                                    <Link :href="route('guest.album.rap')">ẢNH RẠP</Link>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <Link href="/gioi-thieu">Giới thiệu</Link>
                        </li>

                        <li>
                            <Link href="/lien-he">Liên hệ</Link>
                        </li>
                    </ul>
                </div>

                <Button class="button toggle-mobile-nav" size="small" icon="pi pi-bars"
                    @click="visibleSidebar = true"></Button>

                <div class="header-button">
                    <button class="button" @click="visibleBookingModal = true">Đặt lịch nhanh</button>
                </div>
            </div>
        </div>
    </header>

    <!-- Quick Booking Modal -->
    <QuickBookingModal v-model:visible="visibleBookingModal" />

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
                            <Link href="/">Trang chủ</Link>
                        </li>
                        <li>
                            <Link href="/thuc-don">Thực đơn</Link>
                        </li>
                        <li class="has-dropdown">
                            <span class="nav-link-trigger">Hình ảnh <i class="pi pi-chevron-down text-[10px] ml-1"></i></span>
                            <ul class="dropdown-menu">
                                <li>
                                    <Link :href="route('guest.album.tiec')">ẢNH TIỆC</Link>
                                </li>
                                <li>
                                    <Link :href="route('guest.album.rap')">ẢNH RẠP</Link>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <Link href="/gioi-thieu">Giới thiệu</Link>
                        </li>

                        <li>
                            <Link href="/lien-he">Liên hệ</Link>
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

.has-dropdown {
    position: relative;
    display: flex;
    align-items: center;
}

.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    background-color: #1a1a1a;
    min-width: 200px;
    list-style: none;
    padding: 10px 0;
    margin: 0;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5);
    opacity: 0;
    visibility: hidden;
    transform: translateY(10px);
    transition: all 0.3s ease;
    border-top: 2px solid var(--primary-color-600);
}

.has-dropdown:hover .dropdown-menu {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}

.nav-link-trigger {
    cursor: pointer;
    display: flex;
    align-items: center;
    color: var(--neutral-color-200);
    transition: color 0.3s ease;
    position: relative;
    font-weight: var(--fw-semi-bold);
    text-transform: uppercase;
}

.nav-link-trigger:hover {
    color: var(--primary-color-600);
}

.nav-link-trigger::after {
    content: "";
    position: absolute;
    width: 100%;
    height: 2px;
    top: calc(100% + var(--size-200));
    left: 0;
    background-color: var(--primary-color-600);
    transform: scaleX(0);
    transform-origin: center;
    transition: transform 0.3s ease-out;
}

.nav-link-trigger:hover::after {
    transform: scaleX(1);
}

.dropdown-menu li {
    padding: 0 !important;
}

.dropdown-menu a {
    display: block;
    padding: 12px 20px !important;
    color: #ccc !important;
    font-size: 13px !important;
    letter-spacing: 1px;
    transition: all 0.2s ease;
    text-align: left;
}

.dropdown-menu a:hover {
    background-color: #252525;
    color: var(--primary-color-600) !important;
    padding-left: 25px !important;
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

.sidebar-nav .dropdown-menu {
    position: static;
    opacity: 1;
    visibility: visible;
    transform: none;
    background: transparent;
    box-shadow: none;
    border-top: none;
    padding: 0 0 0 20px;
}

.sidebar-nav .dropdown-menu a {
    padding: 8px 10px !important;
    font-size: 14px !important;
    color: rgba(255, 255, 255, 0.6) !important;
}

.sidebar-menu li {
    padding: .75em 1em;
    cursor: pointer;
}
</style>

<script setup>
import { ref } from 'vue';
import { Link } from '@inertiajs/vue3';
import Button from 'primevue/button';
import Drawer from 'primevue/drawer';
import QuickBookingModal from './QuickBookingModal.vue';

const visibleSidebar = ref(false);
const visibleBookingModal = ref(false);
</script>