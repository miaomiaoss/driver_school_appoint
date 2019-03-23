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
         <input type="text" placeholder="请输入搜索关键字" name="car_id"  id="car_id" class="input" style="width:250px; line-height:17px;display:inline-block" />
        <c:choose>
                <c:when test="${userlimit=='admin' }">
            <input type="button" class="button bg-blue margin-left" id="add" value="+ 添加车辆"  >
           <button type="button" id="delete" class="button border-red"><span class="icon-trash-o"></span> 删除</button>
             <a class="button border-main" href="javascript:void(0)" onclick="modify()"><span class="icon-edit"></span> 修改</a> 
               </c:when>
      <c:otherwise>
                 <a href="javascript:void(0)" class="button border-main icon-search" onclick="getSignalCar()" > 搜索</a></li>
                       <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" id="add"> 车辆预约</a> </li>
                
      </c:otherwise>
       </c:choose>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width=>ID</th>
        <th>车主</th>
        <th>车品牌</th>
        <th>车龄</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>状态</th>
      </tr>
      <tbody id="tbody" style="text-align:center">
       <c:forEach items="${list}" var="car" varStatus="vs">
    <c:set var="index" value="${index+1}" /> 
        <tr >
          <td >${car.car_id }</td>
          <td >${car.car_owner }</td>
          <td >${car.car_type }</td>
          <td >${car.car_status }</td>
          <td >${car.car_age }</td>
          
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
			  content: 'jsp/school_car_appoint.jsp'
			});
		
	});
	
	
	$("#delete").on("click",function(){
		var car_id=$("#car_id").val();
		layer.confirm('您是是否要删除该车辆信息？', {
			  btn: ['是','否'] //按钮
			}, function(){
				 $.ajax({
				       type:"POST",
				       url: "car/toDeleteCarInfoById",
				       data:{car_id:car_id
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
		       async:false,
		       url: "car/toTargetCarInfoPage",
		       data:{Page:tag,
		       },
		       dataType:"json",
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	   $("#tbody").html("");//清空原来的表格，重新生成表格
		    	   for(var i=0;i<data.list.length;i++)
		   	    	 {  
		   	    		$("#tbody").append('<tr id='+i+'>'); 
		   	    		$("#"+i).append('<td>'+data.list[i].car_id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].car_owner+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].car_type+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].car_age+'年</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].startTime+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].endTime+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].car_status+'</td></tr>');
		   	    	 }
		    	 
		       }
		}); 
	}

});

function getSignalCar(){
	var car_id=$("#car_id").val();
	
	$.ajax({
	       type:"POST",
	       async:false,
	       url: "car/getCarInfoById",
	       data:{car_id:car_id,
	       },
	       dataType:"json",
	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	       success:function(data){
	    	 // alert(data.car.car_id);
	    	   var info="车牌号:"+data.car.car_id+"</br>";
	    	   info=info+"车主编号:"+data.teacher.tea_id+"</br>";
	    	   info=info+"车主:"+data.car.car_owner+"</br>";
	    	   info=info+"车型:"+data.car.car_type+"</br>";
	    	   info=info+"车龄:"+data.car.car_age+"</br>";
	    	   info=info+"状态:"+data.car.car_status+"</br>";
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