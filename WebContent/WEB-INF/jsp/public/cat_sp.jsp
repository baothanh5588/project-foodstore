<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!-- Two columns content -->
<section class="main-container col2-left-layout">
	<div class="main container">
		<div class="row">
		<!-- ooooooooooooooooooooooooooooooo Khác nhau giửa trang cat_sp và cat_blog ooooooooooooooooooooooooooooooo -->
			<section class="col-main col-md-9 col-sm-12 col-md-push-3">
				<div class="breadcrumbs">
					<ul>
						<li class="home"> <a href="${pageContext.request.contextPath}/public/index" title="Go to Home Page">Home</a><span>/</span></li>
						<li ><strong>Sản phẩm</strong></li>
					</ul>
				</div>
				<div class="category-products">
					<div class="toolbar">
						<div class="pager">
						</div>
						<div id="sort-by">
							<label>Lọc sản phẩm theo: </label>
							<select name="sortBy" id="sortBy" class="selectBox" style="height: 28px;">
								<option selected value="default">Mặc định</option>
								<option value="alpha-asc">A &rarr; Z</option>
								<option value="alpha-desc">Z &rarr; A</option>
								<option value="price-asc" >Giá tăng dần</option>
								<option value="price-desc">Giá giảm dần</option>
								<option value="created-desc">Hàng mới nhất</option>
								<option value="created-asc">Hàng cũ nhất</option>
							</select>
							<script>
								Bizweb.queryParams = {};
								if (location.search.length) {
									for (var aKeyValue, i = 0, aCouples = location.search.substr(1).split('&'); i < aCouples.length; i++) {
										aKeyValue = aCouples[i].split('=');
										if (aKeyValue.length > 1) {
											Bizweb.queryParams[decodeURIComponent(aKeyValue[0])] = decodeURIComponent(aKeyValue[1]);
										}
									}
								}
								$(function() {
									$('#sortBy')
									// select the current sort order
										.val('')
										.bind('change', function() {
										Bizweb.queryParams.sortby = jQuery(this).val();
										location.search = jQuery.param(Bizweb.queryParams).replace(/\+/g, '%20');
									});
								});
							</script>
						</div>

					</div>
					<c:forEach items="${listItemProductFromIdcat}" var="listItemProductFromIdcat">
					<ul class="products-grid">
						
						<li class="item col-lg-4 col-md-4 col-sm-6 col-xs-12">
							
								<div class="item-inner">
									<div class="product-block">
										<div class="product-image"> 
											<a href="${pageContext.request.contextPath}/public/detail_sp/${slugUtils.makeSlug(listItemProductFromIdcat.name_sp)}-${listItemProductFromIdcat.id_sp}.html">
												<figure class="product-display">
													<img src="${pageContext.request.contextPath}/files/${listItemProductFromIdcat.image_link}" class="product-mainpic" > 
													<img src="${pageContext.request.contextPath}/files/${listItemProductFromIdcat.image_link}" class="product-secondpic">  
												</figure>
											</a> 
										</div>
									</div>
									<div class="item-info">
										<div class="info-inner">
											<div class="item-title"> <a href="${pageContext.request.contextPath}/public/detail_sp/${slugUtils.makeSlug(listItemProductFromIdcat.name_sp)}-${listItemProductFromIdcat.id_sp}.html">${listItemProductFromIdcat.name_sp }</a> </div>
											<div class="item-content">
												<div class="item-price">
													<div class="price-box">
														<p class="special-price"> <span class="price-label">Giá: </span> <span class="price"><fmt:formatNumber type="number" pattern="###,###"  maxIntegerDigits="11" value="${listItemProductFromIdcat.price}" />₫</span> </p>
													</div>
												</div>
												<div class="product-meta">
													<!-- <form action="${pageContext.request.contextPath}/" method="post" class="variants" id="product-actions-6582687" enctype="multipart/form-data">
														<div class="product-action"> 
															<input type="hidden" name="variantId" value="10468642" />
															<button class="button btn-cart add_to_cart" title="Cho vào giỏ hàng">
																<i class="icon-shopping-cart">&nbsp;</i><span> Thêm vào đơn</span>
															</button>
														</div>
													</form> -->
													<%-- 
													<a href="${pageContext.request.contextPath}/">
														<p style="background: yellow;width: 100px; height: 30px; border: 2px solid green;font-weight: bold; ">Mua hàng</p>
													</a>
													 --%>
												</div>
											</div>
										</div>
									</div>
								</div>							
						</li>
					</ul>
					</c:forEach>
					
					<div class="clear"></div>
					
 	 				<div class="text-center">
						<ul class="pagination">
							<c:forEach var="i" begin="1" end="${totalPage}">
								<li <c:if test="${page==i }">class=	'active'</c:if>>
									<a href="${pageContext.request.contextPath}/public/cat_sp/${slugUtils.makeSlug(objCat.name_cat)}-${objCat.id_cat}.html?page=${i}" title="">${i}</a>
						 		</li> 
							</c:forEach>
						</ul>
					</div> 
				</div>
			</section>
		<!-- oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo -->
		
			<aside class="col-left sidebar col-md-3 col-sm-12 col-xs-12 col-md-pull-9">
				<div class="side-nav-categories">
					<div class="block-title" style="font-weight: bold;font-size: 15px;"> Danh mục sản phẩm </div>
					<!--block-title--> 
					<!-- BEGIN BOX-CATEGORY -->
					<div class="" style="font-weight: bold; font-size: 15px;">
						<c:forEach items="${listItemCatProduct}" var="listItemCatProduct">
							<ul>
								<li style="margin-top: 30px;list-style-type: square;"> <a href="${pageContext.request.contextPath}/public/cat_sp/${slugUtils.makeSlug(listItemCatProduct.name_cat)}-${listItemCatProduct.id_cat}.html">${listItemCatProduct.name_cat}</a> </li>
							</ul>			
						</c:forEach>
					</div>
					
					
					<!--box-content box-category--> 
				</div>
				<div class="block block-banner hidden-sm hidden-xs"><a href="#">
					<img src="${defines.URL_PUBLIC }/assets/block-banner6147.png" alt="block-banner"></a>
				</div>
			</aside>
			
		</div>
	</div>
</section>
<!-- End Two columns content -->
