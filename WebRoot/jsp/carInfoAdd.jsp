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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>教员信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="tea/modifyTeacherById">  
      <div class="form-group">
        <div class="label">
          <label>用户编号</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${teacher.tea_id }" id="tea_id" name="tea_id" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="tea_name" id="tea_name" value="${teacher.tea_name }"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>用户车牌号：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="car_id" id="car_id"  value="${teacher.car_id }"  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
      
             <div class="form-group">
        <div class="label">
          <label>车型：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="car_type" id="car_type" value="${teacher.car_id }"  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
          <div class="form-group">
        <div class="label">
          <label>车龄：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="car_age" id="car_age"  value=""   style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
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
		       url: "tea/addTeacher",
		       data:{tea_name:$("#tea_name").val(),
		    	   tea_id:$("#tea_id").val(),
		    	   car_id:$("#car_id").val(),
		    	   car_type:$("#car_type").val(),
		    	   car_age:$("#car_age").val()
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