<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Two columns content -->
<section class="main-container col2-left-layout">
	<div class="main container">
		<div class="row">
		<!-- ooooooooooooooooooooooooooooooo Khác nhau giửa trang cat_sp và cat_blog ooooooooooooooooooooooooooooooo -->
			<div class="col-main col-md-9 col-sm-12 col-md-push-3">
				<div class="breadcrumbs">
					<ul>
						<li class="home"> <a href="${pageContext.request.contextPath}/public/index" title="Go to Home Page">Home</a><span>/</span></li>
						<li><strong>Blog</strong></li>
					</ul>
				</div>
				
				<div class="blog-wrapper row" id="main">
					<div class="site-content" id="primary">
						<div role="main" id="content" class="content">
							<c:forEach items="${listItemBlogFromIdcat }" var="listItemBlogFromIdcat">
								<article class="blog_entry clearfix col-md-4 col-sm-4 col-xs-12" >
									<div class="entry-content">
										<div class="featured-thumb">
											<a class="ft-thumb" href="${pageContext.request.contextPath}/public/detail_blog/${slugUtils.makeSlug(listItemBlogFromIdcat.name_blog)}-${listItemBlogFromIdcat.id_blog}.html">
												<img src="${pageContext.request.contextPath}/files/${listItemBlogFromIdcat.picture}">
											</a>
										</div>
									</div>
									<header class="blog_entry-header clearfix">
										<div class="blog_entry-header-inner">
											<h2 class="blog_entry-title"> <a rel="bookmark" href="${pageContext.request.contextPath}/public/detail_blog/${slugUtils.makeSlug(listItemBlogFromIdcat.name_blog)}-${listItemBlogFromIdcat.id_blog}.html">${listItemBlogFromIdcat.name_blog }</a> </h2>
										</div>
										<!--blog_entry-header-inner--> 
									</header>
									<footer class="entry-meta"><time class="entry-date"><i class="fa fa-calendar"></i>${listItemBlogFromIdcat.created_blog }</time></footer>
									<div class="entry-content">
										<p>${listItemBlogFromIdcat.mota_blog }</p>
									</div>
									<p> <a class="btn" href="${pageContext.request.contextPath}/public/detail_blog/${slugUtils.makeSlug(listItemBlogFromIdcat.name_blog)}-${listItemBlogFromIdcat.id_blog}.html">Xem thêm</a> </p>
								</article>							
							</c:forEach>

						</div>
					</div>
					
					<div class="clear"></div>
						
	 	 				<div class="text-center">
							<ul class="pagination">
								<c:forEach var="i" begin="1" end="${totalPage}">
									<li <c:if test="${page==i }">class=	'active'</c:if>>
										<a href="${pageContext.request.contextPath}/public/cat_blog/${slugUtils.makeSlug(objCat.name_cat)}-${objCat.id_cat}.html?page=${i}" title="">${i}</a>
							 		</li> 
								</c:forEach>
							</ul>
						</div> 
					</div>
				
			</div>
		<!-- oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo -->
		
			<aside class="col-left sidebar col-md-3 col-sm-12 col-xs-12 col-md-pull-9">
				<div class="side-nav-categories">
					<div class="block-title" style="font-weight: bold;font-size: 15px;"> Danh mục sản phẩm </div>
					<!--block-title--> 
					<!-- BEGIN BOX-CATEGORY -->
					<div class="" style="font-weight: bold; font-size: 15px;">
						<c:forEach items="${listItemCatBlog}" var="listItemCatBlog">
							<ul>
								<li style="margin-top: 30px;list-style-type: square;"> <a href="${pageContext.request.contextPath}/public/cat_blog/${slugUtils.makeSlug(listItemCatBlog.name_cat)}-${listItemCatBlog.id_cat}.html">${listItemCatBlog.name_cat}</a> </li>
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
