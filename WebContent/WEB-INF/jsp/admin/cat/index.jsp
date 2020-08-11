<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!--content-->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Danh sách danh mục</h4>
                                
                      			<c:if test="${not empty msg}">
                                	<p class="category success">${msg}</p>
                                </c:if>
                                
                                <a href="${pageContext.request.contextPath}/admin/cat/add" class="addtop"><img src="${defines.URL_ADMIN}/assets/img/add.png" alt="" />Thêm danh mục</a>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                
                                    <thead>
                                        <th>ID_Cat</th>
                                    	<th>Danh mục sản phẩm</th>
                                    	<th>ID_ParentCat</th>
                                    	<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listCat}" var="objItem">
                                        <tr>
                                        	<td>${objItem.id_cat}</td>
                                        	<td><a href="${pageContext.request.contextPath}/admin/cat/edit/${objItem.id_cat}">${objItem.name_cat }</a></td>
                                        	<td>${objItem.id_parent_cat}</td>
                                        	
                                        	<c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/cat/edit/${objItem.id_cat }"></c:set>
                                        	<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/cat/del/${objItem.id_cat }"></c:set>
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
								    		<a href="${pageContext.request.contextPath}/admin/cat/index/?page=${i}" >${i}</a>
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