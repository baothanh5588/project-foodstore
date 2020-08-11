<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c"  %>  

<script type="text/javascript " src="${pageContext.request.contextPath}/templates/valid/js/jquery.validate.min.js"> </script>

<script type="text/javascript">
	    $(document).ready(function(){
	    	$("#customer_register").validate({
				rules:{
					"fullnameTV":{
						required: true,
						minlength: 6,
						maxlength: 32
					},
					
					"usernameTV":{
						required: true,
						maxlength: 32
					},
					
					"emailTV":{
						 required:true,
						  email:true						
		               },
		               
		            "phoneTV":{
							required: true,
							digits: true,
							minlength: 10,
							maxlength: 15
				     },
				     
				     "passwordTV":{
							required: true,
							minlength: 6,
							maxlength: 15
				     },
				
				},
				messages:{
					"fullnameTV":{
						required: " <span style='color:red' > Vui lòng nhập vào họ tên</span> </span>",
						minlength:"<span style='color:red' >  Họ tên phải có ít nhất 6 ký tự  </span>",
						maxlength: " <span style='color:red' > Họ tên có nhiều nhất 32 ký tự  </span>"
					},
					"usernameTV":{
						required: " <span style='color:red' > Vui lòng nhập vào username</span> </span>",
						maxlength: " <span style='color:red' > Username có nhiều nhất 32 ký tự  </span>"
					},
					"emailTV":{
						 required:"<span style='color:red'> Vui lòng nhập email </span>",	
	                     email: "<span style='color:red'> Vui lòng nhập đúng định dạng email : ai_do@example.com </span> "						
					},	
					"phoneTV":{
						required: " <span style='color:red' > Vui lòng nhập vào số điện thoại</span> </span>",
						digits: " <span style='color:red' > Số điện thoại phải là số nguyên dương</span> </span>",
						minlength:"<span style='color:red' >  Số điện thoại phải có ít nhất 10 ký tự  </span>",
						maxlength: " <span style='color:red' > Số điện thoại có nhiều nhất 15 ký tự  </span>"
					},
					
					"passwordTV":{
						required: " <span style='color:red' > Vui lòng nhập vào mật khẩu</span> </span>",
						minlength:"<span style='color:red' >  Mật khẩu phải có ít nhất 6 ký tự  </span>",
						maxlength: " <span style='color:red' > Mật khẩu có nhiều nhất 15 ký tự  </span>"
					},
					
				}
			});
	    	
		});
    
    </script>

 
		
<div class="container" style="margin-bottom:40px;">
	 <div class="title_cart">
		 <h2 style="margin-top:30px; margin-bottom:15px; text-align:center;">Đăng ký tài khoản</h2>
	  </div>
	 <div class="form_regd" style="    margin: 0px 15%;background-color: #f7f7f7;padding: 10px 20px;">
	             
	
		<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/public/register' id='customer_register' method='post'>
		
			<input name='FormType' type='hidden' value='customer_register' />
			<input name='utf8' type='hidden' value='true' /> 
			<h2 align="center">Thông tin cá nhân</h2>
			
			<c:if test="${not empty msg}">
                  <p class="category success"> ${msg} </p>
            </c:if>
			
			<div class="form-group">
				<label for="last_name">Họ và tên<span id="required">*</span></label>
				<input style="border-radius:0px;" type="text" name="fullnameTV" id="fullnameTV" class="form-control" placeholder=" Họ và tên">
			</div>
			
			<div class="form-group">
				<label for="last_name">Tên đăng nhập<span id="required">*</span></label>
				<input style="border-radius:0px;" type="text" name="usernameTV" id="usernameTV" class="form-control" placeholder="Tên đăng nhập">
			</div>
			
			<div class="form-group">
				<label for="email">Email<span id="required">*</span></label>
				<input style="border-radius:0px;" type="text" class="form-control" name="emailTV" id="emailTV" placeholder="Email">
			</div>
			
			<div class="form-group">
				<label for="sodienthoai">Số điện thoại<span id="required">*</span></label>
				<input style="border-radius:0px;" type="text" class="form-control" name="phoneTV" id="phoneTV" placeholder="Số điện thoại">
			</div>
			
			<div class="form-group">
				<label for="customer_password">Password*</label>
				<input style="border-radius:0px;" type="password" class="form-control" name="passwordTV" id="passwordTV" placeholder="Password">
			</div>
			<div class="form-group">
				<button  style=" border-radius:0px; border:none; background:#000; color:#fff;" type="submit" class="btn btn-default button-red">Đăng ký</button>
			</div>

		</form>
		
	</div>
</div>



