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
                <div class="col-xxl-10 col-xl-10 col-lg-10 ">
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-md-12  "> 
                            <div class="home_content ">
                                 <div class="title">
                                     <p>Quản lý sản phẩm </p>
                                 </div>
                                 <div class="date_time">
                                     <p id="current-date"></p> <p id="current-time"></p>
                                 </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-md-12  "> 
                            <div class="product_manager">
                                <div class="element_button">
                                    <li id="element_button_1"><a href="../index/addproduct.html">Thêm sản phẩm</a></li>
                                    <li id="element_button_2"><a href="">Xuất Excel</a></li>
                                    <li id="element_button_3"><a href="">Xuât PDF</a></li>
                                    <li id="element_button_4"><a href="">Xóa tất cả</a></li>
                                </div>
                                <div class="table_order">
                                    <div class="title">
                                        <h3>Danh sách sản phẩm</h3>
                                    </div>
                                    <div >
                                        <table class="table table-responsive table-hover table-striped table-bordered table_content" >
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>MÃ sản phẩm</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>ảnh</th>
                                                    <th>số lượng</th>
                                                    <th>Giá tiền</th>
                                                    <th>Danh mục</th>
                                                    <th>Tình trạng</th>
                                                    <th>Chức năng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>A001</td>
                                                    <td>giày mlb</td>
                                                    <td><img src="../img/product_img.webp" alt=""></td>
                                                    <td>40</td>
                                                    <td>3.000.000đ</td>
                                                    <td>giày thể thao</td>
                                                    <td>còn hàng</td>
                                                    <td>
                                                        <li><a href="">Sửa</a></li>
                                                        <li><a href="">Xóa</a></li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>A001</td>
                                                    <td>giày mlb</td>
                                                    <td><img src="../img/product_img.webp" alt=""></td>
                                                    <td>40</td>
                                                    <td>3.000.000đ</td>
                                                    <td>giày thể thao</td>
                                                    <td>còn hàng</td>
                                                    <td>
                                                        <li><a href="">Sửa</a></li>
                                                        <li><a href="">Xóa</a></li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>A001</td>
                                                    <td>giày mlb</td>
                                                    <td><img src="../img/product_img.webp" alt=""></td>
                                                    <td>40</td>
                                                    <td>3.000.000đ</td>
                                                    <td>giày thể thao</td>
                                                    <td>còn hàng</td>
                                                    <td>
                                                        <li><a href="">Sửa</a></li>
                                                        <li><a href="">Xóa</a></li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>A001</td>
                                                    <td>giày mlb</td>
                                                    <td><img src="../img/product_img.webp" alt=""></td>
                                                    <td>40</td>
                                                    <td>3.000.000đ</td>
                                                    <td>giày thể thao</td>
                                                    <td>còn hàng</td>
                                                    <td>
                                                        <li><a href="">Sửa</a></li>
                                                        <li><a href="">Xóa</a></li>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>A001</td>
                                                    <td>giày mlb</td>
                                                    <td><img src="../img/product_img.webp" alt=""></td>
                                                    <td>40</td>
                                                    <td>3.000.000đ</td>
                                                    <td>giày thể thao</td>
                                                    <td>còn hàng</td>
                                                    <td>
                                                        <li><a href="">Sửa</a></li>
                                                        <li><a href="">Xóa</a></li>
                                                    </td>
                                                </tr>
                                                
                                               
                                      
                                            </tbody>
                                            
                                        </table>
                                    </div>
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