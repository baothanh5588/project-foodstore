<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Sửa thông tin thành viên</h4>
                            </div>
                            <div class="content">
                                <form action="${pageContext.request.contextPath }/admin/member/edit/${objMember.idTV}" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="form-group">
                                                <label>Username</label>
                                                <input disabled="disabled" type="text" name="usernameTV" class="form-control border-input" placeholder="username" value="${objMember.usernameTV }">
                                            </div>
                                        </div>
                                        <div class="col-md-9">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="text" name="passwordTV" class="form-control border-input" placeholder="password" value="">
                                            </div>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col-md-9">
                                            <div class="form-group">
                                                <label>Fullname</label>
                                                <input type="text" name="fullnameTV" class="form-control border-input" placeholder="Họ và tên" value="${objMember.fullnameTV }">
                                            </div>
                                        </div>
                                        <div class="col-md-9">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" name="emailTV" class="form-control border-input" placeholder="Email" value="${objMember.emailTV }">
                                            </div>
                                        </div>
                                        <div class="col-md-9">
                                            <div class="form-group">
                                                <label>Số điện thoại</label>
                                                <input type="text" name="phoneTV" class="form-control border-input" placeholder="Số điện thoại" value="${objMember.phoneTV }">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <input type="submit" class="btn btn-info btn-fill btn-wd" value="Sửa" />
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            
            
            