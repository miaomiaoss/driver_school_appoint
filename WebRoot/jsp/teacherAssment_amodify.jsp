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
    <form method="post" class="form-x" id="modForm" action="teacherAssment/ModifyTeacherAssmentInfoById">  
      <div class="form-group">
        <div class="label">
          <label>编号:</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="id" id="id" readonly="true" value="${teacherAssment.id }"  data-validate="required:不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>评价状态:</label>
        </div>
        <div class="field">
          <select name="assment_status" id="assment_status" class="laydate-icon input w50">
                 <option value="未评价">未评价</option>
                 <option value="已评价">已评价</option>
          </select>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>教师编号:</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="tea_id" id="tea_id"  value="${teacherAssment.tea_id }"  data-validate="required:不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
      
             <div class="form-group">
        <div class="label">
          <label>学生编号:</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="stu_id" id="stu_id" value="${teacherAssment.stu_id }"  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
          <div class="form-group">
        <div class="label">
          <label>评价:</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <select name="assment" id="assment" class="laydate-icon input w50">
                 <option value="好评">好评</option>
                 <option value="中评">中评</option>
                 <option value="差评">差评</option>
          </select>         
           <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" id="addAssment" type="button"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<input type="hidden" id="assmentStatus" value="${teacherAssment.assment_status}">
<input type="hidden" id="Assment" value="${teacherAssment.assment}">
</body>
<script type="text/javascript">
$(function(){
	var assment_status=$("#assmentStatus").val();
	var assment=$("#Assment").val();
	$("#assment").val(assment);
	$("#assment_status").val(assment_status);
	$("#addAssment").on("click",function(){
		layer.msg('上传数据中....', {
			  icon: 16
			  ,shade: 0.01
			});
		   setTimeout(function(){
			   $("#modForm").submit();
			   parent.layer.closeAll();
			 }, 2000);

		
		
	});
	
	
	
	
});



</script>
</html>