<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
        <div class="container-fluid  ">
            <div class="row  ">
                 <jsp:include page="/WEB-INF/views/administrator/layout/admin_menu.jsp"></jsp:include>
                <div class="col-xxl-10 col-xl-10 col-lg-10 ">
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-md-12  "> 
                            <div class="home_content ">
                                 <div class="title">
                                     <p>Quản lý sản phẩm / Thêm sản phẩm</p>
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
                                    <li id="element_button_2"><a href="">Thêm danh mục</a></li>
                                    <li id="element_button_3"><a href="">Thêm nhà cung cấp</a></li>
                                    <li id="element_button_4"><a href="">thêm tình trạng</a></li>
                                </div>
                                <div class="form__add_product">
                                    <div class="title">
                                        <h3>Thêm sản phẩm</h3>
                                    </div>
                                    <sf:form class="row" method="post" action="${base}/admin/product/management" modelAttribute="product" enctype="multipart/form-data">
                                       
                                        <%-- <div class="form-group col-xxl-6  col-xl-6">
                                            <label class="control-label">Mã sản phẩm</label>
                                            <sf:input path="id" id="productId" class="form-control" type="number"></sf:input>
                                        </div> --%>
                                        <sf:hidden path="id" id="productId"  class="form-control"></sf:hidden>
                                        
                                         <!-- đang mapping cho foreign key: category_id(int) -->
                                         <!-- path chỉ hiểu và chỉ nên mapping với các kiểu (int, bool, double, string) -->                                                       
                                        <div class="form-group col-xxl-6  col-xl-6">
                                            <label class="control-label">Danh mục</label>
                                           	<sf:select path="categories.id" class="form-control" id="category">
												<sf:options items="${categories}" itemValue="id" itemLabel="name" />									
											</sf:select>
                                        </div>
                                        
                                        <div class="form-group col-xxl-6  col-xl-6">
                                            <label class="control-label">Thương hiệu</label>
                                           	<sf:select path="brand.id" class="form-control" id="brand">
												<sf:options items="${brand}" itemValue="id" itemLabel="brand_name" />									
											</sf:select>
                                        </div>
                                       
                                      
                                        
                                      
										                                        
                                        <div class="form-group col-xxl-6  col-xl-6">
                                            <label class="control-label">Tên sản phẩm</label>
                                            <sf:input path="title" autocomplete="off" type="text" class="form-control" id="title" placeholder="Title" required="required"></sf:input>                                         
                                        </div>
                                      	  <div class="form-group col-xxl-6  col-xl-6">
                                            <label class="control-label">Màu sắc</label>
                                           	<sf:select path="colorProduct.id" class="form-control" id="color">
												<sf:options items="${colorProduct}" itemValue="id" itemLabel="color_name" />									
											</sf:select>
                                        </div>
                                        <div class="form-group col-xxl-6  col-xl-6">
                                            <label class="control-label">giá gốc</label>
                                            <sf:input type="number" autocomplete="off" path="price" class="form-control" id="price" placeholder="Price" required="required"></sf:input>
                                            
                                        </div>
                                        <div class="form-group col-xxl-6  col-xl-6">
                                            <label class="control-label">giá sale</label>
                                            <sf:input type="number" autocomplete="off" path="priceSale" class="form-control" id="priceSale" placeholder="Price sale" required="required"></sf:input>
                                        </div>
                                        
                                      
                                        
                                        	
                                         <div class="form-group col-xxl-12  col-xl-12">
                                            <label class="control-label">Mô tả</label>
                                            <sf:textarea path="shortDes" autocomplete="off" type="text" class="form-control" id="shortDes" placeholder="shortDes" required="required"></sf:textarea>                                         
                                        </div>
                                        <div class="form-group col-xxl-12  col-xl-12">
                                            <label class="control-label">Chi tiết sản phẩm</label>
                                              <sf:textarea  path="details" autocomplete="off" type="text" class="form-control  "   rows="3"  id="summernote" placeholder="details" required="required"></sf:textarea>                                     
                                        </div>
                                        
                                        	<!-- avatar -->
										<div class="form-group col-xxl-12  col-xl-12">
											<label class="control-label">Avatar</label> 
											<input id="fileProductAvatar" name="productAvatar" type="file" class="form-control">
										</div>								
										<div class="form-group">
										<!-- ${product.avatar}  -->
											<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${product.avatar}">
										</div>

										<!-- pictures -->
										<div class="form-group col-xxl-12  col-xl-12">
											<label class="control-label"  for="fileProductPictures">ảnh sản phẩm (Multiple)</label> 
											<input id="fileProductPictures" name="productPictures" type="file" class="form-control" multiple="multiple"> <!--multiple="multiple" chọn được nhiều file  -->
										</div>
										
										<div class="form-group col-xxl-12  col-xl-12">
										<!-- 	private Set<ProductImages> productImages= new HashSet<ProductImages>();  -->
											<c:forEach items="${product.productImages }" var="productImage">
												<img alt="" style="width: 100px; height: 100px;" src="${base }/upload/${productImage.path}">
											</c:forEach>
										</div>
										
										
										<%-- <div class="form-group col-xxl-12  col-xl-12">
											<label class="control-label" for="selectedSize">Chọn size:</label>
										    <c:forEach items="${sizes}" var="size">
										        <div>
										            <input type="checkbox" id="size${size.id}" name="selectedSizes" value="${size.id}">
										            <label for="size${size.id}">${size.name_size}</label>
										        </div>
										    </c:forEach>
										</div> --%>
									     
									  
										 <div class="form-group col-xxl-6  col-xl-6">
                                            <label class="control-label control-label-hot ">Sản phẩm này đang hot</label>
                                            <sf:checkbox path="isHot" class="form-check-input" id="isHot" />
                                        </div>
                                  
                                      
                                       <div class="">
                                            <button class="btn btn-save" type="submit">Lưu lại</button>
                                            <a href="">Hủy bỏ</a>
                                       </div>
                                        
                                   </sf:form>
                            </div>
                        </div>                    
                    </div>
                </div>
            </div>
        </div>
       </div>
    </section>
    <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
      <script>
      $(document).ready(function() {
    	  $('#summernote').summernote();
    	});
    </script>
</body>
</html>