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
                                     <p>Quản lý người dùng </p>
                                 </div>
                                 <div class="date_time">
                                     <p id="current-date"></p> <p id="current-time"></p>
                                 </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-md-12  "> 
                         	<sf:form class="form-inline" action="${base}/admin/user" method="get">
                            <div class="product_manager">
                                 
                                <div class="element_button">
                                    <div class="d-flex element_button__search ">
                                         <input id="page" name="page" class="form-control" value="${searchModel.page }">  
                                        
                                        <!-- tìm kiếm theo tên  -->
                                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" autocomplete="off" value="${searchModel.keyword }" style="margin-right: 10px;">                                
                                        <!-- tìm kiếm theo roles  -->
                                        <select class="form-control" name="roleId" id="roleId" style="margin-right: 10px;">
                                            <option value="0">All</option>
											<option value="1">ADMIN</option>
											<option value="2">USER</option>
											<option value="3">MANAGER</option>
                                        </select>                                  
                                        <button type="submit"  name="btnSearch" value="Search" class="btn  " id="btnSearch">Seach</button>
                                    </div> 
                                </div>
                                 <div class="table_order">
                                    <div class="title">
                                        <h3>Danh sách khách hàng</h3>
                                    </div>
                                    <div >
                                    <!-- danh sách người dùng -->
                                        <table class="table table-responsive table-hover table-striped table-bordered table_content" >
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>Vai trò</th>
                                                    <th>Họ tên</th>
                                                    <th>Tài khoản</th>
                                                    <th>Email</th>
                                                    <th>Trạng thái</th>
                                                    <th>Chỉnh sửa quyền</th>
                                                    <th>Khác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:set var="count" value="0" scope="page" />
								              <c:forEach items="${users.data }" var="user">
								             	<c:set var="co_admin" value="0" scope="page"></c:set>
								          		<c:set var="admin" value="0" scope="page"></c:set>
                                                <tr>
		                                             <td>
			                                             <c:forEach items="${user.roles }" var="role">
															${role.name }
															<c:if test="${role.id == 3 }">
																<c:set var="co_admin" value="${co_admin + 1}" scope="page"/>
															</c:if>
															<c:if test="${role.id == 1 }">
																<c:set var="admin" value="${admin + 1}" scope="page"/>
															</c:if>
														</c:forEach>
												    </td>
				                                    <td>${user.fullname }</td>
								              		<td>${user.username }</td>
								              		<td>${user.email }</td>
                                                    <td>
								              			<span id="_product_status_${user.id} }">
															<c:choose>
																<c:when test="${user.status }">
																	<input type="checkbox" checked="checked" readonly>
																</c:when>
																<c:otherwise>
																	<input type="checkbox" readonly>
																</c:otherwise>
															</c:choose>
														</span>
													</td>	
                                                    <td>
								              			<div class="d-flex set-Roles" style="justify-content: space-around;">
								              			
								              				<c:if test="${co_admin == 0 && admin==0 }">
								              					<a role="button"  onclick="ShowUpModal(${count})">
									              					sửa thành manage
									              				</a>
								              				</c:if>
								              				<c:if test="${co_admin>0 && admin==0 }">
								              					<a role="button"  onclick="ShowDownModal(${count})">
									              					Sửa thành người dùng
									              				</a>
								              				</c:if>
								              				<c:if test="${admin>0 }">
								              					<a role="button">
									              					
									              				</a>
								              				</c:if>
								              				

															<!-- The Modal -->
															<div id="myUpModal${count }" class="modal">
															
															  <!-- Modal content -->
															  <div class="set-modal">
															    <div class="modal-title">
															      <p>Bạn có muốn thêm quyền manage cho người dùng: ${user.fullname } này không ?</p>
															    </div>
															    <div class="modal-button">
															      <button type="button" class="btn btn-secondary" onclick="CloseUpModal(${count})" id="cancel">Cancel</button>
															      <button type="button" class="btn btn-primary" onclick="AddUserCO(${user.id})">Accept!</button>
															    </div>
															  </div>
															</div>
															
															<!-- The Modal -->
															<div id="myDownModal${count }" class="modal">
															
															  <!-- Modal content -->
															  <div class="set-modal">
															    <div class="modal-title">
															      <p>Bạn có muốn xóa quyền manage của người dùng: ${user.fullname} này không ?</p>
															      
															    </div>
															    <div class="modal-button">
															      <button type="button" class="btn btn-secondary" onclick="CloseDownModal(${count})" id="cancel">Cancel</button>
															      <button type="button" class="btn btn-primary" onclick="RemoveUserCO(${user.id})">Accept!</button>
															    </div>
															  </div>
															</div>
								              			</div>
								              		</td>
                                                    <td>
										                <c:if test="${co_admin==0 && admin==0 }">
							              					<a role="button" class="myBtn ${count }" onclick="ShowModal(${count})"  >
							              					    <i class="bi bi-person-x"></i>
							              				    </a>
							              				</c:if>
							              				<c:if test="${co_admin>0 && admin==0 }">
							              					<a role="button" class="myBtn ${count }" onclick="ShowModal(${count})"  >
							              					    <i class="bi bi-person-x"></i>
							              				    </a>
							              				</c:if>
							              				<c:if test="${admin>0 }">
							              					<a role="button">
								              					
								              				</a>
							              				</c:if>
						              				
							              				<!-- The Modal -->
														<div id="myModal${count }" class="modal">
														
														  <!-- Modal content -->
														  <div class="set-modal">
															    <div class="modal-title">
															      <p>Bạn có muốn xóa: ${user.fullname } không ?</p>										      
															    </div>
															    <div class="modal-button">
															      <button type="button" class="btn btn-secondary" onclick="CloseModal(${count})" id="cancel">Cancel</button>
															      <button type="button" class="btn btn-primary" onclick="BanUser(${user.id})">Accept!</button>
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
                       		 </sf:form>   
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
		
		function ShowUpModal(i) {
			var modal = document.getElementById("myUpModal"+i);
			modal.style.display = "block";
		}
		function CloseUpModal(i) {
			var modal = document.getElementById("myUpModal"+i);
			modal.style.display = "none";
		}
		
		function ShowDownModal(i) {
			var modal = document.getElementById("myDownModal"+i);
			modal.style.display = "block";
		}
		function CloseDownModal(i) {
			var modal = document.getElementById("myDownModal"+i);
			modal.style.display = "none";
		}
	    function AddUserCO(userId) {
 
			var data = {
				id: userId,
			};
			

			jQuery.ajax({
				url:  '${base}' + "/admin/user/addCO",
				type: "post",						
				contentType: "application/json",
				data: JSON.stringify(data),
	
				dataType: "json", 
				success: function(jsonResult) {
					location.reload(); //refresh lại trang web
				},
				error: function(jqXhr, textStatus, errorMessage) {
					alert("error");
				}
			});
		}
		function RemoveUserCO(userId) {
			// tạo javascript object.  
			var data = {
				id: userId,
			};

			jQuery.ajax({
				url:  '${base}' + "/admin/user/removeCO",
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
		function BanUser(userId) { 
			var data = {
				id: userId,
			};

			jQuery.ajax({
				url:  '${base}' + "/admin/user/delete",
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

		
	    $( document ).ready(function() {
			
			// đặt giá trị của category ứng với điều kiện search trước đó
			$("#roleId").val(${searchModel.roleId});
			
			$("#paging").pagination({
				currentPage: ${users.currentPage}, //trang hiện tại
		        items: ${users.totalItems},	//tổng số sản phẩm
		        itemsOnPage: ${users.sizeOfPage}, //số sản phẩm trên 1 trang
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