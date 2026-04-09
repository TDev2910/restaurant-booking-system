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
                            <li v-for="cat in categories" :key="cat.name"
                                :class="{ active: selectedCategory === cat.name }" @click="selectedCategory = cat.name">
                                {{ cat.name }}
                            </li>
                        </ul>
                    </div>
                </aside>

                <!-- 3. Product List Right -->
                <main class="menu-content">
                    <div class="content-header flex justify-between items-end mb-8">
                        <div>
                            <h2 class="category-display-title">{{ currentCategoryInfo.name }}</h2>
                            <p class="opacity-60 text-sm">{{ currentCategoryInfo.description }}</p>
                        </div>
                        <div class="sort-wrapper flex items-center gap-4">
                            <span class="sort-label uppercase tracking-widest text-xs opacity-60">Sắp xếp:</span>
                            <Select v-model="sortValue" :options="sortOptions" class="minimal-sort-select" />
                        </div>
                    </div>

                    <div class="product-grid">
                        <!-- Hiển thị danh sách món ăn từ mảng dishes -->
                        <div v-for="dish in dishes" :key="dish.id" class="product-card">
                            <div class="product-image">
                                <img :src="dish.image" :alt="dish.name">
                            </div>
                            <div class="product-info p-4">
                                <h4 class="product-name">{{ dish.name }}</h4>
                                <p class="product-price">{{ dish.price }} VNĐ</p>
                                <p class="product-desc text-xs opacity-60 mb-4">{{ dish.description }}</p>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!-- 4. High-class Set Menu Section -->
        <section class="set-menu-section py-24 bg-dark-elegant text-center">
            <div class="custom-container">
                <span class="sub-title gold-text uppercase tracking-widest text-sm">Bespoke Experience</span>
                <h2 class="main-title text-4xl gold-text mt-2 mb-16">Set Menu Tiệc Cao Cấp</h2>

                <div class="set-menu-grid">
                    <div v-for="menu in setMenus" :key="menu.id" class="set-menu-card">
                        <h3 class="gold-text uppercase tracking-widest text-lg mb-6">Menu {{ menu.id < 10 ? '0' +
                            menu.id : menu.id }}</h3>
                                <ul class="set-menu-items my-6 text-sm space-y-4">
                                    <li v-for="(item, index) in menu.items" :key="index"
                                        class="menu-item-row flex items-baseline gap-2">
                                        <span class="item-name text-left leading-relaxed">{{ item }}</span>
                                        <span
                                            class="dots flex-1 border-b border-dotted border-gray-600 opacity-30"></span>
                                    </li>
                                </ul>
                                <div class="price-tag mt-10 p-4 border-t border-gray-800">
                                    <span class="text-[10px] uppercase opacity-50 block mb-1">Tổng cộng</span>
                                    <p class="gold-text text-xl font-bold italic">{{ menu.totalPrice }} VNĐ</p>
                                </div>
                    </div>
                </div>

                <div class="mt-16">
                    <p class="text-sm opacity-60 mb-8 italic">Tất cả các Set Menu có thể được điều chỉnh theo yêu cầu và
                        khẩu vị của quý khách</p>
                </div>
            </div>
        </section>
    </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import HeroBannerMenu from '../Partials/HeroBannerMenu.vue';
import Select from 'primevue/select';

const sortValue = ref('Mặc định');
const sortOptions = ref(['Mặc định', 'Giá cao', 'Giá thấp']);

const categories = [
    { name: 'Khai vị', description: 'Những khởi đầu tinh tế đánh thức vị giác' },
    { name: 'Món chính', description: 'Hương vị đậm đà, tinh hoa của bữa tiệc' },
    { name: 'Món bánh', description: 'Sự kết hợp hoàn hảo giữa bột và nhân truyền thống' },
    { name: 'Món lẩu', description: 'Ấm áp quây quần bên nồi lẩu nghi ngút khói' },
    { name: 'Tráng miệng', description: 'Kết thúc ngọt ngào cho một bữa tiệc trọn vẹn' }
];

const selectedCategory = ref('Khai vị');

const currentCategoryInfo = computed(() => {
    return categories.find(c => c.name === selectedCategory.value) || categories[0];
});

const allDishes = ref([
    // Khai vị
    { id: 1, category: 'Khai vị', name: 'Sò Điệp Nhật Nướng Mỡ Hành', price: '40.000', description: 'Sò điệp Nhật tươi nướng mỡ hành thơm nức, ăn kèm lạc rang giòn rụm.', image: '/img/sanpham/sodiepnuongmohanh.jpg' },
    { id: 2, category: 'Khai vị', name: 'Gỏi Bắp Bò', price: '120.000', description: 'Bắp bò thái mỏng bóp thấu với hành tây, rau thơm và nước mắm chua ngọt.', image: '/img/sanpham/goibapbo.jpg' },
    { id: 3, category: 'Khai vị', name: 'Sườn Nướng Ngũ Vị', price: '189.000', description: 'Sườn non tẩm ướp ngũ vị hương đậm đà, nướng vàng đều các mặt.', image: '/img/sanpham/suonnuong.jpg' },
    { id: 4, category: 'Khai vị', name: 'Bò Lúc Lắc Khoai Tây', price: '213.000', description: 'Thịt bò thăn thái vuông, xào lửa lớn với ớt chuông và hành tây.', image: '/img/sanpham/boluclac.jpg' },
    { id: 5, category: 'Khai vị', name: 'Bò Né Hoa Thiên Lý', price: '120.000', description: 'Thịt bò mềm xào nhanh với hoa thiên lý tươi xanh, giữ trọn vị ngọt.', image: '/img/sanpham/bonehoathienly.jpg' },
    { id: 6, category: 'Khai vị', name: 'Mực Chiên Giòn', price: '150.000', description: 'Mực tươi cắt khoanh áo lớp bột mỏng, chiên vàng giòn tan.', image: '/img/sanpham/mucchiengion.jpg' },

    // Món chính
    { id: 7, category: 'Món chính', name: 'Gà Nướng Tây Bắc', price: '350.000', description: 'Gà ta thả vườn tẩm mắc khén, hạt dỗi nướng thơm nồng chuẩn vị núi rừng.', image: '/img/sanpham/ganuongtaybac.jpg' },
    { id: 8, category: 'Món chính', name: 'Vịt Đúc Lò', price: '420.000', description: 'Vịt được tẩm ướp thảo mộc, nướng trong lò đá giúp da giòn rụm và thịt mềm mọng.', image: '/img/sanpham/vitduclo.jpg' },
    { id: 9, category: 'Món chính', name: 'Tôm Rang Muối Hồng Kông', price: '280.000', description: 'Tôm sú loại to rang muối tỏi kiểu Hồng Kông, vị đậm đà khó cưỡng.', image: '/img/sanpham/tomrangmuoihongkong.jpg' },
    { id: 10, category: 'Món chính', name: 'Bò Hầm Rượu Vang', price: '450.000', description: 'Thịt bò thăn hầm chậm với rượu vang đỏ và các loại rau củ quả.', image: '/img/sanpham/bohamruouvang.jpg' },
    { id: 11, category: 'Món chính', name: 'Gà Bó Xôi', price: '380.000', description: 'Gà chiên vàng giòn bọc trong lớp xôi nếp nương chiên phồng.', image: '/img/sanpham/gaboxoi.jpg' },
    { id: 12, category: 'Món chính', name: 'Xôi Cua', price: '480.000', description: 'Xôi nếp dẻo thơm nấu cùng gạch cua và thịt cua tươi chắc ngọt.', image: '/img/sanpham/xoicua.jpg' },

    // Món bánh
    { id: 13, category: 'Món bánh', name: 'Bánh Xèo Miền Tây', price: '85.000', description: 'Bánh xèo giòn rụm với nhân tôm, thịt, giá đỗ, ăn kèm rau sống và nước mắm chua ngọt.', image: '/img/sanpham/banhxeo.jpg' },
    { id: 14, category: 'Món bánh', name: 'Bánh Khọt Vũng Tàu', price: '65.000', description: 'Những chiếc bánh nhỏ xinh, vàng giòn với nhân tôm tươi và mỡ hành thơm phức.', image: '/img/sanpham/banhkhot.jpg' },
    { id: 15, category: 'Món bánh', name: 'Bánh Căn Phan Thiết', price: '70.000', description: 'Bánh căn nướng trong khuôn đất nung, ăn kèm xíu mại và nước chấm đặc trưng.', image: '/img/sanpham/banhcan.jpg' },

    // Món lẩu
    { id: 19, category: 'Món lẩu', name: 'Lẩu Hong Kong', price: '550.000', description: 'Nước dùng lẩu đặc trưng kiểu Hong Kong với đồ nhúng hải sản cao cấp.', image: '/img/sanpham/lauhongkong.jpg' },
    { id: 20, category: 'Món lẩu', name: 'Lẩu Cua Đồng', price: '450.000', description: 'Vị ngọt thanh từ cua đồng tươi, ăn kèm rau dân dã và bún tươi.', image: '/img/sanpham/laucuadong.jpg' },
    { id: 21, category: 'Món lẩu', name: 'Lẩu Cá Tầm Măng Chua', price: '580.000', description: 'Cá tầm phi lê béo ngậy nấu cùng măng chua Tây Bắc bắt vị.', image: '/img/sanpham/laucatam.jpg' },
    { id: 22, category: 'Món lẩu', name: 'Lẩu Gà Lá É', price: '420.000', description: 'Đặc sản Đà Lạt với nước dùng thơm mùi lá é và vị cay nồng của ớt xiêm.', image: '/img/sanpham/laugalae.jpg' },
    { id: 23, category: 'Món lẩu', name: 'Lẩu Bò Nhúng Dấm', price: '480.000', description: 'Thịt bò tươi nhúng nước dùng dấm thanh mát, cuốn bánh tráng rau sống.', image: '/img/sanpham/laubonhungdam.jpg' },
    { id: 24, category: 'Món lẩu', name: 'Lẩu Nấm Thiên Nhiên', price: '380.000', description: 'Nước dùng từ rau củ kết hợp cùng nhiều loại nấm quý tươi ngon.', image: '/img/sanpham/launamthiennhien.jpg' },

    // Tráng miệng
    { id: 25, category: 'Tráng miệng', name: 'Sữa Chua Trái Cây', price: '45.000', description: 'Sữa chua nhà làm sánh mịn, dùng kèm trái cây tươi theo mùa.', image: '/img/sanpham/suachuadeo.jpg' },
    { id: 26, category: 'Tráng miệng', name: 'Chè Khoai Dẻo Đài Loan', price: '55.000', description: 'Khoai viên dẻo dai, thảo mộc thanh mát và nước cốt dừa béo.', image: '/img/sanpham/chekhoaideodailoan.jpg' },
    { id: 27, category: 'Tráng miệng', name: 'Rau Câu Dừa', price: '35.000', description: 'Rau câu làm từ nước dừa tươi nguyên chất, thanh khiết và mát lạnh.', image: '/img/sanpham/raucaudua.jpg' },
    { id: 28, category: 'Tráng miệng', name: 'Tàu Hũ Singapore', price: '40.000', description: 'Tàu hũ mềm mịn tan trong miệng, hương vị nhẹ nhàng.', image: '/img/sanpham/tauhusg.jpg' },
    { id: 29, category: 'Tráng miệng', name: 'Kem Trái Dừa', price: '65.000', description: 'Kem dừa đặc biệt phục vụ trong trái dừa xiêm, kèm dừa nạo.', image: '/img/sanpham/kemtraidua.jpg' },
    { id: 30, category: 'Tráng miệng', name: 'Trái Cây Theo Mùa', price: '120.000', description: 'Đĩa trái cây tươi tổng hợp được chọn lọc kỹ lưỡng hàng ngày.', image: '/img/sanpham/traicaytheomua.jpg' },
]);

const dishes = computed(() => {
    let list = allDishes.value.filter(dish => dish.category === selectedCategory.value);

    if (sortValue.value === 'Giá cao') {
        return list.sort((a, b) => parseFloat(b.price.replace(/\./g, '')) - parseFloat(a.price.replace(/\./g, '')));
    } else if (sortValue.value === 'Giá thấp') {
        return list.sort((a, b) => parseFloat(a.price.replace(/\./g, '')) - parseFloat(b.price.replace(/\./g, '')));
    }

    return list;
});

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
