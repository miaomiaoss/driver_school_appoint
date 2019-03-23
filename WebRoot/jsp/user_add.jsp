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
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="layer/layer.js"></script>
<script src="layui/layui.js" charset="utf-8"></script>
	</head>
	<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>学员信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="tea/modifyTeacherById">  
      <div class="form-group">
        <div class="label">
          <label>用户姓名1</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" id="studentName" name="studentName" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="password" id="password" value=""  />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>确认密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="newPas" id="newPas" value=""  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" id="reg" type="button"> 注册</button>
        </div>
     </div>
    </form>
  </div>
</div>

</body>
<script type="text/javascript">
$(function(){
	 $("#reg").on("click",function(){
		// alert("登录");
	    	var pas=$("#password").val();
	     	var newPas=$("#newPas").val();
	     	var studentName=$("#studentName").val();
	    	if(studentName==null||studentName==""){
	    		 layer.msg('名字不能为空！');
	    		 return false;
	    	}
	     	if(pas==null||pas==""){
	     		 layer.msg('密码不能为空！');
	     		 return false;
	     	}
	     	if(newPas==null||newPas==""){
	    		 layer.msg('确认密码不能为空！');
	    		 return false;
	     	}
	     	if(newPas!=pas){
	       		 layer.msg('密码不一致！');
	       		return false;
	        	} 
	  
	    	
	     layer.msg('拼命上传中,请稍后....', {
	           icon: 16
	           ,shade: 0.45
	         });
	     setTimeout(function(){
	     	 $.ajax({
			       type:"POST",
			       ansyc:false,
			       url: "user/addUser",
			       data:{password:pas,
			    	   studentName:studentName
			       },
			       dataType:"json",
			       contentType:"application/x-www-form-urlencoded;charset=utf-8",
			       success:function(data){
			    	   var info="注册成功！<br>";
			    	   info=info+"分配到的账户为:"+data.user.account+"<br>";
			    	 layer.alert(info, {
			    		  skin: 'layui-layer-molv' //样式类名
			    		  ,closeBtn: 0
			    		}, function(){
			    		   parent.layer.closeAll();
			    		});
			       }
			});
	       layer.closeAll('loading');
	     }, 2000); 
	      

	    });
});
</script>
</html>