<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
      <section class="bread-crumb" style="background-image: url(${base}/img/bread-crumb/bread-crumb.webp)">
        <div class="container">
            <div class="bread-crumb__title">
                MLB Vietnam | Giày MLB Chính Hãng Tại Việt Nam
            </div>
            <nav aria-label="breadcrumb " class="bread-crumb__List">
                <ol class="breadcrumb bread-crumb__List__ol">
                  <li class="breadcrumb-item bread-crumb__List__item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item active bread-crumb__List__item" aria-current="page">Giày MLB</li>
                </ol>
            </nav>
        </div>

    </section>
    <section class="cate-products">
    <sf:form action="${base }/home/listproduct/{cateID}" method="get">
    	<input id="page" name="page" class="form-control" value="${searchModel.page }" style="display: none;">
        <div class="container">
            <div class="row ">
                <div class="col-xl-3 col-xxl-3 col-lg-3 col-md-3 filter__products ">
                	
                    <div class="accordion accordion__products " onclick="accordion__products__click()" id="accordionPanelsStayOpenExample">
                        <div class="accordion-item">
                          <h2 class="accordion-header accordion__products__header  " id="panelsStayOpen-headingOne">
                            <button class="accordion-button accordion__products__title " type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                SẮP XẾP
                            </button>
                          </h2>
                          <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                            <div class="accordion-body accordion__products__list border-0">
                                <ul>
                                    <li class="active">
                                        <a href="#">
                                            <i></i>Mặc định
                                        </a>
                                    </li>
                                    <li  >
                                        <a href="#" >
                                            <i></i>Tên A - Z
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i></i>Tên Z - A
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i></i>Giá thấp đến cao
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i></i>Giá cao xuống thấp
                                        </a>
                                    </li>
                                </ul>
                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header accordion__products__header" id="panelsStayOpen-headingTwo">
                            <button class="accordion-button collapsed accordion__products__title" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                LOẠI SẢN PHẨM
                            </button>
                          </h2>
                          <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse  " aria-labelledby="panelsStayOpen-headingTwo">
                            <div class="accordion-body accordion__products__list">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i></i> Giày MLB
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i></i>Sandal MLB
                                        </a>
                                    </li>
                                </ul>
                            </div>
                          </div>
                        </div>

                        
                        <div class="accordion-item">
                          <h2 class="accordion-header accordion__products__header" id="panelsStayOpen-headingThree">
                            <button class="accordion-button collapsed accordion__products__title" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                Màu Sắc
                            </button>
                          </h2>
                          <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse " aria-labelledby="panelsStayOpen-headingThree">
                            <div class="accordion-body accordion__products__list">
                                <ul class="accordion__products__list__color">
                                    <li><button class="color-button" style="background-color: #ffffff;"></button></li>
                                    <li><button class="color-button" style="background-color: #000000;"></button></li>
                                    <li><button class="color-button" style="background-color: #c0c0c0;"></button></li>
                                    <li><button class="color-button" style="background-color: #cc9966;"></button></li>
                                    <li><button class="color-button" style="background-color: #3399FF;"></button></li>
                                    <li><button class="color-button" style="background-color: #99ff66;"></button></li>
                                    <li><button class="color-button" style="background-color: #ff66cc;"></button></li>
                                    <li><button class="color-button" style="background-color: #990000;"></button></li>
                                    <li><button class="color-button" style="background-color: #ffcc33;"></button></li>
                                    <li><button class="color-button" style="background-color: #ffff33;"></button></li>
                                  </ul>
                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header accordion__products__header">
                              <button class="accordion-button collapsed accordion__products__title" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
                                LOGO
                              </button>
                            </h2>
                            <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse">
                              <div class="accordion-body accordion__products__list">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i></i>New York Yankees (NY)
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i></i>New York Yankees (NY)
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i></i>New York Yankees (NY)
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i></i>New York Yankees (NY)
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i></i>New York Yankees (NY)
                                        </a>
                                    </li>
                                </ul>
                              </div>
                            </div>
                        </div>
                    </div>
                                       
                </div>
                <div class="col-xl-9 col-xxl-9  col-md-9 col-lg-9">
                    <div class="row categorie__products ">
                     <c:forEach items="${products.data}" begin = "0" end = "6" var="p" >                  
                        <div class="col-xl-3 col-xxl-3 col-lg-3 col-md-4 pb-3">
                             <div class="product__card" >    
                                <div class="product__image">
                                	<a href="${base }/home/product-detail/${p.id }"><img src="${base }/upload/${p.avatar}" />    </a>                             
                                </div>
                                <div class="product__info">
                                   <span class="product__brand" >${p.brand.brand_name}</span>
	                                    <a href="${base }/home/product-detail/${p.id }">${p.title }</a>
	                                    <fmt:setLocale value="vi_VN"/>
                                   <div class="product__price" >
	                               		 <span  style="text-decoration: line-through !important;">
	                               		 <fmt:formatNumber value="${p.price}" type="currency"/></span>
										 <span>
										 <fmt:formatNumber value="${p.priceSale}" type="currency"/></span>
                                   </div>	                                    
	                           </div>
                            </div>
                        </div>
                     </c:forEach> 
                    </div>
                    <div class="row">
                        <!-- phân trang -->
						 <div class="row">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
        </sf:form>
    </section>
    
     <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
     <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    <script>
    
	    $( document ).ready(function() {
			
			
			$("#paging").pagination({
				currentPage: ${products.currentPage}, //trang hiện tại
		        items: ${products.totalItems},	//tổng số sản phẩm
		        itemsOnPage: ${products.sizeOfPage}, //số sản phẩm trên 1 trang
		        cssStyle: 'light-theme',
		        onPageClick: function(pageNumber, event) {
		        	$('#page').val(pageNumber);
		        	//$('#btnSearch').trigger('click');
		        	 updateUrl(pageNumber);
				},
		    });
		});
	    
	    function updateUrl(pageNumber) {
	        // Lấy URL hiện tại
	        var currentUrl = window.location.href;
	        
	        // Kiểm tra xem URL đã chứa tham số 'page' chưa
	        var regex = /([?&])page=\d+/;
	        var hasPageParam = regex.test(currentUrl);

	        // Nếu URL không có tham số 'page', thêm vào
	        if (!hasPageParam) {
	            window.location.href = currentUrl + (currentUrl.indexOf('?') !== -1 ? '&' : '?') + 'page=' + pageNumber;
	        } else {
	            // Nếu URL đã có tham số 'page', cập nhật giá trị của nó
	            window.location.href = currentUrl.replace(/([?&])page=\d+/, '$1page=' + pageNumber);
	        }
	    }
    
        // Lấy danh sách các nút màu
        var colorButtons = document.querySelectorAll(".color-button");

        // Gắn sự kiện click cho từng nút màu
        colorButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            // Thêm lớp 'active' cho nút màu đang được chọn
            button.classList.add("active");
        });
        });
        
       
    </script>

  

</body>
</html>