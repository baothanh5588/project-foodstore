<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
 
<script type="text/javascript " src="${pageContext.request.contextPath}/templates/valid/js/jquery.validate.min.js"> </script>
<script type="text/javascript">
	    $(document).ready(function(){
	    	$("#lienhe").validate({
				rules:{
					"fullname_LH":{
						required: true,
						minlength: 6,
						maxlength: 32
					},
					"email_LH":{
						 required:true,
						 email:true						
		               },
					"content":{
				        required: true,
				        maxlength: 500
			         },
				},
				messages:{
					"fullname_LH":{
						required: " <span style='color:red' > Vui lòng nhập vào họ tên</span> </span>",
						minlength:"<span style='color:red' >  Họ tên phải có ít nhất 6 ký tự  </span>",
						maxlength: " <span style='color:red' > Họ tên có nhiều nhất 32 ký tự  </span>"
					},
					"email_LH":{
						 required:"<span style='color:red'> Vui lòng nhập email </span>",	
	                     email: "<span style='color:red'> Vui lòng nhập đúng định dạng email : ai_do@example.com </span> "						
					},	
					"content":{
						required:"<span style='color:red'> Vui lòng nhập lời nhắn </span>",	
						maxlength: " <span style='color:red' > Lời nhắn không quá 500 ký tự  </span>"
			        },
				}
			});
		});
    </script>    
    
<!-- main-container -->
<div class="main-container col2-right-layout">
	<div class="main container">
		<div class="row">
			<section class="col-main col-sm-12 wow bounceInUp animated">
				<div class="page-title">
					<h2>Liên hệ </h2>
					(Bạn có thể phản hồi với chúng tôi qua email)
				</div>
				
				<form accept-charset='UTF-8' action='${pageContext.request.contextPath }/public/lien-he' id='lienhe' method='post'>

					<c:if test="${not empty msg}">
                   		<p class="category success"> ${msg} </p>
                 	</c:if>
				
				
				<div class="static-contain">
					<fieldset class="group-select">
						<ul>
							<li id="billing-new-address-form">
								<fieldset>
									<legend>New Address</legend>
									<input type="hidden" name="billing[address_id]" value="" id="billing:address_id">
									<ul>
										<li>
											<div class="customer-name">
												<div class="input-box name-firstname">
													<label for="billing:firstname"> Họ tên<span class="required">*</span></label>
													<br>
													<input id="name" name="fullname_LH" type="text" value="" title="First Name" class="input-text ">
												</div>
												<div class="input-box name-lastname">
													<label for="billing:lastname"> Email<span class="required">*</span> </label>
													<br>
													<input id="email" name="email_LH" type="email" value="" title="Last Name" class="input-text">
												</div>
												
											</div>
										</li>
										<li class="">
											<label for="comment">Lời nhắn<em class="required">*</em></label>
											<br>
											<div style="float:none" class="">
												<textarea id="message" name="content" title="Comment" class="required-entry input-text" cols="10" rows="7"></textarea>
											</div>
										</li>
									</ul>
								</fieldset>
							</li>
							<p class="require"><em class="required">* </em>Bắt buộc</p>
							<input type="text" name="hideit" id="hideit" value="" style="display:none !important;">
							<div class="buttons-set">
								<button type="submit" title="Submit" class="button submit"> <span> Gửi </span> </button>
							</div>
						</ul>
					</fieldset>
				</div>
				</form>
			</section>
		</div>
	</div>
</div>
<!--End main-container -->