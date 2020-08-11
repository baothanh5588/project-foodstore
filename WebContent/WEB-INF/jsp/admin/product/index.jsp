<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <!--content-->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Danh sách sản phẩm</h4>
                                
                      			<c:if test="${not empty msg}">
                                	<p class="category success">${msg}</p>
                                </c:if>
                                
                                <a href="${pageContext.request.contextPath}/admin/product/add" class="addtop"><img src="${defines.URL_ADMIN}/assets/img/add.png" alt="" />Thêm sản phẩm</a>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                
                                    <thead>
                                        <th>ID SP</th>
                                    	<th>Tên SP</th>
                                    	<th>ID Cat in Product</th>
                                    	<th>Price</th>
                                   		<th>Image_Link</th>
                                    	<th>Thông Tin Sp</th>
                                    	<th>View</th>
                                    	<th>Created_SP</th>
                                    	<th>Chức năng</th>
                                    	
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listProduct}" var="objItem">
                                    <c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/product/edit/${objItem.id_sp}"></c:set>
                                    <c:set var="urlDel" value="${pageContext.request.contextPath}/admin/product/del/${objItem.id_sp}"></c:set>
                                    <fmt:formatDate value="${objItem.created_sp}" pattern="HH:mm:ss dd:MM:yyyy" var="fmtDate"/>
                                        <tr>
                                        	<td>${objItem.id_sp}</td>
                                        	<td><a href="${pageContext.request.contextPath}/admin/product/edit/${objItem.id_sp}">${objItem.name_sp}</a></td>
                                        	<td>${objItem.id_cat_in_product}</td>
                                        	<td>${objItem.price}</td>
                                        	<td>${objItem.image_link}</td>
                                        	<td>${objItem.thongtin_sp}</td>
                                        	<td>${objItem.view}</td>
                                        	<td>${fmtDate}</td>
                                        	<td>
                                        		<a href="${urlEdit}"><img src="${defines.URL_ADMIN}/assets/img/edit.gif" alt="" /> Sửa</a> &nbsp;||&nbsp;
                                        		<a href="${urlDel}" onclick="return confirm('Bạn có chắn chắn muốn xóa ! ')" ><img src="${defines.URL_ADMIN}/assets/img/del.gif" alt="" /> Xóa</a>
                                        	</td>
                                        </tr>                                    
                                    </c:forEach>

                                    </tbody>
 
                                </table>

								<div class="text-center">
								    <ul class="pagination">
								    <c:forEach var="i" begin="1" end="${totalPage}">
								    	<li <c:if test="${page==i }">class=	'active'</c:if>>
								    		<a href="${pageContext.request.contextPath}/admin/product/index/?page=${i}" title="">${i}</a>
								    	</li> 
								    </c:forEach>
								    </ul>
								</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
			<!--end content-->