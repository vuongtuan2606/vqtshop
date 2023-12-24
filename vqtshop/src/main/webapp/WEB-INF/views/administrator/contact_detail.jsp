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
    <title>contact</title>
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
                                     <p>Chi tiết liên hệ</p>
                                 </div>
                                 <div class="date_time">
                                     <p id="current-date"></p> <p id="current-time"></p>
                                 </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xxl-12 col-xl-12 col-md-12  "> 
                         	<div class="form-contact_detail clearfix">
                                 <fieldset class="form-group " style="margin-bottom: 20px;" >
                                     <label>ID<span class="required">*</span></label>
                                     <input type="text" class="form-control " value="${contacts.id }" >
                                 </fieldset>
                                 <fieldset class="form-group " style="margin-bottom: 20px;">
                                     <label for="">HỌ TÊN<span class="required">*</span></label>
                                     <input type="text" class="form-control " value="${contacts.fullname }"  >
                                 </fieldset>
                                 <fieldset class="form-group " style="margin-bottom: 20px;">
                                     <label for=""> EMAIL<span class="required">*</span></label>
                                     <input type="email" class="form-control " value="${contacts.email }"  >
                                 </fieldset>
                                 <fieldset class="form-group " style="margin-bottom: 20px;">
                                     <label for=""> YÊU CẦU<span class="required">*</span></label>
                                     <input  type="text" class="form-control " value="${contacts.request }"  >
                                 </fieldset>
                                 <fieldset class="form-group " style="margin-bottom: 20px;">
                                     <label for="">MÔ TẢ <span class="required">*</span></label>
                                     <input type="text" class="form-control " value="${contacts.description }" >
                             </div>
                        </div>            
                    </div>
			    </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
    <script type="text/javascript">
		
    </script> 
</body>
</html>