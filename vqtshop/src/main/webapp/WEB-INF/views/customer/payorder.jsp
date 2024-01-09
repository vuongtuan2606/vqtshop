

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
    
</head>
<body>
    
    <jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	 <section class="bread-crumb">
        <div class="container">
            <div class="bread-crumb__title">
                Thanh toán
            </div>
        </div>
    </section>
     <section class="Payment_orders">
        <div class="container orders__box">
        	<form action="${base }/cart/checkout" method="post">
            <div class="row ">
                <div class="col-xxl-6 col-xl-6">
                    <div class=" orders__box-shadow">
                        <div  class="row">
                             <div class="form-orders clearfix">
                                 <fieldset class="form-group margin-bottom-10">
                                     <label>Họ Tên<span class="required">*</span></label>
                                     <input type="text" class="form-control " value="${userLogined.fullname }" id="customerFullName" name="customerFullName" >
                                 </fieldset>
                                 <fieldset class="form-group margin-bottom-10">
                                     <label for=""> EMAIL<span class="required">*</span></label>
                                     <input type="email" class="form-control " value="${userLogined.email }"  id="customerEmail" name="customerEmail" >
                                 </fieldset>
                                 <fieldset class="form-group margin-bottom-10">
                                     <label for=""> Số điện thoại<span class="required">*</span></label>
                                     <input  type="text" class="form-control " value="${userLogined.phone }" id="customerPhone" name="customerPhone" >
                                 </fieldset>
                                 <fieldset class="form-group margin-bottom-10">
                                     <label for=""> Địa chỉ<span class="required">*</span></label>
                                     <input type="text" class="form-control " value="${userLogined.shippingAddress }"  id="customerAddress" name="customerAddress"  ></input>
                                 </fieldset>                 
                             </div>
                        </div>
                    </div>
                </div>
                <div class="col-xxl-6 col-xl-6">
                    <div class=" orders__box-shadow">
                        <div class="row">
                            <div class="product__oder">
                               <table class="table">
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                               	 <c:forEach items="${cart.cartItems }" var="ci">
                                    <tr>
                                        <td>${ci.productName } - số lượng ${ci.quanlity }</td>
                                       	
                                  </c:forEach>
                                </tbody>
                               </table>
                            </div>

                            <div class="total__order">
                                
                                <div class="total__right ">
                                    Tổng tiền: <span class="totalPrice" ></span>
                                </div>
                            </div>
                            <div class="pay_oder">
                               <button type="submit" >Thanh toán</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </section>

       
   
   

    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
    <script type="text/javascript">
    
    document.addEventListener("DOMContentLoaded", function() {
	    
	    const baseUrl = "${base}";
	    const productId = "${productId}";
	    const quanlity = "${quanlity }";
	    
	
	  
	    UpdateQuanlityCart(baseUrl, productId, quanlity);
	    
	});
    </script>

</body>
</html>
