 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
 <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Quản lý thành viên</h4>
                                
                                
                                 <c:if test="${not empty msg}">
                                    <p class="category success"> ${msg} </p>
                                </c:if>
                                
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th>ID</th>
                                    	<th>UsernameTV</th>
                                    	<th>FullNameTV</th>
                                    	<th>EmailTV</th>
                                    	<th>PasswordTV</th>
                                    	<th>PhoneTV</th>
                                    	<th>Ngày đăng ký</th>
                                    	<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                       <c:forEach items="${listMember}" var="objMember">
                                           <c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/member/edit/${objMember.idTV}"></c:set>
                                           <c:set var="urlDel" value="${pageContext.request.contextPath}/admin/member/del/${objMember.idTV}"></c:set>
                                           <fmt:formatDate value="${objMember.createdTV}" pattern="HH:mm:ss dd/MM/yyyy" var="fmtDate"/>
                                        <tr>
                                        	<td>${objMember.idTV }</td>
                                        	<td><a href="${urlEdit}"> ${objMember.usernameTV} </a></td>
                                        	<td>${objMember.fullnameTV }</td>
                                            <td>${objMember.emailTV}</td>
                                            <td>${objMember.passwordTV}</td>
                                        	<td>${objMember.phoneTV}</td>
                                            <td>${fmtDate}</td>
                                        	<td>
                                        		<a href="${urlEdit}"><img src="${defines.URL_ADMIN}/assets/img/edit.gif" alt="" /> Sửa</a> &nbsp;||&nbsp;
                                        		<a href="${urlDel}"  onclick="return confirm('Bạn có chắc muốn xóa ! ')"><img src="${defines.URL_ADMIN}/assets/img/del.gif" alt="" /> Xóa</a>
                                        	</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
 
                                </table>
								
								
								<div class="text-center">
								    <ul class="pagination">
								    <c:forEach var="i" begin="1" end="${totalPage}">
								    	<li <c:if test="${page==i }">class=	'active'</c:if>>
								    		<a href="${pageContext.request.contextPath}/admin/member/index/?page=${i}" title="">${i}</a>
								    	</li> 
								    </c:forEach>
								    </ul>
								</div>
								
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            
            