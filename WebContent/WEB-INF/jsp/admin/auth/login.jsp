 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

 <script type="text/javascript">
	    $(document).ready(function(){
	    	$("#frmAddUser").validate({
				rules:{
					"username":{
						 required:true,
					     maxlength: 40
					},
					
					"password":{
						 required:true,
						 minlength: 6,
					     maxlength: 15
		               },
					
				},
				messages:{
					"username":{
						required: " <span style='color:red' > Vui lòng nhập vào username </span> </span>",
						maxlength: " <span style='color:red' > Username có nhiều nhất 40 ký tự  </span>"
					},
					"password":{
						required: " <span style='color:red' > Vui lòng nhập vào password </span> </span>",
						minlength:"<span style='color:red' >  Password phải có ít nhất 6 ký tự  </span>",
						maxlength: " <span style='color:red' > Password có nhiều nhất 15 ký tự  </span>"
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
                                <h4 class="title">Đăng nhập</h4>
                            </div>
                            <div class="content">
                                <form id="frmAddUser"  action="${pageContext.request.contextPath}/haha"  method="post">
                                    <div class="row">
                                       
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Username</label>
                                                <input value="" type="text" name="username" class="form-control border-input" placeholder="" >
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>PassWord</label>
                                                <input value="" type="password" name="password" class="form-control border-input" placeholder="" >
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="text-center">
                                        <input type="submit" class="btn btn-info btn-fill btn-wd" value="Login" />
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </div>