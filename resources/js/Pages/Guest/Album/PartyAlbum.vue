<template>
    <div class="album-page">
        <div class="custom-container py-24">
            <div class="text-center mb-16">
                <h1 class="text-4xl gold-text mt-2 mb-4">ẢNH TIỆC</h1>
                <div class="w-24 h-px bg-amber-600 mx-auto opacity-50 mb-8"></div>
                <p class="max-w-2xl mx-auto opacity-70">
                    Ghi lại những khoảnh khắc tuyệt vời của các buổi tiệc chúng tôi đã phục vụ. 
                    Mỗi bữa tiệc là một kỷ niệm đáng nhớ mà Xuân Diệu Chef vinh dự được đồng hành.
                </p>
            </div>

            <div class="album-grid">
                <div v-for="i in placeholderImages.length" :key="i" class="album-item">
                    <div class="album-image-wrapper">
                        <img :src="`/img/anhtiec/${placeholderImages[i-1]}`" alt="Party" class="album-img">
                        <div class="album-overlay">
                            <span class="pi pi-search text-2xl"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
const placeholderImages = [
    'xd01.jpg', 'xd02.jpg', 'xd03.jpg', 'xd04.jpg',
    'xd05.jpg', 'xd06.jpg', 'xd07.jpg', 'xd08.jpg',
    'xd09.jpg', 'xd10.jpg', 'xd11.jpg', 'xd12.jpg',
    'xd13.jpg', 'xd14.jpg', 'xd16.jpg',
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
    grid-template-columns: repeat(3, 1fr);
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
