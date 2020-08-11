<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>		
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		
		<section class="main-container col1-layout">
	<div class="main container">
		<div class="col-main">
			<div class="cart">
				<div class="page-title">
					<h2>Giỏ hàng</h2>
				</div>
				               
				<c:if test="${not empty msg}">
               		<p> ${msg} </p>
             	</c:if>
                <c:if test="${not empty msg1}">
               		<p> ${msg1} </p>
               	</c:if>
				
				<div class="table-responsive">
					
					<form action="${pageContext.request.contextPath}/public/cart/update" method="post"  >
					
						<input type="hidden" value="Vwww7itR3zQFe86m" name="form_key">
						<fieldset>
							<table class="data-table cart-table" id="shopping-cart-table">
							
								<thead>
									<tr class="first last">
										<th rowspan="1">&nbsp;</th>
										<th rowspan="1"><span class="nobr">Tên sản phẩm</span></th>
										<th style="width: 100px;" colspan="1" class="a-center"><span class="nobr">Giá</span></th>
										<th class="a-center" rowspan="1">Số lượng</th>
										
										<th ><input type="submit" value="Cập nhật giỏ hàng"></th>
										
										<th style="width: 100px;" colspan="1" class="a-center">Thành tiền</th>
										<th class="a-center" rowspan="1">&nbsp;</th>
									</tr>
								</thead>
								<tfoot>
									<tr class="first last">
										<td class="a-right last" colspan="50">
										    <a href="${pageContext.request.contextPath}/public/index"  class="button btn-continue"><span><span>Tiếp tục mua hàng</span></span></a>
<%-- 										    <a href="${pageContext.request.contextPath}/public/cart/update" id="clickChange" class="button btn-update"> <span><span>Cập nhật giỏ hàng</span></span> </a>
 --%>										    
										    <a href="${pageContext.request.contextPath}/public/cart/deleteAll" > <button class="button btn-empty" title="Clear Cart"  type="button"><span><span>Xóa giỏ hàng</span></span></button> </a>
									   </td>
									</tr>
								</tfoot>
								<tbody>
								    <c:set var="tongtien" value="0"></c:set>
									<c:forEach items="${listCart}" var="objCart">
									     <c:set var="thanhtien" value="${(objCart.soluong) * (objCart.product.price)}"></c:set>
									     <c:set var="tongtien" value="${tongtien + thanhtien}"> </c:set>
									
									<tr class="first odd">
										<td class="image"> <a class="product-image" title="" href="${pageContext.request.contextPath}/public/detail_sp/${slugUtils.makeSlug(objCart.product.name_sp)}-${objCart.product.id_sp}.html"> <img width="75" height="75" alt="" src="${pageContext.request.contextPath }/files/${objCart.product.image_link}"></a></td>
										
										<td><h2 class="product-name"> <a href="${pageContext.request.contextPath}/public/detail_sp/${slugUtils.makeSlug(objCart.product.name_sp)}-${objCart.product.id_sp}.html"> ${objCart.product.name_sp} </a></h2></td>
										
										<td class="a-right"><span class="cart-price"> <span class="price"> <fmt:formatNumber type="number" pattern="###,###"  maxIntegerDigits="11" value="${objCart.product.price}" /> ₫</span> </span></td>
										
										<td class="a-center movewishlist"> <input class="input-text qty quanti" type="text" name="UpdateSL" id="${objCart.product.id_sp}" value="${objCart.soluong}"></td>
										
										<td></td>
										
										<td class="a-right movewishlist"><span class="cart-price"> <span class="price"> <fmt:formatNumber type="number" pattern="###,###"  maxIntegerDigits="11" value="${thanhtien}" />₫</span> </span></td>
										
										<td class="a-center last">
										    <a  href="${pageContext.request.contextPath}/public/cart/delete/${objCart.product.id_sp}"   class="button remove-item" title="Remove item"></a>
										</td>
									</tr>
							        </c:forEach>
							        
								</tbody>
							</table>
						</fieldset>
					</form>
					
				</div>

				<!-- BEGIN CART COLLATERALS -->
				<div class="cart-collaterals row">
					<div class="totals col-sm-4" style="float:right">
						<h3><span>Tổng tiền</span></h3>
						<div class="inner">
							<table class="table shopping-cart-table-total" id="shopping-cart-totals-table">
								<colgroup>
									<col>
									<col width="1">
								</colgroup>
								<tfoot>
									<tr>
										<td colspan="1" class="a-left" style=""><strong>Tổng</strong></td>
										<td class="a-right" style=""><strong><span class="price"> <fmt:formatNumber type="number" pattern="###,###"  maxIntegerDigits="11" value="${tongtien}" /> ₫</span></strong></td>
									</tr>
								</tfoot>
							</table>
							<ul class="checkout">
								<li>
								   <a href="#" style="text-decoration: none; color: white;">
								      <button  name="checkout"  class="button btn-proceed-checkout" title="Proceed to Checkout" type="button"> <span>Xác nhận và thanh toán</span> </button>  
								   </a>   
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
</section>
