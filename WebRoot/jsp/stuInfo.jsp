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

		<base href="${basePath}">
		<meta charset="UTF-8">
        <link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
$(function(){
	$("#delete").click(function(){
		$("#deleteForm").submit();
	});
});



</script>
	</head>
	<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>用户信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="user/updateStuInfoById">  
      <div class="form-group">
        <div class="label">
          <label>用户编号</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${User.userId}" name="userId" />
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>用户账号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="account" value="${User.account}"   />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>用户密码：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="password"  value="${User.password }"   style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>用户权限：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="userLimit" value="${User.userLimit }"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
         <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
          <button type="button" id="delete" class="button border-red"><span class="icon-trash-o"></span>删除该用户</button>
        </div>
     
      </ul>
      </div>
    </form>
  </div>
</div>
<form method="post" id="deleteForm" action="user/deleteStuInfoById">
<input type="hidden" name="userId" value="${User.userId}">
</form>
</body>
</html>