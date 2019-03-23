<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
 <base href="${basePath}">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改用户信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">
    <input type="hidden" name="userId" value="${user.userId }"/> 
    <input type="hidden" name="lastLoginTime" value="${user.lastLoginTime }"/>
    <input type="hidden" name="userId" value="${user.roleId }"/>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户帐号：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           ${user.account}
          </label>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="user_pass" name="password" size="50" value="${user.password}" />       
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">年龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="age" size="50" value="${user.age }"/>         
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">证件号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="idCard" size="50" value="${user.idCard }"/>          
        </div>
      </div>
      
    </form>
  </div>
</div>
</body>
</html>