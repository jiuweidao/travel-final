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
					<header class="block-heading cleafix">
					</header>
					<section class="block-body">
							<div id="fh5co-main">
			<div class="fh5co-narrow-content">
				<div class="row row-bottom-padded-md">
					<div class="col-md-6-plan-pic animate-box" data-animate-effect="fadeInLeft" >
						<c:if test='${plans.picpath == null}'>
							<img src="assets/images/bike_water1-1000x600.jpg">
						</c:if>
						<c:if test='${plans.picpath != null}'>
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
					</div>
					<div class="col-md-6-plan-pic animate-box" data-animate-effect="fadeInLeft">
						<div class="fleft">

					<select id="cd-dropdown" name="cd-dropdown" class="cd-select">
						<option value="-1" selected>查看当前成员 ${plans.presentnum}/${plans.expectnum}</option>
						<option value="1"  class="icon-monkey">${allPlanmembers.creater.username} /发起人</option>
						<c:forEach items="${allPlanmembers.verifiedPlanmembers}" var="member" varStatus="status">
							<option value="1" class="icon-monkey">${member.username}/已审核通过</option>
						</c:forEach>
						<c:forEach items="${allPlanmembers.waitVerifiedPlanmembers}" var="member" varStatus="status">
							<option value="1" class="icon-monkey">${member.username}/等待审核</option>
						</c:forEach>
					</select>

				</div>
					</div>
					<div id="btn_div" class="col-md-6-plan-pic animate-box" data-animate-effect="fadeInLeft">
						<c:if test='${plans.type == "2"}'>
							<p><a id="" href="#" class="btn btn-primary">已结束</a></p>
						</c:if>
					  	<c:if test='${plans.type == "1"}'>
							<p><a id="" href="#" class="btn btn-primary">出游中</a></p>
						</c:if>
					  	<c:if test='${plans.type == "0"}'>
							<c:if test='${me.id == plans.creatby}'>
								<p>
									<a id="" href="modifyPlan?id=${plans.id}" class="btn btn-primary">修改邀约</a>
									<a id="delete_btn" href="deletePlan?id=${plans.id}" class="btn btn-primary">取消出行</a>
									<a id="leave_btn" href="" class="btn btn-primary">出发</a> </p>
							</c:if>
							<c:if test='${me.id != plans.creatby}'>
								<c:if test='${plans.ismember == true}'>
									<p><a id="" href="#" class="btn btn-primary">已申请</a> </p>
								</c:if>
								<c:if test='${plans.ismember != true}'>
									<p><a id="appplan_btn" class="btn btn-primary">申请加入</a> </p>
								</c:if>
							</c:if>
						</c:if>
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
									<div id ="${commentsItem.id}_note_div" class="fh5co-text animate-box" style="display: none">
										<div>
											<textarea id="${commentsItem.id}_note_content" name="content"  class="form-control-comment form-control-black" placeholder="Write Something" rows="3"></textarea>
										</div>
										<div class="note_btn">
											<button class="btn btn-primary-tonote" onclick="addNote(${commentsItem.id},0,${commentsItem.creatby},)">回复</button>
											<button class="btn btn-primary-tonote" onclick="hideNoteDiv(${commentsItem.id})">取消</button>
									
										</div>
									</div>
									<div id ="${commentsItem.id}_lstNotes_div" class="fh5co-feature">
										<c:forEach items="${commentsItem.lstNote}" var="item" varStatus="status">
											<div id ="${item.id}st_note_div">
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
	
	$('#appplan_btn').click(function(){
		if("${usertype}"=="U"){
			alert("实名认证后才能发起邀约");
			return;
		}
    		$.ajax({  
				data:"id=" +${plans.id},      
        		type:"POST",  
     			dataType:'json',
        		url:"appPlan",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        			if(data.success=="1"){
        				var btn_div = "<a  href=\"#\" class=\"btn btn-primary\">已申请</a>";
        				$("#btn_div").empty();
						$("#lstComments_div").prepend($(btn_div));
        			}else{
        				alert("申请失败"+data.msg); 
        			}
        		} 
     		});  
	});
	
	$('#leave_btn').click(function(){
	
    		$.ajax({  
				data:"id=" +${plans.id},      
        		type:"POST",  
     			dataType:'json',
        		url:"leave",  
        		error:function(data){  
           			 alert("出错了！！:"+data);  
        		},  
        		success:function(data){  
        			if(data.success=="1"){
        				var btn_div = "<a  href=\"#\" class=\"btn btn-primary\">出游中</a>";
        				$("#btn_div").empty();
						$("#lstComments_div").prepend($(btn_div));
        			}else{
        				alert("申请失败"+data.msg); 
        			}
        		} 
     		});  
	});
	
	
	
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
						"				<button class=\"btn btn-primary-tonote\" onclick=\"addNote("+json.id+","+uid +",1)\">回复</button>"+
						"				<button class=\"btn btn-primary-tonote\" onclick=\"hideNoteDiv("+json.id+")\">取消</button>"+
						"			</div>"+
						"		</div>"+
						"	</div>";
				$("#lstComments_div").prepend($(commentDiv));
				$('#comment_to_plan').val("");
			}			
		},
		error: function(data) { 
			alert(data); 
			}
		});
	});
	
	
	
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
						"				<button  class=\"btn btn-primary-tonote\" onclick=\"addNote("+commentId+","+uid+",2)\">回复</button>"+
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
	</script>
	</body>
</html>
