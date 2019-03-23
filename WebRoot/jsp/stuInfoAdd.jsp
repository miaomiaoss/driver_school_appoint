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
          <label>用户账号</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" id="stu_id" name="stu_id" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="stu_name" id="stu_name" value=""  />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>权限：</label>
        </div>
        <div class="field">
          <select name="userLimit" id="userLimit"class="input w50">
            <option value="">请选择分类</option>
            <option value="管理员">管理员</option>
            <option value="教师">教师</option>
            <option value="学生">学生</option>
          </select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" id="addTea" type="button"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body>
<script type="text/javascript">
$(function(){
	$("#addTea").on("click",function(){
		
		 $.ajax({
		       type:"POST",
		       async:false,
		       url: "stu/addStudent",
		       data:{
		    	   studentName:$("#stu_name").val(),
		    	   account:$("#stu_id").val(),
		    	   userLimit:$("#userLimit").val(),
		       },
		       dataType:"json",
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	   if(data.flag){
		    		   layer.msg('添加成功');	
		    		   setTimeout(function(){
		    			   parent.layer.closeAll();
		    			 }, 2000);
		    		   
		    	   }
		       }
		}); 
		
		
	});
	
	
	
	
});



</script>
</html>