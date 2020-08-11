<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    
<h1 class="hidden">Bánh xíu páo phục vụ nhiều khách hàng nhất Hà Nội</h1>
<!-- giao diện dưới header-->
<section class="gallery_bg">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12 col-xs-12">
				<div class="about-content">
					<p style="font-size: 20px">"Thanh Truong Food" không đơn thuần chỉ là nơi cung cấp cho bạn những sản phẩm ngon
					mà còn là món quà ẩm thực tinh tế bạn dành tặng cho người thân của mình.. 
					Với tiêu chí "Ngon - Sạch - Đẹp" hi vọng các món ăn tại shop sẽ khiến mọi người vừa "Ngon miệng" vừa "Ngon mắt", 
					thư giãn và cảm nhận  hương vị độc đáo của các sản phẩm cùng bạn bè, gia đình,... Hãy luôn ủng hộ Thanh Truong Food nhé!</p>
				</div>
				<div class="viewmore">
					<a href="${pageContext.request.contextPath}/public/gioi-thieu"">Xem chi tiết</a>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 hidden-sm hidden-xs col-xs-12">
				<div id="slide">
					<div class="slider-wrap">
						<section class="bg_slide">
							<div id="slide">
								<div class="slider-wrap">
									<div id="slide-item-carousel" class="carousel slide" data-ride="carousel">
										<!-- Wrapper for slides -->
										<div class="carousel-inner">
											<div class="item active">
												<a href="index.html"><img src="${defines.URL_PUBLIC}/assets/truong2.jpg?1494485291817" alt="Bếp nhà Du" width="1920px" height="300px"></a>
											</div>
											
											<div class="item">
												<a href="index.html"><img src="${defines.URL_PUBLIC}/assets/truong1.jpg?1494485291817" alt="Bếp nhà Du" width="1920px" height="300px"></a>
											</div>
											
											<div class="item">
												<a href="index.html"><img src="${defines.URL_PUBLIC}/assets/truong3.jpg?1494485291817" alt="Bếp nhà Du" width="1920px" height="300px"></a>
											</div>
											
										</div>
										<a class="left slide-item-carousel-control" href="#slide-item-carousel" data-slide="prev">
											<img src="${defines.URL_PUBLIC}/assets/arrow-left6147.png?1494485291817" /> 
										</a>
										<a class="right slide-item-carousel-control" href="#slide-item-carousel" data-slide="next">
											<img src="${defines.URL_PUBLIC}/assets/arrow-right6147.png?1494485291817" /> 
										</a>
									</div> 
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!--đồ ăn ngon-->
<section class="best-seller-pro">
	<div class="container">
		<div class="slider-items-products">
			<div class="new_title center">
				<h2>Đồ ăn Ngon</h2>
			</div>
			<div id="best-seller-slider" class="product-flexslider hidden-buttons">
			
			<c:forEach items="${listProductInnerCat}" var="listProductInnerCat">  
			<div class="item ">
				<div class="product-block">
					<div class="product-image"> 
						<a href="${pageContext.request.contextPath}/public/cat_sp/${slugUtils.makeSlug(listProductInnerCat.name_sp)}-${listProductInnerCat.id_cat}.html">
							<figure class="product-display">
								<img src="${pageContext.request.contextPath}/files/${listProductInnerCat.image_link}" class="product-mainpic" > 
								<img src="${pageContext.request.contextPath}/files/${listProductInnerCat.image_link}" class="product-secondpic"> 
							</figure>
						</a> 
					</div>
				</div>
				<div class="item-info">
					<div class="info-inner">
						<div class="item-title"> <a href="${pageContext.request.contextPath}/public/cat_sp/${slugUtils.makeSlug(listProductInnerCat.name_sp)}-${listProductInnerCat.id_cat}.html">${listProductInnerCat.name_sp}</a> </div>
						<div class="item-content">
							<div class="item-price">
								<div ps-class="price-box-ps-1476654" class="price-box">
									<p class="special-price"> <span class="price-label">Giá: </span> 
									<span class="price"> <fmt:formatNumber type="number" pattern="###,###"  maxIntegerDigits="11" value="${listProductInnerCat.price}" />đ</span>
								</div>
							</div>
							<div class="product-meta">
							
								<!-- <form action="${pageContext.request.contextPath}/public/cart/add/${listProductInnerCat.id_sp}.html" method="post" class="variants" id="product-actions-1476654" enctype="multipart/form-data">
									<div class="product-action"> 
										<input type="hidden" name="variantId" value="2934682" />
										<button class="button btn-cart add_to_cart" title="Cho vào giỏ hàng">
											<i class="icon-shopping-cart">&nbsp;</i><span> Mua hàng</span>
										</button>
									</div>
								</form> -->
								
								<a href="${pageContext.request.contextPath}/public/cart/add/${listProductInnerCat.id_sp}.html">
									<p style="background: yellow;width: 100px; height: 30px; border: 2px solid green;font-weight: bold; ">Mua hàng</p>
								</a>

							</div>
						</div>
					</div>
				</div>
			</div>			
			</c:forEach>	


			<script>
				$(document).ready(function(){
					if(typeof window.append == 'undefined' ){
						for(var pid in window.listPsId){
							$('.price-box[ps-class=price-box-ps-'+pid+']').after("<div class='prices_"+pid+"'></div>");
							listId.push(parseInt(pid));
						}
						
					}
				});
			</script>
				   

			</div>
		</div>
	</div>
</section>

<!--góc bếp-->
<div class="site-content">
	<div class="container">
		<div class="new_title center">
			<h2>Góc bếp</h2>
		</div>
		<div class="blog_home" id="blog_home">
			<c:forEach items="${listBlogInnerCat}" var="listBlogInnerCat">
				<article class="blog_entry item" >
					<div class="entry-content">
						<div class="featured-thumb">
							<a class="ft-thumb" href="${pageContext.request.contextPath}/public/cat_blog/${slugUtils.makeSlug(listBlogInnerCat.name_blog)}-${listBlogInnerCat.id_cat}.html">
								<img src="${pageContext.request.contextPath}/files/${listBlogInnerCat.picture}">
							</a>
						</div>
					</div>
					<header class="blog_entry-header clearfix">
						<div class="blog_entry-header-inner">
							<h2 class="blog_entry-title"> <a rel="bookmark" href="${pageContext.request.contextPath}/public/cat_blog/${slugUtils.makeSlug(listBlogInnerCat.name_blog)}-${listBlogInnerCat.id_cat}.html">${listBlogInnerCat.name_blog}</a> </h2>
						</div>
						<!--blog_entry-header-inner--> 
					</header>
					<footer class="entry-meta"><time class="entry-date"><i class="fa fa-calendar"></i>${listBlogInnerCat.created_blog}</time></footer>
					<div class="entry-content">
						<p>${listBlogInnerCat.mota_blog}</p>
					</div>
					<p> <a class="btn" href="${pageContext.request.contextPath}/public/cat_blog/${slugUtils.makeSlug(listBlogInnerCat.name_blog)}-${listBlogInnerCat.id_cat}.html">Xem thêm</a> </p>
				</article>			
			</c:forEach>

		</div>
	</div>
</div>