<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
						<span  class="choosed" >窩的名片</span>
						<p>travel alone not lonely</p>
					</header>
					<section class="block-body-user">
						<div class="row">
							<div class="col-md-6 col-md-offset-3-user-left">
								<div class="icon">
									<img id="pic" src="<%=request.getContextPath()%>${users.iconpath}">
								</div>
									<form id="uploadUserIconForm"  class="form-user-upload" enctype="multipart/form-data">  
   								 		<input  type="file" name="file"/>  
									</form>  
							
   								<button class="btn btn-o-white" id="uploadUserIcon">上传头像</button>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-md-offset-3-user-left">
								<h1>个人信息</h1>
								<form id="message_form" class="form-user" role="form">
									<div class="form-group">
								    	<label>昵称：</label>
								    	<input id="name" name="name" type="text" class="form-control-user form-control-white"  value="${users.name}" placeholder="Your Name" >
								    	<label id="name_error" class="lable-error" style="display:none;" >不能为空</label>
								  	</div>
								    <div class="form-group">
								    	<label>手机：</label>
								    	<input id="telemoble" name="telemoble"type="text" class="form-control-user form-control-white" value="${users.telemoble}"  placeholder="Enter email">
								    	<label id="telemoble_error" class="lable-error" style="display:none;">不能為空</label>
								    </div>
								    <div class="form-group">
								    	<label>邮箱：</label>
								    	<input id="email" name="email" type="text" class="form-control-user form-control-white" value="${users.email}" placeholder="Enter email" >
								    	<label id="email_error" class="lable-error" style="display:none;">不能為空</label>
								    </div>
								    <div class="form-group">
								    	<label>签名：</label>
								    		<textarea id="sign" name="sign"  class="form-control-user form-control-white" placeholder="Write Something" rows="10" >${users.sign}</textarea>
								    </div>
								    <div class="form-group">
								    	<label>阶级：</label>
								    	<input id="class" type="text" class="form-control-user form-control-white" value=""  readonly="true">
								    </div>
								    <div class="form-group">
								    	<label>积分：</label>
								    	<input id="score" type="text" class="form-control-user form-control-white" value="${users.score}" readonly="true">
								    </div>
								  <input id="modifyMessage_btn" type="button" class="btn btn-o-white" value="修改">
								  <input id="clear_btn" type="button" class="btn btn-o-white" value="清空">
								</form>
							</div>
							<div class="col-md-6 col-md-offset-3-user-right">
								<h1>紧急联系方式</h1>
								<form id="contact_form" class="form-user" role="form">
									<div class="form-group">
								    	<label>一般联系人：</label>
								    	<input id="contact1" name="contact1" type="text" class="form-control-user form-control-white" value="${users.contact1}"   >
								  	</div>
								    <div class="form-group">
								    	<label>特别联系人：</label>
								    	<input id="contact2" name="contact2"  type="text" class="form-control-user form-control-white" value="${users.contact2}"  >
								    </div>
								   
								 	<input id="modifyContact_btn" type="button" class="btn btn-o-white" value="修改">
								</form>
							</div>
							<div class="col-md-6 col-md-offset-3-user-right">
								<h1>修改密码</h1>
								<form id="password_form" class="form-user" role="form">
									<div class="form-group">
								    	<label>原密码：</label>
								    	<input id="original_password" name="original_password" type="password" class="form-control-user form-control-white"  required>
								    	<label id="original_password_error" class="lable-error" style="display:none;">不能為空</label>
								  	</div>
								    <div class="form-group">
								    	<label>新密码：</label>
								    	<input id="password" name="password"  type="password" class="form-control-user form-control-white"  required>
								    	<label id="password_error" class="lable-error" style="display:none;">不能為空</label>
								    </div>
								    <div class="form-group">
								    	<label>再输入：</label>
								    	<input id="repassword" name="repassword"  type="password" class="form-control-user form-control-white" required>
								    	<label id="repassword_error" class="lable-error" style="display:none;">不能為空</label>
								    </div>
								 	<input id="modifyPassworde_btn" type="button" class="btn btn-o-white" value="修改">
								</form>
							</div>
							
						</div>
						<div class="row">
							<div class="col-md-6 col-md-offset-3-user-left">
								<h1>实名验证</h1>
								<c:if test="${users.usertype=='U'}">
									<div class="form-group">
								    	<label>验证：</label>
								    		<input id="certification" name="certification"   class="form-control-user form-control-white" value="待验证"readonly="true" >
								  	</div>
								  	<div class="form-group">
										<form id="uploadForm"  class="form-user-upload" enctype="multipart/form-data">  
   								 			<input id="file"  type="file" name="file"/>  
										</form>  
									</div>
   									<button class="btn btn-o-white" id="doCertification">提交验证</button>
   								</c:if>
   								<c:if test="${users.usertype=='V'}">
									<div class="form-group">
								    	<label>验证：</label>
								    		<input id="certification" name="certification" class="form-control-user form-control-white" value="验证通过"readonly="true" >
								  	</div>
   								</c:if>
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
	<script type="text/javascript">
	var username = $('#username').text();
	
	if(username !=""){
		$('#logined_div').show();
		$('#user_div').show();
		$('#nologin_div').hide();
	}else{
		$('#nologin_div').show();
		$('#logined_div').hide();
		$('#user_div').hide();
	}
	
	$('#modifyMessage_btn').click(function(){
			var name=$("#name").val(); 
			var telemoble=$("#telemoble").val();  
    		var email=$("#email").val();
    		var error=""; 
    		
    		
    		$('#name_error').hide();
    		$('#telemoble_error').hide();
    		$('#email_error').hide();
   			//手机号
   			var mobileReg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
   			//中文英文数字[^\u4E00-\u9FA5A-Za-z0-9]/g
			var emailReg =/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;   	
					
			if(name==""){
			 	$('#name_error').show();
                 error="true";
			}
   			if(telemoble==""){
                 $('#telemoble_error').removeAttr("style");
                 $('#telemoble_error').text("不能为空");
                 error="true";
             }else if(telemoble.length !=11||!mobileReg.test(telemoble)){
                 $('#telemoble_error').removeAttr("style");
                 $('#telemoble_error').text("手机号格式不正确");
             	 error="true";
    		}
    		
    		if(email==""){
                 $('#email_error').removeAttr("style");
                 $('#email_error').text("不能为空");
                 error="true";
             }else if(email !=""){
                 if(!emailReg.test(email)){
             	 	$('#email_error').removeAttr("style");
             	 	
					$('#email_error').removeAttr("style");
                 	$('#email_error').text(" 邮箱格式不正确");
             	 	error="true";
             	}
             }
             
             if(error!=""){
             	return false;
             }
    		$.ajax({  
				data:$('#message_form').serialize()+"&type=m",       
        		type:"POST",  
     			datatype:'json',
        		url:"modifyMyssage",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        		
        			var json=JSON.parse(data);
        			console.log("data",data);
        			if(json.success=="1"){
        				alert("修改成功"); 
        			}else if(json.telemoble=="1"){
        				$('#telemoble_error').text(" 该手机号已被占用"); 
        			}else if(json.email=="1"){
        				$('#email_error').text(" 该邮箱已被占用"); 
        			}else if(json.email=="f"){
        				$('#email_error').text(" 无效邮箱"); 
        			}
        			else{
        				alert("修改失败"+json.msg); 
        			}
        	}  
     	});  
    });
    
     $('#modifyContact_btn').click(function(){
    		
    	var contact1=$("#contact1").val(); 
		var contact2=$("#contact2").val();  
    
    	$.ajax({  
			data:$('#contact_form').serialize()+"&type=c",      
        	type:"POST",  
     		dataType:'json',
        	url:"modifyMyssage",  
        	error:function(data){  
           		 alert("出错了！！:"+data);  
        	},  
        	success:function(data){  
       			if(data.success=="1"){
       				alert("修改成功"); 
        		}else{
       				alert("修改失败"); 
       			}
       	}  
    	});  
   });
    $('#modifyPassworde_btn').click(function(){
    		
    		var originALPassword=$("#original_password").val(); 
			var password=$("#password").val();  
    		var repassword=$("#repassword").val(); 
    		var error=""; 
    		
    		$('#original_password_error').hide();
    		$('#repassword_error').hide();
    		$('#password_error').hide();
    		
    		if(originALPassword==""){
    			$('#original_password_error').removeAttr("style");
    			$('#original_password_error').text(" 不能为空");
    			error="true";
    		}
    		
    		if(password==""){
    			$('#password_error').removeAttr("style");
    			$('#password_error').text(" 不能为空");
    			error="true";
    		}
    		if(password.length>15||password.length<6){//6-15
    			$('#password_error').removeAttr("style");
    			$('#password_error').text(" 密码为6-15位");
    			error="true";
  			}
  			if(password != repassword){//6-15
    			$('#repassword_error').removeAttr("style");
    			$('#repassword_error').text(" 两次密码不一致");
    			error="true";
  			}
  			 if(error!=""){
             	return false;
             }
    		$.ajax({  
				data:$('#password_form').serialize()+"&type=p",      
        		type:"POST",  
     			datatype:'json',
        		url:"modifyMyssage",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        			var json=JSON.parse(data);
        			console.log("data",json);
        			console.log("json.password",json.password);
        			if(json.success=="1"){
        				alert("修改成功"); 
        				$("#repassword").val(""); 
						$("#password").val("");  
    					$("#original_password").val("");
        			}else if(json.password=="f"){
        				$('#original_password_error').removeAttr("style");
    					$('#original_password_error').text(" 密码错误");
        					
        			}else{
        				alert("修改失败"); 
        			}
        	}  
     	});  
    });
    
     $("#doCertification").click(function () {  
            var formData = new FormData($('#uploadForm')[0]);  
            $.ajax({  
                type: 'post',  
                url: "doCertification",  
                data: formData,  
                cache: false,  
                dataType: "json", 
                processData: false,  
                contentType: false,  
            }).success(function (data) {  
                if(data.success=="true"){
                	$("#picpath").val(data.path);
                	$("#certification").val("验证通过");
                	$('#doCertification').hide();
                	$('#uploadForm').hide();
                }else{
                	alert("验证失败请重试"); 
                	$("#certification").val("验证失败请重试");
                }
            }).error(function () {  
                alert("上传失败");  
            });  
        }); 
       
        $("#uploadUserIcon").click(function () {  
            var formData = new FormData($('#uploadUserIconForm')[0]);  
            $.ajax({  
                type: 'post',  
                url: "uploadUserIcon",  
                data: formData,  
                cache: false,  
                dataType: "json", 
                processData: false,  
                contentType: false,  
            }).success(function (data) {  
                if(data.success=="true"){
                	$("#pic").attr("src","<%=request.getContextPath()%>"+data.path);
                }else{
                	alert("验证失败请重试"); 
                }
            }).error(function () {  
                alert("上传失败");  
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
	</script>

	</body>
</html>
