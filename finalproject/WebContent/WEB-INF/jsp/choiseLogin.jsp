<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="container register" style="padding-top:20px; padding-bottom:20px;">
            <div class="row">
                <div class="col-md-12">
                
                    <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">�л� �α���</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">���� �α���</a>
                        </li>
                    </ul>
                    
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active text-align form-new" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <!-- <h3 class="register-heading">�л� �α���</h3>  -->
                            <div class="row register-form">
                                <div class="col-md-12" style="padding-top:20px;">
                                    <form method="post" action="loginProcess" autocomplete="off">
                                        <div class="form-group">
                                            <input type="text" name="ms_id" class="form-control" placeholder="�л����̵� �Է��ϼ���." value="" required=""/>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="ms_pwd" class="form-control" placeholder="��й�ȣ�� �Է��ϼ���." value="" required=""/>
                                        </div>
                                        
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">�α���</button>
                                        </div>
                                        
                                        <div class="form-group text-center">
                                        	<a href="ForgetPassword.php" class="btnForgetPwd" value="Login">���̵� ã��</a> / 
                                        	<a href="ForgetPassword.php" class="btnForgetPwd" value="Login">��й�ȣ ã��</a>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <div class="tab-pane fade show text-align form-new" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <!--  <h3  class="register-heading">���� �α���</h3>  -->
                            <div class="row register-form">
                                <div class="col-md-12" style="padding-top:20px;">
                                    <form method="post" action="teacher_loginProcess" autocomplete="off">
                                        <div class="form-group">
                                            <input type="text" name="mt_id" class="form-control" placeholder="������̵� �Է��ϼ���." value="" required="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="mt_pwd" class="form-control" placeholder="��й�ȣ�� �Է��ϼ���." value="" required=""/>
                                        </div>
                                        
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-block">�α���</button>
                                        </div>
                                        
                                        <div class="form-group text-center">
                                        	<a href="ForgetPassword.php" class="btnForgetPwd" value="Login">���̵� ã��</a> / 
                                        	<a href="ForgetPassword.php" class="btnForgetPwd" value="Login">��й�ȣ ã��</a>
                                        </div>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>