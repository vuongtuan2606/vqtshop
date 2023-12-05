<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <div class="col-xxl-6 col-xl-6">
                            <div class="total_customers">
                                <div class="total_customers__icon col-4">
                                    <i class="bi bi-people"></i>
                                </div>
                                <div class="total_customers__info col-8 ">
                                    <h4>TỔNG SỐ KHÁCH HÀNG</h4>
                                    <P>100 khách hàng</P>
                                    <p class="all_customers">TỔng số khách hàng được quản lý</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-6 col-xl-6 ">
                            <div class="total_customers">
                                <div class="total_customers__icon col-4">
                                    <i class="bi bi-bag-check"></i>
                                </div>
                                <div class="total_customers__info  col-8">
                                    <h4>TỔNG SỐ SẢN PHẨM</h4>
                                    <P>100 sản phẩm</P>
                                    <p class="all_product">TỔng số sản phẩm được quản lý</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-6 col-xl-6 ">
                            <div class="total_customers">
                                <div class="total_customers__icon col-4">
                                    <i class="bi bi-bag-check"></i>
                                </div>
                                <div class="total_customers__info col-8 ">
                                    <h4>TỔNG ĐƠN HÀNG</h4>
                                    <P>100 đơn hàng</P>
                                    <p class="all_order">TỔng số hóa đơn bán trong tháng</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-6 col-xl-6 ">
                            <div class="total_customers">
                                <div class="total_customers__icon col-4">
                                    <i class="bi bi-exclamation-octagon-fill"></i>
                                </div>
                                <div class="total_customers__info  col-8">
                                    <h4>SẮP HẾT HÀNG</h4>
                                    <P>4 sản phẩm</P>
                                    <p class="all_order">Số sản phẩm cảnh báo cần nhập thêm</p>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-lg-12  ">
                            <div class="table_order ">
                                <div class="title">
                                    <h3>Tình trạng đơn hàng</h3>
                                </div>
                                <div >
                                    <table class="table table-responsive table-hover table-striped table-bordered   table_content" >
                                        <tr>
                                            <th>ID đơn hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái</th>
                                        </tr>
                                        <tr>
                                            <td>A001</td>
                                            <td>Nguyễn Văn A</td>
                                            <td>5.000.00đ</td>
                                            <td>chờ xử lý</td>
                                        </tr>
                                        <tr>
                                            <td>A002</td>
                                            <td>Nguyễn Văn b</td>
                                            <td>5.000.00đ</td>
                                            <td>chờ xử lý</td>
                                        </tr>
                                        <tr>
                                            <td>A003</td>
                                            <td>Nguyễn Văn c</td>
                                            <td>5.000.00đ</td>
                                            <td>chờ xử lý</td>
                                        </tr>
                                        <tr>
                                            <td>A004</td>
                                            <td>Nguyễn Văn D</td>
                                            <td>5.000.00đ</td>
                                            <td>chờ xử lý</td>
                                        </tr>
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
                                            <th>ID khách hàng</th>
                                            <th>Tên khách hàng</th>
                                            <th>Ngày sinh</th>
                                            <th>Số điện thoại</th>
                                        </tr>
                                        <tr>
                                            <td>A001</td>
                                            <td>Nguyễn Văn A</td>
                                            <td>21/06/2002</td>
                                            <td>0899232121</td>
                                        </tr>
                                        <tr>
                                            <td>A002</td>
                                            <td>Nguyễn Văn b</td>
                                            <td>21/06/2002</td>
                                            <td>0899232121</td>
                                        </tr>
                                        <tr>
                                            <td>A003</td>
                                            <td>Nguyễn Văn C</td>
                                            <td>21/06/2002</td>
                                            <td>0899232121</td>
                                        </tr>
                                        <tr>
                                            <td>A003</td>
                                            <td>Nguyễn Văn C</td>
                                            <td>21/06/2002</td>
                                            <td>0899232121</td>
                                        </tr>                                    
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