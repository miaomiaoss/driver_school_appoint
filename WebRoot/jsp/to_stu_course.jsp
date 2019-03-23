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
  <div class="panel-head"><strong><span class="icon-key"></span> 学生课程信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="stu/getCourseInfoById">
      <div class="form-group">
        <div class="label">
          <label for="sitename">学生账号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="account" name="account" size="50"  />       
        </div>
      </div>      
      <div class="form-group">
       <div class="field" style="margin-left:160px;">
          <button class="button bg-main icon-check-square-o" type="submit" id="select_user">确认</button>
        </div>
      </div>      
    </form>
  </div>
</div>
</body>
</html>