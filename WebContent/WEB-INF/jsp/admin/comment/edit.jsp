 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 <script type="text/javascript">
	    $(document).ready(function(){
	    	$("#edit_intro").validate({
				rules:{
					"name_intro":{
						required: true,
						maxlength: 50
					},
					
					"detail_intro":{
						 required:true,
		             },
		          
				},
				messages:{
					"name_intro":{
						required: " <span style='color:red' > Vui lòng nhập vào tên bài viết</span> </span>",
						maxlength: " <span style='color:red' > Tên bài viết có nhiều nhất 50 ký tự  </span>"
					},
					
					"detail_intro":{
						 required:"<span style='color:red'> Vui lòng nhập chi tiết bài viết </span>",	
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
                                <h4 class="title">Sửa bài viết</h4>
                            </div>
                            <div class="content">
                                <form id="edit_intro" action="${pageContext.request.contextPath}/admin/introduce/edit/${objIntro.id_intro}"  method="post">
                                
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Tiều đề bài viết</label>
                                                <input type="text" name="name_intro" class="form-control border-input" placeholder="Tiều đề" value="${objIntro.name_intro }">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Chi tiết bài viết</label>
                                                <textarea name="detail_intro" rows="6" class="form-control border-input" placeholder="Nhập chi tiết bài viết......"> ${objIntro.detail_intro}</textarea>
                                            </div>
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