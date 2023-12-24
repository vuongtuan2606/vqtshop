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
    <title>order</title>
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
                                     <p>Quản lý đơn hàng </p>
                                 </div>
                                 <div class="date_time">
                                     <p id="current-date"></p> <p id="current-time"></p>
                                 </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-md-12  "> 
                         	<sf:form class="form-inline" action="${base}/admin/order" method="get">
                            <div class="product_manager">
                                 
                                <div class="element_button">
                                    <div class="d-flex element_button__search ">
                                         <input id="page" name="page" class="form-control" value="${searchModel.page }">  
                                        
                                        <!-- tìm kiếm theo tên  -->
                                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" autocomplete="off" value="${searchModel.keyword }" style="margin-right: 10px;">                                
                                        <!-- tìm kiếm theo roles  -->
                                        <select class="form-control" name="orderStatus" id="orderStatus" style="margin-right: 10px;">
                                            <option value="-10">All</option>
											<option value="0">Đã hủy</option>
											<option value="1">Chờ xử lý</option>
											<option value="2">Đang giao</option>
											<option value="3">Hoàn thành</option>
                                        </select>                                  
                                        <button type="submit"  name="btnSearch" value="Search" class="btn  " id="btnSearch">Seach</button>
                                    </div> 
                                </div>
                                 <div class="table_order">
                                    <div class="title">
                                        <h3>Danh sách đơn hàng</h3>
                                    </div>
                                    <div >
                                    <!-- danh sách người dùng -->
                                        <table class="table table-responsive table-hover table-striped table-bordered table_content" >
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Họ tên</th>
                                                    <th>Số điện thoại
                                                    <th>Địa chỉ</th>
                                                    <th>Email</th>
                                                    <th>Trạng thái</th>
                                                    <th>Chi tiết đơn hàng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:set var="count" value="0" scope="page" />
								              <c:forEach items="${orders.data }" var="order">
								             	<c:set var="co_admin" value="0" scope="page"></c:set>
								          		<c:set var="admin" value="0" scope="page"></c:set>
                                                <tr>		                                          
				                                    <td>${order.code }</td>
								              		<td>${order.customerName }</td>
								              		<td>${order.customerPhone }</td>
								              		<td>${order.customerAddress }</td>
								              		<td>${order.customerEmail }</td>

                                                    <td>
								              			<c:choose>
								              				<c:when test="${order.orderStatus == 0 }">
								              					<span class="btn btn-danger">Đã hủy</span>
								              				</c:when>
								              				<c:when test="${order.orderStatus == 1 }">
								              					<span class="btn btn-warning">Chờ sử lý</span>
								              				</c:when>
								              				<c:when test="${order.orderStatus == 2 }">
								              					<span class="btn btn-primary">Đang giao</span>
								              				</c:when>
								              				<c:when test="${order.orderStatus == 3 }">
								              					<span class="btn btn-success">hoàn thành</span>
								              				</c:when>
								              			</c:choose>					              			
													</td>	
                                                    <td>
								              			<div class="d-flex set-detail "  style="justify-content: space-around;">
								              				<a href="${base }/admin/order/detail/${order.id}">
								              					xem chi tiết
								              				</a>
								              			</div>
								              		</td>                                   
                                                </tr>
                                                <c:set var="count" value="${count + 1}" scope="page"/>
				              					</c:forEach>       	                                    
                                            </tbody>                                           
                                        </table>
                                        <!-- phân trang -->
										 <div class="row">
											<div class="col-12 d-flex justify-content-center">
												<div id="paging"></div>
												
											</div>
										</div>
										
                                    </div>
                                </div>
                            </div>
                       		 </sf:form>   
                        </div>            
                    </div>
			    </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
    <script type="text/javascript">

		$( document ).ready(function() {
			
			$("#orderStatus").val(${searchModel.orderStatus});
			
			$("#paging").pagination({
				currentPage: ${orders.currentPage}, //trang hiện tại
		        items: ${orders.totalItems},	//tổng số sản phẩm
		        itemsOnPage: ${orders.sizeOfPage}, //số sản phẩm trên 1 trang
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