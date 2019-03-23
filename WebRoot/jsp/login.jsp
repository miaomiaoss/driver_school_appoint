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
    <title>登录</title>  
    <base href="${basePath}">
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script> 
    <script src="layer/layer.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script> 
</head>
<body>
<div class="bg"></div>

<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="user/main" method="post">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>用户登录</h1><div ><a href="javascript:void(0);" id="reg" style="margin-left:280px;"><font color="white">注册</font></a></div></div>
                
                <div class="text-center margin-big padding-big-top"><p><font color="red">${error_message}</font></p></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="account" id="account" placeholder="登录账号" data-validate="required:请填写账号" value="${account}" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" id="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                       <div class="form-group">
                        <div class="field field-icon-right">
                              <select name="userLimit" id="userLimit" class="input"   style="width:330px; line-height:17px;display:inline-block">
                                <option value="管理员">管理员</option>
                                <option value="教员">教员</option>
                                <option value="学员">学员</option>
                              </select>  
                        </div>
                    </div>
                </div>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big"  value="登录"></div>
            </div>
            </form>          
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
$(function(){
	$("#reg").on("click",function(){
		//alert("天假学生");
		layer.open({
			  type: 2,
			  area: ['800px', '480px'],
			  fixed: false, //不固定
			  maxmin: true,
			  closeBtn: 1,
			  content: 'jsp/user_add.jsp'
			});
		
	});
	
	
	
});

</script>
</html>