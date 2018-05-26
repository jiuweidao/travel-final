<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<!--[if IE 7 ]><html class="ie ie7 lte9 lte8 lte7" lang="en-US"><![endif]-->
<!--[if IE 8]><html class="ie ie8 lte9 lte8" lang="en-US">	<![endif]-->
<!--[if IE 9]><html class="ie ie9 lte9" lang="en-US"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="noIE" lang="en-US">
<!--<![endif]-->
	<head>
		<title>Flusk</title>

		<!-- meta -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no"/>
		
		<!-- google fonts -->
		<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans'>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Serif:regular,bold"/>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Alegreya+Sans:regular,italic,bold,bolditalic"/>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Nixie+One:regular,italic,bold,bolditalic"/>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Alegreya+SC:regular,italic,bold,bolditalic"/>
		
		<!-- css -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/style.css" media="screen"/>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.js"></script>
			<script src="assets/js/respond.js"></script>
		<![endif]-->

		<!--[if IE 8]>
	    	<script src="assets/js/selectivizr.js"></script>
	    <![endif]-->
	</head>
	
	<body>
		<jsp:include   page="sidebar.jsp" flush="true"/>
		<div id="wrapper">
			<jsp:include   page="header.jsp" flush="true"/>

			<div class="content-block" id="contact">
				<div class="login-container text-center">
					<header class="block-heading cleafix">
						<span  class="choosed" >修改邀約</span>
						<p>travel alone not lonely</p>
					</header>
				<section class="block-body-user">
						<div class="row">
						<form id="form" class="form-user" role="form">
							<div class="col-md-6 col-md-offset-3-user-left">
									<div class="form-group">
								    	<label>邀约标题：</label>
								    	<input id="title" name="title" type="text" class="form-control-user form-control-white" value="${plans.title}"  placeholder="搭车西藏七日">
								    	<label id="title_error" class="lable-error" style="display:none;" >不能为空</label>
							 		</div>
									<div class="form-group">
								    	<label>旅行标签：</label>
								    	<input id="tag" name="tag" type="text" class="form-control-user form-control-white" value="${plans.tag}" placeholder="搭车西藏游" >
								    	<label id="tag_error" class="lable-error"  style="display:none;">不能為空</label>
								  	</div>
								    <div class="form-group">
								    	<label>开始时间：</label>
								    	 <input id="departuretime" name="departuretime"  type="text" class="form-control-user form-control-white" value="${plans.strdeparturetime}" >
								    	<label id="departuretime_error" class="lable-error"  style="display:none;">不能為空</label>
								    </div>
								    <div class="form-group">
								    	<label>结束时间：</label>
								    	<input id="endtime" name="endtime"  type="text" class="form-control-user form-control-white" value="${plans.strendtime}" >
								    	<label id="email_error" class="lable-error"  style="display:none;">不能為空</label>
								    </div>
								    <div class="form-group">
								    	<label>出发地点：</label>
								    	<input id="departureplace" name="departureplace" type="text" class="form-control-user form-control-white" value="${plans.departureplace}" placeholder="武汉">
								    	<label id="departureplace_error" class="lable-error" style="display:none;">不能為空</label>
								    </div>
								    <div class="form-group">
								    	<label>目的地点：</label>
								    	<input id="destination" name="destination"  type="text" class="form-control-user form-control-white"  value="${plans.destination}" placeholder="西藏" >
								    	<label id="destination_error" class="lable-error"  style="display:none;">不能為空</label>
								    </div>
								    <div class="form-group">
								    	<label>期望人数：</label>
								    	<input id="expectnum" name="expectnum"  type="text" class="form-control-user form-control-white" value="${plans.expectnum}" placeholder="20">
								    	<label id="expectnum_error" class="lable-error"  style="display:none;">不能為空</label>
								    </div>
								    <div class="form-group">
								    	<label>旅行预算：</label>
								    	<input id="budgetbottom" name="budgetbottom" type="text" class="form-control-user-half form-control-white" value="${plans.budgetbottom}"   placeholder="3000/人">
								   		 <span> ——</span>
								   		<input id="budgettop" name="budgettop" type="text" "  class="form-control-user-half form-control-white" value="${plans.budgettop}" placeholder="6000/人">
								    </div>
								      <div class="form-group">
								      <input id="picpath" name ="picpath" value="${plans.picpath}" type="text" style="visibility:hidden"/>  
								    </div>
								  <input id="addplan_btn" type="button" class="btn btn-o-white" value="提交">
								  <input id="clear_btn" type="button" class="btn btn-o-white" value="清空">
							</div>
							<div class="col-md-6 col-md-offset-3-user-left">
								<h1>详细说明：</h1>
								<label id="content_error" class="lable-content-error" style="display:none;">不能為空</label>
								<div class="form-group">
								    	<textarea id="content" name="content"  class="form-control form-control-white" placeholder="Write Something" rows="10" >${plans.detail} </textarea>
								</div>
							</div>
							
							</form>
							<div class="col-md-6 col-md-offset-3-user-left">
   								<img id="pic" class="upload-img" src="<%=request.getContextPath()%>${plans.picpath}"/> 
   							</div>
							<form id="uploadForm"  class="form-user" enctype="multipart/form-data">  
								<div class="col-md-6 col-md-offset-3-user-right">
   								 <input id="file"  type="file" name="file"/>  
   								 </div>
							</form>  
							<div class="col-md-6 col-md-offset-3-user-left">
   								<button class="btn btn-o-white" id="upload">上传图片</button>
   							 </div>
							</div>
					</section>
				</div>
			</div><!-- #contact -->

			<jsp:include   page="footer.jsp" flush="true"/>
		</div><!--/#wrapper-->




		<script src="assets/js/jquery-2.1.3.min.js"></script>
		<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.actual.min.js"></script>
		<script src="assets/js/jquery.scrollTo.min.js"></script>
		<script src="assets/js/script.js"></script>
		<script src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	
	$('#addplan_btn').click(function(){
			var error="";
			var tag=$("#tag").val();  
			var title=$("#title").val();  
    		var departuretime=$("#departuretime").val(); 
    		var departureplace=$("#departureplace").val(); //出发时间 
    		var destination=$("#destination").val();	   //目的地
   			var expectnum=$("#expectnum").val();
   			var content=$("#content").val();
   			if(tag==""){
   				error="true";
   				$('#tag_error').show(); 
   			}else{
   				$('#tag_error').hide();
   			}
   			if(title==""){
   				error="true";
   				$('#title_error').show(); 
   				
   			}else{
   				$('#title_error').hide();
   			}
   			if(departuretime==""){
   				error="true";
   				$('#departuretime_error').show();
   			}else{
   				$('#departuretime_error').hide();
   			}
   			if(departureplace==""){
   				error="true";
   				$('#departureplace_error').show();
   			}else{
   				$('#departureplace_error').hide();
   			}
   			if(destination==""){
   				error="true";
   				$('#destination_error').show();
   			}else{
   				$('#destination_error').hide();
   			}
   			if(expectnum==""){
   				error="true";
   				$('#expectnum_error').show();
   			}else{
   				$('#expectnum_error').hide();
   			}
   			if(content==""){
   				error="true";
   				$('#content_error').show();
   			}else{
   				$('#content_error').hide();
   			}
   			
   			if(error != ""){
   				return false;
   			}
   			
   			
    		$.ajax({  
				data:$('#form').serialize(),      
        		type:"POST",  
     			datatype:'json',
        		url:"modify?id=${plans.id}",   
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        			var json=JSON.parse(data);
        			if(json.success=="1"){
        				alert("修改成功"); 
        				window.location.href ="<%=request.getContextPath()%>" + "/plandetail?id="+${plans.id};
        			}else{
        				alert("修改失败"+json.msg); 
        			}
        		
        	}  
     	});  
	});

	$('#clear_btn').click(function(){
			$("#title").val("");  
			$("#tag").val(""); 
    		$("#departuretime").val(""); 
    		$("#departureplace").val(""); //出发时间 
    		$("#destination").val("");	   //目的地
   			$("#expectnum").val("");
   			$("#content").val("");
   			$("#endtime").val("");
   			$("#budgetbottom").val("");
   			$("#budgettop").val("");
     	 
     	 
     	 
	});
	
	$("#upload").click(function () {  
          var formData = new FormData($('#uploadForm')[0]);  
            $.ajax({  
                type: 'post',  
                url: "uploadImg.html",  
                data: formData,  
                cache: false,  
                dataType: "json", 
                processData: false,  
                contentType: false,  
            }).success(function (data) {  
                if(data.success=="true"){
                	$("#picpath").val(data.path);
                	$("#pic").attr("src","<%=request.getContextPath()%>"+data.path);
                }
            }).error(function () {  
                alert("上传失败");  
            });  
        }); 
	</script>
	</body>
</html>
