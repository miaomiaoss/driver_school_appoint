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
     <link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="css/pintuer.css">
        <link rel="stylesheet" href="css/admin.css">
        <script src="js/jquery.js"></script>
        <script src="js/pintuer.js"></script>
        <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
	</head>
	<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>用户信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="user/updateStuInfoById">  
      <div class="form-group">
        <div class="label">
          <label>账号</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="account" id="account" />
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="password" id="password" value="${User.account}"   />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>新密码：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="password" class="laydate-icon input w50" name="new_password" id="new_password"    style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>确认密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="confirm_pas" id="confirm_pas"   />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
         <div class="field">
          <button class="button bg-main icon-check-square-o" id="modify" type="button"> 提交</button>
        </div>
      </ul>
      </div>
    </form>
  </div>
</div>
<form action="user/loginOut" id="toLogin"></form>
</body>
<script type="text/javascript">
$(function(){
	
	$("#modify").on("click",function(){
		    if($("#account").val()==""||$("#account").val()==null){
		    	layer.tips('账号不能为空', '#account');
		    	return false;
		    }
			if($("#password").val()==""||$("#password").val()==null){
				layer.tips('密码不能为空', '#password');
		    	return false;
		    }
			if($("#new_password").val()==""||$("#new_password").val()==null){
				layer.tips('新密码不能为空', '#new_password');
				return false;
			}
			if($("#confirm_pas").val()==""||$("#confirm_pas").val()==null){
				layer.tips('确认密码不能为空', '#confirm_pas');
			return false;
			}
			if($("#new_password").val()!=$("#confirm_pas").val()){
				$("#new_password").val("");
				$("#confirm_pas").val("");
				layer.msg('密码不一致，请重新输入');
			    return false;
			}
	$.ajax({
		       type:"POST",
		       url: "user/modifyUserPass",
		       data:
		       {account:$("#account").val(),
		    	    password:$("#password").val(),
		    	    newPassword:$("#new_password").val()
		            },
		       dataType:"json",
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	if(data.flag){
		    		layer.msg('修改成功！', {icon: 1});
		    		setTimeout(function(){
		    			  layer.closeAll('loading');
		    			  window.parent.location.href="user/loginOut";
		    			}, 1000);
		    		
		    	} 
		    	else{
		    		layer.msg('用户名密码不正确！', {icon: 1});
		    		$("#account").val("");
		    		 $("#password").val("");
		    	}
		       }
		});  
		
	});
});


</script>
</html>