<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- import sf: spring-form -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
      <section class="bread-crumb" style="background-image: url(${base}/img/bread-crumb/bread-crumb.webp)">
        <div class="container">
            <div class="bread-crumb__title">
                ĐĂNG KÝ TÀI KHOẢN
            </div>
            <nav aria-label="breadcrumb " class="bread-crumb__List">
                <ol class="breadcrumb bread-crumb__List__ol">
                  <li class="breadcrumb-item bread-crumb__List__item"><a href="#">Trang chủ</a></li>
                  <li class="breadcrumb-item active bread-crumb__List__item" aria-current="page">Đăng ký tài khoản</li>
                </ol>
            </nav>
        </div>

    </section>
    <section class="account-login">
        <div class="container account-login__box">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="page-login account-login__box-shadow">
                        <div id="login" class="row">
                            <ul class="col-xl-12 account-login__menu__list">
                                <li >
                                    <a href="${base }/login" title="Đăng nhập">Đăng nhập</a>
                                </li>
                                <li class="active">
                                    <a href="#" title="Đăng ký">Đăng ký</a>
                                </li>
                            </ul>

                            <div class="col-xl-12" id="nd-login">
                                <sf:form  modelAttribute="User" action="${base}/home/register" method="post"  enctype="multipart/form-data">
                                    <div class="form-signup">
                                        <br>
                                    </div>
                                    <div class="form-signup clearfix">
                                        <fieldset class="form-group margin-bottom-10">
                                            <label>Họ và tên<span class="required">*</span></label>
                                           <sf:input autocomplete="off" placeholder="Nhập Họ" type="text" path="fullname" class="form-control form-control-lg" required="" data-validation-error-msg="Không được để trống" data-validation="required"></sf:input>
                                        </fieldset>
                                        <fieldset class="form-group margin-bottom-10">
                                            <label>tài khoản<span class="required">*</span></label>
                                            <sf:input autocomplete="off" placeholder="Nhập Tên" type="text" path="username" class="form-control form-control-lg"  required="" data-validation-error-msg="Không được để trống" data-validation="required"></sf:input>
                                        </fieldset>                             
                                        <fieldset class="form-group margin-bottom-10">
                                            <label for=""> EMAIL<span class="required">*</span></label>
                                            <sf:input autocomplete="off" placeholder="Nhập Địa chỉ Email" type="email" path="email" class="form-control form-control-lg" value="" name="email" id="customer_email" required="" data-validation="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" data-validation-error-msg="Email sai định dạng"></sf:input>
                                        </fieldset>
                                        <fieldset class="form-group  mb-4">
                                            <label>Mật khẩu<span class="required">*</span></label>
                                            <sf:input autocomplete="off" placeholder="Nhập Mật khẩu" type="password"  path="password" class="form-control form-control-lg" value="" name="password" id="customer_password" data-validation-error-msg="Không được để trống" data-validation="required"></sf:input>
                                        </fieldset>
                                        <div class="clearfix"></div>
                                        <!-- <p class="text-right recover">
                                            <a href="#" class="btn-link-style"  title="Quên mật khẩu?">Quên mật khẩu?</a>
                                        </p> -->
                                        <div class="text-center" >
                                            <button class="btn btn-style btn-blues" type="submit" value="Đăng ký">Đăng ký</button>
                                        </div>
                                        
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