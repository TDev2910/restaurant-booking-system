<template>
    <div class="menu-page">
        <!-- 1. Banner Section -->
        <HeroBannerMenu />

        <div class="custom-container py-16">
            <div class="menu-layout-grid">
                <!-- 2. Sidebar Left -->
                <aside class="menu-sidebar">
                    <div class="sidebar-section">
                        <h3 class="section-title">Danh mục</h3>
                        <ul class="category-list" role="list">
                            <template v-for="category in dishCategories" :key="category.value">
                                <li :class="{ 'active': dishCategory === category.value }"
                                    @click="dishCategory = category.value">
                                    {{ category.label }}
                                </li>
                            </template>
                        </ul>
                    </div>

                    <!-- <div class="sidebar-section mt-12">
                        <h3 class="section-title">Lọc giá</h3>
                        <div class="price-filter-placeholder">
                            <Slider v-model="priceRange" range :min="0" :max="5000000" class="w-full" />
                            <div class="flex justify-between mt-4 text-sm opacity-70">
                                <span>0đ</span>
                            <li @click="dishType.value == 'main'">Tráng miệng</li>
                        </ul>
                    </div>

                    <!-- <div class="sidebar-section mt-12">
                        <h3 class="section-title">Lọc giá</h3>
                        <div class="price-filter-placeholder">
                            <Slider v-model="priceRange" range :min="0" :max="5000000" class="w-full" />
                            <div class="flex justify-between mt-4 text-sm opacity-70">
                                <span>0đ</span>
                                <span>5.000.000đ</span>
                            </div>
                        </div>
                    </div> -->
                </aside>

                <!-- 3. Menu List - Section Right -->
                <main class="menu-content">
                    <div class="content-header flex justify-between items-end mb-8">
                        <div>
                            <h2 class="menu-title">Khai Vị</h2>
                            <p class="menu-desc | opacity-60">Những khởi đầu tinh tế đánh thức vị giác</p>
                        </div>
                        <div class="sort-wrapper flex items-center gap-4">
                            <span class="sort-label uppercase tracking-widest text-xs opacity-60">Sắp xếp:</span>
                            <Select v-model="dishPriceOption" placeholder="Mặc định" :options="sortPriceOptions" optionLabel="label"
                                optionValue="value"/>
                        </div>
                    </div>

                    <div class="product-grid">
                        <!-- Hiển thị danh sách món ăn từ mảng dishes -->
                        <div v-for="dish in filteredDishMenu" :key="dish.id" class="product-card">
                            <div class="product-image">
                                <img :src="dish.image" :alt="dish.name">
                            </div>
                            <div class="product-info p-4">
                                <h4 class="product-name | text-truncate">{{ dish.name }}</h4>
                                <p class="product-price">{{ dish.price }} VNĐ</p>
                                <p class="product-desc">{{ dish.description }}</p>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!-- 4. High-class Set Menu Section -->
        <section class="set-menu-section py-24 bg-dark-elegant text-center">
            <div class="custom-container">
                <span class="set-subtitle gold-text uppercase tracking-widest">Bespoke Experience</span>
                <h2 class="set-title gold-text mb-16">Set Menu Tiệc Cao Cấp</h2>

                <div class="set-menu-grid">
                    <div v-for="set in setMenus" :key="set.id" class="set-menu-card">
                        <h3 class="set-menu-title | gold-text uppercase tracking-widest mb-4">Menu {{ set.id < 10 ? '0'
                            + set.id : set.id }}</h3>
                                <ul class="set-list my-6 text-sm space-y-4">
                                    <li v-for="(item, index) in set.items" :key="index"
                                        class="set-item-row flex items-baseline gap-2">
                                        <span class="item-name text-left leading-relaxed">{{ item }}</span>
                                        <span
                                            class="dots flex-1 border-b border-dotted border-gray-600 opacity-30"></span>
                                    </li>
                                </ul>
                                <div class="price-tag mt-10 p-4 border-t border-gray-800">
                                    <span class="text-[10px] uppercase opacity-50 block mb-1">Tổng cộng</span>
                                    <p class="gold-text text-xl font-bold italic">{{ set.totalPrice }} VNĐ</p>
                                </div>
                    </div>
                </div>

                <div class="set-contact | mt-10">
                    <p class="set-contact-note">Tất cả các Set Menu có thể được điều chỉnh theo yêu cầu và
                        khẩu vị của quý khách</p>
                    <button class="button">LIÊN HỆ TƯ VẤN</button>
                </div>
            </div>
        </section>
    </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import HeroBannerMenu from '../Partials/HeroBannerMenu.vue';
import Slider from 'primevue/slider';
import Select from '../../Components/Select.vue';

const priceRange = ref([0, 2000000]);
const dishPriceOption = ref('default');
const sortPriceOptions = ref(
    [
        { label: 'Mặc định', value: 'default' },
        { label: 'Giá cao', value: 'high' },
        { label: 'Giá thấp', value: 'low' }
    ]);

// Filter dish type
const dishCategory = ref('all');
const dishCategories = ref([
    {
        value: 'all',
        label: 'Tất cả'
    },
    {
        value: 'starters',
        label: 'Khai vị'
    },
    {
        value: 'main',
        label: 'Món chính'
    },
    {
        value: 'bakery',
        label: 'Món bánh'
    },
    {
        value: 'soups',
        label: 'Món nước'
    },
    {
        value: 'hotpot',
        label: 'Món lẩu'
    },
    {
        value: 'desserts',
        label: 'Tráng miệng'
    },
])
const filteredDishMenu = computed(() => {
    if (dishCategory.value === 'all') {
        return dishes.value;
    }
    return dishes.value.filter(dish => dish.type == dishCategory.value);
})

// Dữ liệu 6 món ăn khác nhau
const dishes = ref([
    { id: 1, type: 'hotpot', name: 'Sò Điệp Nhật Nướng Mỡ Hành', price: '40.000', description: 'Món ăn này thường được chuẩn bị bằng cách nướng sò điệp Nhật và sau đó thêm mỡ hành để tạo ra hương vị đặc trưng. Món ăn này thường được kết hợp với các loại rau sống và nước sốt chua ngọt.', image: '/img/sanpham/sodiepnuongmohanh.jpg' },
    { id: 2, type: 'soups', name: 'Gỏi Bắp Bò', price: '120.000', description: 'Gỏi bò bóp thấu được coi là món ăn đặc trưng với nét riêng của ẩm thực Miền Nam Việt Nam, nổi bật với hương vị đậm đà, dễ ăn và dễ gây nghiện. Món ăn này thường được sử dụng như món khai vị trong các bữa tiệc hoặc bữa ăn gia đình, đặc biệt là vào những ngày hè oi ả.', image: '/img/sanpham/goibapbo.jpg' },
    { id: 3, type: 'bakery', name: 'Sườn Nướng Ngũ Vị', price: '189.000', description: 'Sườn non là phần xương sườn nằm gần bụng heo, có xương nhỏ, dẹt, nhiều thịt và thường kèm sụn. Loại này mềm và nhanh chín hơn sườn già, rất thích hợp để làm món nướng.', image: '/img/sanpham/suonnuong.jpg' },
    { id: 4, type: 'main', name: 'Bò Lúc Lắc Khoai Tây', price: '213.000', description: 'Bò lúc lắc khoai tây là món ăn đặc trưng của ẩm thực Việt Nam, kết hợp giữa thịt bò mềm mọng và khoai tây chiên giòn rụm', image: '/img/sanpham/boluclac.jpg' },
    { id: 5, type: 'starters', name: 'Bò Né Hoa Thiên Lý', price: '120.000', description: 'Bò né hoa thiên lý là món ăn đặc sắc thường xuất hiện trong các thực đơn đãi tiệc hoặc bữa cơm gia đình thịnh soạn.', image: '/img/sanpham/bonehoathienly.jpg' },
    { id: 6, type: 'desserts', name: 'Mực chiên giòn', price: '150.000', description: 'Mực tươi rói được tuyển chọn từ vùng biển địa phương, cắt khoanh vừa ăn và áo một lớp bột mỏng vàng ươm. Khi ăn, bạn sẽ cảm nhận được độ giòn tan của lớp vỏ bên ngoài, hòa quyện với vị ngọt tự nhiên, sần sật của thịt mực bên trong.', image: '/img/sanpham/mucchiengion.jpg' },
]);

const setMenus = ref([
    {
        id: 1,
        totalPrice: '2.100.000',
        items: ['Súp bào ngư hải sản', 'Vịt đúc lò + Bánh bao', 'Cá mú hấp bún nấm + Rau bún', 'Lẩu cua đồng + Bún', 'Tráng miệng: Sữa chua']
    },
    {
        id: 2,
        totalPrice: '1.850.000',
        items: ['Gỏi bò cải mầm + Bánh phồng', 'Sườn nướng ngũ vị + Bánh bao', 'Hải sản xào ngũ sắc', 'Lẩu cá tầm măng chua', 'Tráng miệng: Nho']
    },
    {
        id: 3,
        totalPrice: '2.050.000',
        items: ['Khai vị tứ quý', 'Gà nướng tây bắc + Xôi', 'Bò né hoa thiên lý + Bánh đa', 'Lẩu thái + Bún', 'Tráng miệng: tàu hũ singapore']
    },
    {
        id: 4,
        totalPrice: '1.950.000',
        items: ['Gỏi ngó sen tôm mực + Bánh phồng', 'Cá chẽm sốt chanh dây', 'Mực sốt thái', 'Lẩu gà lá é + Bún', 'Tráng miệng: Rau câu']
    },
    {
        id: 5,
        totalPrice: '1.800.000',
        items: ['Súp hoành thánh', 'Nai né bơ tỏi + Bánh đa', 'Tôm hoàng kim + bánh đúc', 'Lẩu chua cá dứa + Bún', 'Tráng miệng: trái cây']
    }
]);
</script>

<style scoped src="@css/pages/Guest/Menu.css"></style>
