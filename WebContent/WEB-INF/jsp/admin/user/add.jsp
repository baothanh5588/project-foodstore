 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 
<!--  <script type="text/javascript">
	    $(document).ready(function(){
	    	$("#add_user").validate({
				rules:{
					"username":{
						required: true,
						maxlength: 30,
						minlength: 6
					},
					"password":{
						required: true,
						maxlength: 30,
						minlength: 6
					},
					"fullname":{
						required: true,
						maxlength: 30,
						minlength: 6
					}
				},
				messages:{
					"username":{
						required: " <span style='color:red' > Vui lòng nhập vào username</span> </span>",
						maxlength: " <span style='color:red' > username nhiều nhất 30 ký tự  </span>",
						minlength: " <span style='color:red' > username ít nhất 6 ký tự  </span>"					
					},
					"password":{
						required: " <span style='color:red' > Vui lòng nhập vào password</span> </span>",
						maxlength: " <span style='color:red' > password nhiều nhất 30 ký tự  </span>",
						minlength: " <span style='color:red' > password ít nhất 6 ký tự  </span>"					
					},
					"fullname":{
						required: " <span style='color:red' > Vui lòng nhập vào fullname</span> </span>",
						maxlength: " <span style='color:red' > fullname nhiều nhất 30 ký tự  </span>",
						minlength: " <span style='color:red' > fullname ít nhất 6 ký tự  </span>"					
					},
				}
			});
	    	
		});
    
    </script> -->
 
 <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Thêm User</h4>
                            </div>
 	                           <div class="content">
                                <form  id="add_user" action="${pageContext.request.contextPath}/admin/user/add"  method="post">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>UserName</label>
                                                <input value="" type="text" name="username" class="form-control border-input" placeholder="" >
	                                                 <form:errors path="objUser.username" cssStyle="color:red"></form:errors>
                                            </div>
                                        </div>
                                    </div>                                 
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input value="" type="text" name="password" class="form-control border-input" placeholder="" >
	                                                 <form:errors path="objUser.password" cssStyle="color:red"></form:errors>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>FullName</label>
                                                <input value="" type="text" name="fullname" class="form-control border-input" placeholder="" >
	                                                 <form:errors path="objUser.fullname" cssStyle="color:red"></form:errors>
                                            </div>
                                        </div>
                                    </div>
                                                                        
                                    <div class="col-md-12">
										 <label>Quyền truy cập</label>
											<div class="form-group">
												<select name="id_role">
													<c:forEach items="${listRole}" var="objRole">
														<option value="${objRole.id_role}"> ${objRole.name_role}</option>
													</c:forEach>
												</select>
											</div>
									</div>
									
									<div class="col-md-6">
										       <p> Kích Hoạt Tài Khoản (*) :</p>
											   <div class="form-group">
												 <input name="active" type="radio" value="1" checked="checked"/> Active
												 <input name="active" type="radio" value="0" /> Non-Active
											   </div>
											   
									</div>
										    
                                    <div class="text-center">
                                        <input type="submit" class="btn btn-info btn-fill btn-wd" value="Thực hiện" />
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </div>