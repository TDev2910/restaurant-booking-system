<template>
    <div class="auth-layout">
        <main class="auth-content">
            <slot />
        </main>
    </div>
</template>

<style scoped>
.auth-layout {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: var(--neutral-color-800);
}

.auth-content {
    background: var(--neutral-color-700);
    padding: var(--size-600);
    border-radius: var(--size-400);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    width: 100%;
    max-width: 450px;
}
</style>
