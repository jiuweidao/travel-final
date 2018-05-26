<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Marble &mdash; Free HTML5 Bootstrap Website Template by FreeHTML5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	

  	

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<script src="<%=basePath%>js/datePicker/WdatePicker.js?v=${staticVersion}"
	type="text/javascript"></script>
	</head>
	<body>
	<div id="fh5co-page">
		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
		<aside id="fh5co-aside" role="complementary" class="border js-fullheight">

			<h1 id="fh5co-logo"><a href="index.html">独步</a></h1>
			<nav id="fh5co-main-menu" role="navigation">
				<ul>
					<li class="fh5co-active"><a href="index.html">首页</a></li>
					<li><a href="allPlans">所有邀约</a></li>
					<li><a href="portfolio.html">出行游记</a></li>
					<div id="nologin" style="display:none;">
						<li><a href="<%=basePath%>login">登陆</a></li>
						<li><a href="<%=basePath%>register">注册</a></li>
					</div>
					<div id="logined" style="display:none;">
						<li class="fh5co-active"> <a> 我的窝</a></li>
						<li><a id="username" href="<%=basePath%>myMessage">${username}</a></li>
						<li><a  href="<%=basePath%>createPlan">我要出游</a></li>
						<li class="fh5co-active"><a  href="<%=basePath%>myplans">我的邀约</a></li>
						<li><a  href="<%=basePath%>myappplans">我的申请</a></li>
						<li><a id="logout_btn" href="" >退出登录</a></li>
					</div>
				</ul>
			</nav>

			<div class="fh5co-footer">
				<ul>
					<li><a href="#"><i class="icon-facebook2"></i></a></li>
					<li><a href="#"><i class="icon-twitter2"></i></a></li>
					<li><a href="#"><i class="icon-instagram"></i></a></li>
					<li><a href="#"><i class="icon-linkedin2"></i></a></li>
				</ul>
			</div>

		</aside>

		<div id="fh5co-main">
		
			<form id="form">
			<div class="fh5co-narrow-content" style="box-sizing:content-box;">
					<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">
						标题：<input id="title" name="title" type="text" class="input_plan"value="${plans.title}"><a id="title_error" style="display:none;" >不能为空</a>
					</h2>
					<div class="row">
						<div class="col-md-6">
							<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-settings"></i>
								</div>
								<div class="fh5co-text">
								
									<h3>旅行标签：<input id="tag" name="tag"type="text" " class="input_plan" value="${plans.tag}">*<a id="tag_error" style="display:none;" >不能为空</a></h3>
									<h3>开始时间：<input id="departuretime" name="departuretime"type="text" value="${plans.strdeparturetime}" onclick="WdatePicker({skin:'whyGreen',readOnly:'readOnly',highLineWeekDay:true,dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})" readonly="readonly"  class="input_plan">*<a id="departuretime_error" style="display:none;" >不能为空</a></h3>
									<h3>结束时间：<input id="endtime" type="text"  name="endtime" value="${plans.strendtime}" onclick="WdatePicker({skin:'whyGreen',readOnly:'readOnly',highLineWeekDay:true,dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})" readonly="readonly"  class="input_plan"></h3>
									<h3>出发地点：<input id="departureplace" name="departureplace" type="text" " class="input_plan"value="${plans.departureplace}">*<a id="departureplace_error" style="display:none;" >不能为空</a></h3>
									<h3>目的地点：<input id="destination" name="destination" type="text" " class="input_plan"value="${plans.destination}">*<a id="destination_error" style="display:none;" >不能为空</a></h3>
									<h3>期望人数：<input id="expectnum" name="expectnum" type="text" " class="input_plan"value="${plans.expectnum}">*<a id="expectnum_error" style="display:none;" >不能为空</a></h3>
									<h3>旅行预算：<input id="budgetbottom"name="budgetbottom"  type="text" " class="halfinput_plan"value="${plans.budgetbottom}">——<input id="budgettop" name="budgettop" type="text" "  class="halfinput_plan"value="${plans.budgettop}"></h3>
									<p></p>
									<p><a id="updateplan_btn" href="#" class="btn btn-primary">修改邀约</a> <a id="clear_btn" href="#" class="btn btn-primary">清空数据</a></p>
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">
								<div class="fh5co-icon">
									<i class="icon-settings"></i>
								</div>
								<div class="fh5co-text">
									<h3>详细说明：*<a id="content_error" style="display:none;" >不能为空</a></h3>
									<textarea id="content"name="content" class="content_plan" rows="10" id="content" >${plans.detail}</textarea>
									<%-- <form action="<%=basePath%>uploadImg.html" httpMethod="post" enctype="multipart/form-data">
  										<input type="file" name="testfile"/>
  										<button type="submit">提交</button>
										</form>
									<form name="Form2" action="<%=basePath%>springUpload"   enctype="multipart/form-data">
<h1>使用spring mvc提供的类的方法上传文件</h1>
<input type="file" name="file">
<input type="submit" value="upload"/>
								</form>> --%>
								</div>
							</div>
						</div>
						
					
					</div>
				</div>
		
			
				</form>
						
					
			
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="js/main.js"></script>
<script type="text/javascript">
	var username = $('#username').text();
	
	if(username !=""){
		$('#logined').show();
		$('#nologin').hide();
	}else{
		$('#nologin').show();
		$('#logined').hide();
	}
	$('#updateplan_btn').click(function(){
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
        		url:"modify?id="+"${plans.id}",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        		
        		
        			var json=JSON.parse(data);
        			if(json.success=="1"){
        				alert("修改成功"); 
        				window.location.href ="<%=request.getContextPath()%>" + "/myplans";
        			}else{
        				alert("修改失败"+json.msg); 
        			}
        			
        		
        	}  
     	});  
	});
		$('#logout_btn').click(function() {
	$.ajax({ 
		type: "post", 
		url: "<%=request.getContextPath()%>" + "/logout", 
		data: {}, 
		dataType: "json", 
		success: function(data) { 
			window.location.href = "<%=request.getContextPath()%>" +  "/login";
		},
		error: function(data) { 
			alert("调用失败...."); 
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
	
	function setImg(obj){//用于进行图片上传，返回地址
            var f=$(obj).val();
            if(f == null || f ==undefined || f == ''){
                return false;
            }
            if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
            {
                alert("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
                $(obj).val('');
                return false;
            }
            var data = new FormData();
            $.each($(obj)[0].files,function(i,file){
                data.append('file', file);
            });
            $.ajax({
                type: "POST",
                url: "uploadImg.html",
                data: f,
                cache: false,
                contentType: false,    //不可缺
                processData: false,    //不可缺
                dataType:"json",
                success: function(suc) {
                    if(suc.code==0){
                            $("#thumbUrl").val(suc.message);//将地址存储好
                            $("#thumburlShow").attr("src",suc.message);//显示图片                                                              
                        }else{
                        alert("上传失败");
                        $("#url").val("");
                        $(obj).val('');
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("上传失败，请检查网络后重试");
                    $("#url").val("");
                    $(obj).val('');
                }
            });
        }
	</script>
	</body>
</html>

