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
						<span  class="choosed" >举报</span>
						<p>travel alone not lonely</p>
					</header>
					<section class="block-body-user">
						<div class="row">
							<div id ="scheduls"class="col-md-6-strategy">  
								<div  class="schedul">
								   	<div class="form-group">
								   		<label>举报用户：</label>
								   		<input name="departureplace" type="text" class="form-control-strategy form-control-white valid"  value="${name}">
								   	</div>
								   	<div class="form-group">
								    	<label>举报原因：</label>
								    	<textarea id="content" name="content"  class="form-control-strategy form-control-white valid" rows="10" required></textarea>
								    	<label id="content_error" class="lable-error" style="display:none;" >不能为空</label>
								    </div>
								    <hr style="color: white">
								</div >
							</div>
							<input id="addReport_btn" type="button" class="btn btn-o-white" value="提交">
						<input id="clear_btn" type="button" class="btn btn-o-white" value="清空">
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
	
	$('#addReport_btn').click(function(){
		if(username==""){
			alert("请先登录");
			return;
		}
		if("${me.usertype}"=="U"){
			alert("实名认证后才能发起邀约");
			return;
		}
    	var content= $("#content").val(); ;
   		if(content==""){
   			$('#content_error').show(); 
   		}else{
   			$('#content_error').hide();
   		}
   			
    	$.ajax({  
			data:"id=${id}"+ "&content="+content,
        	type:"POST",  
     		dataType: "json", 
        	url:"addReport",  
        	error:function(data){  
           		 alert("出错了！！:"+data);  
        	},  
        	success:function(data){  
        		if(data.success=="1"){
        			alert("创建成功"); 
        		}else {
        			alert("创建失败"); 
        		}
        	},
        	error: function(data) { 
				alert("调用失败...."); 
			}
     	});  
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
