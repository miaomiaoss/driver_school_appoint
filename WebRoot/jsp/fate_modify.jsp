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
	var courseId=$("#course_id").val();
	$("#courseId").val(courseId);
	$("#delete").click(function(){
		$("#deleteForm").submit();
	});
});



</script>
	</head>
	<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>缴费信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="fate/ModifyFateInfoById">  
      <div class="form-group">
        <div class="label">
          <label>编号</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${fate.id}" name="id" readonly="true"/>
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>缴费课程:</label>
        </div>
        <div class="field">
         <select name="courseId" id="courseId" class="laydate-icon input w50">
                 <option value="1">科目一</option>
                 <option value="2">科目二</option>
                 <option value="3">科目三</option>
                 <option value="4">科目四</option>
          </select> <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>缴费金额:</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="money"  value="${fate.money}"   style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips">元</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>缴费时间:</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="fateTime" value="${fate.fateTime }" readonly="true" />
          <div class="tips"></div>
        </div>
      </div>
         <div class="form-group">
        <div class="label">
          <label>缴费备注:</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="fateRemark" value="${fate.fateRemark }"  />
          <div class="tips"></div>
        </div>
      </div>
          <div class="form-group">
        <div class="label">
          <label>学生编号:</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="studentId" value="${fate.studentId }"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
         <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </ul>
      <input type="hidden" id="course_id" value="${fate.courseId}"/>
      </div>
    </form>
  </div>
</div>
</body>
</html>