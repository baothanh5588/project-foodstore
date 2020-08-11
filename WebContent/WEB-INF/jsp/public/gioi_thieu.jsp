<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
<div class="container" style="margin-bottom:30px;margin-top: 40px;">
	<div class="span12 post">
		<h1 style="margin-top:0px;" align="center">Giới thiệu</h1>
		
		<c:forEach items="${listIntroduce}" var="objIntroduce">
			<div class="rte">
				   <h3> ${objIntroduce.name_intro}</h3>
			</div>
			
			<div class="content">
				<p >
				  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				   ${objIntroduce.detail_intro} &nbsp;&nbsp;
				</p>
			</div>
		</c:forEach>
		
		
	</div>
</div>


