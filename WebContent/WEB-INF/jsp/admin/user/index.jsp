<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!--content-->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Danh sách user</h4>
                                
                      			<c:if test="${not empty msg}">
                                	<p class="category success">${msg}</p>
                                </c:if>
                                
                                <c:if test="${sessionObjUser.id_role == 1}">
                                	<a href="${pageContext.request.contextPath}/admin/user/add" class="addtop"><img src="${defines.URL_ADMIN}/assets/img/add.png" alt="" />Thêm user</a>
                                </c:if>
                                
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                
                                    <thead>
                                        <th>ID_User</th>
                                    	<th>UserName</th>
                                    	<th>Password</th>
                                    	<th>FullName</th>
                                   		<th>Trạng thái</th>
                                   		<th>ID_Role</th>
                                    	<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listUser}" var="objItem">
                                    <c:set var="urlEdit" value="${pageContext.request.contextPath}/admin/user/edit/${objItem.id_user }"></c:set>
                                    <c:set var="urlDel" value="${pageContext.request.contextPath}/admin/user/del/${objItem.id_user }"></c:set>
                                        <tr>
                                        	<td>${objItem.id_user}</td>
                                        	<td><a href="${pageContext.request.contextPath}/admin/user/edit/${objItem.id_user }">${objItem.username}</a></td>
                                        	<td>${objItem.password}</td>
                                        	<td>${objItem.fullname}</td>
                                        	
                                        	<td class="${objItem.id_user}">
												<c:choose>
													<c:when test="${objItem.active == 1}">
														<a class="turnOn" href="javascript:void(0)" onclick="return turnOn(id)" id="${objItem.id_user }">
															<img alt="ok" src="${defines.URL_ADMIN}/assets/img/ok.png">
														</a>
													</c:when>												
													<c:otherwise>
														<a class="turnOff" href="javascript:void(0)" onclick="return turnOff(id)" id="${objItem.id_user }">
															<img alt="cancel" src="${defines.URL_ADMIN}/assets/img/cancel.png">
														</a>													
													</c:otherwise>												
												</c:choose>
											</td>
                                        	
                                        	<td>${objItem.id_role}</td>
                                        	
                                        	<c:choose>
                                        		<c:when test="${sessionObjUser.id_role == 1}">
		                                        	<td>
		                                        		<a href="${urlEdit}"><img src="${defines.URL_ADMIN}/assets/img/edit.gif" alt="" /> Sửa</a> &nbsp;||&nbsp;
		                                        		<a href="${urlDel}" onclick="return confirm('Bạn có chắn chắn muốn xóa ! ')" ><img src="${defines.URL_ADMIN}/assets/img/del.gif" alt="" /> Xóa</a>
		                                        	</td>
                                        		</c:when>
                                        		<c:otherwise>
                                        		    <c:if test="${sessionObjUser.id_user == objItem.id_user}">
                                        				<td>
                                        					<a href="${urlEdit}" ><img src="${defines.URL_ADMIN}/assets/img/edit.gif" alt="" /> Sửa</a>
                                        				</td>
                                        			</c:if>
                                        		</c:otherwise>
                                        	</c:choose>
                                        </tr>                                    
                                    </c:forEach>

                                    </tbody>
 
                                </table>
                                
                                <script type="text/javascript">
                                	function turnOn(iduser) {
										$.ajax({
											url: '${pageContext.request.contextPath}/admin/user/xu-ly',
											type: 'POST',
											cache: false,
											data:{
												bidUser: iduser,
												bstatus: 0,
											},
											success: function(data){
												$('.'+iduser).html(data);
											},
											error: function () {
												
											}
										});
									}
                                	function turnOff(iduser) {
										$.ajax({
											url: '${pageContext.request.contextPath}/admin/user/xu-ly',
											type: 'POST',
											cache: false,
											data:{
												bidUser: iduser,
												bstatus: 1,
											},
											success: function(data){
												$('.'+iduser).html(data);
											},
											error: function () {
												
											}
										});
									}
                                </script>

								<div class="text-center">
								    <ul class="pagination">
								    <c:forEach var="i" begin="1" end="${totalPage}">
								    	<li <c:if test="${page==i }">class=	'active'</c:if>>
								    		<a href="${pageContext.request.contextPath}/admin/user/index/?page=${i}" title="">${i}</a>
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