<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript " src="${pageContext.request.contextPath}/templates/valid/js/jquery.validate.min.js"> </script>

<script type="text/javascript">
	    $(document).ready(function(){
	    	$("#customer_login").validate({
				rules:{
					"usernameTV":{
						required: true,
					},
				     "passwordTV":{
						required: true,
				     },
				},
				messages:{
					"usernameTV":{
						required: " <span style='color:red' ><br> Vui lòng nhập vào username</span> </span>",
					},				
					"passwordTV":{
						required: " <span style='color:red' ><br> Vui lòng nhập vào mật khẩu</span> </span>",
					},
					
				}
			});
	    	
		});
 </script>
 
<section class="main-container col1-layout">
	<div class="main container">
		<div class="account-login">
			<div class="page-title">
				<h2>Đăng nhập / tạo tài khoản</h2>
			</div>
			<fieldset class="col2-set">
				<legend>Đăng nhập / tạo tài khoản</legend><br><br>
				<div class="col-1 new-users"><strong>Khách hàng mới</strong>
					<div class="content">
						<p>Bằng cách tạo một tài khoản với cửa hàng của chúng tôi , bạn sẽ có thể thực hiện những quy trình mua hàng nhanh hơn , lưu trữ nhiều địa chỉ gửi hàng , xem và theo dõi đơn đặt hàng của bạn trong tài khoản của bạn và nhiều hơn nữa .</p>
						<div class="buttons-set">
						    <a href="${pageContext.request.contextPath}/public/register"> 
							  <button class="button create-account" type="button"> <span>Tạo tài khoản</span> </button>
							</a>
						</div>
					</div>
				</div>
				<div class="col-2 registered-users"><strong>Đăng nhập</strong>
				         <c:if test="${not empty msg}">
                              <p class="category success"> ${msg} </p>
                          </c:if>
				
					<div class="content">
						<p>Nếu bạn đã có tài khoản , xin vui lòng đăng nhập </p>
						
						<form accept-charset='UTF-8' action='${pageContext.request.contextPath}/public/login' id='customer_login' method='post'>
							<input name='FormType' type='hidden' value='customer_login' />
							<input name='utf8' type='hidden' value='true' />
							
							<ul class="form-list"  >
								<li >
									<label for="email"> UserName <span class="required">*</span></label><br>
									<input type="text" name="usernameTV" id="usernameTV"  class="input-text required-entry" >
								</li>
								<li>
									<label for="pass">Mật khẩu <span class="required">*</span></label><br>
									<input type="password" name="passwordTV"  id="passwordTV" class="input-text required-entry validate-password" >
								</li>
							</ul>
						
							<div class="buttons-set">
								<button  id="send2" name="send" type="submit" class="button login"><span >Đăng nhập</span></button>
								<!-- <a class="forgot forgot-word" href="#recover" onclick="showRecoverPasswordForm();return false;" id="RecoverPassword">Quên mật khẩu?</a>  -->
							    </br> <a href="${pageContext.request.contextPath}/checkout/not-account" style="color:red;"> * Mua hàng khi không có tài khoản * </a>
							</div>
							 
							
						</form>
						
						
						<div id="recover_password" style="display: none;">
							<h3>Đặt lại mật khẩu</h3>                     
							<p id="intro note-reset">Chúng tôi sẽ gửi cho bạn một email để kích hoạt việc đặt lại mật khẩu.</p>
							
							<form accept-charset='UTF-8' action='https://bepnhadu.com/account/recover' id='recover_customer_password' method='post'>
								<input name='FormType' type='hidden' value='recover_customer_password' />
								<input name='utf8' type='hidden' value='true' />
							
							<label for="email">Email<span id="required">*</span></label>
							<input style="height:34px;" type="email" class="input-control" value="" title="email" name="email" id="email" >
							
							<p class="action-btn" style="margin-top: 15px;">
								<input  type="submit" class="button stl_btn_reg" value="Gửi">
								hoặc <a href="#" onclick="hideRecoverPasswordForm();return false;">Hủy</a>
							</p>
							
							</form>     
						</div>
					</div>
				</div>
			</fieldset>
		</div>
		<br>
	</div>
</section>

<script>  
  function showRecoverPasswordForm() {
    document.getElementById('recover_password').style.display = 'block';
    document.getElementById('customer_login').style.display='none';
  }

  function hideRecoverPasswordForm() {
    document.getElementById('recover_password').style.display = 'none';
    document.getElementById('customer_login').style.display = 'block';
  }

  // Allow deep linking to the recover password form
  if (window.location.hash == '#recover') { showRecoverPasswordForm() }

  // reset_success is only true when the reset form is
  
</script>


		