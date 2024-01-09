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
                            <div class="detail-product__right__form">                       
                                <div class="from-action-addcart">
                                    <div class="quality-btn">
                                        <div class="quality-btn-numbers">
                                           <button type="submit" onclick="Tru('${productDetail.id}')" value="-">-</button>
											       <strong><input  name="a" type="number" id="${productDetail.id}" value="1" ></input></strong>
											<button type="submit"  onclick="Cong('${productDetail.id}')" value="+">+</button>
                                        </div>
                                    </div>
                                    <div class="btn-buy">
                                        <button type="submit" class="add-cart">
	                                        <a href="#" onclick="AddToCartInDetail('${base}', ${productDetail.id }, 1)">
	                                       		 Thêm vào giỏ <i class="bi bi-cart-plus"></i>
	                                  		 </a> 
                                        </button>
                                         <button type="button" class="btn-buy-now">
                                        	<a href="${base}/cart"  onclick="AddToCart('${base}', ${productDetail.id }, 1)">MUA NGAY</a>
                                        </button> 
                                    </div>
                                </div>
                            </div>
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
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-element-bundle.min.js"></script>
    <script>
    function Cong(id) {
    	var product = document.getElementById(id);
    	a=product.getAttribute("value");
    	a=parseInt(a);
    	product.setAttribute("value",a+1);
	}
	
function Tru(id) {
    	var product = document.getElementById(id);
    	a=product.getAttribute("value");
    	product.setAttribute("value",a-1);
	}

  
    </script>
   
    
    
   
</body>
</html>
