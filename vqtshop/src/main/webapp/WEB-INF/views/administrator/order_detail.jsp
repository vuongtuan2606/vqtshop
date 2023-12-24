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
    <title>Page Title</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/administrator/layout/css.jsp"></jsp:include>


</head>
<body>
    <jsp:include page="/WEB-INF/views/administrator/layout/admin_header.jsp"></jsp:include>
    <section class="section-1 ">
        <div class="container-fluid set-gutter-none ">
            <div class="row  ">
                
                <jsp:include page="/WEB-INF/views/administrator/layout/admin_menu.jsp"></jsp:include>
                <div class="col-xxl-10 col-xl-10 col-lg-10 ">
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-md-12  "> 
                            <div class="home_content ">
                                 <div class="title">
                                     <p>Chi tiết dơn hàng </p>
                                 </div>
                                 <div class="date_time">
                                     <p id="current-date"></p> <p id="current-time"></p>
                                 </div>
                            </div>
                        </div>
                    </div>
                    <div class="order-detail__top">
                        <ul>
                            <li>Ngày tạo :  <span>${order.createdDate}</span></li>
                            <li>Mã đơn hàng :  <span>${order.code }</span></li>
                            <li>Tên khách hàng :  <span>${order.customerName }</span></li>
                            <li>số điện thoại : <span>${order.customerPhone }</span></li>
                            <li>Email : <span>${order.customerEmail }</span></li>
                            <li>Địa chỉ nhận : <span>${order.customerAddress }</span></li>
                            <li><p style="font-weight: 600;">trạng thái :
	                            <c:choose>
									<c:when test="${order.orderStatus == 0 }">
										<span class="">Đã hủy</span>
									</c:when>
									<c:when test="${order.orderStatus == 1 }">
										<span class="">Chờ xử lí</span>
									</c:when>
									<c:when test="${order.orderStatus == 2 }">
										<span class="">Đang giao</span>
									</c:when>
									<c:when test="${order.orderStatus == 3 }">
										<span class="">Hoàn thành</span>
									</c:when>
								 </c:choose>
								</p>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="order-detail__body">
                        <table class=" table table-hover table-bordered" style="text-align: center;">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Ảnh sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                   
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Tổng</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:set var="count" value="0" scope="page" />
		              			<c:forEach items="${order.saleOrderProducts }" var="p">
                                <tr>                              
                                    <td><img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${p.product.avatar}"></td>
                                    <td>${p.product.title }</td>
                                    <td>x ${p.quantity } </td>
                                    <td><span>${p.product.price } đ</span></td>
                                    <td>${p.product.price * p.quantity } đ</td>
                                </tr>
                                 </c:forEach>
                            </tbody>
                          
                        </table>
                        <div class="" style="float: right; font-weight: 600;">
                            <p>Tổng giá trị đơn hàng:${order.total } đ</p>
                       </div>
                                  
                    </div>
                    <div class="order-detail__botton">
                        <div class="back_to_list">
                           <a  href="${base }/admin/order" class="btn btn-primary"> trở lại</a>
                        </div>
                        <div class="order_confirmation">
                            <c:if test="${order.orderStatus>0 && order.orderStatus<3 }">
				      			<a role="button" class="btn btn-danger" id="myBtn" >Hủy đơn</a>
				      			<!-- The Modal -->
								<div id="myModal" class="modal">
											
								<!-- Modal content -->
								<div class="set-modal">
								    <div class="modal-header">
							      <span class="close">&times;</span>
							      
							    </div>
								    <div class="modal-title">
								      <p>Bạn có muốn hủy đơn đặt hàng này không?</p>					      
								    </div>
								    <div class="modal-button">
								      <button type="button" class="btn btn-secondary" id="cancel">Cancel</button>
								      <button type="button" class="btn btn-danger" onclick="CancelOrder(${order.id})">Accept!</button>
								    </div>
								  </div>
								
								</div>
				      		</c:if>
				      		<c:if test="${order.orderStatus==1 }">
				      			<a role="button" class="btn btn-primary" onclick="AcceptOrder(${order.id})" >Duyệt đơn  hàng </a>
				      		</c:if>
				      		<c:if test="${order.orderStatus==2 }">
				      			<a role="button" class="btn btn-success" onclick="CompleteOrder(${order.id})" >Hoàn thành đơn  hàng</a>
				      		</c:if>
                        </div>
                    </div>
			    </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
    <script type="text/javascript">
		 // Get the modal
		var modal = document.getElementById("myModal");
	
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
	
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		
		//
		var cancel = document.getElementById("cancel")
	
		// When the user clicks on the button, open the modal
		btn.onclick = function() {
		  modal.style.display = "block";
		}
	
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		  modal.style.display = "none";
		}
		
		cancel.onclick = function() {
		  modal.style.display = "none";
		}
	
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
		function CancelOrder(orderID) {
			var data = {
				id: orderID,
			};
			
			jQuery.ajax({
				url:  '${base}' + "/admin/order/cancel",
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
		
		function AcceptOrder(orderID) {
 
			var data = {
				id: orderID,
			};

			jQuery.ajax({
				url:  '${base}' + "/admin/order/accept",
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
		function CompleteOrder(orderID) {
			  
			var data = {
				id: orderID,
			};
			

			jQuery.ajax({
				url:  '${base}' + "/admin/order/complete",
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
</html>