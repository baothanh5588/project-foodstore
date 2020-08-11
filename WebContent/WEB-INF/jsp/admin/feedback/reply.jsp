 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@taglib uri= "http://java.sun.com/jsp/jstl/core" prefix= "c"  %>  
 
  <script type="text/javascript">
	    $(document).ready(function(){
	    	$("#frmFeedback").validate({
				rules:{
					"eAdmin":{
						 required:true,
						 email:true	
					},
					
					"pAdmin":{
						 required:true,
						 minlength: 6,
					     maxlength: 15
		               },
					"eNguoiNhan":{
						required:true,
						email:true	
					},
					"subject":{
						required: true,
						minlength: 5,
						maxlength: 50
			         },
			         "message":{
			        	 required: true,
						 minlength: 6
				      },
					
				},
				messages:{
					"eAdmin":{
					    required:"<span style='color:red'> Vui lòng nhập email Admin </span>",	
		                email: "<span style='color:red'> Vui lòng nhập đúng định dạng email : ai_do@example.com </span> "	
					},
					"pAdmin":{
						required: " <span style='color:red' > Vui lòng nhập vào mật khẩu</span> </span>",
						minlength:"<span style='color:red' >  Mật khẩu phải có ít nhất 6 ký tự  </span>",
						maxlength: " <span style='color:red' > Mật khẩu có nhiều nhất 15 ký tự  </span>"
					},	
					"eNguoiNhan":{
						 required:"<span style='color:red'> Vui lòng nhập email Người nhận </span>",	
			             email: "<span style='color:red'> Vui lòng nhập đúng định dạng email : ai_do@example.com </span> "
					},
					"subject":{
						required: " <span style='color:red' > Vui lòng nhập vào tiêu đề </span> </span>",
						minlength:"<span style='color:red' > Tiêu đề phải có ít nhất 5 ký tự  </span>",
						maxlength: " <span style='color:red' >Tiêu đề có nhiều nhất 50 ký tự  </span>"
			        },
			        "message":{
			        	required: " <span style='color:red' > Vui lòng nhập vào nội dung phản hồi</span> </span>",
						minlength:"<span style='color:red' >  Nội dung phải có ít nhất 6 ký tự  </span>"
						
			        },
					
				  }
			  });
	    	
		  });
    
      </script>
    
      
 <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Phản hồi lại khách hàng</h4>
                            </div>
                             <c:if test="${not empty msg}">
                                    <p class="category success"> ${msg} </p>
                                </c:if>
                            <div class="content">
                                <form accept-charset='UTF-8'  id="frmFeedback" action="${pageContext.request.contextPath}/admin/feedback/reply/${objFeedbackFromId.id_LH}"  method="post">
                                    <div class="row">
                                       <span style="color: red">FROM:</span> <br>
                                       <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Email Admin</label>
                                                <input type="text" name="emailNguoiGui" class="form-control border-input" placeholder="Bạn muốn gửi đi từ email nào" value="">
                                            </div>
                                       </div>
                                       <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Password Admin</label>
                                                <input type="password" name="passEmailNguoiGui" class="form-control border-input" placeholder="Nhập password" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tiêu đề phản hồi lại khách hàng</label>
                                                <input type="text" name="tieude" class="form-control border-input" placeholder="Tiêu đề phản hồi" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nội dung phản hồi lại khách hàng</label>
                                                <textarea  name="noidung"  rows="6" class="form-control border-input" placeholder="Nội dung phản hồi"></textarea>
                                            </div>
                                        </div>
                                        <span style="color: red" >TO: </span> <br> <br>
                                         <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Email Người Nhận</label>
                                                <input  type="text" name="emailNguoiNhan" class="form-control border-input" placeholder="Email Người Nhận" value="${objFeedbackFromId.email_LH}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <input type="submit" class="btn btn-info btn-fill btn-wd" value="Gửi Phản Hồi" />
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </div>