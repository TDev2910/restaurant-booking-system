<template>
    <Head title="Quản lý đặt tiệc" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Danh sách đặt tiệc</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                    <DataTable :value="bookings" paginator :rows="10" tableStyle="min-width: 50rem" :sortField="'booking_date'" :sortOrder="-1">
                        <Column field="id" header="ID" sortable></Column>
                        <Column field="customer_name" header="Khách hàng" sortable></Column>
                        <Column header="Liên hệ">
                            <template #body="slotProps">
                                <div class="flex flex-col">
                                    <span><i class="pi pi-phone text-xs mr-1 text-green-600"></i>{{ slotProps.data.phone }}</span>
                                    <span v-if="slotProps.data.email" class="text-xs text-gray-500"><i class="pi pi-envelope text-xs mr-1"></i>{{ slotProps.data.email }}</span>
                                </div>
                            </template>
                        </Column>
                        <Column field="guest_count" header="Số người" sortable></Column>
                        <Column field="booking_date" header="Ngày giờ" sortable>
                            <template #body="slotProps">
                                {{ formatDate(slotProps.data.booking_date) }}
                            </template>
                        </Column>
                        <Column field="status" header="Trạng thái" sortable>
                            <template #body="slotProps">
                                <Tag :value="getStatusLabel(slotProps.data.status)" :severity="getStatusSeverity(slotProps.data.status)" />
                            </template>
                        </Column>
                        <Column field="admin_note" header="Ghi chú"></Column>
                        <Column header="Thao tác" class="text-right">
                            <template #body="slotProps">
                                <div class="flex gap-2 justify-end">
                                    <Button icon="pi pi-pencil" severity="info" text rounded @click="openDialog(slotProps.data)" title="Cập nhật ghi chú và trạng thái" />
                                    <Button v-if="slotProps.data.status === 'pending'" icon="pi pi-check" severity="success" text rounded @click="updateQuickStatus(slotProps.data, 'confirmed')" title="Xác nhận nhanh" />
                                    <Button v-if="slotProps.data.status === 'pending'" icon="pi pi-times" severity="danger" text rounded @click="updateQuickStatus(slotProps.data, 'cancelled')" title="Hủy nhanh" />
                                </div>
                            </template>
                        </Column>
                    </DataTable>
                </div>
            </div>
        </div>

        <Dialog v-model:visible="editStatusVisible" modal header="Cập nhật thông tin đặt tiệc" :style="{ width: '35vw' }">
            <div class="flex flex-col gap-4 py-4">
                <div class="flex flex-col gap-2">
                    <label for="status" class="font-bold">Trạng thái</label>
                    <Select id="status" v-model="form.status" :options="statusOptions" optionLabel="label" optionValue="value" placeholder="Chọn trạng thái" class="w-full" />
                </div>
                <div class="flex flex-col gap-2">
                    <label for="note" class="font-bold">Ghi chú của Admin</label>
                    <Textarea id="note" v-model="form.admin_note" rows="5" placeholder="Nhập ghi chú phản hồi khách hàng (Vd: Khách đổi sang 18h, Đã cọc 500k...)" class="w-full" />
                </div>
                <div class="flex justify-end gap-2 mt-4">
                    <Button type="button" label="Bỏ qua" severity="secondary" @click="editStatusVisible = false" />
                    <Button label="Lưu thay đổi" icon="pi pi-save" @click="saveChanges" :loading="form.processing" />
                </div>
            </div>
        </Dialog>
    </AuthenticatedLayout>
</template>

<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import Tag from 'primevue/tag';
import Button from 'primevue/button';
import Dialog from 'primevue/dialog';
import Textarea from 'primevue/textarea';
import Select from 'primevue/select';
import { ref } from 'vue';
import Swal from 'sweetalert2';

const props = defineProps({
    bookings: Array
});

const editStatusVisible = ref(false);
const selectedId = ref(null);

const statusOptions = [
    { label: 'Chờ duyệt', value: 'pending' },
    { label: 'Xác nhận', value: 'confirmed' },
    { label: 'Hủy bỏ', value: 'cancelled' }
];

const form = useForm({
    status: '',
    admin_note: ''
});

const openDialog = (booking) => {
    selectedId.value = booking.id;
    form.status = booking.status;
    form.admin_note = booking.admin_note || '';
    editStatusVisible.value = true;
};

const saveChanges = () => {
    form.patch(route('admin.bookings.update', selectedId.value), {
        onSuccess: () => {
            editStatusVisible.value = false;
            Swal.fire('Thành công', 'Đã cập nhật thông tin thành công!', 'success');
        },
    });
};

const updateQuickStatus = (booking, status) => {
    Swal.fire({
        title: `Bạn muốn ${status === 'confirmed' ? 'Xác nhận' : 'Hủy'} lịch đặt này?`,
        text: `Khách hàng: ${booking.customer_name}`,
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Đồng ý',
        cancelButtonText: 'Bỏ qua'
    }).then((result) => {
        if (result.isConfirmed) {
            form.status = status;
            form.admin_note = booking.admin_note || '';
            form.patch(route('admin.bookings.update', booking.id), {
                onSuccess: () => {
                    Swal.fire('Thành công', 'Đã cập nhật trạng thái nhanh!', 'success');
                }
            });
        }
    });
};

const formatDate = (dateString) => {
    if (!dateString) return '';
    return new Date(dateString).toLocaleString('vi-VN', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric',
        hour: '2-digit',
        minute: '2-digit'
    });
};

const getStatusLabel = (status) => {
    const labels = {
        'pending': 'CHỜ DUYỆT',
        'confirmed': 'ĐÃ XÁC NHẬN',
        'cancelled': 'ĐÃ HỦY'
    };
    return labels[status] || status;
};

const getStatusSeverity = (status) => {
    const severities = {
        'pending': 'warn',
        'confirmed': 'success',
        'cancelled': 'danger'
    };
    return severities[status] || 'info';
};
</script>
