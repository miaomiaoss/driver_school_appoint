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
          <label>缴费科目:</label>
        </div>
        <div class="field">
          <select name="courseId" id="courseId" class="laydate-icon input w50">
                 <option value="1">科目一</option>
                 <option value="2">科目二</option>
                 <option value="3">科目三</option>
                 <option value="4">科目四</option>
          </select>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>缴费金额:</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="money" id="money"  value=""  data-validate="required:金额不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
      
             <div class="form-group">
        <div class="label">
          <label>缴费备注:</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="fateRemark" id="fateRemark" value=""  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
          <div class="form-group">
        <div class="label">
          <label>学生编号:</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="studentId" id="studentId"  value=""   style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" id="addFate" type="button"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body>
<script type="text/javascript">
$(function(){
	$("#addFate").on("click",function(){
		
		 $.ajax({
		       type:"POST",
		       async:false,
		       url: "fate/addFate",
		       data:{courseId:$("#courseId").val(),
		    	   money:$("#money").val(),
		    	   studentId:$("#studentId").val(),
		    	   fateRemark:$("#fateRemark").val()
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