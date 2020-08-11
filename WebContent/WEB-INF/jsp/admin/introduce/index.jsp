 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--content-->
<div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title"> Giới Thiệu </h4>
                                
                                <c:if test="${not empty msg}">
                                    <p class="category success"> ${msg} </p>
                                </c:if>
                                
                                <a href="${pageContext.request.contextPath}/admin/introduce/add" class="addtop"><img src="${defines.URL_ADMIN}/assets/img/add.png" alt="" /> Thêm Intro</a>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th>ID</th>
                                    	<th>Tiêu đề bài viết</th>
                                    	<th>Chi tiết bài viết</th>
                                    	<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                       <c:forEach items="${listIntroduce }" var="objIntro">
                                       
                                            <c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/introduce/edit/${objIntro.id_intro}"></c:set>
                                            <c:set var="urlDel" value="${pageContext.request.contextPath}/admin/introduce/del/${objIntro.id_intro}"></c:set>
                                        
                                            <tr>
                                        	   <td>${objIntro.id_intro }</td>
                                        	   <td><a href="${urlEdit }">${objIntro.name_intro }</a></td>
                                        	   <td> ${objIntro.detail_intro } </td>
                                        	   <td>
                                        		   <a href="${urlEdit }"><img src="${defines.URL_ADMIN}/assets/img/edit.gif" alt="" /> Sửa</a> &nbsp;||&nbsp;
                                        		   <a href="${urlDel }"  onclick="return confirm('Bạn có chắn chắn muốn xóa ! ')" ><img src="${defines.URL_ADMIN}/assets/img/del.gif" alt="" /> Xóa</a>
                                        	   </td>
                                            </tr>
                                            
                                       </c:forEach>
                                    </tbody>
                                </table>
								<div class="text-center">
								    <ul class="pagination">
								    <c:forEach var="i" begin="1" end="${totalPage}">
								    	<li <c:if test="${page==i }">class=	'active'</c:if>>
								    		<a href="${pageContext.request.contextPath}/admin/cat/index/?page=${i}" title="">${i}</a>
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