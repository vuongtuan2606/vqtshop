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
    <form action="${base }/home/productSearch" method="get">
    <section class="bread-crumb">
        <div class="container">
            <div class="bread-crumb__title">
              ${searchModel.keyword } | TÌM KIẾM
            </div>
            <nav aria-label="breadcrumb " class="bread-crumb__List">
                <ol class="breadcrumb bread-crumb__List__ol">
                  <li class="breadcrumb-item bread-crumb__List__item"><a href="${base }/home">Home</a></li>
                  <li class="breadcrumb-item active bread-crumb__List__item" aria-current="page">Tìm kiếm</li>
                </ol>
            </nav>
        </div>

    </section>
    <section class="cate-products">
        <div class="container">
	       
			
            <div class="row">
                <div class="col-xxl-12 col-xxl-12 col-lg-12">
                    <div class="top__search__product " style="padding: 10px 0;margin-bottom: 0; font-size: 25px; font-weight: 600; color: #000;" >
                        <p> Kết quả tìm kiếm với từ khóa: ${searchModel.keyword } </p>
                        <p id="page" name="page" class="form-control" style="display: none;"></p>
                        
                    </div>
                </div>
            </div>
            <div class="row ">
	            <c:forEach items="${products.data}" var="pro" begin = "0" end = "8"  >
	                <div class="col-xl-3 col-xxl-3 col-lg-3 col-md-4 pb-3">
	                    <div class="product__card" >    
	                        <div class="product__image">
	                            <img src="${base }/upload/${pro.avatar}" />                                 
	                        </div>
	                        <div class="product__info">
	                            <span class="product__brand">${pro.brand.brand_name}</span>
	                            <a href="${base }/home/product-detail/${pro.id }">${pro.title }</a>
	                            <div class="product__price">
	                                 <span  style="text-decoration: line-through !important;">
	                              		 <fmt:formatNumber value="${pro.price}" type="currency"/></span>
									 <span>
									 <fmt:formatNumber value="${pro.priceSale}" type="currency"/></span>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </c:forEach>
			</div>  
			<!-- phân trang -->
			 <div class="row">
				<div class="col-12 d-flex justify-content-center">
					<div id="paging"></div>
				</div>
			</div>                   
        </div>
    </section>
    </form>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    <script type="text/javascript">
	    $( document ).ready(function() {
	    	
			
			// đặt giá trị của category ứng với điều kiện search trước đó
			//$("#categoryId").val(${searchModel.categoryId});
			
			$("#paging").pagination({
				currentPage: ${products.currentPage}, //trang hiện tại
		        items: ${products.totalItems},	//tổng số sản phẩm
		        itemsOnPage: ${products.sizeOfPage}, //số sản phẩm trên 1 trang
		        cssStyle: 'light-theme',
		        onPageClick: function(pageNumber, event) {
		        	$('#page').val(pageNumber);
		        	$('#btnSearch').trigger('click');
				},
		    });
		});
    </script>

</body>
</html>