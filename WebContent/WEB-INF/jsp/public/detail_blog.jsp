<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
		
<div class="main-container col2-right-layout">
	<div class="main container">
		<div class="row">
			<div class="col-main col-sm-9">
				<div class="breadcrumbs">
					<ul>
						<li class="home"> <a href="${pageContext.request.contextPath}/public/index" title="Go to Home Page">Home</a><span>/</span></li>
						<li><strong>${objItemBlog.name_blog }</strong></li>
					</ul>
				</div>
				
				<div class="blog-wrapper" id="main">
					<div class="site-content" id="primary">
						<div role="main" id="content">
							<article class="blog_entry clearfix" >
								<header class="blog_entry-header clearfix">
									<div class="blog_entry-header-inner">
										<h2 class="blog_entry-title">${objItemBlog.name_blog }</h2>
									</div>
									<div class="blog_entry-header-inner">
										<img style="width: 300px;height: 300px" src="${pageContext.request.contextPath}/files/${objItemBlog.picture}" >
									</div>
									<!--blog_entry-header-inner--> 
								</header>
								<!--blog_entry-header clearfix-->
								<div class="entry-content">
									<div class="entry-content">
										<p style="font-size: 20px; font-weight: bold;">Mô tả:</p>
										<p>${objItemBlog.mota_blog }</p>
									</div>
									<div class="entry-content">
										<p style="font-size: 20px; font-weight: bold;">Chi tiết:</p>
										<p>${objItemBlog.chitiet_blog }</p>
									</div>
								</div>
								
							</article>
							<!-- 
							<div class="comment-content">
								
								<div class="comments-form-wrapper clearfix">
									<h3>Bình luận của bạn</h3>
									<form accept-charset='UTF-8' action='https://bepnhadu.com/posts/5-mon-tra-sua-ma-ban-khong-the-khong-nhac-de-moi-khi-mua-he-ve/comments' id='article_comments' method='post'>
										<input name='FormType' type='hidden' value='article_comments' />
										<input name='utf8' type='hidden' value='true' />
										<div class="field">
											<label style=" width: 100%;" for="name">Tên<em class="required">*</em></label>
											<input type="text" id="user" name="Author" value="" class="input-text">
										</div>
										<div class="field">
											<label style=" width: 100%;" for="email">Email<em class="required">*</em></label>
											<input  type="text" id="email" name="Email" value="" class="input-text validate-email">
										</div>
										<div class="clear"></div>
										<div class="field aw-blog-comment-area">
											<label style=" width: 100%;" for="comment">Ý kiến của bạn<em class="required">*</em></label>
											<textarea rows="5" cols="50" class="input-text" title="Comment" id="comment" name="Body"></textarea>
										</div>
										<div style="width:96%" class="button-set">
											<button type="submit" class="bnt-comment"><span><span>Gửi đi</span></span></button>
										</div>
									</form>
								</div>
								comments-form-wrapper clearfix 
							</div>
							 -->
						</div>
					</div>
				</div>
			</div>
			
<!-- 			
<div class="col-right sidebar col-sm-3">
	  <div role="complementary" class="widget_wrapper13" id="secondary">
		
		<div class="popular-posts widget widget__sidebar " id="recent-posts-4">
			<h3 class="widget-title"><span>Đọc nhiều</span></h3>
			<div class="widget-content">
				<ul class="posts-list unstyled clearfix">
					
										
					<li>
						<figure class="featured-thumb" style="width:35%">
							<a class="ft-thumb" href="giai-nhiet-mua-he-voi-thuc-don-7-ngay-trong-tuan-cua-bep-nha-du.html">
								
								<img src="thumb/large/100/059/177/articles/413a0e.jpg?v=1495123486910" alt="Giải nhiệt mùa hè với thực đơn 7 ngày trong tuần của Bếp Nhà Du">
								
							</a>
						</figure>
						featured-thumb
						<h4><a title="Giải nhiệt mùa hè với thực đơn 7 ngày trong tuần của Bếp Nhà Du" href="giai-nhiet-mua-he-voi-thuc-don-7-ngay-trong-tuan-cua-bep-nha-du.html">Giải nhiệt mùa hè với thực đơn 7 ngày trong tuần của Bếp Nhà Du</a></h4>
						<p class="post-meta"><i class="icon-calendar"></i>
							<time class="entry-date">18/05/2017</time>
						</p>
					</li>
					
					
										
					<li>
						<figure class="featured-thumb" style="width:35%">
							<a class="ft-thumb" href="ban-da-thuong-thuc-het-10-mon-qua-vat-ngon-nuc-tieng-cua-vung-dat-nam-dinh-chua.html">
								
								<img src="thumb/large/100/059/177/articles/collage-photocat-3b2b2725-e98c-4b53-9f70-3c09d2d5d5b691f4.jpg?v=1495037676740" alt="Bạn đã thưởng thức hết 10 món quà vặt ngon nức tiếng của vùng đất Nam Định chưa?">
								
							</a>
						</figure>
						featured-thumb
						<h4><a title="Bạn đã thưởng thức hết 10 món quà vặt ngon nức tiếng của vùng đất Nam Định chưa?" href="ban-da-thuong-thuc-het-10-mon-qua-vat-ngon-nuc-tieng-cua-vung-dat-nam-dinh-chua.html">Bạn đã thưởng thức hết 10 món quà vặt ngon nức tiếng của vùng đất Nam Định chưa?</a></h4>
						<p class="post-meta"><i class="icon-calendar"></i>
							<time class="entry-date">17/05/2017</time>
						</p>
					</li>
					
					
				</ul>
			</div>
			widget-content 
		</div>
		
		<div class="popular-posts widget widget_categories" id="categories-2" style="display: none">
			<h3 class="widget-title"><span>Danh mục tin tức</span></h3>
			<ul>
				
				<li class="cat-item cat-item-19599"><a href="feedback-khach-hang-1.html">Feedback khách hàng</a></li>
				
				<li class="cat-item cat-item-19599"><a href="com-chay-1.html">Cơm cháy</a></li>
				
				<li class="cat-item cat-item-19599"><a href="tong-hop-cach-lam-banh.html">Tổng hợp cách làm bánh</a></li>
				
				<li class="cat-item cat-item-19599"><a href="suc-khoe.html">Sức khỏe</a></li>
				
				<li class="cat-item cat-item-19599"><a href="kim-chi.html">Kim chi</a></li>
				
				<li class="cat-item cat-item-19599"><a href="banh-xiu-pao-1.html">Bánh xíu páo</a></li>
				
				<li class="cat-item cat-item-19599"><a href="goc-bep.html">Góc Bếp</a></li>
				
				<li class="cat-item cat-item-19599"><a href="tin-tuc.html">Tin tức</a></li>
				
			</ul>
		</div>

		Banner Ad Block
		<div class="block block-banner"><a href="#"  style="display: none">
			<img src="assets/block-banner6147.png?1494485291817" alt="Bếp nhà Du"></a>
		</div>
	</div>
</div> -->
		</div>
	</div>
</div>