<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c"  %>    
<div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Khách hàng Phản hồi</h4>
                                <c:if test="${not empty msg}">
                                    <p class="category success"> ${msg} </p>
                                </c:if>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th>ID</th>
                                    	<th>Tên Người Gửi </th>
                                    	<th>Email </th>
                                    	<th>Lời Nhắn </th>
                                    	<th>Chức năng</th>
                                    </thead>
                                    <tbody>
                                      <c:forEach items="${listFeedback }" var="objItem">
                                      <c:set var="urlFeedBack" value="${pageContext.request.contextPath }/admin/feedback/reply/${objItem.id_LH}"></c:set>
                                       <c:set var="urlDel" value="${pageContext.request.contextPath }/admin/feedback/del/${objItem.id_LH }"></c:set>
                                        <tr>
                                        	<td>${objItem.id_LH }</td>
                                        	<td><a href="${urlFeedBack}">${objItem.fullname_LH}</a></td>
                                        	<td>${objItem.email_LH }</td>
                                        	<td>${objItem.content }</td>
                                        	<td>
                                        		<a href="${urlFeedBack}"><img src="${defines.URL_ADMIN}/assets/img/edit.gif" alt="" />Reply</a> &nbsp;||&nbsp;
                                        		<a href="${urlDel}"   onclick="return confirm('Bạn có thực sự muốn xóa ! ')" ><img src="${defines.URL_ADMIN}/assets/img/del.gif" alt="" /> Xóa</a>
                                        	</td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
								<div class="text-center">
								    <ul class="pagination">
								    <c:forEach var="i" begin="1" end="${totalPage}">
								    	<li <c:if test="${page==i }">class=	'active'</c:if>>
								    		<a href="${pageContext.request.contextPath}/admin/feedback/index/?page=${i}" title="">${i}</a>
								    	</li> 
								    </c:forEach>
								    </ul>
								</div>

                            </div>
                        </div>
                    </div>


                </div>
            </div>
            
            