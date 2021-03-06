﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="KetThucMon.TheHien.Footer" %>

<script src="../Scripts/bootstrap.min.js"></script>
<link href="../Content/bootstrap.min.css" rel="stylesheet" />
<link href="../Style/style.css" rel="stylesheet" />

<div class="footer">
    <div class="designed-info text-white flex flex-row justify-center">
        <span>Designed by </span><strong><a
            class="text-white"
            href="https://github.com/lamsonhai1379"
            target="_blank">LamSonHai</a></strong>
    </div>
    <div class="overlay"></div>
    <div class="footer-contents flex flex-row space-around align-center">
        <div class="site-slogan flex flex-column flex-start align-center">
            <div class="logo">
                <img src="../images/logo.png" alt="" />
            </div>
            <span class="introduce text-gray">Ducky Chúng tôi, những người trẻ đam mê văn hoá đường phố, những
              nét văn hoá mang đầy tính bụi bặm, dựa trên những cảm xúc mà chúng
              tôi cảm nhận được ở Sài Gòn này, chúng tôi muốn mang đến cho những
              khách hàng của chúng tôi những chiếc áo mang những graphic, những
              câu chuyện đường phố nhất có thể. Đối với chúng tôi, những chiếc
              áo thun không đơn thuần chỉ là để mặc, mà nó còn mang cả một câu
              chuyện mà chúng tôi muốn mang đến cho các khách hàng.
            </span>
        </div>
        <div class="product flex flex-column flex-start">
            <div class="product-title">
                <h1>Top sale</h1>
            </div>

            <div class="product-items flex flex-column v-padding space-between">
                <div class="items flex flex-row">
                    <div class="item-sale flex flex-row">
                        <div class="item-img">
                            <a href="./page/product.html?tag=TSHIRT&id=BHTS-03">
                                <img
                                    class="img-fit"
                                    src="../images/Products/Clothes/T-shirt/bad-funky-1.webp"
                                    alt="" />
                            </a>
                        </div>
                        <div class="item-info flex flex-column v-padding">
                            <div class="item-name text-white">
                                <span>BAD FUNKY</span>
                            </div>
                            <div class="item-price line-through text-white">
                                400.000đ
                   
                            </div>
                            <div class="item-price text-white">
                                310.000đ
                   
                            </div>
                        </div>
                    </div>
                    <div class="item-sale flex flex-row">
                        <div class="item-img">
                            <a href="./page/product.html?tag=TSHIRT&id=BHTS-08">
                                <img
                                    class="img-fit"
                                    src="../images/Products/Clothes/T-shirt/rabbit-king-1.webp"
                                    alt="" />
                            </a>
                        </div>
                        <div class="item-info flex flex-column v-padding h-padding">
                            <div class="item-name text-white">
                                <span>RABBIT KING TEE</span>
                            </div>
                            <div class="item-price line-through text-white">
                                310.000đ
                   
                            </div>
                            <div class="item-price text-white">
                                250.000đ
                   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-items flex flex-column space-between">
                <div class="items flex flex-row">
                    <div class="item-sale flex flex-row">
                        <div class="item-img">
                            <a href="./page/product.html?tag=BACK_PACK&id=BHBP-03">
                                <img
                                    class="img-fit"
                                    src="../images/Products/Backpack/dau-lau-trang-den.webp"
                                    alt="" />
                            </a>
                        </div>
                        <div class="item-info flex flex-column v-padding h-padding">
                            <div class="item-name text-white">
                                <span>BW Backpack</span>
                            </div>
                            <div class="item-price line-through text-white">
                                550.000đ
                   
                            </div>
                            <div class="item-price text-white">
                                400.000đ
                   
                            </div>
                        </div>
                    </div>
                    <div class="item-sale flex flex-row">
                        <div class="item-img">
                            <a href="./page/product.html?tag=BACK_PACK&id=DG-02">
                                <img
                                    class="img-fit"
                                    src="../images/Products/Backpack/DG-holo-1.webp"
                                    alt="" />
                            </a>
                        </div>
                        <div class="item-info flex flex-column v-padding h-padding">
                            <div class="item-name text-white">
                                <span>Backpack Hologram</span>
                            </div>
                            <div class="item-price line-through text-white">
                                650.000đ
                   
                            </div>
                            <div class="item-price text-white">
                                450.000đ
                   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="contact flex flex-column flex-start align-center">
            <div class="contact-title">
                <h1>Liên hệ</h1>
            </div>
            <div class="email">
                <span class="text-white">Email: </span>
                <span class="text-white">lamsonhai1379@gmail.com</span>
            </div>
            <div class="social">
                <ul class="social-icon flex flex-row">
                    <li>
                        <a
                            href="https://www.facebook.com/hai.lam.3726613"
                            target="blank"><i class="fab fa-facebook-square text-gray"></i></a>
                    </li>
                    <li>
                        <a href="https://github.com/sonhai32" target="blank"><i class="fab fa-github-square text-gray"></i></a>
                    </li>
                    <li>
                        <a
                            href="https://www.instagram.com/hai.lam.3726613/"
                            target="blank"><i class="fab fa-instagram text-gray"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
