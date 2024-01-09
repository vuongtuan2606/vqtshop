<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="header">
       <div class="middle-header ">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-xl-2 col-lg-2 col-md-3 right-header"> 
                        <a href="${base}/home"><img src="${base }/img/mylogo.png" alt="" ></a>           
                    </div>
                    <div class="col-xl-8 col-lg-8 col-md-6 center-header">
                        <ul>
                            <li id="menu-product">
                                <a href="${base }/home/listproduct/1">Giày Dép</a>
                                <div class="menu-product-drop-down">
                                    <ul>
                                        <li>
                                            <a href=""><img src="../img/mlb-viet-nam-giay-mlb-big-ball-chunky-chinh-hang.webp" alt=""></a>
                                            <a href="">All SHORE</a>
                                        </li>
                                        <li>
                                            <a href=""><img src="../img/mlb-viet-nam-giay-mlb-big-ball-chunky-chinh-hang.webp" alt=""></a>
                                            <a href="">BIGBALL CHUNKY</a>
                                        </li>
                                        <li>
                                            <a href=""><img src="../img/mlb-viet-nam-giay-mlb-mule-chinh-hang.webp" alt=""></a>
                                            <a href="">MULE</a>
                                        </li>
                                        <li>
                                            <a href=""><img src="../img/mlb-viet-nam-giay-mlb-chunky-liner-chinh-hang.webp" alt=""></a>
                                            <a href="">CHUNKY LINER</a>
                                        </li>
                                        <li>
                                            <a href=""><img src="../img/mlb-viet-nam-giay-mlb-play-ball-chinh-hang.webp" alt=""></a>
                                            <a href="">PLAYBALL</a>
                                        </li>
                                        <li>
                                            <a href=""><img src="../img/mlb-viet-nam-giay-mlb-chunky-classic-chinh-hang.webp" alt=""></a>
                                            <a href="">CHUNKY CLASSIC</a>
                                        </li>
                                        <li>
                                            <a href=""><img src="../img/mlb-viet-nam-giay-mlb-chunky-runner-chinh-hang.webp" alt=""></a>
                                            <a href="">CHUNKY JOGGER</a>
                                        </li>
                                        <li>
                                            <a href=""><img src="../img/mlb-viet-nam-sandal-mlb-chinh-hang.webp" alt=""></a>
                                            <a href="">SLIDERS/SANDALS</a>
                                        </li>
                                    </ul>
        
                                </div>
                            </li>
                            <li><a href="${base }/home/listproduct/3">Túi balo</a></li>
                            <li><a href="">Mũ nón</a></li>
                            <li><a href="">Áo quần</a></li>
                            <li><a href="">Phụ kiện</a></li>
                            <li><a href="${base}/contact">Liên hệ</a></li>
                            <li><a href="">Sale-off</a></li>
                        </ul>
                    </div>
                    <div class="col-xl-2 col-lg-2 col-md-3 Left-header ">
                        <ul class="group-account">
                            <li class="search-container "> 
                            <form action="${base }/home/productSearch" method="get">
                                <a href=""><i class="bi bi-search"></i></a>
                                <div class="input-container">
                                    <input type="text"  id="keyword" name="keyword" value="${searchModel.keyword }"  class="input"  placeholder="search...">
                                    <button type="submit" id="btnSearch">
	                                    <span class="icon"> 
	                                    	<svg width="19px" height="19px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path opacity="1" d="M14 5H20" stroke="#000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <path opacity="1" d="M14 8H17" stroke="#000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path> <path d="M21 11.5C21 16.75 16.75 21 11.5 21C6.25 21 2 16.75 2 11.5C2 6.25 6.25 2 11.5 2" stroke="#000" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"></path> <path opacity="1" d="M22 22L20 20" stroke="#000" stroke-width="3.5" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
	                                    </span>
                                    </button>
                                    
                                </div>
                                
                            </form>    
                            </li>
                            <li class="user">
                            <div class="dropdown">
                                 <div class="icon-user" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                     <i class="bi bi-person-circle"></i>
                                 </div>
                                  <c:choose>
                                  	 <c:when test="${isLogined }">
                                  		<ul class="dropdown-menu set__dropdown-menu">
                                       <li><a href=""><button class="dropdown-item set__dropdown-item" type="button"> ${userLogined.username}</button> </a></li>
                                       <li><a href="${base }/logout"><button class="dropdown-item set__dropdown-item" type="button">Đăng xuất</button></a></li>
                                   </ul>
                                 </c:when>
                                  <c:otherwise>
                                  		<ul class="dropdown-menu set__dropdown-menu">
                                        <li><a href="${base }/login"><button class="dropdown-item set__dropdown-item" type="button"> đăng nhập</button> </a></li>
                                        <li><a href="${base }/home/register"><button class="dropdown-item set__dropdown-item" type="button">đăng ký</button></a></li>
                                    </ul>
                                   </c:otherwise> 
                                  </c:choose>
                            </div>                          
                            </li>
                            <li class="cart">
                            	<a href="${base}/cart">
	                            	<i class="bi bi-bag-check"></i>
		                             <span class="cart_Item " id="iconShowTotalItemsInCart">
		                           	 	 ${totalItems }
		                        	</span>
                            	</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
       </div>
    </div>