<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-xxl-2 col-xl-2 col-lg-2     ">
				<div class="menu_manager__all h-100 ">
					<div class="user_manager  ">
                        <div class="avatar">
                            <img src="../img/avatar.jpg"  alt="">
                        </div>
                        <div class="name">
                            <a href="">${userLogined.username}</a>
                        </div>
                    </div>
                    <div class="menu_manager  ">
                        <ul id="menu">
                            <li class="menu_link ">
                                <a href="${base }/admin/home">
                                    <i class="bi bi-speedometer2"></i> Bảng điều khiển
                                </a>
                            </li>
                            <li class="menu_link">
                                <a href="${base }/admin/user">
                                    <i class="bi bi-people-fill"></i>Quản lý khách hàng
                                </a>
                            </li>
                            <li  class="menu_link">
                                <a href="${base}/admin/products/list">
                                    <i class="bi bi-tags"></i>Quản lý sản phẩm
                                </a>
                            </li>
                            <li  class="menu_link">
                                <a href="${base }/admin/order">
                                    <i class="bi bi-journal-check"></i>Quản lý đơn hàng
                                </a>
                            </li>
                            <li  class="menu_link">
                                <a href="${base }/admin/contact">
                                    <i class="bi bi-envelope"></i>Quản lý liên hệ
                                </a>
                            </li>
                           
                        </ul>
                    </div>
                </div>
					</div>
                    