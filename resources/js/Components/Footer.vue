<template>
    <footer class="footer">
        <div class="custom-container">
            <div class="footer-wrapper">
                <div class="footer-logo-social | text-center-only-md flow" style="--flow-spacer:1rem">
                    <div class="footer-logo">
                        <img src="../../../public/img/logo.png" alt="Restaurant Logo" class="logo">
                    </div>
                    <div class="footer-desc | text-center-only-md">
                        <p>
                            Kiến tạo trải nghiệm ẩm thực xa
                            xỉ tại gia mang tiêu chuẩn Michelin đến tận bàn tiệc
                            của bạn.
                        </p>
                    </div>
                    <ul class="social-list">
                        <li>
                            <a aria-label="facebook" href="">
                                <svg class="social-icon">
                                    <use xlink:href="/img/social-icons.svg#icon-facebook"></use>
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a aria-label="instagram" href="">
                                <svg class="social-icon">
                                    <use xlink:href="/img/social-icons.svg#icon-instagram"></use>
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a aria-label="grab-food" href="">
                                <svg class="social-icon">
                                    <use xlink:href="/img/social-icons.svg#icon-grabfood"></use>
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a aria-label="youtube" href="">
                                <svg class="social-icon">
                                    <use xlink:href="/img/social-icons.svg#icon-youtube"></use>
                                </svg>
                            </a>
                        </li>
                    </ul>
                </div>
                <nav class="footer-nav | even-columns text-center-only-md">
                    <div class="footer-policy">
                        <h3 class="text-xl font-semibold mb-4">Khám phá</h3>
                        <ul class="nav-list flow" style="--flow-spacer: .25em" aria-label="footer" role="list">
                            <li><a href="#">Về chúng tôi</a></li>
                            <li><a href="#">Chính sách bảo mật</a></li>
                            <li><a href="#">Điều khoản dịch vụ</a></li>
                            <li><a href="#">Liên hệ báo chí</a></li>
                        </ul>
                    </div>
                    <div class="footer-contact">
                        <h3 class="text-xl font-semibold mb-4">Địa Chỉ Nhà Hàng</h3>
                        <ul class="contact-list nav-list | flow" style="--flow-spacer: .25em">
                            <li class="flex items-center">
                                <i class="pi pi-map-marker" style="font-size:var(--size-600)"></i>
                                <span>
                                    123 Đường Thùy Vân, Phường Thắng Tam<br />
                                    TP. Vũng Tàu, Bà Rịa - Vũng Tàu
                                </span>
                            </li>

                            <li class="flex items-center">
                                <i class="pi pi-phone" style="font-size:var(--size-600)"></i>
                                <span>Hotline đặt bàn:
                                    <a href="tel:0909123456">0909123456</a>
                                </span>
                            </li>

                            <li class="flex items-center">
                                <i class="pi pi-clock" style="font-size:var(--size-600)"></i>
                                <span>Giờ mở cửa: 08:00 - 22:30 (Tất cả các ngày)</span>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div
                    class="footer-location | first-line:map-container w-full h-64 md:h-80 bg-gray-800 rounded-xl overflow-hidden shadow-2xl border border-gray-700">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3924.627294326521!2d107.0844538152865!3d10.341395992617757!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31756fd27f273ab9%3A0x671d1170ccf60f6f!2zQsOjaSBTYXUsIFZũngIFTw6B1!5e0!3m2!1svi!2s!4v1680000000000!5m2!1svi!2s"
                        width="100%" height="100%" style="border:0;" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <h3 class="footer-copyright-text">@ 2026 Xuân Diệu Chef Nghệ thuật ẩm thực tinh hoa</h3>
        </div>
    </footer>
</template>

<style scoped>
.footer {
    padding: var(--size-500) 0;
}

.footer-wrapper {
    display: grid;
    gap: var(--size-700);
    grid-template-areas: "logo-social" "nav" "location";
    margin-bottom: var(--size-400);
}

.footer-wrapper>* {
    margin-inline: auto;
}

@media (min-width: 48em) {
    .footer-wrapper {
        grid-template-areas: "logo-social nav" "location";
    }
}

@media (min-width: 62em) {
    .footer-wrapper {
        grid-template-areas: "logo-social nav location";
    }
}


/* footer logo social */
.footer-logo-social {
    grid-area: logo-social;
    display: flex;
    flex-direction: column;
    align-items: center;
}

@media(min-width: 48em) {
    .footer-logo-social {
        align-items: flex-start;
    }
}

.footer-logo {
    height: 72px;
}

/* footer nav */
.footer-nav {
    grid-area: nav;
    gap: clamp(var(--size-400), 4vw, var(--size-600));
}

@media(min-width: 48em) {
    .footer-nav.even-columns {
        grid-template-columns: auto minmax(0, 1fr);
    }
}

.footer-nav .nav-list {
    flex-direction: column;
    gap: var(--size-200);
}

@media(min-width: 48em) {
    .footer-contact {
        text-align: left;
    }
}

/* footer-location */
.footer-location {
    grid-area: location;
    margin-bottom: var(--size-200);
}

/* footer-copyright */
.footer-copyright {
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    font-size: var(--fs-nav);
    padding: var(--size-600) 0 var(--size-200);
    text-align: center;
}
</style>