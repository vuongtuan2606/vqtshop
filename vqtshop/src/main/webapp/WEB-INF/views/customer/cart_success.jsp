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
    <title>Gio hang</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
   
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
    <section class="bread-crumb">
        <div class="container">
            <div class="bread-crumb__title">
                GIỎ HÀNG
            </div>
            <nav aria-label="breadcrumb " class="bread-crumb__List">
                <ol class="breadcrumb bread-crumb__List__ol">
                  <li class="breadcrumb-item bread-crumb__List__item"><a href="${base }/home">Trang chủ</a></li>
                  <li class="breadcrumb-item active bread-crumb__List__item" aria-current="page">Giỏ hàng</li>
                </ol>
            </nav>
        </div>

    </section>
    <section class="main-cart">
        <div class="container">
            <div class="main-cart__box">
                <div class="row">
                    <div class="header-cart">
                        <h1 class="header-cart__title">
                            <span>Giỏ hàng của bạn </span>
                        </h1>
                    </div>

                    <div class="cart-page">
                        <form action="" method="post">
                            <div class="cart-page__info">
                                <div>Thông tin sản phẩm</div>
                                <div>Đơn giá</div>
                                <div>Số lượng</div>
                            </div>
                            <div class="cart-page__body">
                            	<c:set var="count" value="0" scope="page" />
                            	<c:forEach items="${cart.cartItems }" var="ci">
                                <div class="cart-page__row">
                                      
                                    <div class="cart-page__product__info">
                                        <div class="cart-page__product__name">
                                            <a href="" class="cart-page__image">
                                             	<img src="${base }/upload/${ci.anhSP}" />
                                            </a>
                                            <a class="title" href="">${ci.productName } </a>
                                            <!-- <span class="cart-page__product__name__size">37.5 - 235 KR</span> -->
                                        </div>
                                        <div class="grid">
                                            <div class="cart-page__product__price">
                                                <span>
                                                	<fmt:setLocale value="vi_VN"/>
													<strong><fmt:formatNumber value="${ci.priceUnit }" type="currency"/> </strong>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="grid ">
                                            <div class="cart-page__product__select">                                               
                                                <button class="btt" onclick="UpdateQuanlityCart('${base }', ${ci.productId}, -1)" value="-" type="button">-</button>
									      			<span data-price="${ci.priceUnit }"  id="quanlity_${ci.productId}">${ci.quanlity }</span>
												<button class="btt" onclick="UpdateQuanlityCart('${base }', ${ci.productId}, 1)" value="+"  type="button">+</button>                   
                                            </div>
                                        </div>

                                        <div  class="gridf">
                                            <div class="cart-page__product__remote">
                                                <button  type="button" onclick="toggleModal(${count})"  ><i class="bi bi-x-circle"></i></button>
                                            </div>
                                        </div>
                                         <div id="myModal${count }" class="Model__content">
	                                     	<div  class="show-modal">
		                                     	<div class="modal__body">    
		                                            <p>Bạn có muốn xóa sản phẩm :${ci.productName } ?</p>
		                                        </div>
		                                        <div class="modal__button">
		                                            <button type="button" class="btn btn-secondary" onclick="CloseModal(${count})" >Cancel</button>
								                    <button type="button" class="btn btn-primary"  onclick="DeleteProduct(${ci.productId})">Accept!</button>
		                                        </div>
	                                     	</div>
                                    	</div>
                                    </div>
                                    
                                </div>
                                </c:forEach>
                                 <c:set var="count" value="${count + 1}" scope="page"/>
                   
                            </div>
                            <div class="cart-page__footer">
                                <div class=" offset-8">
                                    <!-- <div class="cart-page__footer__subtotal">
                                        <div class="cart-page__footer__subtotal__left">Tổng tiền:</div>
                                        <div class="cart-page__footer__subtotal__right ">
                                            <p class="totalPrice"></p>                         
                                        </div>
                                    </div> -->
                                    <div class="cart-page__footer__checkout">
                                        <button type="button">
                                            Thanh toán
                                        </button>
                                    </div>
                                 </div>   
                            </div>
                        </form>
                    </div>
                </div>
            </div>       
        </div>
    </section>
     <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    <script type="text/javascript">
		function DeleteProduct(productId) {
		
			var data = {
					productId: productId,
			};
		
			jQuery.ajax({
				url:  '${base}' + "/cart/deleteProduct",
				type: "post",						
				contentType: "application/json",
				data: JSON.stringify(data),
		
				dataType: "json", 
				success: function(jsonResult) {
					location.reload(); 
				},
				error: function(jqXhr, textStatus, errorMessage) {
					alert("error");
				}
			});
		}
		
	

</script>
</body>