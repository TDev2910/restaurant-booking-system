import "../css/reset.css";
import "../css/app.css";
import "../css/base.css";
import "./bootstrap";

import { createInertiaApp } from "@inertiajs/vue3";
import { resolvePageComponent } from "laravel-vite-plugin/inertia-helpers";
import { createApp, h } from "vue";
import { ZiggyVue } from "../../vendor/tightenco/ziggy";

// PrimeVue
import PrimeVue from "primevue/config";
import Aura from "@primevue/themes/aura";
import "primeicons/primeicons.css";
import ToastService from "primevue/toastservice";
import ConfirmationService from "primevue/confirmationservice";

// Layouts
import GuestLayout from "../js/Layouts/GuestLayout.vue";

// SweetAlert2
import Swal from "sweetalert2";

const appName = import.meta.env.VITE_APP_NAME || "Laravel";

createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    resolve: (name) => {
        const pages = import.meta.glob("./Pages/**/*.vue", { eager: true });
        const page = pages[`./Pages/${name}.vue`];

        // can expand with role authentication
        if (name.startsWith("Guest/")) {
            page.default.layout = GuestLayout;
        }
        else{
            page.default.layout = page.default.layout;   
        }

        return page;
    },
    setup({ el, App, props, plugin }) {
        const app = createApp({ render: () => h(App, props) });

        // Register plugins
        app.use(plugin);
        app.use(ZiggyVue);
        app.use(PrimeVue, {
            theme: {
                preset: Aura,
                options: {
                    darkModeSelector: ".dark",
                },
            },
        });
        app.use(ToastService);
        app.use(ConfirmationService);

        // global function: set background image
        app.config.globalProperties.$getBgStyle = (url) => {
            let finalUrl = url;
            if (!finalUrl.startsWith("http")) {
                finalUrl = "/" + finalUrl.replace(/^\/+/, "");
            }
            return {
                backgroundImage: `url(${finalUrl})`,
            };
        };

        // Make $swal available globally
        app.config.globalProperties.$swal = Swal;

        return app.mount(el);
    },
    progress: {
        color: "#d97706", // amber-600 – culinary theme
    },
});
