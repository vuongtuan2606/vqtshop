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
                         	<form class="form-inline" action="${base}/admin/products/list" method="get">
                            <div class="product_manager">
                                 <div class="element_button">
                                    <div class="d-flex element_button__search ">
                                        <input id="page" name="page" class="form-control" value="${searchModel.page }">  
                                        
                                        <!-- tìm kiếm theo tên sản phẩm -->
                                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" autocomplete="off" value="${searchModel.keyword }" style="margin-right: 10px;">                                
                                        <!-- tìm kiếm theo danh mục sản phẩm -->
                                        <select class="form-control" name="categoryId" id="categoryId" style="margin-right: 10px;">
                                            <option value="0">All</option>
                                            <c:forEach items="${categories}" var="category">
                                                <option value="${category.id }">${category.name }</option>
                                            </c:forEach>
                                        </select>                                  
                                        <button type="submit" id="btnSearch" name="btnSearch" value="Search" class="btn btn-primary">Tìm kiếm</button>
                                    </div> 
                                    <div id="element_button_1" >
                                        <a href="${base }/admin/product/management">Thêm sản phẩm</a>
                                    </div>
                                </div>  
                                <div class="table_order">
                                    <div class="title">
                                        <h3>Danh sách sản phẩm</h3>
                                    </div>
                                    <div >
                                        <table class="table table-responsive table-hover table-striped table-bordered table_content" >
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>stt</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>giá</th>
                                                    <th>Danh mục</th>
                                                    <th>Trạng thái</th>         
                                                    <th>Avatar</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                              <c:set var="count" value="0" scope="page" />
                                            	<c:forEach items="${products.data}" var="p" varStatus="loop">	
                                                <tr>
                                                    <td scope="row" width="5%">
                                                    	${loop.index + 1}
                                                    </td>
                                                    <td>
                                                    	${p.title }
                                                    </td>
                                                    <td>
                                                    	<!-- định dạng tiền tệ -->
														<fmt:setLocale value="vi_VN" scope="session" />
														<fmt:formatNumber value="${p.price}" type="currency" />
                                                    </td>
                                                    <td>
                                                    	${p.categories.name }
                                                    </td>
                                                    <td>
                                                    	<span id="_product_status_${p.id} }">
															<c:choose>
																<c:when test="${p.status }">
																	<input type="checkbox" checked="checked" readonly="readonly">
																</c:when>
																<c:otherwise>
																	<input type="checkbox" readonly="readonly">
																</c:otherwise>
															</c:choose>
														</span>
                                                    </td>
                                                    <td>
														<img src="${base }/upload/${p.avatar}" width="100" height="100">
													</td>
                                                    <td>
                                                        <li><a class="btn btn-primary" href="${base }/admin/product/management/${p.id}">Sửa</a></li>
                                                        <li><a class="btn btn-danger" onclick="ShowModal(${count})" role="button" >Delete</a></li>
                                                        
                                                        <div id="myModal${count }" class="modal">																
														  <!-- Modal content -->
														  <div class="set-modal">
														    <div class="modal-body">
														      <p>Bạn có muốn xóa sản phẩm: ${p.title } ?</p>
														    </div>
														    <div class="modal-button">
														      <button type="button" class="btn btn-secondary" onclick="CloseModal(${count})" id="cancel">Cancel</button>
														      <button type="button" class="btn btn-primary" onclick="DeleteProduct(${p.id});">Accept!</button>
														    </div>
														  </div>									
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
                       		</form>
                        </div>            
                    </div>
			    </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
    <script type="text/javascript">
	    function ShowModal(i) {
			var modal = document.getElementById("myModal"+i);
			modal.style.display = "block";
		}
			
		function CloseModal(i) {
		var modal = document.getElementById("myModal"+i);
		modal.style.display = "none";
		}
		 function DeleteProduct(productId) // yêu cầu 1 cái id
		 {
				// tạo javascript object.  
				var data = {
					id: productId,
				};
				
				// $ === jQuery
				// json == javascript object
				jQuery.ajax({
					url:  '${base}' + "/admin/product/delete", //->request mapping định nghĩa bên controller
					type: "post",						       //-> method type của Request Mapping	
					contentType: "application/json",          //-> nội dung gửi lên dạng json <=> javascript object
					data: JSON.stringify(data),              //-> chuyển 1 javascript object thành string json
	
					dataType: "json",                         // kiểu dữ liệu trả về từ Controller
					success: function(jsonResult) {           // gọi ajax thành công
						location.reload();                    //refresh lại trang web
					},
					error: function(jqXhr, textStatus, errorMessage) { // gọi ajax thất bại
						alert("error");
					}
				});
			}
    
    
	    $( document ).ready(function() {
	    	
			
			// đặt giá trị của category ứng với điều kiện search trước đó
			$("#categoryId").val(${searchModel.categoryId});
			
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