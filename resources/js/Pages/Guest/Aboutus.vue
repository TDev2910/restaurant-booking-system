<template>
    <div class="about-page">
        <!-- 1. Banner Section -->
        <HeroBannerAboutUs />

        <!-- 2. About Content Section -->
        <section class="about-section">
            <div class="custom-container">
                <div class="about-grid">
                    <!-- Left: Brand Story/Intro -->
                    <div class="about-content">
                        <h2 class="about-title">XUÂN DIỆU CHEF</h2>
                        <p class="about-slogan">Dịch Vụ Nấu Ăn XUÂN DIỆU xin hân hạnh phục vụ Quý khách hàng!</p>
                        <p
                            class="text-sm opacity-60 max-w-md italic border-l-2 border-amber-600 pl-4 py-2 mt-4 leading-relaxed">
                            "Mỗi bữa tiệc không chỉ là những món ăn ngon, mà còn là tâm hồn và sự tận tâm của người bếp
                            trưởng gửi gắm đến từng thực khách."
                        </p>
                    </div>

                    <!-- Right: Certificate Image -->
                    <div class="about-image-container">
                        <!-- Replace src with your certificate image path -->
                        <img src="/img/giaychungnhan.jpg" alt="Giấy chứng nhận Bếp Chuyên Tiệc - Nguyễn Thị Xuân Diệu"
                            class="certificate-img">
                    </div>
                </div>
            </div>
        </section>

        <!-- 3. Services Details Section -->
        <section class="services-section">
            <div class="custom-container">
                <div class="services-grid">
                    <!-- Left: Chef Image -->
                    <div class="service-image-container">
                        <img src="/img/chungnhanhocvien.jpg" alt="Đội ngũ đầu bếp Xuân Diệu Chef" class="chefs-img">
                    </div>

                    <!-- Right: Services Info -->
                    <div class="services-list-container">
                        <h2 class="about-title mb-4">XUÂN DIỆU CHEF</h2>
                        <h3 class="services-list-title italic gold-text">Dịch Vụ nấu ăn XUÂN DIỆU chuyên nhận:</h3>

                        <div class="services-list">
                            <div class="service-item"><span>*</span> Tiệc cưới, Lễ hỏi</div>
                            <div class="service-item"><span>*</span> Tiệc Sinh nhật</div>
                            <div class="service-item"><span>*</span> Tiệc Thôi nôi, đầy tháng</div>
                            <div class="service-item"><span>*</span> Tiệc liên hoan, tất niên</div>
                            <div class="service-item"><span>*</span> Đám giỗ</div>
                            <div class="service-item"><span>*</span> ............................................</div>
                        </div>

                        <button class="menu-link-btn">
                            <Link href="/">Xem thêm</Link>
                        </button>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>


<script setup>
import { Link } from '@inertiajs/vue3';
import HeroBannerAboutUs from '@/Pages/Partials/HeroBannerAboutUs.vue';
</script>


<style scoped src="@css/pages/Guest/Aboutus.css"></style>
