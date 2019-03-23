<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    pageContext.setAttribute("path", path);
    pageContext.setAttribute("basePath", basePath);
%>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <base href="${basePath}">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <link rel="stylesheet" href="css/pintuer.css">
 <link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="layer/layer.js"></script>
</head>
<body>
   <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 离线升级包</strong></div>
    <div class="padding border-bottom">
    <form action="file/upload" id="onlineSub" enctype="multipart/form-data" method="POST">
      <ul class="search" style="padding-left:10px;">
        <li> <input type="file" name="myFile" id="myFile" class="button border-main icon-plus-square-o" /> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="upload()">上传 </a> </li>
         <input type="hidden" name="upType" value="offline"/>
       </ul>
      </form>
    </div>
    <table class="table table-hover text-center" id="onlineTable">
    <thead>
      <tr>
        <th width="45%">升级包版本</th>
        <th width="45%">更新时间</th>
        <th width="10%">操作</th>
      </tr>
      </thead>
      <tbody>
      <c:set var="index" value="0" />  
      <c:forEach items="${list}" var="fileInfo" varStatus="vs">
         <tr id="${index} ">
         <c:set var="index" value="${index+1}" /> 
          <td>${fileInfo.fileName }</td>
          <td>${fileInfo.upgradeDate }</td>
         <td><input onclick="download(this)" name=imgbtn type=image id=${fileInfo.fileName}  src=images/download.png width=35 height=35 border=0></td>
        </tr>
     </c:forEach>
      </tbody>
      <tfoot>   <tr>
        <td colspan="8"><div id="demo7"></div> </td>
      </tr></tfoot>
    </table>
    
  </div> 

  <input type="hidden" name="pageNum" id="pageNum" value="${mapInfo['pages'] }"/>       
 <form action="user/fileDownload" method="POST" id="downloadForm">
 <input type="hidden" name="fileName" id="fileName" value=""/>
 <input type="hidden" name="download_type" value="offline"/>
 </form>
<script src="layui/layui.js" charset="utf-8"></script>
<script>
function upload(){
	 var value = document.getElementById("myFile").value;
	 if(value==undefined||value==null||value==""){
		 layer.msg('未选择要上传的文件！');
		 return false;
	 }
	 else{
	layer.msg('拼命上传中,请稍后....', {
		  icon: 16
		  ,shade: 0.45
		});
	setTimeout(function(){
	     var formData = new FormData($("#onlineSub")[0]);
	     $.ajax({
	         url: 'file/upload',
	         type: 'POST',
	         data: formData,
	         async:false,
	         cache: false,
	         contentType: false,
	         enctype: 'multipart/form-data',
	         processData: false,
	         success: function (data) {
	         document.getElementById("myFile").value=null; 
	        	   layer.msg('文件上传成功！');
	         }
	     });
		toPageLimit();
	  layer.closeAll('loading');
	}, 2000);
	 }
}
function toPageLimit(){
    $.ajax({
	       type:"POST",
	       async:false,
	       url: "user/targetList",
	       data:{pageNum:1,
	    	     upType:"offline"
	       },
	       dataType:"json",
	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	       success:function(data){
	    	   $("#onlineTable tbody").html("");//清空原来的表格，重新生成表格
	    	  for(var i=0;i<data.list.length;i++)
	   	    	 {  
	   	    		$("#onlineTable tbody").append('<tr id='+i+'></tr>'); 
	   	    		$("#"+i).append('<td>'+data.list[i].fileName+'</td>');
	   	    		$("#"+i).append('<td>'+data.list[i].upgradeDate+'</td>');
	   	    		$("#"+i).append('<td><input onclick=download(this) name=imgbtn type=image id='+data.list[i].fileName +' src=images/download.png width=35 height=35 border=0></td>');
	   	    	 }
	    	 
	       }
	}); 
}
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
  laypage({
	    cont: 'demo7'
	    ,pages:$("#pageNum").val()
	    ,skip: true
	    ,jump: function(obj, first){
	        if(!first){
	        	$("#onlineTable tbody").html(""); 
	           $.ajax({
	     	       type:"POST",
	     	       url: "user/targetList",
	     	       data:{pageNum:obj.curr,upType:"offline"
	     	       },
	     	       dataType:"json",
	     	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	     	       success:function(data){
	     	    	  for(var i=0;i<data.list.length;i++)
	    	   	    	 {  
	    	   	    		 
	    	   	    		$("#onlineTable tbody").append('<tr id='+i+'></tr>'); 
	    	   	    		$("#"+i).append('<td>'+data.list[i].fileName+'</td>');
	    	   	    		$("#"+i).append('<td>'+data.list[i].upgradeDate+'</td>');
	    	   	    		$("#"+i).append('<td><input onclick=download(this) name=imgbtn type=image id='+data.list[i].fileName +' src=images/download.png width=35 height=35 border=0></td>');
	    	   	    	 }
	     	    	 
	     	       }
	     	}); 
	         /*   va？r table = document.getElementById('onlineTable');
	           var row = document.getElementsByTagName('tbody')[0];
	           row.parentNode.removeChild(row); */
	            layer.msg('第 '+ obj.curr +' 页');
	        }
	    }
	  });
	  
	});
function download(num){
	var id=num.id;
	document.getElementById("fileName").value=id;
	$("#downloadForm").submit();
}

</script>

</body>
</html>