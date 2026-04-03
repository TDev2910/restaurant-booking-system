<template>
    <Dialog v-model:visible="visible" modal header="Đặt lịch nhanh" :style="{ width: '35vw' }" :breakpoints="{ '1199px': '75vw', '575px': '90vw' }">
        <form @submit.prevent="submit" class="flex flex-col gap-4 py-4">
            <div class="flex flex-col gap-2">
                <label for="name" class="font-medium">Họ và tên <span class="text-red-500">*</span></label>
                <InputText id="name" v-model="form.customer_name" placeholder="Nhập tên người đặt" :class="{ 'p-invalid': form.errors.customer_name }" />
                <small v-if="form.errors.customer_name" class="text-red-500">{{ form.errors.customer_name }}</small>
            </div>
            
            <div class="grid grid-cols-2 gap-4">
                <div class="flex flex-col gap-2">
                    <label for="phone" class="font-medium">Số điện thoại <span class="text-red-500">*</span></label>
                    <InputText id="phone" v-model="form.phone" placeholder="Nhập số điện thoại" :class="{ 'p-invalid': form.errors.phone }" />
                    <small v-if="form.errors.phone" class="text-red-500">{{ form.errors.phone }}</small>
                </div>
                <div class="flex flex-col gap-2">
                    <label for="guests" class="font-medium">Số lượng người <span class="text-red-500">*</span></label>
                    <InputNumber id="guests" v-model="form.guest_count" :min="1" placeholder="Số khách" :class="{ 'p-invalid': form.errors.guest_count }" />
                    <small v-if="form.errors.guest_count" class="text-red-500">{{ form.errors.guest_count }}</small>
                </div>
            </div>

            <div class="flex flex-col gap-2">
                <label for="email" class="font-medium">Email (liên hệ)</label>
                <InputText id="email" v-model="form.email" placeholder="Nhập email" :class="{ 'p-invalid': form.errors.email }" />
                <small v-if="form.errors.email" class="text-red-500">{{ form.errors.email }}</small>
            </div>

            <div class="flex flex-col gap-2">
                <label for="date" class="font-medium">Ngày giờ đặt tiệc <span class="text-red-500">*</span></label>
                <DatePicker id="date" v-model="form.booking_date" showTime hourFormat="24" placeholder="Chọn ngày & giờ" :class="{ 'p-invalid': form.errors.booking_date }" />
                <small v-if="form.errors.booking_date" class="text-red-500">{{ form.errors.booking_date }}</small>
            </div>

            <div class="flex justify-center mt-4">
                <button type="submit" class="button" :disabled="form.processing">
                    Gửi yêu cầu
                </button>
            </div>
        </form>
    </Dialog>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3';
import Dialog from 'primevue/dialog';
import InputText from 'primevue/inputtext';
import InputNumber from 'primevue/inputnumber';
import DatePicker from 'primevue/datepicker';
import Swal from 'sweetalert2';

const visible = defineModel('visible');

const form = useForm({
    customer_name: '',
    email: '',
    phone: '',
    guest_count: 1,
    booking_date: null,
});

const submit = () => {
    form.post(route('bookings.store'), {
        onSuccess: () => {
            visible.value = false;
            form.reset();
            Swal.fire({
                title: 'Thành công!',
                text: 'Yêu cầu của bạn đã được gửi. Chúng tôi sẽ liên hệ sớm nhất!',
                icon: 'success',
                confirmButtonColor: 'var(--primary-color-600)',
            });
        },
    });
};
</script>

<style>
.p-datepicker {
    z-index: 1001 !important;
}
</style>
