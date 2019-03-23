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
		<form method="post" action="fate/toModifyFateInfoById" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keyWords"  id="keyWords" class="input" style="width:250px; line-height:17px;display:inline-block" />
           <input type="button" class="button bg-blue margin-left" id="add" value="+ 添加缴费"  >
           <button type="button" id="delete" class="button border-red"><span class="icon-trash-o"></span> 删除缴费</button>
           <a href="javascript:void(0)" class="button border-main icon-search" onclick="getSignalFate()" > 搜索</a></li>
           <a class="button border-main" href="javascript:void(0)" onclick="modify()"><span class="icon-edit"></span> 修改</a> 
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width=>ID</th>
        <th>学生姓名</th>
        <th>缴费项目</th>
        <th>缴费时间</th>
        <th>缴费金额</th>
        <th>备注</th>
      </tr>
      <tbody id="tbody" style="text-align:center">
       <c:forEach items="${list}" var="fate" varStatus="vs">
    <c:set var="index" value="${index+1}" /> 
        <tr >
          <td >${fate.id}</td>
          <td >${fate.student.studentName}</td>
          <td >${fate.course.courseName}</td>
          <td >${fate.fateTime}</td>
          <td >${fate.money}/元</td>
          <td >${fate.fateRemark}</td>
        </tr>
        </c:forEach>
        </tbody>
      <tr>
        <td colspan="8"><div id="demo7"></div> </td>
      </tr>
    </table>
  </div>
</form>
<form action="fate/toModifyFateInfoById" method="post" id="modifyForm">
<input type="hidden"  name="keyWords" id="key_words"/>
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
			  content: 'jsp/fateAdd.jsp'
			});
		
	});
	
	
	$("#delete").on("click",function(){
		var id=$("#keyWords").val();
		layer.confirm('您是是否要删除该车辆信息？', {
			  btn: ['是','否'] //按钮
			}, function(){
				 $.ajax({
				       type:"POST",
				       async:false,
				       url: "fate/toDeleteFateInfoById",
				       data:{id:id
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
		       url: "fate/toTargetFateInfoPage",
		       data:{Page:tag,
		       },
		       dataType:"json",
		       
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	   $("#tbody").html("");//清空原来的表格，重新生成表格
		    	   for(var i=0;i<data.list.length;i++)
		   	    	 {  
		   	    		$("#tbody").append('<tr id='+i+'>'); 
		   	    		$("#"+i).append('<td>'+data.list[i].id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].student.studentName +'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].course.courseName+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].fateTime+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].money+'/元</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].fateRemark+'</td></tr>');
		   	    	 }
		    	 
		       }
		}); 
	}

	
});

function getSignalFate(){
	var studentId=$("#keyWords").val();
	 $.ajax({
	       type:"POST",
	       async:false,
	       url: "fate/getFateInfoById",
	       data:{studentId:studentId
	       },
	       dataType:"json",
	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	       success:function(data){
	              var info=data.sb;
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
	var keyWords=$("#keyWords").val();
	alert(keyWords);
	document.getElementById("key_words").value=keyWords;
	$("#modifyForm").submit();
}



</script>
		
	</body>
</html>