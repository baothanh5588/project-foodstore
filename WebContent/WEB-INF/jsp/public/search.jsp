<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
		
<!-- main-container -->
<div class="main-container col2-right-layout">
	<div class="main container">
	  <div class="row">
	     <section class="col-main col-sm-12 wow bounceInUp animated">
	
	       <div class="page-title">
			   <h2>Tìm kiếm</h2>
		   </div>
	     <c:if test="${not empty msg}">
              	<p > ${msg} </p>
         </c:if>
	
			
			
			<ul class="products-grid">
			    <c:forEach items="${listSearch}" var="objSearch">
						<li class="item col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<div class="item-inner">
							
								<div class="product-block">
									<div class="product-image"> <a href="${pageContext.request.contextPath}/public/detail_sp/${slugUtils.makeSlug(objSearch.name_sp)}-${objSearch.id_sp}.html">
										<figure class="product-display">
											<img src="${pageContext.request.contextPath}/files/${objSearch.image_link}" class="lazyOwl product-mainpic" style="display: block;" > 
											<img src="${pageContext.request.contextPath}/files/${objSearch.image_link}" class="product-secondpic" width="258px"> 
										</figure>
										</a> 
									</div>
								</div>
								
								<div class="item-info">
									<div class="info-inner">
									
										<div class="item-title"> <a href="${pageContext.request.contextPath}/public/detail_sp/${slugUtils.makeSlug(objSearch.name_sp)}-${objSearch.id_sp}.html" title=""> ${objSearch.name_sp}</a> </div>
										
										<div class="item-content">
											<div class="item-price">
												<div class="price-box">
													<p class="special-price"> <span class="price-label">Giá: </span> 
													     <span class="price"> <fmt:formatNumber type="number" pattern="###,###"  maxIntegerDigits="11" value="${objSearch.price}" />đ</span> 
													 </p>
												</div>
											</div>
											
											<div class="product-meta">
												<%-- <form action="${pageContext.request.contextPath}/" method="post" class="variants" id="product-actions-6582687" enctype="multipart/form-data">
													<div class="product-action"> 
														<input type="hidden" name="variantId" value="10468642" />
														 <a href="javascript:void(0)" onclick="return getInfo(this.id,this.name)"  class="add-cart" name="${objSearch.name_sp}" id="${objSearch.id_sp}" > 
														     <button class="button btn-cart  add_to_cart" title="Cho vào giỏ hàng" >
														     	 <i class="icon-shopping-cart">&nbsp;</i><span> Mua hàng</span>
														     </button>
														 </a> 	
													</div>
												</form> --%>
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
						</c:forEach>
			
			</ul>
			
			       <script type="text/javascript">
					   function getInfo(id,name){
					     // alert("ten sp : "+name+"--id : "+id);
					      $.ajax({
	  						url: '${pageContext.request.contextPath}/xuly',
	  						type: 'POST',
	  						cache: false,
	  						data: {
	  							bname:name,
	  						    bid: id
	  						},
	  						success: function(data){
	  						    $('.mini-cart').html(data); 
	  						    Lobibox.notify('default', {
	  							  size: 'mini',
	  							  rounded: true,
	  							  //delayIndicator: false,
	  							  delay:1000,
	  							  position: 'center top',
	  							  msg: 'Sản phẩm đã cho vào giỏ hàng'
	  							});
	  						},
	  						error: function (){
	  						}
	  					});
					      
					   }
					</script>
		
		</section>
		</div>
	</div>
</div>
<!--End main-container -->


		