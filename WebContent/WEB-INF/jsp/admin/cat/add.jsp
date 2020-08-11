 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 <script type="text/javascript"> 
	    $(document).ready(function(){
	    	$("#add_dm").validate({
				rules:{
					"name_cat":{
						required: true,
						maxlength: 30
					},
					
				},
				messages:{
					"name_cat":{
						required: " <span style='color:red' > Vui lòng nhập vào tên danh mục</span> </span>",
						maxlength: " <span style='color:red' > Tên danh mục có nhiều nhất 30 ký tự  </span>"
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
                                <h4 class="title">Thêm danh mục</h4>
                            </div>
                            
                            <div class="content">
                                <form  id="add_dm" action="${pageContext.request.contextPath}/admin/cat/add"  method="post">
                                    <div class="row">
 		                               <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Danh mục cha</label>
	                                            <select name="id_parent_cat" class="form-control border-input">
	                                            		<c:forEach items="${listParentCat}" var="objParentCat">
	                                        				<option value="${objParentCat.id_cat}">${objParentCat.name_cat}</option>
	                                         			</c:forEach>
	                                          	</select>
                                            </div>
                                        </div>
		                             </div>                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Tên danh mục</label>
                                                <input type="text" name="name_cat" class="form-control border-input" placeholder="Ten danh muc" value="">
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