<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <div class="panel-head"><strong><span class="icon-key"></span> 学生成绩查询</strong></div>
  <div class="body-content">
    <form method="post" id="addForm" class="form-x" action="stu/insertStuScore">
      <div class="form-group">
        <div class="label">
          <label>科目：</label>
        </div>
        <div class="field">
          <select name="courseId" class="input w50">
            <option value="">请选择分类</option>
            <option value="1">科目一</option>
            <option value="2">科目二</option>
            <option value="3">科目三</option>
            <option value="4">科目四</option>
          </select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>学生账号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="studentId" value="${account }" />
          <div class="tips"></div>
        </div>
      </div>
        <div class="form-group">
        <div class="label">
          <label>分数：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="studentScore" value="" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="field" style="margin-left:150px;">
          <button class="button bg-main icon-check-square-o" type="button" id="addScore"> 提交</button>
        </div>
    </form>
  </div>
</div>
<script type="text/javascript">
$(function(){
	$("#addScore").on("click",function(){
		$("#addForm").submit();
	});
	
	
});
</script>
</body>
</html>