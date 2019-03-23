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
		<title>H5模版:</title>
     <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script> 
	</head>
	<body>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>
          <li>
            <select name="courseId" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
              <option value="">请选择课程分类</option>
              <option value="1">科目一</option>
              <option value="2">科目二</option>
              <option value="3">科目三</option>
              <option value="4">科目四</option>
            </select>
          </li>
        
        <li>
          教员账号:<input type="text" placeholder="请输入搜索关键字" name="tea_account" class="input" style="width:250px; line-height:17px;display:inline-block" />
          学员账号 :<input type="text" placeholder="请输入搜索关键字" name="stu_account" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
      <table class="table table-hover text-center" >
    <tr>
      <th width="5%">教练</th>     
      <th>科车牌号</th>  
      <th>上课时间</th>     
      <th width="250">操作</th>
    </tr>
    <tbody id="tbody">
   <c:forEach items="${list}" var="student" varStatus="vs">
    <c:set var="index" value="${index+1}" /> 
    <tr id="">
      <td style="text-align:center;width:25%;"> <input type="text" class="input input-big" id="account${account }" name="account" size="50" value="${account }" style="text-align:center"/></td> 
      <td style="text-align:center;width:25%;"  > <input type="text" class="input input-big" id="courseId${account }" name="courseId" size="50" value="${student.course.courseName }" style="text-align:center;"/></td>      
      <td style="text-align:center;width:25%;"><input type="text" class="input input-big" id="coursScore${index}" name="coursScore" size="50" value="${student.studentScore }" style="text-align:center;"/></td>  
      <td style="text-align:center;width:25%;" id="tr${student.courseId}lp">
      <div class="button-group">
      <a type="button" id="${index}"  onClick="doModify(this)" class="button border-main"  href="javascript:void(0);" ><span class="icon-edit"></span>修改</a>
      <a class="button border-red" id="${student.courseId}"onClick="doDelete(this)" href="javascript:void(0);" onclick="return del(17)"><span class="icon-trash-o"></span> 删除</a>
      </div>
      </td>
    </tr> 
   </c:forEach>
   </tbody>
  </table>
    </div>
    
	</body>
</html>