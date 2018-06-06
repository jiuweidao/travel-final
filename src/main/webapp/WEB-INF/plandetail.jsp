<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
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
	
		<!-- css -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/style.css" media="screen"/>
		<link rel="stylesheet" href="css/paging.css">
 		<link rel="stylesheet" href="css/timeline.css">
		<link rel="shortcut icon" href="../favicon.ico"> 

		<link rel="stylesheet" type="text/css" href="css/style1.css" />

		<script src="js/modernizr.custom.63321.js"></script>
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

			<div class="content-block-plans" id="blog">
				<div class="container">
					<div id="fh5co-main">
						<div class="row row-bottom-padded-md">
							<div class="col-md-6-plan-pic animate-box" data-animate-effect="fadeInLeft" >
								<c:if test='${plans.picpath == null||plans.picpath == ""}'>
									<img src="assets/images/bike_water1-1000x600.jpg">
								</c:if>
								<c:if test='${plans.picpath != null && plans.picpath != ""}'>
									<img src="<%=request.getContextPath()%>${plans.picpath}">
								</c:if>
							</div>
				
							<div class="col-md-6-plan-pic animate-box" data-animate-effect="fadeInLeft">
								<h2 class="fh5co-heading">${plans.title}</h2>
								<p>期望人数：${plans.expectnum}
									&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp
									目前人数：${plans.presentnum}</p>
								<p>开始时间：<fmt:formatDate value="${plans.departuretime}" pattern="yyyy-MM-dd"/>
									&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp
									结束时间：<fmt:formatDate value="${plans.endtime}" pattern="yyyy-MM-dd"/></p>
								<p>出发地点：${plans.departureplace}</p>
								<p>目的地点：${plans.destination}</p>
								<p>出发地点：${plans.departureplace}</p>
								<p>旅行预算：${plans.budgetbottom}——${plans.budgettop}</p>
								<p>邀约详情： ${plans.detail}</p>
								<div id="btn_div"  data-animate-effect="fadeInLeft">
									<c:if test='${plans.type == "2"}'>
										<a id="" href="#" class="btn btn-primary">已结束</a>
									</c:if>
				  					<c:if test='${plans.type == "1"}'>
										<a id="" class="btn btn-primary">出游中</a>
										<c:if test='${me.id == plans.creatby}'>
											<a id="" href="modifyPlan?id=${plans.id}" class="btn btn-primary">修改邀约</a>
											<input id="end_btn" type="button" class="btn btn-primary" value="结束出游" onclick="end()">
										</c:if>
										<c:if test='${me.id != plans.creatby}'>
											<c:if test='${plans.ismember == true}'>
												<a id="apped" href="#" class="btn btn-primary">已申请</a>
											</c:if>
											<c:if test='${plans.ismember != true}'> 
												<a id="appplan_btn" class="btn btn-primary" onclick="appplan()">申请加入</a>
											</c:if>
										</c:if>
									</c:if>
				  					<c:if test='${plans.type == "0"}'>
										<c:if test='${me.id == plans.creatby}'>
											<a id="" href="modifyPlan?id=${plans.id}" class="btn btn-primary">修改邀约</a>
											<input id="delete_btn" type="button" class="btn btn-primary"  value="取消出行">
											<input id="leave_btn" type="button" class="btn btn-primary"  value="出发">
										</c:if>
										<c:if test='${me.id != plans.creatby}'>
											<c:if test='${plans.ismember == true}'>
												<a id="apped" href="#" class="btn btn-primary">已申请</a>
											</c:if>
											<c:if test='${plans.ismember != true}'>
												<a id="appplan_btn" class="btn btn-primary" onclick="appplan()">申请加入</a>
											</c:if>
										</c:if>
									</c:if>
									 <input id="showMember_btn" type="button" class="btn btn-primary" onclick="showMember()" value="查看成员">
									 <input id="hideMember_btn" type="button" class="btn btn-primary" onclick="hideMember()" value="收起成员" style="display: none">
								</div>
							</div>
					</div>
				</div>
			<div class="fh5co-narrow-content">
			<div class="row">
			<div id ="member_div" class="col-md-6-plan-pic animate-box" data-animate-effect="fadeInLeft" style="display: none">
				<div class="timeline timeline-single-column">
				   <span class="timeline-label">
                       <span class="label label-primary">查看当前成员 ${plans.presentnum}/${plans.expectnum}</span>
                  </span>
				 <div class="timeline-item timeline-item-arrow-sm">
                        <div class="timeline-point timeline-point-primary">
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="timeline-event timeline-event-primary">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">${allPlanmembers.creater.username} 
                                    	<c:if test='${allPlanmembers.creater.isontravel == 1}'>
                                    		/出行中
                                   		</c:if>
                                   	 	/发起人
                                   	 </h3>
                                </div>
                                <div class="panel-body">
                                    <a href="userMessage?id=${allPlanmembers.creater.userid}"  target="_blank" class="">查看个人信息</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <span class="timeline-label">
                       <span class="label label-primary">审核通过</span>
                  </span>
                  <div id = "verifiedPlanmembers_div">
                  <c:forEach items="${allPlanmembers.verifiedPlanmembers}" var="member" varStatus="status">
                   <div id="${member.id}_verified_div" class="timeline-item timeline-item-arrow-sm">
                        <div class="timeline-point timeline-point-primary">
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="timeline-event timeline-event-primary">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                    	${member.username}
                                    	<c:if test='${member.isontravel == 1}'>
                                    	/出行中
                                   		</c:if>
                                   		/已审核通过
                                    </h3>
                                </div>
								<div class="panel-body">
									<a href="userMessage?id=${member.id}" target="_blank"  class="">查看个人信息</a>
									<c:if test='${me.id == plans.creatby &&(plans.type == "1"||plans.type == "0")}'>
                                    	<a onclick="unVerifyMember(0,${plans.id},${member.userid},${member.id},'${member.username}')">踢出</a>
                                   	</c:if>
                                   	<c:if test='${me.id != plans.creatby &&(member.userid == me.id)}'>
                                    	<a onclick="quit(1,${member.id})">退出</a>
                                   	</c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                  </c:forEach>
                  </div>
                  <span class="timeline-label">
                       <span class="label label-primary">等待审核</span>
                  </span>
                  <div id ="waitVerifiedPlanmembers_div">
                  <c:forEach items="${allPlanmembers.waitVerifiedPlanmembers}" var="member" varStatus="status">
                   <div id="${member.id}_waitVerified_div" class="timeline-item timeline-item-arrow-sm">
                        <div class="timeline-point timeline-point-primary">
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="timeline-event timeline-event-primary">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">${member.username}
                                    	<c:if test='${member.isontravel == 1}'>
                                    	/出行中
                                   		</c:if>
                                    	/等待审核
                                    </h3>
                                </div>
                               <div class="panel-body">
                               		<a href="userMessage?id=${member.userid}" target="_blank"  class="">查看个人信息</a>
									<c:if test='${me.id == plans.creatby &&(plans.type == "1"||plans.type == "0")}'>
                                    	<a onclick="verifyMember(1,${plans.id},${member.userid},${member.id},'${member.username}')">同意</a>
                                    </c:if>
                                    <c:if test='${me.id != plans.creatby &&(member.userid == me.id)}'>
                                    	<a onclick="quit(0,${member.id})">退出</a>
                                   	</c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                  </c:forEach>
                  </div>
                     <span class="timeline-label">
                        <button class="btn btn-danger"><i class="fa fa-ambulance"></i></button>
                    </span>
                </div>
			</div>
			</div>
			
			
			</div>
			<div class="fh5co-narrow-content">
				<div class="row">
					<div >
						<div class=" animate-box" data-animate-effect="fadeInLeft">
							<div class="fh5co-text">
								<textarea id="comment_to_plan" name="content"  class="form-control form-control-black" placeholder="Write Something" rows="3" required></textarea>
								<button id = "comment_to_plan_btn" class="btn btn-primary-commont">回复</button>
							</div>
						</div>
					</div>
					
					<div id="comment">
						<h2 class="fh5co-heading" data-animate-effect="fadeInLeft">所有回复</h2>
						<div id="lstComments_div">
							<c:forEach items="${lstComments}" var="commentsItem" varStatus="status">
								<div id ="${commentsItem.id}st_comment_div" class="animate-comment" data-animate-effect="fadeInLeft">
									<!-- 本条评论 -->
									<div  class="fh5co-text">
										<span></span>
										<span class="username">${commentsItem.creatbyname}:</span>
										<span class="time">
											<fmt:formatDate value="${commentsItem.creattime}" pattern="yyyy-MM-dd HH:mm"/>
										</span>
										<p>
											${commentsItem.content} 
											<br/>
											<button id ="${commentsItem.id}_comment_btn" class="btn btn-primary-note" onclick="showNoteDiv(${commentsItem.id})">回复</button>
											<c:if test="${commentsItem.creatby==me.id}">
												<button id ="${commentsItem.id}_delete_btn" class="btn btn-primary-note-delete" onclick="deleteDiv(${commentsItem.id},0)">删除</button>
											</c:if>
										</p>
									</div>
									<!--回复 该评论的btn -->
									<div id ="${commentsItem.id}_note_div" class="fh5co-text animate-box" style="display: none">
										<div>
											<textarea id="${commentsItem.id}_note_content" name="content"  class="form-control-comment form-control-black" placeholder="Write Something" rows="3"></textarea>
										</div>
										<div class="note_btn">
											<button class="btn btn-primary-tonote" onclick="addNote(${commentsItem.id},0,${commentsItem.creatby},)">回复</button>
											<button class="btn btn-primary-tonote" onclick="hideNoteDiv(${commentsItem.id})">取消</button>
									
										</div>
									</div>
									<!--该评论的所有回复  -->
									<div id ="${commentsItem.id}_lstNotes_div" class="fh5co-feature">
										<c:forEach items="${commentsItem.lstNote}" var="item" varStatus="status">
											<div id ="${item.id}st_note_div">
												<!--该回复的内容  -->
												<div class="fh5co-text animate-box">
													<span class="username">${item.creatbyname}:</span>
													<span class="time">
														<fmt:formatDate value="${item.creattime}" pattern="yyyy-MM-dd HH:mm"/>
													</span>
													<p>
														${item.content}
														<br/> 
														<button  id ="${item.id}_comment_btn" class="btn btn-primary-note" onclick="showNoteDiv(${item.id})">回复</button>
														<c:if test="${item.creatby==me.id}">
															<button id ="${item.id}_delete_btn" class="btn btn-primary-note-delete" onclick="deleteDiv(0,${item.id})">删除</button>
														</c:if>
													</p>
												</div>
												<!--回复回复的按钮  -->
												<div id ="${item.id}_note_div" class="fh5co-text animate-box" style="display: none">
													<div>
														<textarea id="${item.id}_note_content" name="content"  class="form-control-comment form-control-black" placeholder="Write Something" rows="3" required></textarea>
													</div>
													<div class="note_btn">
														<button  class="btn btn-primary-tonote" onclick="addNote(${commentsItem.id},${item.id},${item.creatby},2)">回复</button>
														<button  class="btn btn-primary-tonote" onclick="hideNoteDiv(${item.id})">取消</button>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
					</section>
				</div>
			</div><!-- #blog -->
			
			<div class="box" id="box"></div>
			<jsp:include   page="footer.jsp" flush="true"/>

		</div><!--/#wrapper-->


	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>

		<script src="assets/js/jquery-2.1.3.min.js"></script>
		<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.actual.min.js"></script>
		<script src="assets/js/jquery.scrollTo.min.js"></script>
		<script src="assets/js/script.js"></script>
		<script src="js/datePicker/WdatePicker.js"></script>
		<script src="js/paging.js"></script>
		<script src="js/utils.js"></script>
		<script type="text/javascript" src="js/jquery.dropdown.js"></script>
	<script type="text/javascript">
	var uid =  "${me.id}";
	
	if(username !=""){
		$('#logined_div').show();
		$('#user_div').show();
		$('#nologin_div').hide();
	}else{
		$('#nologin_div').show();
		$('#logined_div').hide();
		$('#user_div').hide();
	}
	
	function showMember(){
		$('#member_div').show();
		$('#hideMember_btn').show();
		$('#showMember_btn').hide();
	}
	function hideMember(){
		$('#member_div').hide();
		$('#showMember_btn').show();
		$('#hideMember_btn').hide();
	}
	
		function showNoteDiv(commentId){
		$('#'+commentId+'_note_div').show();
		$('#'+commentId+'_comment_btn').hide();
		$('#'+commentId+'_delete_btn').hide();
	}
	
	function hideNoteDiv(commentId){
		$('#'+commentId+'_note_div').hide();
		$('#'+commentId+'_comment_btn').show();
		$('#'+commentId+'_delete_btn').show();
	}
	
	$('#delete_btn').click(function(){
	
    		$.ajax({  
				data:"id=${plans.id}" ,      
        		type:"POST",  
     			dataType:'json',
        		url:"deletePlan",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        			window.location.href ="<%=request.getContextPath()%>" + "/myplans?type=0&page=1&id=${me.id}";
        		} 
     		});  
	});
	
	function appplan(){
		if(username==""){
			alert("请先登录");
			return;
		}
		if("${usertype}"=="U"){
			alert("实名认证后才能申请邀约");
			return;
		}
    		$.ajax({  
				data:"id=${plans.id}" ,      
        		type:"POST",  
     			dataType:'json',
        		url:"appPlan",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){ 
        			$('#member_div').hide(); 
        			if(data.success=="1"){
        				var btn_div = 
        				"<a id=\"apped\" href=\"#\" class=\"btn btn-primary\">已申请</a>"+
						"   <input id=\"showMember_btn\" type=\"button\" class=\"btn btn-primary\" onclick=\"showMember()\" value=\"查看成员\">"+
						"	<input id=\"hideMember_btn\" type=\"button\" class=\"btn btn-primary\" onclick=\"hideMember()\" value=\"收起成员\" style=\"display: none\">";
        				
        				$("#btn_div").empty();
						$("#btn_div").prepend($(btn_div));
						
					
					var waitVerifiedDiv =
					" <div id=\""+data.id+"_waitVerified_div\" class=\"timeline-item timeline-item-arrow-sm\">"+
                    "	<div class=\"timeline-point timeline-point-primary\">"+
                    "       <i class=\"fa fa-star\"></i>"+
                    "    </div>"+
                    "    <div class=\"timeline-event timeline-event-primary\">"+
                    "        <div class=\"panel panel-default\">"+
                    "            <div class=\"panel-heading\">"+
                    "                <h3 class=\"panel-title\">${me.name}/等待审核</h3>"+
                    "           </div>"+
					"			<div class=\"panel-body\">"+
					"				<a href=\"userMessage?id=${me.id}\" target=\"_blank\">查看个人信息</a>"+
					"				<a onclick=\"quit(0,"+data.id+")\">退出</a>"+
                    "            </div>"+
                    "        </div>"+
                    "    </div>"+
                    "</div>";
					$("#waitVerifiedPlanmembers_div").append($(waitVerifiedDiv));
        			}else{
        				alert("申请失败"+data.msg); 
        			}
        		} 
     		});  
	}
	
	$('#leave_btn').click(function leave(){
	
    		$.ajax({  
				data:"id=${plans.id}",      
        		type:"get",  
     			dataType:'json',
        		url:"leave",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        			if(data.success=="1"){
        				var btn_div = 
        			"	<a  href=\"#\" class=\"btn btn-primary\">出游中</a>"+
					"	<a href=\"modifyPlan?id=${plans.id}\" class=\"btn btn-primary\">修改邀约</a>"+
					"	<input id=\"end_btn\" type=\"button\" class=\"btn btn-primary\" value=\"结束出游\" onclick=\"end()\">"	+
					"   <input id=\"showMember_btn\" type=\"button\" class=\"btn btn-primary\" onclick=\"showMember()\" value=\"查看成员\">"+
					"	<input id=\"hideMember_btn\" type=\"button\" class=\"btn btn-primary\" onclick=\"hideMember()\" value=\"收起成员\" style=\"display: none\">";
        				$("#btn_div").empty();
						$("#btn_div").prepend($(btn_div));
        			}else if(data.isOntravel=="-1"){
						alert("无法同意申请，您正在出行中"); 
				
					}else if(data.isOntravel=="-1"){
						alert("无法同意申请，邀约成员已有在出行中"); 
				
					}else{
        				alert("出行失败"+data.msg); 
        			}
        		} 
     		});  
	});
	
	function end(){
    	$.ajax({  
			data:"id=${plans.id}",      
        	type:"get",  
     		dataType:'json',
       		url:"end",  
       		error:function(data){  
       			 alert("出错了！！:"+data);  
       		},  
        	success:function(data){  
        		if(data.success=="1"){
        			var btn_div = 
        			"	<a  href=\"#\" class=\"btn btn-primary\">已结束</a>"+
					"   <input id=\"showMember_btn\" type=\"button\" class=\"btn btn-primary\" onclick=\"showMember()\" value=\"查看成员\">"+
					"	<input id=\"hideMember_btn\" type=\"button\" class=\"btn btn-primary\" onclick=\"hideMember()\" value=\"收起成员\" style=\"display: none\">";
        			$("#btn_div").empty();
					$("#btn_div").prepend($(btn_div));
        		}else{
        			alert("结束失败"+data.msg); 
       			}
       		} 
   		});  
	}
	
	//对于整个plan 的评论
	$('#comment_to_plan_btn').click(function() {
		var comment = $('#comment_to_plan').val();
		$.ajax({ 
			data: 
				"comment=" + comment +
				"&planid=" + ${plans.id} + 
				"&commentId=" + 0 + 
				"&commentCreateby=" + 0+
				"&type="+0,
			type: "post", 
			url: "<%=request.getContextPath()%>" + "/addComment", 
			dataType: "json", 
			success: function(data) { 
				var json=data;
        		if(json.success=="1"){
					var commentDiv = 
						"	<div id =\""+json.id+"st_comment_div\" class=\"animate-comment\" data-animate-effect=\"fadeInLeft\">"+
						"		<div class=\"fh5co-text\">"+
						"			<span class=\"username\">"+ username +":</span>"+
						"			<span class=\"time\">"+
						"				刚刚"+
						"			</span>"+
						"			<p>"+
										comment+
						"				<br/> "+
						"				<button class=\"btn btn-primary-note\" onclick=\"showNoteDiv("+json.id+")\">回复</button>"+
						"				<button id =\""+json.id+"_delete_btn\" class=\"btn btn-primary-note-delete\" onclick=\"deleteDiv("+json.id+",0)\">删除</button>"+
						"			</p>"+
						"		</div>"+
						"		<div id =\""+json.id+"_note_div\" class=\"fh5co-text \" style=\"display: none\">"+
						"			<div>"+
						"				<textarea id=\""+json.id+"_note_content\" name=\"content\"  class=\"form-control-comment form-control-black\" placeholder=\"Write Something\" rows=\"3\" required></textarea>"+
						"			</div>"+
						"			<div class=\"note_btn\">"+
						"				<button class=\"btn btn-primary-tonote\" onclick=\"addNote("+json.id+",0,"+uid +",1)\">回复</button>"+
						"				<button class=\"btn btn-primary-tonote\" onclick=\"hideNoteDiv("+json.id+")\">取消</button>"+
						"			</div>"+
						"		</div>"+
						"		<div id =\""+json.id+"_lstNotes_div\" class=\"fh5co-feature\">"+
						"		</div>"+
						"	</div>";
				$("#lstComments_div").prepend($(commentDiv));
				$('#comment_to_plan').val("");
				setTotalCount+=1;
			}			
		},
		error: function(data) { 
			alert(data); 
			}
		});
	});
	
	
	//对于某条评论的回复
	function addNote(commentId,noteId,commentCreateby,type){
		var comment ;
		if(noteId==0){
			comment = $('#'+ commentId +'_note_content').val();
		}else{
			comment = $('#'+ noteId +'_note_content').val();
		}
		$.ajax({ 
			data: 
				"comment=" + comment +
				"&planid=" + ${plans.id} + 
				"&commentId=" + commentId + 
				"&commentCreateby=" + commentCreateby+
				"&type="+1, 
			type: "post", 
			url: "<%=request.getContextPath()%>" + "/addComment", 
			dataType: "json", 
			success: function(data) { 
				if(data.success=="1"){
					var noteDiv = 
						"<div id =\""+data.id+"st_note_div\">"+
						"	<div class=\"fh5co-text animate-box\">"+
						"		<span class=\"username\">"+ username +":</span>"+
						"			<span class=\"time\">"+
						"				刚刚"+
						"			</span>"+
						"			<p>"+
										comment+" "+
						"				<br/> "+
						"				<button class=\"btn btn-primary-note\" onclick=\"showNoteDiv("+data.id+")\">回复</button>"+
						"				<button id =\""+data.id+"_delete_btn\" class=\"btn btn-primary-note-delete\" onclick=\"deleteDiv(0,"+data.id+")\">删除</button>"+
						"			</p>"+
						"	</div>"+
						"	<div id =\""+data.id+"_note_div\" class=\"fh5co-text\" style=\"display: none\">"+
						"			<div>"+
						"				<textarea id=\""+data.id+"_note_content\" name=\"content\"  class=\"form-control-comment form-control-black\" placeholder=\"Write Something\" rows=\"3\" required></textarea>"+
						"			</div>"+
						"			<div class=\"note_btn\">"+
						"				<button  class=\"btn btn-primary-tonote\" onclick=\"addNote("+commentId+","+data.id+","+uid+",2)\">回复</button>"+
						"				<button  class=\"btn btn-primary-tonote\" onclick=\"hideNoteDiv("+data.id+")\">取消</button>"+
						"			</div>"+
						"	</div>"+
						"</div>";
						$("#"+commentId+"_lstNotes_div").append($(noteDiv));
						if(noteId==0){
							$('#'+ commentId +'_note_content').val("");
							$('#'+commentId+'_note_div').hide();
							$('#'+commentId+'_comment_btn').show();
							$('#'+commentId+'_delete_btn').show();
						}else{
							$('#'+ noteId +'_note_content').val("");
							$('#'+noteId+'_note_div').hide();
							$('#'+noteId+'_comment_btn').show();
							$('#'+noteId+'_delete_btn').show();
						}
						
					}		 
			},
			error: function(data) { 
				alert(data); 
			}
		});
	}
	
	var setTotalCount = ${plans.commentcount};
    $('#box').paging({
         initPageNo: 0, // 初始页码
         totalPages: setTotalCount%10==0?(setTotalCount/10):(parseInt(setTotalCount/10)+1), //总页数
         totalCount: '合计' + setTotalCount + '条数据', // 条目总数
         slideSpeed: 600, // 缓动速度。单位毫秒
         jump: true, //是否支持跳转
         callback: function(page) { // 回调函数
              console.log(page);
         }
      })
      
      $('#pageSelect').children().click(function(){
       		pageIndex = $(this).index() + 1;
            $.ajax({ 
				type: "post", 
				url: "<%=request.getContextPath()%>" + "/getcomments", 
				data: "page="+pageIndex+"&id="+${plans.id}, 
				dataType: "json", 
				success: function(data) { 
					var lstComment= data.lstComments;
					var lstComment_div="";
						for(var i = 0;i<lstComment.length;i++){
							var comment =lstComment[i];
							lstComment_div+=	
								"<div id =\""+ comment.id +"st_comment_div\" class=\"animate-comment\" data-animate-effect=\"fadeInLeft\">"+
								"	<div class=\"fh5co-text\">"+
								"		<span class=\"username\">"+comment.creatbyname+":</span>"+
								"		<span class=\"time\">"+
											formatDateTime(comment.creattime)+
								"		</span>"+
								"		<p>"+
											comment.content+
								"			<br/> "+
								"			<button id =\""+comment.id+"_comment_btn\" class=\"btn btn-primary-note\" onclick=\"showNoteDiv("+comment.id+")\">回复</button>"+
								(uid ==comment.creatby?
								"			<button id =\""+comment.id+"_delete_btn\" class=\"btn btn-primary-note-delete\" onclick=\"deleteDiv(0,"+comment.id+")\">删除</button>":"")+
								"		</p>"+
								"	</div>"+
								"	<div id =\""+comment.id+"_note_div\" class=\"fh5co-text \" style=\"display: none\">"+
								"		<div>"+
								"			<textarea id=\""+comment.id+"_note_content\" name=\"content\"  class=\"form-control-comment form-control-black\" placeholder=\"Write Something\" rows=\"3\" required></textarea>"+
								"		</div>"+
								"		<div class=\"note_btn\">"+
								"			<button class=\"btn btn-primary-tonote\" onclick=\"addNote("+comment.id+","+comment.creatby+",)\">回复</button>"+
								"			<button class=\"btn btn-primary-tonote\" onclick=\"hideNoteDiv("+comment.id+")\">取消</button>"+
								"		</div>"+
								"	</div>"+
								"	<div id =\""+comment.id+"_lstNotes_div\" class=\"fh5co-feature\">";
								
								for(var j=0;j<comment.lstNote.length;j++){
								
									var note=comment.lstNote[j];
									lstComment_div+=	
								"			<div id =\""+note.id+"st_note_div\">"+
								"				<div class=\"fh5co-text animate-box\">"+
								"					<span class=\"username\">"+note.creatbyname+":</span>"+
								"					<span class=\"time\">"+
														formatDateTime(note.creattime)+
								"					</span>"+
								"					<p>"+
														note.content+
								"						<br/> "+
								"						<button class=\"btn btn-primary-note\" onclick=\"showNoteDiv("+note.id+")\">回复</button>"+
											(uid ==note.creatby?
								"			<button id =\""+note.id+"_delete_btn\" class=\"btn btn-primary-note-delete\" onclick=\"deleteDiv(0,"+note.id+")\">删除</button>":"")+
								
								"					</p>"+
								"				</div>"+
								"				<div id =\""+note.id+"_note_div\" class=\"fh5co-text\" style=\"display: none\">"+
								"					<div>"+
								"						<textarea id=\""+note.id+"_note_content\" name=\"content\"  class=\"form-control-comment form-control-black\" placeholder=\"Write Something\" rows=\"3\" required></textarea>"+
								"					</div>"+
								"					<div class=\"note_btn\">"+
								"						<button class=\"btn btn-primary-tonote\" onclick=\"addNote("+comment.id+","+note.creatby+",1)\">回复</button>"+
								"						<button class=\"btn btn-primary-tonote\" onclick=\"hideNoteDiv("+note.id+")\">取消</button>"+
								"					</div>"+
								"				</div>"+
								"		</div>";
								}
								lstComment_div+=	
								"	</div>"+
							"	</div>";
					}
					$("#lstComments_div").empty();
					$("#lstComments_div").prepend($(lstComment_div));
				
				},
				error: function(data) { 
					alert("调用失败....",data); 
					console.log("data is ",data);
				}
			});
        });
        
        $( '#cd-dropdown' ).dropdown( {
			gutter : 5
		} );
		
	function deleteDiv(commentId,noteId){
		$.ajax({ 
			data: 
				"commentId=" + commentId +
				"&noteId=" + noteId,
			type: "get", 
			url: "<%=request.getContextPath()%>" + "/deleteComment", 
			dataType: "json", 
			success: function(data) { 
				if(noteId==0){
					$('#'+commentId+'st_comment_div').hide();
				}else{
					$('#'+noteId+'st_note_div').hide();
				}
			},
			error: function(data) { 
				alert(data); 
			}
		});
		
		}
				
	function verifyMember(type,pid,uid,pmid,uname){
		$.ajax({ 
			data: 
				"pid=" + pid +
				"&uid=" + uid+
				"&type=" + type,
			type: "get", 
			url: "<%=request.getContextPath()%>" + "/verifyMember", 
			dataType: "json", 
			success: function(data) { 
				if(data.success=="1"){
					var verifiedDiv =
					" <div id=\""+pmid+"_verified_div\" class=\"timeline-item timeline-item-arrow-sm\">"+
                    "	<div class=\"timeline-point timeline-point-primary\">"+
                    "       <i class=\"fa fa-star\"></i>"+
                    "    </div>"+
                    "    <div class=\"timeline-event timeline-event-primary\">"+
                    "        <div class=\"panel panel-default\">"+
                    "            <div class=\"panel-heading\">"+
                    "                <h3 class=\"panel-title\">"+uname+
                    (data.isontravel=="1"?"/出行中":"")+
                    "/已审核通过</h3>"+
                    "           </div>"+
					"			<div class=\"panel-body\">"+
					"				<a href=\"userMessage?id=${member.id}\" target=\"_blank\">查看个人信息</a>"+
						
							("${me.id}"=="${plans.creatby}"?
							"	<a onclick=\"unVerifyMember(0,"+pid+","+uid+","+pmid+",'"+uname+"')\">踢出</a>":"")+
                    "            </div>"+
                    "        </div>"+
                    "    </div>"+
                    "</div>";
					$("#"+pmid+"_waitVerified_div").remove();
					$("#verifiedPlanmembers_div").append($(verifiedDiv));
				}else if(data.isOntravel=="-1"){
					alert("无法同意申请，该成员已经在出行中"); 
				
				}
			},
			error: function(data) { 
				alert("失败",data); 
			}
		});
		
	}
	function unVerifyMember(type,pid,uid,pmid,uname){
		$.ajax({ 
			data: 
				"pid=" + pid +
				"&uid=" + uid+
				"&type=" + type,
			type: "get", 
			url: "<%=request.getContextPath()%>" + "/verifyMember", 
			dataType: "json", 
			success: function(data) { 
				if(data.success=="1"){
					var waitVerifiedDiv =
					" <div id=\""+pmid+"_waitVerified_div\" class=\"timeline-item timeline-item-arrow-sm\">"+
                    "	<div class=\"timeline-point timeline-point-primary\">"+
                    "       <i class=\"fa fa-star\"></i>"+
                    "    </div>"+
                    "    <div class=\"timeline-event timeline-event-primary\">"+
                    "        <div class=\"panel panel-default\">"+
                    "            <div class=\"panel-heading\">"+
                    "                <h3 class=\"panel-title\">"+uname+
                    (data.isontravel=="1"?"/出行中":"")+
                    "/等待审核</h3>"+
                    "           </div>"+
					"			<div class=\"panel-body\">"+
					"				<a href=\"userMessage?id=${member.id}\" target=\"_blank\">查看个人信息</a>"+
						
							("${me.id}"=="${plans.creatby}"?
							"	<a onclick=\"verifyMember(1,"+pid+","+uid+","+pmid+",'"+uname+"')\">同意</a>":"")+
                    "            </div>"+
                    "        </div>"+
                    "    </div>"+
                    "</div>";
					$("#"+pmid+"_verified_div").remove();
					$("#waitVerifiedPlanmembers_div").append($(waitVerifiedDiv));
				}
			},
			error: function(data) { 
				alert("失败",data); 
			}
		});
		
		}
		
	function quit(type,id){
		$.ajax({ 
			data: 
				"id=" + id ,
			type: "get", 
			url: "<%=request.getContextPath()%>" + "/quitPlan", 
			dataType: "json", 
			success: function(data) { 
				if(data.success=="1"){
					if(type==0){
						$("#"+id+"_waitVerified_div").remove();
					}
					if(type==1){
						$("#"+id+"_verified_div").remove();
					}
					
					var btn_div="<a id=\"appplan_btn\" class=\"btn btn-primary\" onclick=\"appplan()\">申请加入</a>";
					$("#apped").remove();
					$("#btn_div").prepend($(btn_div));
				}
			},
			error: function(data) { 
				alert("失败",data); 
			}
		});
		
		}
	</script>
	</body>
</html>
