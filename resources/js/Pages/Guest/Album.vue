<template>
    <div class="p-8 text-center pt-24">
        <h1 class="text-4xl font-bold mb-4 uppercase">Hình ảnh: {{ categoryName }}</h1>
        <p>Bộ sưu tập hình ảnh sẽ sớm được hiển thị tại đây.</p>
    </div>
</template>

<script setup>
import { computed } from 'vue';

const props = defineProps({
    currentCategory: String
});

const categoryName = computed(() => {
    switch (props.currentCategory) {
        case 'mon-an': return 'Món Ăn';
        case 'tiec': return 'Tiệc';
        case 'rap': return 'Rạp';
        default: return 'Tất cả';
    }
});
</script>
