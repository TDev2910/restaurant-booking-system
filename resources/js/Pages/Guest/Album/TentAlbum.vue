<template>
    <div class="album-page">
        <div class="custom-container py-24">
            <div class="text-center mb-16">
                <h1 class="text-4xl gold-text mt-2 mb-4">ẢNH RẠP</h1>
                <div class="w-24 h-px bg-amber-600 mx-auto opacity-50 mb-8"></div>
                <p class="max-w-2xl mx-auto opacity-70">
                    Bố trí rạp và trang trí sự kiện đẹp mắt từ đội ngũ chuyên nghiệp. 
                    Chúng tôi chăm chút từng chi tiết để tạo nên không gian sang trọng và ấm cúng nhất.
                </p>
            </div>

            <div class="album-grid">
                <div v-for="i in placeholderImages.length" :key="i" class="album-item">
                    <div class="album-image-wrapper">
                        <img :src="`/img/anhrap/${placeholderImages[i-1]}`" alt="Tent" class="album-img">
                        <div class="album-overlay">
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mb-16 mt-32">
                <span class="gold-text uppercase tracking-widest text-sm">Finishing Touches</span>
                <h1 class="text-4xl gold-text mt-2 mb-4">ẢNH DECOR</h1>
                <div class="w-24 h-px bg-amber-600 mx-auto opacity-50 mb-8"></div>
            </div>

            <div class="album-grid">
                <div v-for="i in decorImages.length" :key="'decor-'+i" class="album-item">
                    <div class="album-image-wrapper">
                        <img :src="`/img/anhrap/decor/${decorImages[i-1]}`" alt="Decor" class="album-img">
                        <div class="album-overlay">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
const placeholderImages = [
    'rap01.jpg', 'rap02.jpg', 'rap03.jpg', 
    'rap04.jpg', 'rap05.jpg', 'rap06.jpg'
];

const decorImages = [
    'decor01.jpg', 'decor02.jpg', 'decor03.jpg', 'decor04.jpg'
];
</script>



<style scoped>
.album-page {
    background: var(--neutral-color-800);
    min-height: 100vh;
    padding-top: 120px;
}

.album-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 1.5rem;
}

.album-item {
    aspect-ratio: 1;
    overflow: hidden;
    position: relative;
    border-radius: 4px;
}

.album-image-wrapper {
    width: 100%;
    height: 100%;
    position: relative;
    cursor: pointer;
}

.album-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.album-item:hover .album-img {
    transform: scale(1.1);
}

.album-overlay {
    position: absolute;
    inset: 0;
    background: rgba(0, 0, 0, 0.4);
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.album-item:hover .album-overlay {
    opacity: 1;
}

.gold-text {
    color: var(--primary-color-600);
}

@media (max-width: 1024px) {
    .album-grid {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 768px) {
    .album-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 480px) {
    .album-grid {
        grid-template-columns: 1fr;
    }
}
</style>
