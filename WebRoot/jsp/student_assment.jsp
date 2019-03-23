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

		<base href="${basePath}">
		<meta charset="UTF-8">
		<title>H5模版:</title>
        <link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="css/pintuer.css">
        <link rel="stylesheet" href="css/admin.css">
        <script src="js/jquery.js"></script>
        <script src="js/pintuer.js"></script>
        <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
	</head>
	<body>
		<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 学生信息</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>
           <a class="button border-main" href="student/toAddAssment" ><span class="icon-edit"></span>评教</a> 
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width=>ID</th>
        <th>学生编号</th>
        <th>教师编号</th>
        <th>评价</th>
        <th>状态</th>
      </tr>
      <tbody id="tbody" style="text-align:center">
 <c:forEach items="${list}" var="teacherAssment" varStatus="vs">
    <c:set var="index" value="${index+1}" /> 
        <tr >
          <td >${teacherAssment.id}</td>
          <td >${teacherAssment.stu_id}</td>
          <td >${teacherAssment.tea_id}</td>
          <td >${teacherAssment.assment}</td>
          <td >${teacherAssment.assment_status}</td>
        </tr>
        </c:forEach>
        </tbody>
      <tr>
        <td colspan="8"><div id="demo7"></div> </td>
      </tr>
    </table>
  </div>
</form>
<form action="car/toModifyCarInfoById" method="post" id="modifyForm">
<input type="hidden"  name="carId" id="carId"/>
</form>
<input type="hidden" value="${count }" name="count" id="count"/>
<script type="text/javascript">
$(function(){
	$("#add").on("click",function(){
		
		layer.open({
			  type: 2,
			  area: ['800px', '480px'],
			  fixed: false, //不固定
			  maxmin: true,
			  closeBtn: 1,
			  content: 'jsp/stuInfoAdd.jsp'
			});
		
	});
	
	
	layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage
		  ,layer = layui.layer;
	  laypage({
		    cont: 'demo7'
		    ,pages:$("#count").val()
		    ,skip: true
		    ,jump: function(obj, first){
		    	
		    	 layer.msg('第 '+ obj.curr +' 页');
		    	 toLimitit(obj.curr);
		    }
		  });
	  
	  
	});
	function toLimitit(tag){
		 $.ajax({
		       type:"POST",
		       url: "student/toTargetStudentAssmentList",
		       data:{Page:tag
		       },
		       dataType:"json",
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	   $("#tbody").html("");//清空原来的表格，重新生成表格
		    	   for(var i=0;i<data.list.length;i++)
		   	    	 {  
		    		   $("#tbody").append('<tr id='+i+'>'); 
		   	    		$("#"+i).append('<td>'+data.list[i].id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].stu_id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].tea_id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].assment+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].assment_status+'</td></tr>');
		   	    	 }
		    	 
		       }
		}); 
	}

});

function getSignalCar(){
	var stu_id=$("#stu_id").val();
	
	$.ajax({
	       type:"POST",
	       url: "stu/getSignalStudent",
	       data:{account:stu_id,
	       },
	       dataType:"json",
	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	       success:function(data){
	    	 // alert(data.car.car_id);
	    	   var info="编号:"+data.student.user.userId+"</br>";
	    	   info=info+"账号:"+data.student.studentId+"</br>";
	    	   info=info+"姓名:"+data.student.studentName+"</br>";
	    	   info=info+"权限:"+data.student.user.userLimit+"</br>";
	    	   layer.open({
	    		   type: 0,
	    		   shade: false,
	    		   title: false, //不显示标题
	    		   content: info //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
	    		 });
	    		 
	    		 }
	       
	}); 
	
}
function modify(){
	var car_id=$("#car_id").val();
	document.getElementById("carId").value=car_id;
	$("#modifyForm").submit();
}



</script>
		
	</body>
</html>