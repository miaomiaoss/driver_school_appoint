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
	<form method="post" action="course/toModSchoolCourseById" id="modForm">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      <c:choose>
      <c:when test="${userLimit=='学员' }">
            <li><a href="javascript:void(0)" class="button border-main icon-search" id="sel"> 搜索</a>
      </c:when>
      <c:otherwise>
       <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" id="add"> 添加课程信息</a> </li>
       <li><button type="submit" class="button border-yellow" id="mod"><span class="icon-plus-square-o"></span> 修改课程信息</button></li>
       <li><button type="button" class="button border-yellow" id="del"><span class="icon-plus-square-o"></span> 删除课程信息</button></li>
      </c:otherwise>
      
      </c:choose>
       
       </li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" id="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
         </li>
      </ul>
    </div>
    </form>
    <table class="table table-hover text-center">
      <tr>
      <th>编号</th>
      <th>车辆编号</th>
      <th>学生编号</th>
      <th>学生姓名</th>
      <th>教师编号</th>
      <th>教师姓名</th>
        <th>上课时间</th>
        <th>科目</th>
        <th>车辆</th>
      </tr>
      <volist name="list" id="vo">
      <tbody id="tbody">
       <c:forEach items="${list}" var="schoolCourse" varStatus="vs">
       <c:set var="index" value="${index+1}" /> 
        <tr>
        <td>${ schoolCourse.id}</td>
          <td>${ schoolCourse.stu_id}</td>
          <td>${ schoolCourse.student.studentName}</td>
          <td>${ schoolCourse.tea_id}</td>
          <td>${ schoolCourse.teacher.tea_name}</td>
          <td>${ schoolCourse.course_time}</td>
          <td>${ schoolCourse.course_name}</td>
          <td>${ schoolCourse.teacher.car.car_type}</td>
        </tr>
        </c:forEach>
    </tbody>
      <tr>
        <td colspan="8"><div  id="demo7"></div></td>
      </tr>
    </table>
    <input type="hidden" id="count" value="${count }"/>
  </div>

<script type="text/javascript">
$(function(){
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
		       url: "course/toTargetCoursePage",
		       data:{Page:tag,
		       },
		       dataType:"json",
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	   $("#tbody").html("");//清空原来的表格，重新生成表格
		    	   for(var i=0;i<data.list.length;i++)
		   	    	 {  
		   	    		$("#tbody").append('<tr id='+i+'>'); 
		   	    		$("#"+i).append('<td>'+data.list[i].teacher.car.car_id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].stu_id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].student.studentName+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].tea_id+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].teacher.tea_name+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].course_time+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].course_name+'</td>');
		   	    		$("#"+i).append('<td>'+data.list[i].teacher.car.car_status+'</td></tr>');
		   	    	 }
		    	 
		       }
		}); 
	}
	$("#add").on('click',function(){
		layer.open({
			  type: 2,
			  area: ['800px', '530px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'jsp/school_course_add.jsp'
			});
		
		
	});
	$("#sel").on('click',function(){
		var keywords=$("#keywords").val();
		 $.ajax({
		       type:"POST",
		       ansyc:false,
		       url: "course/getSignalSchoolCourse",
		       data:{keywords:keywords
		       },
		       dataType:"json",
		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
		       success:function(data){
		    	   var info="编号:"+data.schoolCourse.id+"<br>";
		    	   info=info+"教师编号:"+data.schoolCourse.tea_id+"<br>";
		    	   info=info+"教师姓名:"+data.schoolCourse.teacher.tea_name+"<br>";
		    	   info=info+"学生编号:"+data.schoolCourse.stu_id+"<br>";
		    	   info=info+"学生姓名:"+data.schoolCourse.student.studentName+"<br>";
		    	   info=info+"车型:"+data.schoolCourse.teacher.car.car_type+"<br>";
		    	info=info+"上课时间:"+data.schoolCourse.course_time+"<br>";
		    	info=info+"科目:"+data.schoolCourse.course_name+"<br>";
		    	   layer.open({
		    		   type: 0,
		    		   shade: false,
		    		   title: false, //不显示标题
		    		   content: info //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
		    		 });
		       }
		});
	});
	$("#del").on('click',function(){
		
		layer.confirm('是否删除该条信息？', {
			  btn: ['是','否'] //按钮
			}, function(){
				 $.ajax({
				       type:"POST",
				       url: "course/delSchoolCourseByKeyWords",
				       data:{keywords:$("#keywords").val(),
				       },
				       dataType:"json",
				       contentType:"application/x-www-form-urlencoded;charset=utf-8",
				       success:function(data){
				    	   if(data.flag){
				    		   layer.msg('删除成功！', {icon: 1});
				    		   setTimeout(function(){
				    			   toLimitit(1);
				    			 }, 2000);
				    		   
				    	   }
				    	   else{
				    		   layer.msg('删除失败!');
				    	   }
				       }
				}); 
			
			});
		
		
		
	});
});

</script>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
	</body>
</html>