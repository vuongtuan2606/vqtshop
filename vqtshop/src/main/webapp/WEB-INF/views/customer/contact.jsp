<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import sf: spring-form -->
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
                LIÊN HỆ
            </div>
            <nav aria-label="breadcrumb " class="bread-crumb__List">
                <ol class="breadcrumb bread-crumb__List__ol">
                  <li class="breadcrumb-item bread-crumb__List__item"><a href="#">Trang chủ</a></li>
                  <li class="breadcrumb-item active bread-crumb__List__item" aria-current="page">Liên hệ</li>
                </ol>
            </nav>
        </div>
    </section>
     <section class="contact">
        <div class="container contact__box">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="page-login contact__box-shadow">
                        <div id="login" class="row">
                            <div class="col-xl-12" id="nd-contact">
                            	<!--  Sử dụng sprring-form -->
			                    <!-- bước 1: import thư viện taglib spring-form -->
			                    <!-- bước 2: tạo data mapping, trong trường hợp này là class Contact -->
			                    <!-- bước 3: sử dụng các thẻ spring-form để tạo FORM -->
			                    <!-- modelAttribute: chỉ cho spring-form biết data nào cần binding(tên data là contact vì ở controller đã đẩy xuống với tên là contact) -->
			                    <!-- path: trỏ tới property của data binding -->
			                    <!-- enctype: khi submit form thì sẽ có file đính kèm gửi lên -->
                                 <sf:form modelAttribute="contact"  action="${base }/contact" method="post" enctype="multipart/form-data">
                                <!-- đẩy theo name -->
                                    <div class="form-contact">
                                        <br>
                                    </div>
                                    <div class="form-contact clearfix">
                                        <fieldset class="form-group margin-bottom-10">
                                            <label>Họ Tên<span class="required">*</span></label>
                                            <sf:input path="fullName" placeholder="Nhập Họ tên của bạn" type="text" class="form-control form-control-lg" value="" name="fullName" id="customer_FullName" required="" data-validation-error-msg="Không được để trống" data-validation="required"></sf:input>
                                        </fieldset>
                                        <fieldset class="form-group margin-bottom-10">
                                            <label for=""> EMAIL<span class="required">*</span></label>
                                            <sf:input path="email" autocomplete="off" placeholder="Nhập Địa chỉ Email" type="email" class="form-control form-control-lg" value="" name="email" id="customer_email" required="" data-validation="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" data-validation-error-msg="Email sai định dạng"></sf:input>
                                        </fieldset>
                                        <fieldset class="form-group margin-bottom-10">
                                            <label for=""> Yêu cầu<span class="required">*</span></label>
                                            <sf:input path="message" autocomplete="off" placeholder="Nhập yêu cầu của bạn" type="text" class="form-control form-control-lg" value="" name="message" id="customer_message" data-validation-error-msg="Không được để trống" data-validation="required" ></sf:input>
                                        </fieldset>
                                        <fieldset class="form-group margin-bottom-10">
                                            <label for=""> Mô tả<span class="required">*</span></label>
                                            <sf:textarea path="describe" autocomplete="off" placeholder="Nhập mô tả" class="form-control form-control-lg"  name="describe" id="customer_describe" data-validation-error-msg="Không được để trống" data-validation="required" ></sf:textarea>
                                        </fieldset>        
                                         <fieldset class="form-group margin-bottom-10">
                                            <label>Update File<span class="required">*</span></label>
                                            <!-- do spring-form không có thẻ file nên phải sử dụng thẻ html input  -->
                                            <input type="file" class="form-control form-control-lg" name="attachment" id="uploadFile"/>
                                        </fieldset>         
                                        <div class="text-center" >
                                            <button class="btn btn-style btn-blues" type="submit" value="submit">Gửi thông tin</button>
                                        </div>
                                        <p class="login--notes">MLB Việt Nam cam kết bảo mật và sẽ không bao giờ đăng <br>hay chia sẻ thông tin mà chưa có được sự đồng ý của bạn.</p>
                                    </div>
                                </sf:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
   

    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/js.jsp"></jsp:include>
</body>
</html>
