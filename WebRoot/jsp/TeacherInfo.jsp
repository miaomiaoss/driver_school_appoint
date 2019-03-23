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
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="tea_id"  id="tea_id" class="input" style="width:250px; line-height:17px;display:inline-block" />
           <input type="button" class="button bg-blue margin-left" id="add" value="+ 添加教员"  >
           <button type="button" id="delete" class="button border-red"><span class="icon-trash-o"></span> 删除</button>
           <a href="javascript:void(0)" class="button border-main icon-search" onclick="getSignalTea()" > 搜索</a></li>
           <a class="button border-main" href="javascript:void(0)" onclick="modify()"><span class="icon-edit"></span> 修改</a> 
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width=>ID</th>
        <th>姓名</th>
        <th>车品牌</th>
        <th>车龄</th>
      </tr>
      <tbody id="tbody" style="text-align:center">
       <c:forEach items="${list}" var="teacher" varStatus="vs">
    <c:set var="index" value="${index+1}" /> 
        <tr >
          <td >${teacher.tea_id}</td>
          <td >${teacher.car.car_owner}</td>
          <td >${teacher.car.car_type}</td>
          <td >${teacher.car.car_age}</td>
        </tr>
        </c:forEach>
        </tbody>
      <tr>
        <td colspan="8"><div id="demo7"></div> </td>
      </tr>
    </table>
  </div>
</form>
<form action="user/getTeaInfoById" method="post" id="modifyForm">
<input type="hidden"  name="teaId" id="teaId"/>
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
			  content: 'jsp/teaInfoAdd.jsp'
			});
		
	});
	
	
	$("#delete").on("click",function(){
		var tea_id=$("#tea_id").val();
		layer.confirm('您是是否要删除该车辆信息？', {
			  btn: ['是','否'] //按钮
			}, function(){
				 $.ajax({
				       type:"POST",
				       async:false,
				       url: "tea/toDeleteTeaInfoById",
				       data:{tea_id:tea_id
				       },
				       dataType:"json",
				       contentType:"application/x-www-form-urlencoded;charset=utf-8",
				       success:function(data){
				    	 if(data.flag){
				    		 layer.msg('删除成功！', {icon: 1});
				    		 toLimitit(1);
				    	 }
				       }
				});
			  
			}, function(){
				layer.msg('取消操作！', {icon: 1});
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
		       url: "tea/toTargetTeaListInfo",
		       data:{Page:tag,
		       },
		       dataType:"json",
		       
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	   $("#tbody").html("");//清空原来的表格，重新生成表格
		    	   for(var i=0;i<data.list.length;i++)
		   	    	 {  
		   	    		$("#tbody").append('<tr id='+i+'>'); 
		   	    		$("#"+i).append('<td>'+data.list[i].tea_id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].tea_name +'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].car.car_type+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].car.car_age+'年</td></tr>');
		   	    	 }
		    	 
		       }
		}); 
	}

	
});

function getSignalTea(){
	var tea_id=$("#tea_id").val();
	alert(tea_id);
	 $.ajax({
	       type:"POST",
	       async:false,
	       url: "tea/getTeaInfoById",
	       data:{tea_id:tea_id,
	       },
	       dataType:"json",
	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	       success:function(data){
	    	  alert(data.teacher.tea_id);
	    	 // alert(data.car.car_id);
	    	   var info="编号:"+data.teacher.tea_id+"</br>";
	    	   info=info+"车主:"+data.teacher.tea_name+"</br>";
	    	   info=info+"车型:"+data.teacher.car.car_type+"</br>";
	    	   info=info+"车龄:"+data.teacher.car.car_age+"</br>";
	    	   info=info+"车牌号:"+data.teacher.car.car_id+"</br>";
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
	var car_id=$("#tea_id").val();
	document.getElementById("teaId").value=car_id;
	$("#modifyForm").submit();
}



</script>
		
	</body>
</html>