<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container register" style="padding:100px;">
            <div class="row">
                <div class="col-md-12">
                
                    <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">학생 로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">강사 로그인</a>
                        </li>
                    </ul>
                    
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active text-align form-new" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <!-- <h3 class="register-heading">학생 로그인</h3>  -->
                            <div class="row register-form">
                                <div class="col-md-12" style="padding-top:20px;">
                                    <form method="post" action="loginProcess" autocomplete="off">
                                        <div class="form-group">
                                            <input type="text" name="ms_id" class="form-control" placeholder="학생아이디를 입력하세요." value="" required=""/>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="ms_pwd" class="form-control" placeholder="비밀번호를 입력하세요." value="" required=""/>
                                        </div>
                                        
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">로그인</button>
                                        </div>
                                        
                                        <div class="form-group text-center">
                                        	<a href="findid_student">학생 아이디 찾기</a> / 
                                        	<a href="findpw_student">학생 비밀번호 찾기</a>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <div class="tab-pane fade show text-align form-new" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <!--  <h3  class="register-heading">강사 로그인</h3>  -->
                            <div class="row register-form">
                                <div class="col-md-12" style="padding-top:20px;">
                                    <form method="post" action="teacher_loginProcess" autocomplete="off">
                                        <div class="form-group">
                                            <input type="text" name="mt_id" class="form-control" placeholder="강사아이디를 입력하세요." value="" required="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="mt_pwd" class="form-control" placeholder="비밀번호를 입력하세요." value="" required=""/>
                                        </div>
                                        
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">로그인</button>
                                        </div>
                                        
                                        <div class="form-group text-center">
                                        	<a href="findid_teacher">강사 아이디 찾기</a> / 
                                        	<a href="findpw_teacher">강사 비밀번호 찾기</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>