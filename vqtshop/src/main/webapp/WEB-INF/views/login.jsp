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
                ĐĂNG NHẬP TÀI KHOẢN
            </div>
            <nav aria-label="breadcrumb " class="bread-crumb__List">
                <ol class="breadcrumb bread-crumb__List__ol">
                  <li class="breadcrumb-item bread-crumb__List__item"><a href="#">Trang chủ</a></li>
                  <li class="breadcrumb-item active bread-crumb__List__item" aria-current="page">Đăng nhập tài khoản</li>
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
                                <li class="active">
                                    <a href="#" title="Đăng nhập">Đăng nhập</a>
                                </li>
                                <li>
                                    <a href="../Index/register.html" title="Đăng ký">Đăng ký</a>
                                </li>
                            </ul>
                            <div id="nd-login">
                                <form action="${base }/login_processing_url" method="POST" id="customer_login">
                                    <div class="form-signup">
                                        <br>
                                    </div>
		                             <c:if test="${not empty param.login_error}">
										<div class="alert alert-danger" role="alert">
											Tài khoản hoặc mật khẩu không đúng vui lòng đăng nhập lại !!
										</div>
									</c:if>
                                    <div class="form-signup clearfix">
                                        <fieldset class="form-group margin-bottom-10">
                                            <label for="">Tài khoản<span class="required">*</span></label>
                                            <input name="username"   placeholder="Nhập Tài khoản" type="text" class="form-control form-control-lg" >
                                        </fieldset>
                                        
                                        <fieldset class="form-group margin-bottom-0">
                                            <label>Mật khẩu<span class="required">*</span></label>
                                            <input name="password"  placeholder="Nhập Mật khẩu" type="password" class="form-control form-control-lg" >
                                        </fieldset>
                                        <div class="clearfix"></div>
                                        
                                        <p class="text-right recover">
                                            <a href="#" class="btn-link-style"  title="Quên mật khẩu?">Quên mật khẩu?</a>
                                        </p>
                                        <div class="text-center" >
                                            <button class="btn btn-style btn-blues" type="submit" value="Đăng nhập">Đăng nhập</button>
                                        </div>
                                    </div>

                                </form>

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