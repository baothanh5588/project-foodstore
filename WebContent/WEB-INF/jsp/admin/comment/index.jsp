<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="header">
					<h4 class="title">Quản lý bình luận</h4>

					<c:if test="${not empty msg}">
						<p class="category success">${msg}</p>
					</c:if>

				</div>
				<div class="content table-responsive table-full-width">
					<table class="table table-striped">
						<thead>
							<th>ID</th>
							<th>Name</th>
							<th>Binh luận</th>
							<th>Time</th>
							<th>Duyệt</th>
							<th>Xóa</th>
						</thead>
						<tbody>
							<c:forEach items="${listComment }" var="objCmt">
								<c:set var="urlDel" value="${pageContext.request.contextPath}/admin/comment/del/${objCmt.id_cm}"></c:set>
								<fmt:formatDate value="${objCmt.time_cm}" pattern="HH:mm:ss dd/MM/yyyy" var="fmtDate" />
								<tr>
									<td>${objCmt.id_cm }</td>
									<td>${objCmt.name_cm }</td>
									<td>${objCmt.message_cm}</td>
									<td>${fmtDate}</td>
								<!-- javascript:void(0) : vô hiệu hóa thẻ a vì  khi ta kích vào thẻ a sẻ làm việc, thì nó sẻ load lại trang -->
									<td class="${objCmt.id_cm}">
										<c:choose>
											<c:when test="${objCmt.check_cm == 1 }">
												<a class="turnOn" href="javascript:void(0)" onclick="return turnOn(id)" id="${objCmt.id_cm }" > <!-- 2 id là 1 (*) -->
													<img alt="ok" src="${defines.URL_ADMIN}/assets/img/ok.png">
												</a> 
											</c:when>
											<c:otherwise>
												<a class="turnOff" href="javascript:void(0)" onclick="return turnOff(id)" id="${objCmt.id_cm }"> 
													<img alt="cancel" src="${defines.URL_ADMIN}/assets/img/cancel.png">
												</a>
											</c:otherwise>
										</c:choose></td>
									<td><a href="${urlDel}" onclick="return confirm('Bạn có chắn chắn muốn xóa ! ') "><img src="${defines.URL_ADMIN}/assets/img/del.gif" alt="" /> Xóa</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- ở trang jsp này, vẫn hiển thị dc thông tin cmt, nhưng ta phải load lại trang => muốn k load lại trang=> dùng kĩ thuật ajax -->
					<script type="text/javascript">
						function turnOn(idCmt) { //ban đau là bật= > khi click thì chuyen sang tắt //idCmt là id của (*)
							//kĩ thuật ajax: gửi dử liệu đi, truyền ngầm sang 1 trang nào đó (commentcontroller.java) để xử lí sau đó trả dử liệu về chính trang này
							$.ajax({
										url : '${pageContext.request.contextPath}/admin/comment/xu-ly', //truyền tới servlet nào đó để xử lí
										type : 'POST', // get/post. Nếu chọn get thì sang doGet, chọn post sang doPost -->
										cache : false, //có lưu lại dử liệu trên browser k 
										data : { //Dữ liệu gửi đi
											bidCmt : idCmt,
											bstatus : 0,
										},
										success : function(data) { // Xử lý thành công
											$('.' + idCmt).html(data); // data chính là data lúc gửi đi sang trang servlet(controller) xử lí và gửi về lại class="${objCmt.id_cm}"
										},
										error : function() {// Xử lý nếu có lỗi
										}
									});
						}
						function turnOff(idCmt) { //ban đau là tat= > khi click thì chuyen sang bat
							$.ajax({
										url : '${pageContext.request.contextPath}/admin/comment/xu-ly', 
										type : 'POST',
										cache : false,
										data : {
											bidCmt : idCmt,
											bstatus : 1,
										},
										success : function(data) {

											$('.' + idCmt).html(data);
										},
										error : function() {
										}
									});
						}
					</script>

					<div class="text-center">
						<ul class="pagination">
							<c:forEach var="i" begin="1" end="${totalPage}">
								<li <c:if test="${page==i }">class=	'active'</c:if>><a
									href="${pageContext.request.contextPath}/admin/cat/index/?page=${i}"
									title="">${i}</a></li>
							</c:forEach>
						</ul>
					</div>

				</div>
			</div>
		</div>


	</div>
</div>

