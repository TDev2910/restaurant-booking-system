<template>
  <div class="custom-select-wrapper" ref="selectRef">
    <div 
      class="select-trigger" 
      :class="{ 'is-active': isOpen }"
      @click="toggleDropdown"
    >
      <span v-if="selectedItem" class="selected-text">
        {{ selectedItem[optionLabel] }}
      </span>
      <span v-else class="placeholder-text">
        {{ placeholder }}
      </span>
      
      <span class="arrow-icon" :class="{ 'rotate': isOpen }">▼</span>
    </div>

    <Transition name="dropdown">
      <ul v-if="isOpen" class="options-list">
        <li 
          v-for="(option, index) in options" 
          :key="index"
          class="option-item"
          :class="{ 'is-selected': isSelected(option) }"
          @click="selectOption(option)"
        >
          {{ option.label }}
        </li>
      </ul>
    </Transition>
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue';

// Nhận dữ liệu từ component cha
const props = defineProps({
  modelValue: {
    type: Object,
    default: null
  },
  options: {
    type: Array,
    required: true,
    default: () => []
  },
  optionLabel: {
    type: String,
    default: 'name' // Key để hiển thị text
  },
  placeholder: {
    type: String,
    default: 'Chọn một mục...'
  }
});

const emit = defineEmits(['update:modelValue', 'change']);

const isOpen = ref(false);
const selectRef = ref(null);
const selectedItem = ref(props.modelValue);

// Bật/tắt dropdown
const toggleDropdown = () => {
  isOpen.value = !isOpen.value;
};

// Xử lý khi chọn 1 mục
const selectOption = (option) => {
  selectedItem.value = option;
  emit('update:modelValue', option); // Cập nhật v-model
  emit('change', option);
  isOpen.value = false; // Đóng dropdown sau khi chọn
};

// Kiểm tra mục nào đang được chọn để highlight (Active)
const isSelected = (option) => {
  if (!selectedItem.value) return false;
  // So sánh dựa trên label (có thể đổi thành id hoặc code nếu cần)
  return selectedItem.value[props.optionLabel] === option[props.optionLabel];
};

// Tính năng: Click ra ngoài vùng select để đóng dropdown
const handleClickOutside = (event) => {
  if (selectRef.value && !selectRef.value.contains(event.target)) {
    isOpen.value = false;
  }
};

onMounted(() => {
  document.addEventListener('click', handleClickOutside);
});

onBeforeUnmount(() => {
  document.removeEventListener('click', handleClickOutside);
});
</script>

<style scoped>
/* Vùng bao ngoài */
.custom-select-wrapper {
  position: relative;
  min-width: 200px;
  font-family: sans-serif;
  user-select: none;
}

/* Khung Select (Trigger) */
.select-trigger {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: var(--neutral-color-700);
  color: var(--primary-color-600);
  padding: var(--size-200);
  border: 1px solid #333333;
  border-radius: var(--size-200);
  cursor: pointer;
  transition: border-color 0.2s;
}

.select-trigger:hover {
  border-color: var(--neutral-color-500);
}

.select-trigger.is-active {
  border-color: #ffffff;
  box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.2);
}

.placeholder-text {
  color: #9ca3af;
}

/* Icon mũi tên */
.arrow-icon {
  font-size: 0.8rem;
  transition: transform 0.3s ease;
}
.arrow-icon.rotate {
  transform: rotate(180deg);
}

/* Danh sách Dropdown */
.options-list {
  position: absolute;
  top: calc(100% + 8px);
  left: 0;
  width: 100%;
  background-color: var(--neutral-color-700);
  border: 1px solid var(--neutral-color-500);
  border-radius: var(--size-200);
  padding: var(--size-200) 0;
  margin: 0;
  list-style: none;
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.5);
  max-height: 200px;
  overflow-y: auto;
  z-index: 50;
}

/* Tùy chỉnh thanh cuộn (Scrollbar) cho Webkit */
.options-list::-webkit-scrollbar {
  width: 6px;
}
.options-list::-webkit-scrollbar-thumb {
  background: #444;
  border-radius: 4px;
}

/* Từng mục (Option) */
.option-item {
  padding: 10px 16px;
  color: var(--primary-color-600);
  cursor: pointer;
  transition: background-color 0.2s, font-weight 0.2s;
}

/* Hover: Màu đen nhạt */
.option-item:hover {
  background-color: var(--neutral-color-500);
}

/* Active: Màu đen nhạt sáng hơn một chút */
.option-item.is-selected {
  background-color: var(--neutral-color-500);
  font-weight: var(--fw-semi-bold);
}

/* Hiệu ứng Transition cho Dropdown */
.dropdown-enter-active,
.dropdown-leave-active {
  transition: opacity 0.2s ease, transform 0.2s ease;
}

.dropdown-enter-from,
.dropdown-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
</style>