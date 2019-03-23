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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>驾校预约管理系统后台</title>  
    <base href="${basePath}">
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h2>欢迎进入驾校预约管理系统后台</h2>
  </div>
   <div class="logo margin-big-left fadein-top"> </div>
   <div class="head-l"> &nbsp;&nbsp;<a href="user/loginOut"> <font color="white">退出登录</font></a> <a href="jsp/main.jsp"><font color="white">|</font><font color="white">首页</font></a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
   <h2><span class="icon-pencil-square-o"></span>学员信息管理</h2>
  <ul>
    <li><a href="stu/toStudentList" target="right"><span class="icon-caret-right"></span>学生基本信息管理</a></li>
    <li><a href="user/toSelStuScore" target="right"><span class="icon-caret-right"></span>学生成绩管理</a></li>
    <li><a href="student/toStudentList" target="right"><span class="icon-caret-right"></span>学生课表</a></li>
    
  </ul>
   <h2><span class="icon-pencil-square-o"></span>教员信息管理</h2>
  <ul>
    <li><a href="tea/toGetTeaListInfo" target="right"><span class="icon-caret-right"></span>教员基本信息管理</a></li>
    <li><a href="tea/toGetCourseInfo" target="right"><span class="icon-caret-right"></span>授课学员信息表</a></li>
  </ul>
   <h2><span class="icon-pencil-square-o"></span>车辆信息管理</h2>
    <ul>
    <li><a href="car/toCarInfoPage" target="right"><span class="icon-caret-right"></span>车辆信息管理</a></li>
  </ul>
   <h2><span class="icon-pencil-square-o"></span>缴费管理</h2>
    <ul>
    <li><a href="fate/tofateInfoPage" target="right"><span class="icon-caret-right"></span>缴费管理</a></li>
  </ul>
     <h2><span class="icon-pencil-square-o"></span>学员反馈管理</h2>
    <ul>
    <li><a href="teacherAssment/toTAInfoPage" target="right"><span class="icon-caret-right"></span>学员反馈</a></li>
  </ul>
  <h2><span class="icon-pencil-square-o"></span>课程信息管理</h2>
    <ul>
    <li><a href="course/toCourseList" target="right"><span class="icon-caret-right"></span>课程安排</a></li>
  </ul>
  <h2><span class="icon-pencil-square-o"></span>用户信息管理</h2>
    <ul>
    <li><a href="user/toModifyPassPage" target="right"><span class="icon-caret-right"></span>密码修改</a></li>
  </ul>
<!--     <h2><span class="icon-pencil-square-o"></span>信息报表</h2>
  <ul>
    <li><a href="course/toCourseAdd" target="right"><span class="icon-caret-right"></span>学生信息报表</a></li>
    <li><a href="course/toCourseAdd" target="right"><span class="icon-caret-right"></span>车辆信息报表</a></li>
    <li><a href="course/toCourseAdd" target="right"><span class="icon-caret-right"></span>教员信息报表</a></li>
  </ul> -->
</div>

<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="user/welcom" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>