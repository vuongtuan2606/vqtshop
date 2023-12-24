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
        <div class="container-fluid ">
            <div class="row  ">
                <jsp:include page="/WEB-INF/views/administrator/layout/admin_menu.jsp"></jsp:include>
                <div class="col-xxl-10 col-xl-10 col-lg-10   ">
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-md-12  "> 
                            <div class="home_content ">
                                 <div class="title">
                                     <p>Bảng điều khiển</p>
                                 </div>
                                 <div class="date_time">
                                     <p id="current-date"></p> <p id="current-time"></p>
                                 </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xxl-4 col-xl-4">
                            <div class="total_customers">
                                <div class="total_customers__icon col-3">
                                    <i class="bi bi-people"></i>
                                </div>
                                <div class="total_customers__info col-9  " style="padding: 10px 10px;">
                                    <h5>TỔNG SỐ KHÁCH HÀNG</h5>
                                    <P>${users } khách hàng </P>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-4 col-xl-4 ">
                            <div class="total_customers">
                                <div class="total_customers__icon col-3">
                                    <i class="bi bi-bag-check"></i>
                                </div>
                                <div class="total_customers__info  col-9" style="padding: 10px 10px;">
                                    <h5>TỔNG SỐ SẢN PHẨM</h5>
                                    <P>${product } sản phẩm</P>
                                   
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-4 col-xl-4 ">
                            <div class="total_customers">
                                <div class="total_customers__icon col-3">
                                    <i class="bi bi-bag-check"></i>
                                </div>
                                <div class="total_customers__info col-9 " style="padding: 10px 10px;">
                                    <h5>TỔNG ĐƠN HÀNG</h5>
                                    <P>${orders} đơn hàng tháng này</P>
                                    
                                </div>
                            </div>
                        </div>
                        
                       
                    </div>
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-lg-12  ">
                            <div class="table_order ">
                                <div class="title">
                                    <h3>Tình trạng đơn hàng gần đây</h3>
                                </div>
                                <div >
                                    <table class="table table-responsive table-hover table-striped table-bordered   table_content" >
                                        <tr>
                                            <th>Mã đơn hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Địa chỉ</th>
                                            <th>Trạng thái</th>
                                        </tr>
                                         <c:forEach items="${listSaleOrder }" var="ListOrder">
                                        <tr>
                                            <td>${ListOrder.code }</td>
                                            <td>${ListOrder.customerName }</td>
                                            <td>${ListOrder.customerAddress }</td>
                                            <td>
						              			<c:choose>
						              				<c:when test="${ListOrder.orderStatus == 0 }">
						              					<span class="btn btn-danger">Đã hủy</span>
						              				</c:when>
						              				<c:when test="${ListOrder.orderStatus == 1 }">
						              					<span class="btn btn-warning">Chờ sử lý</span>
						              				</c:when>
						              				<c:when test="${ListOrder.orderStatus == 2 }">
						              					<span class="btn btn-primary">Đang giao</span>
						              				</c:when>
						              				<c:when test="${ListOrder.orderStatus == 3 }">
						              					<span class="btn btn-success">hoàn thành</span>
						              				</c:when>
						              			</c:choose>					              			
											</td>
                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-lg-12  ">
                            <div class="table_order">
                                <div class="title">
                                    <h3>Khách hàng mới</h3>
                                </div>
                                <div >
                                    <table class="table table-responsive table-hover table-striped table-bordered  table_content " >
                                    
                                        <tr>
                                            <th>Tên khách hàng</th>
                                            <th>Tên tài khoản</th>
                                            <th>email</th>
                                            <th>Số điện thoại</th>
                                        </tr>
                                        <c:forEach items="${listUser}" var="user">
                                        <tr>
                                            <td>${user.fullname }</td>
                                            <td>${user.username }</td>
                                            <td>${user.email }</td>
                                            <td>${user.phone }</td>
                                        </tr>
                                        </c:forEach>                                  
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

   <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>
</html>