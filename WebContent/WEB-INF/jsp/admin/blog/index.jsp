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
                                <h4 class="title">Danh sách blog</h4>
                                
                      			<c:if test="${not empty msg}">
                                	<p class="category success">${msg}</p>
                                </c:if>
                                
                                <a href="${pageContext.request.contextPath}/admin/blog/add" class="addtop"><img src="${defines.URL_ADMIN}/assets/img/add.png" alt="" />Thêm blog</a>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                
                                    <thead>
                                        <th>ID Blog</th>
                                    	<th>Tên Blog</th>
                                    	<th>Mô tả Blog</th>
                                    	<th>Chi tiết Blog</th>
                                   		<th>ID_Cat_In_Blog</th>
                                    	<th>Picture</th>
                                    	<th>Created_Blog</th>
                                    	<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listBlog}" var="objItem">
                                    <c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/blog/edit/${objItem.id_blog}"></c:set>
                                    <c:set var="urlDel" value="${pageContext.request.contextPath}/admin/blog/del/${objItem.id_blog}"></c:set>
                                    <fmt:formatDate value="${objItem.created_blog}" pattern="HH:mm:ss dd:MM:yyyy" var="fmtDate"/>
                                        <tr>
                                        	<td>${objItem.id_blog}</td>
                                        	<td><a href="${pageContext.request.contextPath}/admin/blog/edit/${objItem.id_blog}">${objItem.name_blog}</a></td>
                                        	<td>${objItem.mota_blog}</td>
                                        	<td>${objItem.chitiet_blog}</td>
                                        	<td>${objItem.id_cat_in_blog}</td>
                                        	<td>${objItem.picture}</td>
                                        	<td>${fmtDate}</td>
                                        	<td>
                                        		<a href="${urlEdit}"><img src="${defines.URL_ADMIN}/assets/img/edit.gif" alt="" /> Sửa</a> &nbsp;||&nbsp;
                                        		<a href="${urlDel}" onclick="return confirm('Bạn có chắn chắn muốn xóa ! ')"><img src="${defines.URL_ADMIN}/assets/img/del.gif" alt="" /> Xóa</a>
                                        	</td>
                                        </tr>                                    
                                    </c:forEach>

                                    </tbody>
 
                                </table>

								<div class="text-center">
								    <ul class="pagination">
								    <c:forEach var="i" begin="1" end="${totalPage}">
								    	<li <c:if test="${page==i }">class=	'active'</c:if>>
								    		<a href="${pageContext.request.contextPath}/admin/blog/index/?page=${i}" title="">${i}</a>
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