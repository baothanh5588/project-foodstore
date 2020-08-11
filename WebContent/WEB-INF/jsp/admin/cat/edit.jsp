<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Sửa thông tin danh mục</h4>
                            </div>
                            <div class="content">
                                <form  id="add_dm" action="${pageContext.request.contextPath}/admin/cat/edit/${objCatfromId.id_cat}"  method="post">

                                    <div class="row">
 		                               <div class="col-md-12">
                                            <div class="form-group">
                                            
	                                            <div class="col-md-6">
		                                            <div class="form-group">
		                                                <label>ID_ParentCat</label>
		                                                <input type="text" class="form-control border-input" disabled value="${objCatfromId.id_parent_cat }">
		                                            </div>
	                                        	</div>
	                                        	
 	                                       		<div class="col-md-6">
		                                            <div class="form-group">
		                                            
		                                            	<label>Danh mục cha ban đầu</label>
			                                        	<c:set var="id_parent_cat" value="${objCatfromId.id_parent_cat }"></c:set>
			                                        	<c:choose>
			                                        		<c:when test="${id_parent_cat == 1}">
		                                                		<input type="text" class="form-control border-input" disabled value="Product">
			                                        		</c:when>
			                                        		<c:otherwise>
			                                        			<input type="text" class="form-control border-input" disabled value="Blog">
			                                        		</c:otherwise>
			                                        	</c:choose>
	                                        			
		                                            </div>
	                                        	</div>
                                            </div>
                                        </div>
		                             </div>                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Sửa tên danh mục</label>
                                                <input type="text" name="name_cat" class="form-control border-input" placeholder="Ten danh muc" value="${objCatfromId.name_cat }">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Sửa danh mục cha</label>
	                                            <select name="id_parent_cat" class="form-control border-input">
	                                            		<c:forEach items="${listParentCat}" var="objParentCat">
	                                        				<option value="${objParentCat.id_cat}">${objParentCat.name_cat}</option>
	                                         			</c:forEach>
	                                          	</select>                                            
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