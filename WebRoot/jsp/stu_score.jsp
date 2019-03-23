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
     <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
    <script src="layer/layer.js"></script>
	</head>
	<body>
    
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 学生成绩</strong>
  </div>
       <c:choose>
       <c:when test="${userLimit == '管理员' }">
    <a type="button" id="addScore"   class="button border-main"  href="javascript:void(0);" ><span class="icon-edit"></span>添加成绩</a> 
      </c:when>
      <c:otherwise>
     </c:otherwise>
       </c:choose>  
 

  <!--           <select name="cid" class="input w50">
              <option value="">请选择分类</option>
              <option value="">产品分类</option>
              <option value="">产品分类</option>
              <option value="">产品分类</option>
              <option value="">产品分类</option>
            </select> -->
  <table class="table table-hover text-center" >
    <tr>
      <th width="5%">学号</th>     
      <th>科目</th>  
      <th>成绩</th>
       <c:choose>
       <c:when test="${userLimit == '管理员' }">
    <th width="250">操作</th>
      </c:when>
      <c:otherwise>
     </c:otherwise>
       </c:choose>     
      
    </tr>
    <tbody id="tbody">
   <c:forEach items="${list}" var="student" varStatus="vs">
    <c:set var="index" value="${index+1}" /> 
    <tr id="">
      <td style="text-align:center;width:25%;"> <input type="text" class="input input-big" id="account${account }" name="account" size="50" value="${account }" style="text-align:center"/></td> 
      <td style="text-align:center;width:25%;"  > <input type="text" class="input input-big" id="courseId${account }" name="courseId" size="50" value="${student.course.courseName }" style="text-align:center;"/></td>      
      <td style="text-align:center;width:25%;"><input type="text" class="input input-big" id="coursScore${student.courseId}" name="coursScore" size="50" value="${student.studentScore }" style="text-align:center;"/></td>  
      <td style="text-align:center;width:25%;" id="tr${student.courseId}lp">
       <c:choose>
       <c:when test="${userLimit == '管理员' }">
           <div class="button-group">
      <a type="button" id="${student.courseId}1"  onClick="doModify(this)" class="button border-main"  href="javascript:void(0);" ><span class="icon-edit"></span>修改</a>
      <a class="button border-red" id="delete${student.courseId}" onClick="doDelete(this)" href="javascript:void(0);" onclick="return del(17)"><span class="icon-trash-o"></span> 删除</a>
      </div>
      </c:when>
      <c:otherwise>
    </c:otherwise>
       </c:choose>
    
      </td>
    </tr> 
   </c:forEach>
   </tbody>
  </table>
  <input type="hidden" id="account" value="${account}"/>
</div>
<form id="addForm" action="stu/toInsertStuScore" method="POST">
<input type="hidden" name="account" value="${account}">
</form>
<script>
$(function(){
	$("input").attr("disabled",true);
	$("#addScore").on("click",function(){
		$("#addForm").submit();
	});
});
function doModify(flag){
var courseId=flag.id;
var bf="#"+flag.id;
courseId=courseId.substring(0,courseId.length-1);
alert(courseId);
var modify="#"+courseId;
alert();//操作buduiying
$(bf).html("<span class=icon-edit></span>保存");
var courseScorseId="#coursScore"+courseId;
var accountId="#account"+courseId;
var courseRealId="#courseId"+courseId;
var score=$(courseScorseId).val();
var account=$("#account").val();
//alert(accountId+courseRealId+courseScorseId);
$(courseScorseId).removeAttr("disabled");
$(accountId).removeAttr("disabled");
$(courseRealId).removeAttr("disabled");
$(bf).attr('onclick','save(this)');
}
function save(flag){
	var courseId=flag.id;
	courseId=courseId.substring(0,courseId.length-1);
	var modify="#"+courseId;
	var courseScorseId="#coursScore"+courseId;
	var accountId="#account"+courseId;
	var courseRealId="#courseId"+courseId
	var score=$(courseScorseId).val();
//	alert(courseScorseId+"-----"+score);
	var account=$("#account").val();
	  $.ajax({
	       type:"POST",
	       async:false,
	       url: "stu/modifyScore",
	       data:{studentId:account,
	    	   studentScore:score,
	    	   courseId:courseId
	       },
	       dataType:"json",
	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	       success:function(data){
	    	   alert(data.flag);
	    	   if(data.flag){
	    		   $(modify).html("<span class=icon-edit></span>修改");
	    		   $(modify).attr('onclick','doModify(this)'); 
	    		   $(courseScorseId).attr("disabled",true);
	    		   $(obj).parents("tr").remove(); 
	    		   layer.msg('修改成功');
	    	   }else{
	    		   layer.msg('修改失败');
	    		   
	    	   }
	    	   
	       }
	}); 
	
}
function doDelete(flag){
	var courseId=flag.id;
	courseId=courseId.substring(courseId.length-1,courseId.length);
	var trId="#tr"+courseId+"lp";
	alert(courseId);
	var account=$("#account").val();
	  $.ajax({
	       type:"POST",
	       async:false,
	       url: "stu/deleteStuScore",
	       data:{studentId:account,
	    	   courseId:courseId
	       },
	       dataType:"json",
	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	       success:function(data){
	    	   if(data.flag){
	    		   $(trId).parent().remove(); 
	    		   layer.msg('删除成功！');
	    		   
	    	   }
	       }
	}); 
	
}
</script>
</body>
</html>