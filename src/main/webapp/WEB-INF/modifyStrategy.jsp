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
								    	<label>标&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp题：</label>
								    	<input id="title" name="title" type="text" class="form-control-strategy form-control-white" placeholder="游记标题">
								    	<label id="title_error" class="lable-error" style="display:none;" >不能为空</label>
							 		</div>
									<div class="form-group">
								    	<label>旅行地点：</label>
								    	<input id="site" name="site" type="text" class="form-control-strategy form-control-white"  placeholder="旅行地点" >
								    	<label id="site_error" class="lable-error" style="display:none;" >不能为空</label>
								  	</div>
								    <div class="form-group">
								    	<label>旅行时长：</label>
								    	<input id="duration" name="duration" type="text" class="form-control-strategy form-control-white"  placeholder="本次旅行一共几天">
								    	<label id="duration_error" class="lable-error" style="display:none;" >不能为空</label>
								    </div>
								    <div class="form-group">
								    	<label>图片：</label>
								    	<input id="picpath" name="picpath" type="text" class="form-control-strategy form-control-white"  placeholder="本次旅行一共几天">
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
								    		<input id="durationbottom_1" name="durationbottom" type="text" class="form-control-user-half form-control-white" placeholder="0">
								   		 		<span> ——</span>
								   			<input id="durationtop_1" name="durationtop" type="text" "  class="form-control-user-half form-control-white" placeholder="1">
								   			天
								   			<label id="duration_error_1" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								    	<div class="form-group">
								    		<label>出发地点：</label>
								    		<input id="departureplace_1" name="departureplace" type="text" class="form-control-strategy form-control-white" placeholder="出发地点：丽江火车站">
								    		<label id="departureplace_error_1" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								   		<div class="form-group">
								    		<label>目的地点：</label>
								    		<input id="destination_1" name="destination"  type="text" class="form-control-strategy form-control-white" placeholder="目的地：丽江古城" >
								    		<label id="destination_error_1" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								    	<div class="form-group">
								    		<label>交通方式：</label>
								    		<input id="transportation_1" name="transportation"  type="text" class="form-control-strategy form-control-white"  placeholder="交通方式：班次大巴（30分钟一班）9点发车 ">
								    		<label id="transportation_error_1" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								    	<div class="form-group">
								    		<label>游玩方式：</label>
								    		<textarea id="spot_1" name="content"  class="form-control-strategy form-control-white" placeholder="具体的玩点：1.白天去附近的茶马古道和琴海（白天古城人比较少）2.晚上一路逛古城去狮子山（免费）或者鼓楼（收费）去看古城夜景 3.逛完古城去酒吧（酒吧11点以后只能放歌不能唱，要早点去）" rows="10" required></textarea>
								    		<label id="spot_error_1" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								    	<hr style="color: white">
									</div >
									<div id ="schedul_2" class="schedul">
										<div class="form-group-button">
								    		<input id ="deleteSchedul_btn_2" type="button" class="btn btn-o-white" value="删除本项" onclick="deleteSchedul(2)">
								    	</div>
								    	<div class="form-group">
								    		<label>旅行时长：</label>
								    		第
								    		<input id="durationbottom_2" name="durationbottom" type="text" class="form-control-user-half form-control-white" placeholder="0">
								   		 		<span> ——</span>
								   			<input id="durationtop_2" name="durationtop" type="text" "  class="form-control-user-half form-control-white" placeholder="1">
								   			天
								   			<label id="duration_error_2" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								    	<div class="form-group">
								    		<label>出发地点：</label>
								    		<input id="departureplace_2" name="departureplace" type="text" class="form-control-strategy form-control-white" placeholder="出发地点：丽江火车站">
								    		<label id="departureplace_error_2" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								   		<div class="form-group">
								    		<label>目的地点：</label>
								    		<input id="destination_2" name="destination"  type="text" class="form-control-strategy form-control-white" placeholder="目的地：丽江古城" >
								    		<label id="destination_error_2" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								    	<div class="form-group">
								    		<label>交通方式：</label>
								    		<input id="transportation_2" name="transportation"  type="text" class="form-control-strategy form-control-white"  placeholder="交通方式：班次大巴（30分钟一班）9点发车 ">
								    		<label id="transportation_error_2" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								    	<div class="form-group">
								    		<label>游玩方式：</label>
								    		<textarea id="spot_2" name="content"  class="form-control-strategy form-control-white" placeholder="具体的玩点：1.白天去附近的茶马古道和琴海（白天古城人比较少）2.晚上一路逛古城去狮子山（免费）或者鼓楼（收费）去看古城夜景 3.逛完古城去酒吧（酒吧11点以后只能放歌不能唱，要早点去）" rows="10" required></textarea>
								    		<label id="spot_error_2" class="lable-error" style="display:none;" >不能为空</label>
								    	</div>
								    	<hr/>
									</div>
								</div>
							<div class="col-md-6-strategy">  
								<div class="schedul"> 
									<div class="form-group"> 
   										<img id="pic" class="upload-img" src=""/> 
   										</div>
   										<div class="form-group">
										<form id="uploadForm"  class="form-user" enctype="multipart/form-data">  
   								 				<input id="file"  type="file" name="file"/>  
										</form>  
										</div>
   										<button class="btn btn-o-white" id="upload">上传图片</button>
   										<hr/>
   									</div>
   							 	</div>
   							 	</div>
								<input id="add_schedul_btn" type="button" class="btn btn-o-white" value="添加规划">
							 	<input id="addStrategie_btn" type="button" class="btn btn-o-white" value="提交">
								<input id="clear_btn" type="button" class="btn btn-o-white" value="清空">
							</form>
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
		$("#deleteSchedul_btn_"+(schedulNum)).show();
	}
	
	$('#add_schedul_btn').click(function() {
		schedulNum+=1;
		var schedulDiv = 
			"						<div id =\"schedul_"+schedulNum+"\" class=\"schedul\">"+
			"							<div class=\"form-group-button\">"+
			"					    		<input id =\"deleteSchedul_btn_"+schedulNum+"\" type=\"button\" class=\"btn btn-o-white\" value=\"删除本项\"  onclick=\"deleteSchedul("+schedulNum+")\">"+
			"					    	</div>"+
			"							<div class=\"form-group\">"+
			"					    		<label>旅行时长：</label>"+
			"					    		第"+
			"					    		<input id=\"durationbottom_"+schedulNum+"\" name=\"durationbottom\" type=\"text\" class=\"form-control-user-half form-control-white\" placeholder=\"0\">"+
			"					   		 		<span> ——</span>"+
			"					   			<input id=\"durationtop_"+schedulNum+"\" name=\"durationtop\" type=\"text\"  class=\"form-control-user-half form-control-white\" placeholder=\"1\">"+
			"					   			天"+
			"					   			<label id=\"duration_error_"+schedulNum+"\" class=\"lable-error\" style=\"display:none;\" >不能为空</label>"+
			"					    	</div>"+
			"					    	<div class=\"form-group\">"+
			"					    		<label>出发地点：</label>"+
			"					    		<input id=\"departureplace_"+schedulNum+"\" name=\"departureplace\" type=\"text\" class=\"form-control-strategy form-control-white\" placeholder=\"出发地点：丽江火车站\">"+
			"					    		<label id=\"departureplace_error_"+schedulNum+"\" class=\"lable-error\" style=\"display:none;\" >不能为空</label>"+
			"					    	</div>"+
			"					   		<div class=\"form-group\">"+
			"					    		<label>目的地点：</label>"+
			"					    		<input id=\"destination_"+schedulNum+"\" name=\"destination\"  type=\"text\" class=\"form-control-strategy form-control-white\" placeholder=\"目的地：丽江古城\" >"+
			"					    		<label id=\"destination_error_"+schedulNum+"\" class=\"lable-error\" style=\"display:none;\" >不能为空</label>"+
			"					    	</div>"+
			"					    	<div class=\"form-group\">"+
			"					    		<label>交通方式：</label>"+
			"					    		<input id=\"transportation_"+schedulNum+"\" name=\"transportation\"  type=\"text\" class=\"form-control-strategy form-control-white\"  placeholder=\"交通方式：班次大巴（30分钟一班）9点发车 \">"+
			"					    		<label id=\"transportation_error_"+schedulNum+"\" class=\"lable-error\" style=\"display:none;\" >不能为空</label>"+
			"					    	</div>"+
			"					    	<div class=\"form-group\">"+
			"					    		<label>游玩方式：</label>"+
			"					    		<textarea id=\"spot_"+schedulNum+"\" name=\"content\"  class=\"form-control-strategy form-control-white\" placeholder=\"具体的玩点：1.白天去附近的茶马古道和琴海（白天古城人比较少）2.晚上一路逛古城去狮子山（免费）或者鼓楼（收费）去看古城夜景 3.逛完古城去酒吧（酒吧11点以后只能放歌不能唱，要早点去）\" rows=\"10\" required></textarea>"+
			"					    		<label id=\"spot_error_"+schedulNum+"\" class=\"lable-error\" style=\"display:none;\" >不能为空</label>"+
			"					    	</div>"+
			"					    	<hr/>"+
			"						</div>";
			
			$("#scheduls").append($(schedulDiv));
			$("#deleteSchedul_btn_"+(schedulNum-1)).hide();
	});
	
	$('#addStrategie_btn').click(function(){
			var error="";
			var title=$("#title").val();  
			var site=$("#site").val();  
    		var duration=$("#duration").val(); 
    		var picpath=$("#picpath").val(); 
    		var content= "";
   			if(title==""){
   				error="true";
   				$('#title_error').show(); 
   			}else{
   				$('#title_error').hide();
   			}
   			if(site==""){
   				error="true";
   				$('#site_error').show(); 
   				
   			}else{
   				$('#site_error').hide();
   			}
   			if(duration==""){
   				error="true";
   				$('#duration_error').show();
   			}else{
   				$('#duration_error').hide();
   			}
   			
   			
   			for(var i= 1 ; i<=schedulNum;i++){
   				
				var durationbottom=$("#durationbottom_"+i).val();  
				var durationtop=$("#durationtop_"+i).val();  
    			var departureplace=$("#departureplace_"+i).val(); 
    			var destination=$("#destination_"+i).val(); 
   				var transportation=$("#transportation_"+i).val(); 
   				var spot=$("#spot_"+i).val(); 
   				content+="<*--*--*>"+
   					"durationbottom:"+durationbottom+";"+
   					"durationtop:"+durationtop+";"+
   					"departureplace:"+departureplace+";"+
   					"transportation:"+transportation+";"+
   					"spot:"+spot;
   				if(durationbottom==""||durationtop==""){
   					error="true";
   					$('#duration_error_'+i).show();
   				}else{
   					$('#duration_error_'+i).hide();
   				}
   				if(departureplace==""){
   					error="true";
   					$('#departureplace_error_'+i).show();
   				}else{
   					$('#departureplace_error_'+i).hide();
   				}
   				if(destination==""){
   					error="true";
   					$('#destination_error_'+i).show();
   				}else{
   					$('#destination_error_'+i).hide();
   				}
   				if(transportation==""){
   					error="true";
   					$('#transportation_error_'+i).show();
   				}else{
   					$('#transportation_error_'+i).hide();
   				}
   				if(spot==""){
   					error="true";
   					$('#spot_error_'+i).show();
   				}else{
   					$('#spot_error_'+i).hide();
   				}
   			
   			}
   			if(error != ""){
   				return false;
   			}
   			
   			
    		$.ajax({  
				data:"title="+title+
						"&site="+site+ 
						"&duration="+duration+ 
						"&picpath="+picpath+ 
						"&content="+content,
        		type:"POST",  
     			datatype:'json',
        		url:"addStrategy",  
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
                alert(data); 
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
