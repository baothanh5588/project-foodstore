<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		
<!-- main-container -->
<section class="main-container col1-layout">
	<div class="main container">
		<div class="col-main">
			<div class="row">
				<div class="product-view">
					<div class="product-essential col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="breadcrumbs">
							<ul>
								<li class="home"> <a href="${pageContext.request.contextPath}/public/index" title="Go to Home Page">Home</a><span>/</span></li>
								<li><strong>${objItemProduct.name_sp}</strong><li>
							</ul>
						</div>
						<div class="row">
							<form action="https://bepnhadu.com/cart/add" method="post" enctype="multipart/form-data" id="add-to-cart-form">
								<input name="form_key" value="6UbXroakyQlbfQzK" type="hidden">
								<div style="float: left;">
									<h1>${objItemProduct.name_sp }</h1>
 									<img style="width: 300px;height: 300px" src="${pageContext.request.contextPath}/files/${objItemProduct.image_link}"> 
								</div>
								
								<div style="float: left;margin-left: 80px;">

									<div class="price-block">
										<div>
											<img src="${pageContext.request.contextPath}/templates/public/assets/thongtin.png" width="60px" height="50px">
											<span style="font-family: time new roman;font-size: 30px; font-weight: bold;">Thông tin sản phẩm</span> 
										</div>
									</div>
										
									<div class="add-to-cart">
										<a href="${pageContext.request.contextPath}/public/cart/detail_sp/add/${objItemProduct.id_sp}.html">
											<p style="width: 500px; height: 300px; font-family: time new roman;font-size: 18px;">${objItemProduct.thongtin_sp }</p>
										</a> 
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="product-collateral">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="row">

							<div class="item-content" style="float: left;">
								<div class="price-box">
									<p class="special-price"> <span class="price-label">Giá: </span> <span class="price"><fmt:formatNumber type="number" pattern="###,###"  maxIntegerDigits="11" value="${objItemProduct.price}" />₫</span> </p>
								</div>
							</div>
							<div style="float: left;margin-left: 80px">
								<a href="${pageContext.request.contextPath}/public/cart/detail_sp/add/${objItemProduct.id_sp}.html"">
									<p style="background: yellow;width: 100px; height: 30px; border: 2px solid green;font-weight: bold; fon">Mua hàng</p>
								</a>
							</div>
							<!-- -------------------------------------------------- -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!--End main-container --> 