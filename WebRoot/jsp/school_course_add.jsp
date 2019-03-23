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
         <link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="css/pintuer.css">
        <link rel="stylesheet" href="css/admin.css">
        <script src="js/jquery.js"></script>
        <script src="js/pintuer.js"></script>
        <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
	</head>
	<body>
	<div class="panel admin-panel">
  <div class="panel-head" ><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">  
      <div class="form-group">
        <div class="label">
          <label>教师编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="tea_id" id="tea_id" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
<div class="form-group">
        <div class="label">
          <label>学生编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="stu_id" id="stu_id" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>上课时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="course_time" value="" name="course_time" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
            <div class="form-group">
        <div class="label">
          <label>结束时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="endTime" value="" name="endTime" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>科目：</label>
        </div>
        <div class="field">
   <select name="course_name" id="course_name" class="input"   style="width:200px; line-height:17px;display:inline-block">
            <option value="科目一">科目一</option>
            <option value="科目二">科目二</option>
            <option value="科目三">科目三</option>
            <option value="科目四">科目四</option>
          </select>          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="button" id="add"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
		
	</body>
    <script type="text/javascript">
    $(function(){
    	 $("#add").on('click',function(){
 			var tea_id=$("#tea_id").val();
 			var stu_id=$("#stu_id").val();
 			var course_time=$("#course_time").val();
 			var course_name=$("#course_name").val();
 			var endTime=$("#endTime").val();
 			layer.msg('上传数据中....', {
 				  icon: 16
 				  ,shade: 0.01
 				});
 			setTimeout(function(){
 				$.ajax({
 				       type:"POST",
 				       ansyc:false,
 				       url: "course/addSchoolCourse",
 				       data:{tea_id:tea_id,
 				    	     stu_id:stu_id,
 				    	    course_time:course_time,
 				    	   course_name:course_name,
 				    	   endTime:endTime
 				    	   },
 				       dataType:"json",
 				       contentType:"application/x-www-form-urlencoded;charset=utf-8",
 				       success:function(data){
 				    	   if(data.flag){
 				    		   layer.msg('添加成功');
 				    		   setTimeout(function(){
 				    			   parent.layer.closeAll();
 				    			 }, 2000);
 				    		   
 				    	   }
 				       }
 				});
 				 }, 2000);
 			
 			
 		});
    	
    	
    });
    </script>
    <script type="text/javascript">
    $(function(){
    	
    	
     	layui.use('laydate', function(){
  		  var laydate = layui.laydate;
  		  
  		  var start = {
  		    min: laydate.now()
  		    ,max: '2099-06-16 23:59:59'
  		    ,istoday: false
  		    ,choose: function(datas){
  		      end.min = datas; //开始日选好后，重置结束日的最小日期
  		      end.start = datas //将结束日的初始值设定为开始日
  		    }
  		  };
  		  
  		  var end = {
  		    min: laydate.now()
  		    ,max: '2099-06-16 23:59:59'
  		    ,istoday: false
  		    ,choose: function(datas){
  		      start.max = datas; //结束日选好后，重置开始日的最大日期
  		    }
  		  };
  		  
  
  	
  		});
    	
    });
    
    
    </script>
</html>