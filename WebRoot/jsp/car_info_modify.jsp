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
	var  carStatus=$("#carStatus").val();
	$("#car_status").val(carStatus);
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
    <form method="post" class="form-x" action="car/ModifyCarInfoById">  
      <div class="form-group">
        <div class="label">
          <label>车牌号</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${car.car_id}" name="car_id" />
          <div class="tips"></div>
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>车主：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="car_owner" value="${car.car_owner}"   />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>车型：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="text" class="laydate-icon input w50" name="car_type"  value="${car.car_type}"   style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>状态:</label>
        </div>
        <div class="field">
         <select name="car_status" id="car_status" class="laydate-icon input w50">
         <option value="未占用">未占用</option>
         <option value="已占用">已占用</option>
         </select>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>车龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="car_age" value="${car.car_age }"  />
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
      <input type="hidden" id="carStatus" value="${car.car_status }">
      </div>
    </form>
  </div>
</div>
</body>
</html>