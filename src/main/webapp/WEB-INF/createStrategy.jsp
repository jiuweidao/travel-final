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
		<div id="drawer-right">
			<div class="cross text-right">
				<a class="toggleDrawer" href="#"><i class="fa fa-times-circle fa-2x"></i></a>
			</div>
			<h2>我的窝</h2>
			
				<ul class="nav nav-pills nav-stacked">
					<li>
						<a href="<%=basePath%>myMessage"><i class="fa fa-home"></i> 个人名片</a>
					</li>
					<li>
						<a href="<%=basePath%>createPlan"><i class="fa fa-bookmark"></i> 发起邀约</a>
					</li>
					<li>
						<a href="<%=basePath%>myplans"><i class="fa fa-tasks"></i> 我的邀约</a>
					</li>
					<li>
						<a href="<%=basePath%>myappplans"><i class="fa fa-wordpress"></i> 我的申请</a>
					</li>
					<li>
						<a href="#parallax"><i class="fa fa-heart"></i> 撰写游记</a>
					</li>
					<li>
						<a href="#testimonials"><i class="fa fa-thumbs-up"></i> Testimonials</a>
					</li>
					<li>
						<a href="#contact"><i class="fa fa-phone-square"></i> Contact</a>
					</li>
				</ul>
			<div class="social">
				<h2>Stay Connected</h2>
				<ul>
					<li><a href=""><i class="fa fa-facebook-square fa-3x"></i></a></li>
					<li><a href=""><i class="fa fa-twitter-square fa-3x"></i></a></li>
					<li><a href=""><i class="fa fa-tumblr-square fa-3x"></i></a></li>
					<li><a href=""><i class="fa fa-google-plus-square fa-3x"></i></a></li>
				</ul>
			</div>
		</div><!-- #drawer-right -->
		<div id="wrapper">
			<div id="header" class="content-block header-wrapper">
				<div class="header-wrapper-inner">
					<section class="top clearfix">
						<div class="pull-left">
							<h1><a class="logo">独步</a></h1>
						</div>
						<div id="user_div" class="pull-right"  style="display: none">
							<a class="toggleDrawer" href="#"><i class="fa fa-bars fa-2x"></i></a>
						</div>
						<div id="nologin_div" class="pull-right">
							<a class="logo" href="login">登录/注册</a>
						</div>
						<div id="logined_div" class="pull-right" style="display: none">
							<span  id="username" class="logo" href="login">${username}</span>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">出行交通</a>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">所有邀约</a>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">出行游记</a>
						</div>
						<div class="pull-right">
							<a class="logo" href="index.html">首页</a>
						</div>
					</section>
				</div>
			</div><!-- header -->

			<div class="content-block" id="contact">
				<div class="login-container text-center">
					<header class="block-heading cleafix">
						<span  class="choosed" >撰写游记</span>
						<p>travel alone not lonely</p>
					</header>
					<section class="block-body-user">
						<div class="row">
							<form id="form" class="form-user" role="form">
							<div class="col-md-6-strategy">
								<h2>基本信息</h2>
								<div class="basic">
									<div class="form-group">
								    	<label>标&nbsp &nbsp&nbsp&nbsp&nbsp题：</label>
								    	<input id="title" name="title" type="text" class="form-control-strategy form-control-white" placeholder="游记标题">
								    	<a id="title_error" style="display:none;" >不能为空</a>
							 		</div>
									<div class="form-group">
								    	<label>旅行地点：</label>
								    	<input id="tag" name="tag" type="text" class="form-control-strategy form-control-white"  placeholder="旅行地点" ><label id="name_error" style="display:none;">不能為空</label>
								  	</div>
								    <div class="form-group">
								    	<label>旅行时长：</label>
								    	<input id="departuretime" name="departuretime" type="text" class="form-control-strategy form-control-white"  placeholder="本次旅行一共几天">
								    	<label id="telemoble_error" style="display:none;">不能為空</label>
								    </div>
								 </div>
								 <hr style="border-top: 1px solid white;"/>
						    </div>
							<div id ="scheduls"class="col-md-6-strategy">  
								<h2>详细规划</h2>  
									<div id ="schedul_1" class="schedul">
								    	<div class="form-group">
								    		<label>旅行时长：</label>
								    		第
								    		<input id="budgetbottom" name="budgetbottom" type="text" class="form-control-user-half form-control-white" placeholder="0">
								   		 		<span> ——</span>
								   			<input id="budgettop" name="budgettop" type="text" "  class="form-control-user-half form-control-white" placeholder="1">
								   			天
								    	</div>
								    	<div class="form-group">
								    		<label>出发地点：</label>
								    		<input id="departureplace" name="departureplace" type="text" class="form-control-strategy form-control-white" placeholder="出发地点：丽江火车站">
								    	</div>
								   		<div class="form-group">
								    		<label>目的地点：</label>
								    		<input id="destination" name="destination"  type="text" class="form-control-strategy form-control-white" placeholder="目的地：丽江古城" >
								    	</div>
								    	<div class="form-group">
								    		<label>交通方式：</label>
								    		<input id="expectnum" name="expectnum"  type="text" class="form-control-strategy form-control-white"  placeholder="交通方式：班次大巴（30分钟一班）9点发车 ">
								    	</div>
								    	<div class="form-group">
								    		<label>游玩方式：</label>
								    		<textarea id="content" name="content"  class="form-control-strategy form-control-white" placeholder="具体的玩点：1.白天去附近的茶马古道和琴海（白天古城人比较少）2.晚上一路逛古城去狮子山（免费）或者鼓楼（收费）去看古城夜景 3.逛完古城去酒吧（酒吧11点以后只能放歌不能唱，要早点去）" rows="10" required></textarea>
								    	</div>
								    	<hr style="color: white">
									</div >
									<div id ="schedul_2" class="schedul">
										<div class="form-group-button">
								    		<input type="button" class="btn btn-o-white" value="删除本项" onclick="deleteSchedul(2)">
								    	</div>
								    	<div class="form-group">
								    		<label>旅行时长：</label>
								    		第
								    		<input id="budgetbottom" name="budgetbottom" type="text" class="form-control-user-half form-control-white">
								   		 		<span> ——</span>
								   			<input id="budgettop" name="budgettop" type="text" "  class="form-control-user-half form-control-white">
								   			天
								    	</div>
								    	<div class="form-group">
								    		<label>出发地点：</label>
								    		<input id="departureplace" name="departureplace" type="text" class="form-control-strategy form-control-white" >
								    	</div>
								   		<div class="form-group">
								    		<label>目的地点：</label>
								    		<input id="destination" name="destination"  type="text" class="form-control-strategy form-control-white" >
								    	</div>
								    	<div class="form-group">
								    		<label>交通方式：</label>
								    		<input id="expectnum" name="expectnum"  type="text" class="form-control-strategy form-control-white">
								    	</div>
								    	<div class="form-group">
								    		<label>游玩方式：</label>
								    		<textarea id="content" name="content"  class="form-control-strategy form-control-white" placeholder="Write Something" rows="10" required></textarea>
								    	</div>
								    	<hr/>
									</div>
								</div>
								<input id="add_schedul_btn" type="button" class="btn btn-o-white" value="添加规划">
							 	<input id="addplan_btn" type="button" class="btn btn-o-white" value="提交">
								<input id="clear_btn" type="button" class="btn btn-o-white" value="清空">
							</form>
						</div>
					</section>
				</div>
			</div><!-- #contact -->

			<div class="content-block" id="footer">
				<div class="container">
					<div class="row">
						<div class="col-xs-6">&copy; Copyright Flusk 2014</div>
					<!-- 	<div class="col-xs-6 text-right">Theme ThemeWagon.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></div>
				 -->	</div>
				</div>
			</div><!-- #footer -->
		</div><!--/#wrapper-->

		<script src="assets/js/jquery-2.1.3.min.js"></script>
		<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.actual.min.js"></script>
		<script src="assets/js/jquery.scrollTo.min.js"></script>
		<script src="assets/js/script.js"></script>
		<script src="js/datePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	var username = $('#username').text();
	
	var schedulNum=2;
	if(username !=""){
		$('#logined_div').show();
		$('#user_div').show();
		$('#nologin_div').hide();
	}else{
		$('#nologin_div').show();
		$('#logined_div').hide();
		$('#user_div').hide();
	}
	function deleteSchedul(id){
		$('#schedul_'+id).remove();
		schedulNum-=1;
	}
	
	$('#add_schedul_btn').click(function() {
		schedulNum+=1;
		var schedulDiv = 
			"						<div id =\"schedul_"+schedulNum+"\" class=\"schedul\">"+
			"							<div class=\"form-group-button\">"+
			"					    		<input type=\"button\" class=\"btn btn-o-white\" value=\"删除本项\"  onclick=\"deleteSchedul("+schedulNum+")\">"+
			"					    	</div>"+
			"					    	<div class=\"form-group\">"+
			"					    		<label>旅行时长：</label>"+
			"					    		第"+
			"					    		<input id=\"budgetbottom\" name=\"budgetbottom\" type=\"text\" class=\"form-control-user-half form-control-white\">"+
			"					   		 		<span> ——</span>"+
			"					   			<input id=\"budgettop\" name=\"budgettop\" type=\"text\"   class=\"form-control-user-half form-control-white\">"+
			"					   			天"+
			"					    	</div>"+
			"					    	<div class=\"form-group\">"+
			"					    		<label>出发地点：</label>"+
			"					    		<input id=\"departureplace\" name=\"departureplace\" type=\"text\" class=\"form-control-strategy form-control-white\">"+
			"					    	</div>"+
			"					   		<div class=\"form-group\">"+
			"					    		<label>目的地点：</label>"+
			"					    		<input id=\"destination\" name=\"destination\"  type=\"text\" class=\"form-control-strategy form-control-white\">"+
			"					    	</div>"+
			"					    	<div class=\"form-group\">"+
			"					    		<label>交通方式：</label>"+
			"					    		<input id=\"expectnum\" name=\"expectnum\"  type=\"text\" class=\"form-control-strategy form-control-white\">"+
			"					    	</div>"+
			"					    	<div class=\"form-group\">"+
			"					    		<label>游玩方式：</label>"+
			"					    		<textarea id=\"content\" name=\"content\"  class=\"form-control-strategy form-control-white\" placeholder=\"Write Something\" rows=\"10\" required></textarea>"+
			"					    	</div>"+
			"					    	<hr/>"+
			"						</div>";
			
			$("#scheduls").append($(schedulDiv));
	});
	
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
        		url:"addPlan",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        			var json=JSON.parse(data);
        			if(json.success=="1"){
        				alert("創建成功"); 
        				window.location.href ="<%=request.getContextPath()%>" + "/myplans"
        			}else if(json.mobile=="1"){
        				alert("该手机号已经被占用"); 
        					
        			}else if(json.userName=="1"){
        				alert("该用户名已经被占用"); 
        			}else{
        				alert("注册失败"+json.msg); 
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
