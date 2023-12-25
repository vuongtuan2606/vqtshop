<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Trang chủ</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
   
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <section class="bread-crumb">
        <div class="container">
            <div class="bread-crumb__title">
                ${productDetail.title }
            </div>
            <nav aria-label="breadcrumb " class="bread-crumb__List">
                <ol class="breadcrumb bread-crumb__List__ol">
                  <li class="breadcrumb-item bread-crumb__List__item"><a href="${base }/home">Trang chủ</a></li>
                  <li class="breadcrumb-item active bread-crumb__List__item" aria-current="page">${categorie.name }</li>
                  <li class="breadcrumb-item active bread-crumb__List__item" aria-current="page">${productDetail.title }</li>
                </ol>
            </nav>
        </div>

    </section>
    <section class="detail-product">
        <div class="container">
            <div class="row">
                <div class="col-xl-7 col-lg-7 detail-product__left">
                    <div class="detail-product__image">
                        <div class="gallery-top">
                            <swiper-container  class="mySwiper" thumbs-swiper=".mySwiper2" space-between="1">
                                <swiper-slide>
                                    <a href="#">
                                         <img id="avatar" src="${base }/upload/${productDetail.avatar}" >
                                    </a>
                                </swiper-slide>
                                
                            </swiper-container>
                        </div>
                        <div class="gallery-thumbs">
                            <swiper-container style="--swiper-navigation-color: #c1c1c1; --swiper-pagination-color: #fff" class="mySwiper2" space-between="10" slides-per-view="4" free-mode="true" watch-slides-progress="true"  navigation="true">
                                <swiper-slide>
                                    <img src="../testimg/nho1.webp" />
                                </swiper-slide>
                                <swiper-slide>
                                    <img src="../testimg/nho2.webp" />
                                </swiper-slide>
                                <swiper-slide>
                                    <img src="../testimg/nho3.webp" />
                                </swiper-slide>
                                <swiper-slide>
                                    <img src="../testimg/nho4.webp" />
                                </swiper-slide>
                                <swiper-slide>
                                    <img src="../testimg/nho1.webp" />
                                </swiper-slide>
                                <swiper-slide>
                                    <img src="../testimg/nho2.webp" />
                                </swiper-slide>
                                <swiper-slide>
                                    <img src="../testimg/nho3.webp" />
                                </swiper-slide>
                                <swiper-slide>
                                    <img src="../testimg/nho4.webp" />
                                </swiper-slide>
                            </swiper-container>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5 detail-product__right">
                    <div class="">
                        <h1 class="detail-product__right__title"> ${productDetail.title }</h1>
                        <div class="detail-product__right__top">
                            <div class="trademark-size clearfix">
                                <span>Thương Hiệu: <strong>${brand.brand_name }</strong></span>
                                
                            </div>
                        </div>
                        <div class="detail-product__right__price">
                            <div class="price__box">
                                <!-- khuyến mãi -->
                                <fmt:setLocale value="vi_VN"/>
		                        <span class="special-price" >
		                             <fmt:formatNumber value="${productDetail.priceSale}" type="currency"/>
		                        </span>
                                <!-- giá gốc -->
                                
                                 <fmt:setLocale value="vi_VN"/>
		                        <span class="old-price"  >
		                             <fmt:formatNumber value="${productDetail.price}" type="currency"/>
		                        </span>
                            </div>
                        </div>
                        <form action="" method="post">
                            <div class="detail-product__right__form">                       
                                <div class="from-action-addcart">
                                    <div class="quality-btn">
                                        <div class="quality-btn-numbers">
                                            <button class="decrease"  onclick="decreaseQuantity()">-</button>
                                                <input type="text" class="quantity" value="1">
                                            <button class="increase btn-plus" onclick="increaseQuantity()">+</button>
                                        </div>
                                    </div>
                                    <div class="btn-buy">
                                        <button type="submit" class="add-cart">Thêm vào giỏ>
	                                        <a href="#" onclick="AddToCart('${base}', ${products.id }, 1)">
	                                       		<i class="bi bi-cart-plus"></i>
	                                  		 </a> s
                                        </button>
                                        <button type="button" class="btn-buy-now">Mua ngay</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="size-guide-box ">
                            <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M64 464c-8.8 0-16-7.2-16-16V64c0-8.8 7.2-16 16-16H224v80c0 17.7 14.3 32 32 32h80V448c0 8.8-7.2 16-16 16H64zM64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V154.5c0-17-6.7-33.3-18.7-45.3L274.7 18.7C262.7 6.7 246.5 0 229.5 0H64zm56 256c-13.3 0-24 10.7-24 24s10.7 24 24 24H264c13.3 0 24-10.7 24-24s-10.7-24-24-24H120zm0 96c-13.3 0-24 10.7-24 24s10.7 24 24 24H264c13.3 0 24-10.7 24-24s-10.7-24-24-24H120z"/></svg>
                            <a href=""> Xem hướng dẫn chọn size</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-12 col-lg-12 ">
                    <div class="product-tab ">
                        <ul class="product-tab__title clearfix ">
                            <li class="tablinks active"  onclick="openTab(event, 'tab1')">
                                <span>MÔ TẢ SẢN PHẨM</span>
                            </li>
                            <li class="tablinks" onclick="openTab(event, 'tab2')">
                                <span>CHÍNH SÁCH ĐỔI/TRẢ</span>
                            </li>
                        </ul>
                        <div id="tab1" class="tabcontent">
                            <!-- Nội dung tab 1 -->
                            <h2>Tab 1</h2>
                            <p>Nội dung của tab 1.</p>
                        </div>
                    
                        <div id="tab2" class="tabcontent">
                            <!-- Nội dung tab 2 -->
                            <h2>Tab 2</h2>
                            <p>Nội dung của tab 2.</p>
                        </div>
                    
                        <div id="tab3" class="tabcontent">
                            <!-- Nội dung tab 3 -->
                            <h2>Tab 3</h2>
                            <p>Nội dung của tab 3.</p>
                        </div>

                    </div>


                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="section_prd_feature ">\
                        <div class="accessory__title">
                            <h2>
                                <a href="">NHỮNG SẢN PHẨM TƯƠNG TỰ</a>
                            </h2>
                            <p>
                                Những Sản Phẩm Cùng Bộ Sưu Tập Tại MLB Việt Nam Có Thể Bạn Sẽ Thích
                            </p>
                        </div>
                        <div class="row product_related ">
                            <div class="col-xl-3 pb-3">
                                <div class="product__card" >    
                                    <div class="product__image">
                                        <img src="../img/new-product-1.webp" class="main-image" >
                                        <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                        <div class="overlay__add-to-cart">
                                            <button class="add-to-cart">
                                                <i class="bi bi-cart-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="product__info">
                                        <span class="product__brand">MLB VIỆT NAM</span>
                                        <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                        <span class="product__price">
                                            4.790.000đ
                                        </span>
                                    </div>
                                </div>
                            </div><div class="col-xl-3 pb-3">
                                <div class="product__card" >    
                                    <div class="product__image">
                                        <img src="../img/new-product-1.webp" class="main-image" >
                                        <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                        <div class="overlay__add-to-cart">
                                            <button class="add-to-cart">
                                                <i class="bi bi-cart-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="product__info">
                                        <span class="product__brand">MLB VIỆT NAM</span>
                                        <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                        <span class="product__price">
                                            4.790.000đ
                                        </span>
                                    </div>
                                </div>
                            </div><div class="col-xl-3 pb-3">
                                <div class="product__card" >    
                                    <div class="product__image">
                                        <img src="../img/new-product-1.webp" class="main-image" >
                                        <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                        <div class="overlay__add-to-cart">
                                            <button class="add-to-cart">
                                                <i class="bi bi-cart-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="product__info">
                                        <span class="product__brand">MLB VIỆT NAM</span>
                                        <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                        <span class="product__price">
                                            4.790.000đ
                                        </span>
                                    </div>
                                </div>
                            </div><div class="col-xl-3 pb-3">
                                <div class="product__card" >    
                                    <div class="product__image">
                                        <img src="../img/new-product-1.webp" class="main-image" >
                                        <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                        <div class="overlay__add-to-cart">
                                            <button class="add-to-cart">
                                                <i class="bi bi-cart-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="product__info">
                                        <span class="product__brand">MLB VIỆT NAM</span>
                                        <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                        <span class="product__price">
                                            4.790.000đ
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </section>
    <footer >
        <div class="firt-footer">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 contact-footer">
                        <div class="logo-footer">
                            <img src="..//img/logo_footer.webp" alt="">
                        </div>
                        <ul>
                            <li>
                                <p><i class="bi bi-geo-alt"></i>Golden Mansion Building - HCM City - Vietnam</p>
                                <p>Hanoi Capital - Vietnam</p>
                            </li>
                            <li>
                                <p><i class="bi bi-telephone"></i>+84899263162</p>
                            </li>
                            <li>
                                <p><i class="bi bi-headset"></i>Zalo Business: +84899263162</p>
                            </li>
                            <li>
                                <span><i class="bi bi-stopwatch"></i>Giờ làm việc: 8:00am - 10:00pm</span>
                            </li>
                        </ul>

                    </div>
                    <div class="col-xl-2 footer-click">
                        <h4><span>Hỗ Trợ</span></h4>
                        <div class="footer-menu">
                            <a href="">Tìm kiếm sản phẩm</a>
                            <a href="">Giỏ hàng</a>
                            <a href="">Kiểm tra tình trạng đơn hàng</a>
                            <a href="">Đăng ký tk</a>
                            <a href="">Đăng nhập tk</a>
                        </div>

                    </div>
                    <div  class="col-xl-2 footer-click">
                        <h4><span>Chính Sách MLB</span></h4>
                        <div class="footer-menu">
                            <a href="">Chính sách đổi trả</a>
                            <a href="">Chính sách bảo mật</a>
                            <a href="">Chính sách vận chuyển</a>
                            <a href="">Quy định sử dụng</a>
                        </div>
                    </div>
                    <div  class="col-xl-3 footer-click">
                        <div class="social-buttons">
                            <a href="" class="social-button"><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z"/></svg></a>
                            <a href="" class="social-button"><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M504 256C504 119 393 8 256 8S8 119 8 256c0 123.78 90.69 226.38 209.25 245V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.28c-30.8 0-40.41 19.12-40.41 38.73V256h68.78l-11 71.69h-57.78V501C413.31 482.38 504 379.78 504 256z"/></svg></a>
                            <a href="" class="social-button"><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/></svg></a>
                        </div>
                        <div class="footer-mailchip">
                            <h4>
                                <span>
                                    Đăng ký để nhận tin
                                </span>
                            </h4>

                            <div class="mail_footer">
                                <form action="" method="post">
                                    <input type="email" class="form-control" value placeholder="Nhập địa chỉ email"name="EMAIL" id="mail">
                                    <span class="input-group-append subscribe">
                                        <button class="btn btn-default" type="submit" aria-label="Đăng ký ngay" name="subscribe">Gửi</button>             
                                    </span>
                                </form>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </footer>
    <script>
        // Hàm tăng số lượng
        function increaseQuantity() {
            var quantityInput = document.querySelector('.quantity'); // Lấy thẻ input có class 'quantity'
            var currentValue = parseInt(quantityInput.value); // Lấy giá trị hiện tại của input và chuyển thành số nguyên
    
            if (!isNaN(currentValue)) { // Kiểm tra nếu giá trị hiện tại là một số hợp lệ
                quantityInput.value = currentValue + 1; // Tăng giá trị lên 1 và cập nhật vào input
            }
        }
    
        // Hàm giảm số lượng
        function decreaseQuantity() {
            var quantityInput = document.querySelector('.quantity'); // Lấy thẻ input có class 'quantity'
            var currentValue = parseInt(quantityInput.value); // Lấy giá trị hiện tại của input và chuyển thành số nguyên
    
            if (!isNaN(currentValue) && currentValue > 1) { // Kiểm tra nếu giá trị hiện tại là một số hợp lệ và lớn hơn 1
                quantityInput.value = currentValue - 1; // Giảm giá trị đi 1 và cập nhật vào input
            }
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-element-bundle.min.js"></script>
    
    <script src='../js/index.js'></script>
   
</body>
</html>
