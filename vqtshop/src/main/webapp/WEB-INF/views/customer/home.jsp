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

    <section class="section-1">
        <div class="container-fluid p-0">
            <div class="home-slider">
                <div id="carouselExampleIndicators" class="carousel slide">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${base }/img/slide/slider_1.webp" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${base }/img/slide/slider_2.webp"  class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${base }/img/slide/slider_3.webp"  class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${base }/img/slide/slider_4.webp"  class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </section>
    <section class="section-2">
        <div class="container">
            <div class="row  section-service">
                <div class="col-xxl-4 col-xl-4 section-service__box">
                    <div class="section-service__icon">
                        <i class="bi bi-truck"></i>
                    </div>
                    <div class="section-service__info">
                        <h3>GIAO HÀNG TOÀN QUỐC</h3>
                        <p>Miễn phí các đơn vận chuyển trên 1.000.000Đ</p>
                    </div>
                </div>
                <div class="col-xxl-4 col-xl-4 section-service__box">
                    <div class="section-service__icon">
                        <i class="bi bi-telephone-outbound"></i>
                    </div>
                    <div class="section-service__info">
                        <h3>HỖ TRỢ ONLINE</h3>
                        <p>Đội ngũ hỗ trợ hoạt động tất cả các ngày trong tuần</p>

                    </div>
                </div>
                <div class="col-xxl-4 col-xl-4 section-service__box">
                    <div class="section-service__icon">
                        <i class="bi bi-arrow-repeat"></i>
                    </div>
                    <div class="section-service__info">
                        <h3>ĐỔI HÀNG DỄ DÀNG</h3>
                        <p>Đổi hàng online đơn giản trực tiếp</p>
                    </div>
                </div>
                <div class="col-xxl-4 col-xl-4 section-service__box">
                    <div class="section-service__icon">
                        <i class="bi bi-gift"></i>
                    </div>  
                    <div class="section-service__info">
                        <h3>QUÀ TẶNG HẤP DẪN</h3>
                        <p>CHương trình khuyến mãi cực lớn và hấp dẫn hàng tháng</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-3">
        <section class="section-new-shoes"> 
            <div class="container">
                <div class="new-shoes__title">
                    <h2>
                        <a href="">NEW SHOES</a>
                    </h2>
                    <p>
                        Những phiên bản giày MLB mới nhất tại Cửa Hàng
                    </p>
                </div>
                <div class="new-shoes__banner">
                    <a href="">
                        <div id="carouselExampleSlidesOnly" class="carousel slide " data-bs-ride="carousel">
                            <div class="carousel-inner ">
                              <div class="carousel-item active  ">
                                <img src="${base }/img/shoes/shoes_1.webp" class="d-block w-100" alt="...">
                              </div>
                              <div class="carousel-item">
	                            <img src="${base }/img/slide/slider_4.webp"  class="d-block w-100" alt="...">
	                        </div>
                             
                            </div>
                        </div>
                    </a>
                </div>
                <div class="new-shoes__product">
                    <div class="row d-flex">
                       <c:forEach var="products"  begin = "0" end = "4" items="${productsHot}">  
	                        <div class="col-xl-3 col-xlx-3 col-md-4 col-12 pb-3">                     	    
	                           <div class="product__card" >    
	                               <div class="product__image">
	                                   <img src="${base }/upload/${products.avatar}" />
	                                   <!-- <img src="../img/new-product-1-hover.webp" alt="" class="hover-image"> -->
	                                   <div class="overlay__add-to-cart">
	                                       <button class="add-to-cart">
	                                       		<a href="#" onclick="AddToCart('${base}', ${products.id }, 1)">
		                                       		<i class="bi bi-cart-plus"></i>
		                                  		 </a>                                           
	                                       </button>
	                                   </div>
	                               </div>
	                               <div class="product__info">
	                                   <span class="product__brand" >${products.brand.brand_name}</span>
	                                   <a href="${base }/home/product-detail/${products.id }">${products.title }</a>
	                                   <fmt:setLocale value="vi_VN"/>
	                                   <div class="product__price" >
	                                   		 <span  style="text-decoration: line-through !important;">
	                                   		 	<fmt:formatNumber value="${products.price}" type="currency"/></span>
   											 <span>
   											 <fmt:formatNumber value="${products.priceSale}" type="currency"/></span>
	                                   </div>	                                    
	                               </div>
	                           </div>                          
	                    </div>
                    </c:forEach> 
                </div>
                <div class="view-more">
                    <a href="${base }/home/listproduct/1"   >
                        Xem tất cả
                    </a>
                </div>
            </div>
        </section>
    </section>
    <section class="section-4">
        <section class="section-accessory">
            <div class="container">
                <div class="accessory__title">
                    <h2>
                        <a href="">PHỤ KIỆN</a>
                    </h2>
                    <p>
                        Những phụ kiện MLB mới nhất tại Cửa Hàng
                    </p>
                </div>
                <div class="accessory__list">
                    <div class="row accessory__list__box ">

                        <div class="col-xxl-6 accessory__list__left" >
                            <a href="" class="accessory__wrapper">                  
                                <div class="accessory__info__left">
                                    <h3 class="accessory__info__left__title">
                                        <a href="">Mark</a>
                                    </h3>
                                        <a href="">
                                            Xem thêm <i class="bi bi-arrow-right"></i>
                                        </a>
                                </div>
                                <img src="../img/accessories_1.webp" alt="">
                            </a>
                        </div>
                        
                        <div class="col-xxl-6 accessory__list__right">
                            <div class="row d-block">
                                <div class="col-xxl-6 pb-3 accessory__list__right__inside">
                                   <a href="" class="accessory__wrapper">
                                        <div class="accessory__info__right__1">
                                            <h3 class="accessory__info__right__title__1">
                                                <a href="">Balo MLB</a>
                                            </h3>
                                            <a href="">
                                                Xem thêm <i class="bi bi-arrow-right"></i>
                                            </a>
                                        </div>
                                        <img src="../img/accessories_2.webp" alt="">
                                   </a>
                                </div>
                                <div class="col-xxl-6 accessory__list__right__inside">
                                    <a href="" class="accessory__wrapper">
                                        <div class="accessory__info__right__2">
                                            <h3 class="accessory__info__right__title__2">
                                                <a href="">Socks</a>
                                            </h3>
                                            <a href="">
                                                Xem thêm <i class="bi bi-arrow-right"></i>
                                            </a>
                                        </div>
                                        <a href=""> <img src="../img/accessories_3.webp" alt=""></a>
                                    </a>
                                    
                                </div>
                            </div>
    
                        </div>
    
                    </div>
    
                </div>
                <div class="view-more">
                    <a href="">
                        Xem tất cả
                    </a>
                </div>
            </div>
        </section>
    </section>
    <section class="section-5">
        <section class="section-bag">
            <div class="container">
                <div class="bag__title">
                    <h2>
                        <a href="">MLB BAG</a>
                    </h2>
                    <p>
                        Những bộ sưu tập Túi MLB hót nhất 
                    </p>
                </div>
                <div class="bag__menu">
                    <ul class="bag__product__list">
                        <li class="bag__product__link active" data-product="product-1">
                            <span>Cross Bag</span>
                        </li>
                        <li class="bag__product__link" data-product="product-2" >
                            <span>Bucket Bag</span>
                        </li>
                        <li class="bag__product__link" data-product="product-3" >
                            <span>Hip Sack</span>
                        </li>
                        <li class="bag__product__link" data-product="product-4" >
                             <span>Hobo Bag</span>
                        </li>
                        <li class="bag__product__link" data-product="product-5" >
                            <span>Hote Bag</span>
                        </li>
                        <li class="bag__product__link" data-product="product-6" >
                            <span>Phone Pouch</span>
                        </li>
                    </ul>
                    <div class="bag__product__content">
                        <div id="product-1" class="bag__product__item">
                            <div class="new-shoes__product">
                                <div class="row d-flex">
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
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
                                    </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                                    </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                                    </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        <div id="product-2" class="bag__product__item">
                            <div class="new-shoes__product">
                                <div class="row d-flex">
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
                                        <div class="product__card" >    
                                            <div class="product__image">
                                                <img src="../img/new-product-2.webp" class="main-image" >
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
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
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
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
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
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        <div id="product-3" class="bag__product__item">
                            <div class="new-shoes__product">
                                <div class="row d-flex">
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
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
                                    </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                                    </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                                    </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        <div id="product-4" class="bag__product__item">
                            <div class="new-shoes__product">
                                <div class="row d-flex">
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
                                        <div class="new-shoes__product__card" >    
                                            <div class="new-shoes__product__image">
                                                <img src="../img/new-product-1.webp" class="main-image" >
                                                <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                                <div class="overlay__add-to-cart">
                                                    <button class="add-to-cart">
                                                        <i class="bi bi-cart-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="new-shoes__product__info">
                                                <span class="new-shoes__product__brand">MLB VIỆT NAM</span>
                                                <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                                <span class="new-shoes__product__price">
                                                    4.790.000đ
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
                                        <div class="new-shoes__product__card" >    
                                            <div class="new-shoes__product__image">
                                                <img src="../img/new-product-1.webp" class="main-image" >
                                                <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                                <div class="overlay__add-to-cart">
                                                    <button class="add-to-cart">
                                                        <i class="bi bi-cart-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="new-shoes__product__info">
                                                <span class="new-shoes__product__brand">MLB VIỆT NAM</span>
                                                <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                                <span class="new-shoes__product__price">
                                                    4.790.000đ
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
                                        <div class="new-shoes__product__card" >    
                                            <div class="new-shoes__product__image">
                                                <img src="../img/new-product-1.webp" class="main-image" >
                                                <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                                <div class="overlay__add-to-cart">
                                                    <button class="add-to-cart">
                                                        <i class="bi bi-cart-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="new-shoes__product__info">
                                                <span class="new-shoes__product__brand">MLB VIỆT NAM</span>
                                                <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                                <span class="new-shoes__product__price">
                                                    4.790.000đ
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
                                        <div class="new-shoes__product__card" >    
                                            <div class="new-shoes__product__image">
                                                <img src="../img/new-product-1.webp" class="main-image" >
                                                <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                                <div class="overlay__add-to-cart">
                                                    <button class="add-to-cart">
                                                        <i class="bi bi-cart-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="new-shoes__product__info">
                                                <span class="new-shoes__product__brand">MLB VIỆT NAM</span>
                                                <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                                <span class="new-shoes__product__price">
                                                    4.790.000đ
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="product-5" class="bag__product__item">
                            <div class="new-shoes__product">
                                <div class="row d-flex">
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
                                        <div class="new-shoes__product__card" >    
                                            <div class="new-shoes__product__image">
                                                <img src="../img/new-product-1.webp" class="main-image" >
                                                <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                                <div class="overlay__add-to-cart">
                                                    <button class="add-to-cart">
                                                        <i class="bi bi-cart-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="new-shoes__product__info">
                                                <span class="new-shoes__product__brand">MLB VIỆT NAM</span>
                                                <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                                <span class="new-shoes__product__price">
                                                    4.790.000đ
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
                                        <div class="new-shoes__product__card" >    
                                            <div class="new-shoes__product__image">
                                                <img src="../img/new-product-1.webp" class="main-image" >
                                                <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                                <div class="overlay__add-to-cart">
                                                    <button class="add-to-cart">
                                                        <i class="bi bi-cart-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="new-shoes__product__info">
                                                <span class="new-shoes__product__brand">MLB VIỆT NAM</span>
                                                <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                                <span class="new-shoes__product__price">
                                                    4.790.000đ
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
                                        <div class="new-shoes__product__card" >    
                                            <div class="new-shoes__product__image">
                                                <img src="../img/new-product-1.webp" class="main-image" >
                                                <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                                <div class="overlay__add-to-cart">
                                                    <button class="add-to-cart">
                                                        <i class="bi bi-cart-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="new-shoes__product__info">
                                                <span class="new-shoes__product__brand">MLB VIỆT NAM</span>
                                                <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                                <span class="new-shoes__product__price">
                                                    4.790.000đ
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-4 col-12 pb-3">
                                        <div class="new-shoes__product__card" >    
                                            <div class="new-shoes__product__image">
                                                <img src="../img/new-product-1.webp" class="main-image" >
                                                <img src="../img/new-product-1-hover.webp" alt="" class="hover-image">
                                                <div class="overlay__add-to-cart">
                                                    <button class="add-to-cart">
                                                        <i class="bi bi-cart-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="new-shoes__product__info">
                                                <span class="new-shoes__product__brand">MLB VIỆT NAM</span>
                                                <a href="">Giày MLB Chunky Liner Mid Denim Boston Red</a>
                                                <span class="new-shoes__product__price">
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
            </div>
        </section>
    </section>
    <section class="section-6">
        <section class="section-arrival">
           <div class="container">
                <div class="arrival__title">
                    <h2>
                        <a href="">NEW ARRIVAL</a>
                    </h2>
                    <p>
                        Mới nhất tại Cửa Hàng
                    </p>
                </div>
                <div class="arrival__product">
                    <div class="row d-flex">
                        <div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                        </div><div class="col-xl-3 col-md-4 col-12 pb-3">
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
                <div class="view-more">
                    <a href="">
                        Xem tất cả
                    </a>
                </div>
           </div>
        </section>
    </section>


    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</body>
</html>
