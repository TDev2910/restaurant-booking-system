<template>
    <div class="menu-page">
        <!-- 1. Banner Section -->
        <HeroBannerHome />

        <div class="custom-container py-16">
            <div class="menu-layout-grid">
                <!-- 2. Sidebar Left -->
                <aside class="menu-sidebar">
                    <div class="sidebar-section">
                        <h3 class="section-title">Danh mục món ăn</h3>
                        <ul class="category-list" role="list">
                            <li @click="selectedCategory = 'SÚP'" :class="{ 'active': selectedCategory === 'SÚP' }">CÁC
                                MÓN SÚP</li>
                            <li @click="selectedCategory = 'GỎI'" :class="{ 'active': selectedCategory === 'GỎI' }">CÁC
                                MÓN GỎI</li>
                            <li @click="selectedCategory = 'TÔM'" :class="{ 'active': selectedCategory === 'TÔM' }">CÁC
                                MÓN TÔM</li>
                            <li @click="selectedCategory = 'BÒ'" :class="{ 'active': selectedCategory === 'BÒ' }">CÁC
                                MÓN BÒ</li>
                            <li @click="selectedCategory = 'GÀ'" :class="{ 'active': selectedCategory === 'GÀ' }">CÁC
                                MÓN GÀ</li>
                            <li @click="selectedCategory = 'VỊT'" :class="{ 'active': selectedCategory === 'VỊT' }">CÁC
                                MÓN VỊT</li>
                            <li @click="selectedCategory = 'HEO'" :class="{ 'active': selectedCategory === 'HEO' }">CÁC
                                MÓN HEO</li>
                            <li @click="selectedCategory = 'MỰC'" :class="{ 'active': selectedCategory === 'MỰC' }">CÁC
                                MÓN MỰC</li>
                            <li @click="selectedCategory = 'CÁ'" :class="{ 'active': selectedCategory === 'CÁ' }">CÁC
                                MÓN CÁ</li>
                            <li @click="selectedCategory = 'LẨU'" :class="{ 'active': selectedCategory === 'LẨU' }">CÁC
                                MÓN LẨU</li>
                            <li @click="selectedCategory = 'CUA'" :class="{ 'active': selectedCategory === 'CUA' }">CÁC
                                MÓN CUA</li>
                            <li @click="selectedCategory = 'NAI'" :class="{ 'active': selectedCategory === 'NAI' }">CÁC
                                MÓN NAI, BÊ</li>
                            <li @click="selectedCategory = 'KÈM'" :class="{ 'active': selectedCategory === 'KÈM' }">CÁC
                                MÓN ĂN KÈM</li>
                            <li @click="selectedCategory = 'ỐC'" :class="{ 'active': selectedCategory === 'ỐC' }">CÁC
                                MÓN ỐC</li>
                        </ul>
                    </div>
                    <div class="sidebar-section mt-12 chef-quote">
                        <h3 class="section-title">Lời ngỏ từ Chef</h3>
                        <p class="italic text-sm opacity-80 leading-relaxed">
                            "Mỗi món ăn là một câu chuyện, là tâm huyết mà chúng tôi muốn gửi gắm đến thực khách..."
                        </p>
                    </div>
                </aside>

                <!-- 3. Product List Right -->
                <main class="menu-content">
                    <div class="content-header flex justify-between items-end mb-8">
                        <div>
                            <h2 class="category-display-title text-2xl font-bold">{{ categoryTitle }}</h2>
                            <p class="opacity-60 text-sm">Khám phá hương vị thượng hạng từ nguyên liệu tươi ngon</p>
                        </div>
                    </div>

                    <div class="product-grid">
                        <!-- Hiển thị danh sách món ăn từ mảng filteredDishes -->
                        <div v-for="dish in filteredDishes" :key="dish.id" class="product-card">
                            <div class="product-image">
                                <img :src="dish.image || '/img/placeholder.jpg'" :alt="dish.name">
                            </div>
                            <div class="product-info p-4 text-center">
                                <h4 class="product-name font-bold">{{ dish.name }}</h4>
                                <p class="product-price text-amber-600 gold-text my-2">{{ dish.price }} VNĐ</p>
                                <p class="product-desc text-xs opacity-60 mb-4">{{ dish.description }}</p>
                            </div>
                        </div>

                        <!-- Empty State -->
                        <div v-if="filteredDishes.length === 0" class="col-span-full text-center py-20 opacity-40">
                            <p>Đang cập nhật thực đơn cho mục này...</p>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!-- 4. Featured Dishes Section -->
        <section class="featured-section py-24 bg-dark-elegant">
            <div class="custom-container text-center">
                <span class="sub-title gold-text uppercase tracking-widest text-xs">Chef's Recommendations</span>
                <h2 class="main-title text-4xl gold-text mt-2 mb-16">Món Nổi Bật</h2>

                <div class="featured-grid">
                    <div v-for="item in featuredDishes" :key="item.id" class="product-card">
                        <div class="product-image">
                            <img :src="item.image || '/img/placeholder.jpg'" :alt="item.name">
                        </div>
                        <div class="product-info p-6 text-center">
                            <h4 class="product-name font-bold text-lg mb-2">{{ item.name }}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import HeroBannerHome from '../Partials/HeroBannerHome.vue';

const selectedCategory = ref('SÚP');

const dishes = ref([
    // CÁC MÓN SÚP
    { id: 1, category: 'SÚP', name: 'Súp hoành thánh', price: '45.000', description: 'Gồm hoành thánh tươi và nước dùng thanh ngọt', image: '/img/sanpham/suphoanhthanh.jpg' },
    { id: 2, category: 'SÚP', name: 'Súp Cua', price: '50.000', description: 'Cua tươi kết hợp trứng cút và nấm', image: '/img/sanpham/supcua.jpg' },
    { id: 3, category: 'SÚP', name: 'Súp gà nấm', price: '45.000', description: 'Gà xé phay nấu cùng các loại nấm cao cấp', image: '/img/sanpham/supganam.jpg' },
    { id: 4, category: 'SÚP', name: 'Súp cua tóc tiên', price: '55.000', description: 'Súp cua bổ dưỡng với tóc tiên đen mượt', image: '/img/sanpham/supcuatoctien.jpg' },
    { id: 5, category: 'SÚP', name: 'Súp ngũ sắc hải sản', price: '65.000', description: 'Sự kết hợp hoàn hảo của hải sản và rau củ', image: '/img/sanpham/supngusachaisan.jpg' },
    { id: 6, category: 'SÚP', name: 'Súp bào ngư vi cá', price: '250.000', description: 'Món ăn đại bổ với bào ngư và vi cá thượng hạng', image: '/img/sanpham/supbaonguvica.jpg' },
    { id: 7, category: 'SÚP', name: 'Súp bong bóng cá', price: '75.000', description: 'Vị giòn sần sật của bong bóng cá hòa quyện', image: '/img/sanpham/supbongbongca.jpg' },

    // CÁC MÓN GỎI
    { id: 8, category: 'GỎI', name: 'Khai vị tứ quý', price: '180.000', description: 'Chả giò trái cây, chả bách hoa, ghẹ farci, tiểu long bao,..', image: '/img/sanpham/khaivituquy.jpg' },
    { id: 9, category: 'GỎI', name: 'Gỏi bắp bò', price: '135.000', description: 'Bắp bò tươi trộn cùng các loại rau củ thấm vị', image: '/img/sanpham/goibapbo.jpg' },
    { id: 10, category: 'GỎI', name: 'Gỏi bò cửu vị', price: '155.000', description: 'Sự kết hợp tinh tế của 9 loại gia vị thảo mộc', image: '/img/sanpham/goibocuuvi.jpg' },
    { id: 11, category: 'GỎI', name: 'Gỏi bò bóp thấu', price: '130.000', description: 'Bò tái chanh cùng chuối chát, khế chua', image: '/img/sanpham/goibobopthau.jpg' },
    { id: 12, category: 'GỎI', name: 'Gỏi bò cải mầm', price: '125.000', description: 'Bò áp chảo ăn kèm cải mầm giòn mát', image: '/img/sanpham/goiboraumam.jpg' },
    { id: 13, category: 'GỎI', name: 'Gỏi sứa tôm', price: '140.000', description: 'Sứa biển giòn sần sật cùng tôm tươi bóc vỏ', image: '/img/sanpham/goisuatom.jpg' },
    { id: 14, category: 'GỎI', name: 'Gỏi hải sản rong sụn', price: '160.000', description: 'Rong sụn biển trắng trong kết hợp hải sản', image: '/img/sanpham/goihaisanrongsun.jpg' },
    { id: 15, category: 'GỎI', name: 'Gỏi tiến vua tôm thịt', price: '150.000', description: 'Rau tiến vua tiến vua cùng tôm thịt truyền thống', image: '/img/sanpham/goitienvuatomthit.jpg' },
    { id: 16, category: 'GỎI', name: 'Gỏi ngó sen tôm thịt', price: '145.000', description: 'Ngó sen trắng giòn thấm vị chua ngọt', image: '/img/sanpham/goingosentomthit.jpg' },
    { id: 17, category: 'GỎI', name: 'Gỏi cố hủ dừa tôm thịt', price: '155.000', description: 'Cốt hủ dừa bùi béo đặc sản miền Tây', image: '/img/sanpham/goicohudua.jpg' },
    { id: 18, category: 'GỎI', name: 'Gỏi gà hoa chuối', price: '120.000', description: 'Gà ta xé phay trộn hoa chuối đậm chất quê hương', image: '/img/sanpham/goigahoachuoi.jpg' },
    { id: 19, category: 'GỎI', name: 'Gỏi gà tiến vua', price: '135.000', description: 'Sự kết hợp giữa gà ta thả vườn và rau tiến vua', image: '/img/sanpham/goigatien vua.jpg' },
]);

const featuredDishes = ref([
    { id: 1, name: 'Vịt Hon Xôi', image: '/img/sanpham/vithonxoi.jpg' },
    { id: 2, name: 'Gà Thảo Mộc Cung Đình', image: '/img/sanpham/gathaomoccungdinh.jpg' },
    { id: 3, name: 'Xôi Cua', image: '/img/sanpham/xoicua.jpg' },
    { id: 4, name: 'Tôm Rang Muối Hồng Kông', image: '/img/sanpham/tomrangmuoihongkong.jpg' },
    { id: 5, name: 'Gà Bó Xôi', image: '/img/sanpham/gaboxoi.jpg' },
    { id: 6, name: 'Vịt Tiềm Bát Trân', image: '/img/sanpham/vitiembattran.jpg' },
    { id: 7, name: 'Vịt Giả Chồn', image: '/img/sanpham/vitgiachon.jpg' },
    { id: 8, name: 'Chả Giò Tiều', image: '/img/sanpham/chagiotieu.jpg' },
    { id: 9, name: 'Bò Hầm Rượu Vang', image: '/img/sanpham/bohamruouvang.jpg' },
    { id: 10, name: 'Gà Nướng Tây Bắc', image: '/img/sanpham/ganuongtaybac.jpg' },
    { id: 11, name: 'Lẩu Hồng Kông', image: '/img/sanpham/lauhongkong.jpg' },
    { id: 12, name: 'Vịt Đúc Lò', image: '/img/sanpham/vitduclo.jpg' },
]);

const filteredDishes = computed(() => {
    return dishes.value.filter(dish => dish.category === selectedCategory.value);
});

const categoryTitle = computed(() => {
    const titles = {
        'SÚP': 'CÁC MÓN SÚP',
        'GỎI': 'CÁC MÓN GỎI',
        'TÔM': 'CÁC MÓN TÔM',
        'BÒ': 'CÁC MÓN BÒ',
        'GÀ': 'CÁC MÓN GÀ',
        'VỊT': 'CÁC MÓN VỊT',
        'HEO': 'CÁC MÓN HEO',
        'MỰC': 'CÁC MÓN MỰC',
        'CÁ': 'CÁC MÓN CÁ',
        'LẨU': 'CÁC MÓN LẨU',
        'CUA': 'CÁC MÓN CUA',
        'NAI': 'CÁC MÓN NAI, BÊ',
        'KÈM': 'CÁC MÓN ĂN KÈM',
        'ỐC': 'CÁC MÓN ỐC'
    };
    return titles[selectedCategory.value] || 'MENU';
});

</script>

<style scoped src="@css/pages/Guest/Home.css"></style>
