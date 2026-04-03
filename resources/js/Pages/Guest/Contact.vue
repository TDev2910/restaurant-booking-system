<template>
    <div class="menu-page">
        <!-- 1. Banner Section -->
        <HeroBannerContact />

        <!-- 2. Contact Section -->
        <section class="contact-section">
            <div class="custom-container">
                <div class="contact-grid">
                    <!-- Left: Reservation Form -->
                    <div class="contact-form-container">
                        <h2 class="form-title">Gửi Yêu Cầu</h2>
                        <form @submit.prevent="submit" class="form-grid">
                            <div class="form-group">
                                <label class="form-label">Họ và Tên</label>
                                <input v-model="form.name" type="text" placeholder="Nguyễn Văn A" class="form-input"
                                    required>
                                <div v-if="form.errors.name" class="error-text">{{ form.errors.name }}</div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Số điện thoại</label>
                                <input v-model="form.phone" type="text" placeholder="090 123 4567" class="form-input"
                                    required>
                                <div v-if="form.errors.phone" class="error-text">{{ form.errors.phone }}</div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Địa chỉ Email</label>
                                <input v-model="form.email" type="email" placeholder="example@email.com"
                                    class="form-input" required>
                                <div v-if="form.errors.email" class="error-text">{{ form.errors.email }}</div>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Chủ đề liên hệ</label>
                                <select v-model="form.service_type" class="form-select">
                                    <option value="Hỏi về sản phẩm / Thực đơn">Hỏi về sản phẩm / Thực đơn</option>
                                    <option value="Đặt tiệc & Sự kiện">Đặt tiệc & Sự kiện</option>
                                    <option value="Phản hồi dịch vụ">Phản hồi dịch vụ</option>
                                    <option value="Yêu cầu khác">Yêu cầu khác</option>
                                </select>
                                <div v-if="form.errors.service_type" class="error-text">{{ form.errors.service_type }}
                                </div>
                            </div>


                            <div class="form-group full-width">
                                <label class="form-label">Ghi chú / Yêu cầu đặc biệt</label>
                                <textarea v-model="form.note"
                                    placeholder="Vui lòng cho chúng tôi biết yêu cầu cụ thể của bạn..."
                                    class="form-textarea"></textarea>
                                <div v-if="form.errors.note" class="error-text">{{ form.errors.note }}</div>
                            </div>

                            <div class="full-width">
                                <button type="submit" class="submit-btn" :disabled="form.processing">
                                    <span>GỬI YÊU CẦU</span>
                                    <i class="pi pi-arrow-right"></i>
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- Right: Contact Info -->
                    <div class="contact-info-container">
                        <div class="info-box">
                            <h2 class="info-title">Thông Tin Liên Hệ</h2>
                            <div class="info-list">
                                <div class="info-item">
                                    <div class="info-icon"><i class="pi pi-phone"></i></div>
                                    <div class="info-content">
                                        <h4>Hotline</h4>
                                        <p>0909123456</p>
                                    </div>
                                </div>
                                <div class="info-item">
                                    <div class="info-icon"><i class="pi pi-map-marker"></i></div>
                                    <div class="info-content">
                                        <h4>Địa chỉ</h4>
                                        <p>123 Đường Thùy Vân, Phường Thắng Tam
                                            TP. Vũng Tàu, Bà Rịa- Vũng Tàu</p>
                                    </div>
                                </div>
                                <div class="info-item">
                                    <div class="info-icon"><i class="pi pi-envelope"></i></div>
                                    <div class="info-content">
                                        <h4>Email</h4>
                                        <p>contact@xuandieuchef.com</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { useForm } from '@inertiajs/vue3';
import HeroBannerContact from '../Partials/HeroBannerContact.vue';

const form = useForm({
    name: '',
    phone: '',
    email: '',
    service_type: 'Hỏi về sản phẩm / Thực đơn',
    note: ''
});


const submit = () => {
    alert('Cảm ơn bạn! Yêu cầu của bạn đã được gửi. Chúng tôi sẽ liên hệ lại sớm nhất.');
    form.reset();
};
</script>

<style scoped src="@css/pages/Guest/Contact.css"></style>
