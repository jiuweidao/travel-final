<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>免费模拟考试_历年真题_在线测试  — 我要模考网 </title>
<meta name="keywords" content="免费模拟考试，在线测试，历年真题，考试题库，证券资格考试，公务员行测题库，会计证，考研题库，软考题库，计算机等级考试试题库，英语四六级题库，自考试题，ACCA，CAT" />
<meta name="description" content="在线做题版块针对考友的不同需求，将学习科目划分为十大类：学历类、外语类、医药类、职业资格类、求职招聘、财会类、建筑类、计算机类、外贸类、百科知识等。每个大类下面又可以进一步细分为更多的子类，以帮助考友快速定位和找到目标考题。" />
<script type="text/javascript" src="http://www.51mokao.com/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="http://www.51mokao.com/js/mokao.js?v=10047"></script>
<link rel="stylesheet" type="text/css" href="http://www.51mokao.com/css/style.css?v=10047" />
<link rel="shortcut icon" href="/images/favicon.ico?v=10047" type="image/x-icon" /></head>
<link  rel="stylesheet" type="text/css" href="css/Login.css"/>
<script type="text/javascript">
$(function(){
//注销
	$('#logout').click(function() {
	$.ajax({ 
		type: "post", 
		url: "<%=request.getContextPath()%>" + "/logout", 
		data: {}, 
		dataType: "json", 
		success: function(data) { 
			if(data.success == false){
				alert(data.errorMsg);
			}else{
				alert("退出成功"); 
				//登录成功
			    window.location.href = "<%=request.getContextPath()%>" +  "/doLogin";
			}
		},
		error: function(data) { 
			alert("调用失败...."); 
		}
	});
});
		
	
	//
});


</script>
<body>
<div id="top-header">
     <div class="width-wrap">
          <div class="header-nav left-wrap common-icon">
               <a href="/index.html" title="">返回首页</a>
                <span class="pipe">|</span>   <a href="/html/kaoshishijian.html" title="2015年考试时间" target="_blank">2015年考试时间</a>
          </div>
       	  <div class="header-user right-wrap" id="logined-user"  >
              	<div class="user-nav common-icon" >
                  		<a id="loginedUser">${loginedUser} </a>
                   		<a href="javascript:;" id="logout">注销</a>
               	</div>
      	 </div>		 
     </div>
</div>

<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_r.js?move=0&amp;btn=r5.gif" charset="utf-8"> 
</script><script type="text/javascript"
	src="/js/jquery-ui.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href="/css/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#query").autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "SuggestDo.do",
					contentType : "application/json;charset=utf-8",
					dataType : "json",
					data : {
						q : $("#query").val()
					},
					success : function(data) {
						// alert(data);
						if (data.length > 0) {
							response($.map(data, function(item) {
								return {
									value : item
								}
							}));
						}
					}

				});

			},
			minLength : 1

		});
	});
</script>
<div id="header">
	<div class="width-wrap header-wrap cl">
		<h2 class="left-wrap logo">
			<a href="/index.html"> <img
				src="/img/logo.png" /> </a>
		</h2>
		<div class="left-wrap search-wrap">
			<form method="get" action="/search.html"
				id="frm_s">
				<table cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td><input type="text" x-webkit-speech=""
								placeholder="搜索考题、话题、下载、考友群、招聘、答疑" id="query" value=""
								name="q" class="input-text"></td>
							<td><button value="true" class="button"
									onclick="this.disabled='disabled';document.getElementById('frm_s').submit();"
									type="button">
									<strong><i class="icon"></i>搜索</strong>
								</button></td>
						</tr>
					</tbody>
				</table>
				<div class="search-hot">
					<label class="input-radio2"> <input type="radio" value="0"
						checked="checked" name="r">
						考题 </label> <label class="input-radio2"> <input type="radio"
						value="1"  name="r">
						话题 </label> <label class="input-radio2"> <input type="radio"
						value="2"  name="r">
						下载 </label> <label class="input-radio2"> <input type="radio"
						value="3"  name="r">
						考友群 </label> <label class="input-radio2"> <input type="radio"
						value="4"  name="r">
						招聘 </label><label class="input-radio2"> <input type="radio"
						value="5"  name="r">
						答疑 </label>
				</div>
			</form>
		</div>
		<div class="header-operate right-wrap">
			<a class="browse" href="/History.html"><i
				class="icon"></i>
				<p>浏览记录</p> </a>
			<!--此处后期做JS 下拉菜单 展示记录-->
			<a class="upload" href="/upload"><i
				class="icon"></i>
				<p>上传考题</p> </a>
		</div>
	</div>
	<div id="nav" class="width-wrap cl">
		<div class="stats-wrap right-wrap">
			<span title="考友数" class="user"
				onclick="location.href='/user/users.html'"><i
				class="icon"></i><a></a> 76,433</span> <span title="考题数" class="exams"
				onclick="location.href='/moretests.html'"><i
				class="icon"></i> 269,386</span>
		</div>
		<ul>
			<li id="mu1" class="a"><a
				href="/index.html" title="">首页</a>
			</li>
			<li id="mu2"><a
				href="/practices.html" title="">在线做题</a>
			</li>
			<li id="mu8"><a href="/knowledges.html" title="">知识点</a>
			<li id="mu4"><a
				href="/questions.html" title="">在线答疑</a>
			</li>
			<li id="mu3"><a href="/groups.html"
				title="">考友群组</a></li>
			<li id="mu7"><a
				href="/specialtopics.html" title="">专题</a>
			</li>
			<li id="mu5"><a
				href="/downloads.html" title="">下载</a>
			</li>
			<li id="mu6"><a href="/jobs.html"
				title="">招聘</a>
			</li>

		</ul>
	</div>
</div>
<!--通用头部引用-->
<div id="content" class="cl">
     <div class="width-wrap">
               <div class="bc-nv">
               <span>您当前的位置：</span><a href="#">首页</a>
               <em>&gt;</em><a href="practices.html">在线做题</a>
          </div>
          <div class="cl">
               <div class="content-big left-wrap">
                    <div class="box-wrap list-header">
                         <h2>在线做题 - 题库汇总<span class="right-wrap more"><a class="fs1" href="categories.html" style="font-size: 15px;">分类导航</a>
                              </span></h2>
                         <table cellspacing="0" cellpadding="0" width="100%" class="table-filter" >
                              <tr>
                                   <td><ul class="filter-class">
                                  <li><a href="testlist?id=100"> 学历类(43491)</a>
                                             </li>
                                  <li><a href="testlist?id=300"> 外语类(28340)</a>
                                             </li>
                                  <li><a href="testlist?id=35"> 医药类(32405)</a>
                                             </li>
                                  <li><a href="testlist?id=200"> 资格类(64890)</a>
                                             </li>
                                  <li><a href="testlist?id=400">求职招聘(26690)</a>
                                             </li>
                                  <li><a href="testlist?id=40"> 财会类(63579)</a>
                                             </li>
                                  <li><a href="testlist?id=45"> 建筑类(17374)</a>
                                             </li>
                                  <li><a href="testlist?id=50"> 计算机类(11183)</a>
                                             </li>
                                  <li><a href="testlist?id=55"> 外贸类(3446)</a>
                                             </li>
                                  <li><a href="testlist?id=600"> 百科知识(4449)</a>
                                             </li>
                                  </ul></td>                                  
                              </tr>
                         </table>
                    </div>
                    <div class="sort-filter">
                    <span>排序:</span> 
                         <a href="practices.html?listtype=mostdate"><i class="icon asc"></i>最新</a>
    		                <a href="practices.html?listtype=mostviewcount"><i class="icon desc"></i>浏览次数</a>
                    <a href="practices.html?listtype=mostquality"><i class="icon desc"></i>做题次数</a>  
                    </div>
                    <div class="list-content">
                    <div class="cl">
                        <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=370&tc=300370" >韩语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282900" target="_blank" title="30届韩语初级考试真题（7）--阅读">30届韩语初级考试真题（7）--阅读</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">1</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7837&tc=2002707837" >旅游政策与法规</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282891" target="_blank" title="2015年全国导游资格《政策与法规》单选题精选四">2015年全国导游资格《政策与法规》单选题精选四</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=370&tc=300370" >韩语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282889" target="_blank" title="30届韩语初级考试真题（6）--阅读">30届韩语初级考试真题（6）--阅读</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">1</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7837&tc=2002707837" >旅游政策与法规</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282886" target="_blank" title="2015年全国导游资格《政策与法规》单选题精选三">2015年全国导游资格《政策与法规》单选题精选三</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=370&tc=300370" >韩语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282881" target="_blank" title="30届韩语初级考试真题（5）--阅读">30届韩语初级考试真题（5）--阅读</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">1</em>
                                   </span><span>做题次数：<em class="fs1">

                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7915&tc=3579147915" >医师三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282879" target="_blank" title="临床医师三基训练题集（24）">临床医师三基训练题集（24）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7837&tc=2002707837" >旅游政策与法规</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282877" target="_blank" title="2015年全国导游资格《政策与法规》单选题精选二">2015年全国导游资格《政策与法规》单选题精选二</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282875" target="_blank" title="2015年贵州铜仁中考英语试卷（单词拼写）">2015年贵州铜仁中考英语试卷（单词拼写）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">5</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7915&tc=3579147915" >医师三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282873" target="_blank" title="临床医师三基训练题集（23）">临床医师三基训练题集（23）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282871" target="_blank" title="2015年贵州铜仁中考英语试卷（阅读判断）">2015年贵州铜仁中考英语试卷（阅读判断）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7837&tc=2002707837" >旅游政策与法规</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282869" target="_blank" title="2015年全国导游资格《政策与法规》单选题精选一">2015年全国导游资格《政策与法规》单选题精选一</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">5</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282867" target="_blank" title="2015年贵州铜仁中考英语试卷（阅读理解B）">2015年贵州铜仁中考英语试卷（阅读理解B）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7915&tc=3579147915" >医师三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282866" target="_blank" title="临床医师三基训练题集（22）">临床医师三基训练题集（22）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282865" target="_blank" title="2015年贵州铜仁中考英语试卷（阅读理解A）">2015年贵州铜仁中考英语试卷（阅读理解A）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=370&tc=300370" >韩语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282863" target="_blank" title="30届韩语初级考试真题（4）--写作">30届韩语初级考试真题（4）--写作</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">1</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282861" target="_blank" title="2015年贵州铜仁中考英语试卷（情景交际）">2015年贵州铜仁中考英语试卷（情景交际）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">5</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7915&tc=3579147915" >医师三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282859" target="_blank" title="临床医师三基训练题集（21）">临床医师三基训练题集（21）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282857" target="_blank" title="2015年C语言方向春季校招预测面试题（七）">2015年C语言方向春季校招预测面试题（七）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=370&tc=300370" >韩语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282855" target="_blank" title="30届韩语初级考试真题（3）--词汇与语法③">30届韩语初级考试真题（3）--词汇与语法③</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">1</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282853" target="_blank" title="2015年贵州铜仁中考英语试卷（完形填空）">2015年贵州铜仁中考英语试卷（完形填空）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282850" target="_blank" title="2015年贵州铜仁中考英语试卷（单项选择）">2015年贵州铜仁中考英语试卷（单项选择）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=370&tc=300370" >韩语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282849" target="_blank" title="30届韩语初级考试真题（2）--词汇与语法②">30届韩语初级考试真题（2）--词汇与语法②</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">1</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282848" target="_blank" title="2015年C语言方向春季校招预测面试题（六）">2015年C语言方向春季校招预测面试题（六）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=370&tc=300370" >韩语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282844" target="_blank" title="30届韩语初级考试真题（1）--词汇与语法①">30届韩语初级考试真题（1）--词汇与语法①</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">1</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7915&tc=3579147915" >医师三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282840" target="_blank" title="临床医师三基训练题集（20）">临床医师三基训练题集（20）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282836" target="_blank" title="2015年C语言方向春季校招预测面试题（五）">2015年C语言方向春季校招预测面试题（五）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282833" target="_blank" title="2015年C语言方向春季校招预测面试题（四）">2015年C语言方向春季校招预测面试题（四）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7915&tc=3579147915" >医师三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282832" target="_blank" title="临床医师三基训练题集（19）">临床医师三基训练题集（19）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282830" target="_blank" title="2015年C语言方向春季校招预测面试题（三）">2015年C语言方向春季校招预测面试题（三）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282829" target="_blank" title="2015年C语言方向春季校招预测面试题（二）">2015年C语言方向春季校招预测面试题（二）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7346&tc=1001157346" >专业课</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282827" target="_blank" title="全国2010年7月高等教育自学考试中国税制试题（多项选择题）">全国2010年7月高等教育自学考试中国税制试题（多项选择题）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282826" target="_blank" title="2015年C语言方向春季校招预测面试题（一）">2015年C语言方向春季校招预测面试题（一）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7915&tc=3579147915" >医师三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282822" target="_blank" title="临床医师三基训练题集（18）">临床医师三基训练题集（18）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282816" target="_blank" title="2015年江苏盐城中考英语试卷（首字母填词 ）">2015年江苏盐城中考英语试卷（首字母填词 ）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">5</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7760&tc=3003227760" >PETS－2</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282813" target="_blank" title="全国英语等级考试全真模拟试卷2第二级第六套阅读理解（单选题）">全国英语等级考试全真模拟试卷2第二级第六套阅读理解（单选题）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">6</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282812" target="_blank" title="2015年江苏盐城中考英语试卷（词汇 ）">2015年江苏盐城中考英语试卷（词汇 ）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">6</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7915&tc=3579147915" >医师三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282811" target="_blank" title="临床医师三基训练题集（17）">临床医师三基训练题集（17）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282808" target="_blank" title="2015年江苏盐城中考英语试卷（阅读理解C）">2015年江苏盐城中考英语试卷（阅读理解C）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">6</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7915&tc=3579147915" >医师三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282807" target="_blank" title="临床医师三基训练题集（16）">临床医师三基训练题集（16）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282805" target="_blank" title="2015年江苏盐城中考英语试卷（阅读理解B）">2015年江苏盐城中考英语试卷（阅读理解B）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">6</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282804" target="_blank" title="2015年江苏盐城中考英语试卷（阅读理解A ）">2015年江苏盐城中考英语试卷（阅读理解A ）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">6</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7346&tc=1001157346" >专业课</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282803" target="_blank" title="全国2010年7月高等教育自学考试中国税制试题（单项选择题）">全国2010年7月高等教育自学考试中国税制试题（单项选择题）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282799" target="_blank" title="2015年江苏盐城中考英语试卷（完形填空 ）">2015年江苏盐城中考英语试卷（完形填空 ）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">6</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7309&tc=20023272647309" >保险基础知识</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282798" target="_blank" title="2015保险代理人机考真题二（判断题）10">2015保险代理人机考真题二（判断题）10</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">3</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7309&tc=20023272647309" >保险基础知识</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282796" target="_blank" title="2015保险代理人机考真题二（单选题）09">2015保险代理人机考真题二（单选题）09</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282795" target="_blank" title="2015年C语言方向秋季校招预测面试题（七）">2015年C语言方向秋季校招预测面试题（七）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7116&tc=1001057116" >英语</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282793" target="_blank" title="2015年江苏盐城中考英语试卷（单项选择 ）">2015年江苏盐城中考英语试卷（单项选择 ）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">6</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7309&tc=20023272647309" >保险基础知识</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282792" target="_blank" title="2015保险代理人机考真题二（单选题）08">2015保险代理人机考真题二（单选题）08</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7917&tc=3579147917" >医技三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282787" target="_blank" title="医学影像三基考试练习题集（30）">医学影像三基考试练习题集（30）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7309&tc=20023272647309" >保险基础知识</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282785" target="_blank" title="2015保险代理人机考真题二（单选题）07">2015保险代理人机考真题二（单选题）07</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7309&tc=20023272647309" >保险基础知识</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282783" target="_blank" title="2015保险代理人机考真题二（单选题）06">2015保险代理人机考真题二（单选题）06</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282782" target="_blank" title="2015年C语言方向秋季校招预测面试题（六）">2015年C语言方向秋季校招预测面试题（六）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7917&tc=3579147917" >医技三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282780" target="_blank" title="医学影像三基考试练习题集（29）">医学影像三基考试练习题集（29）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7693&tc=3003107693" >CET6</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282778" target="_blank" title="大学英语六级词汇单选专项训练十八">大学英语六级词汇单选专项训练十八</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7917&tc=3579147917" >医技三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282774" target="_blank" title="医学影像三基考试练习题集（28）">医学影像三基考试练习题集（28）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7309&tc=20023272647309" >保险基础知识</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282773" target="_blank" title="2015保险代理人机考真题二（单选题）05">2015保险代理人机考真题二（单选题）05</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=417&tc=400417" >IT工程师</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282772" target="_blank" title="2015年C语言方向秋季校招预测面试题（五）">2015年C语言方向秋季校招预测面试题（五）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7693&tc=3003107693" >CET6</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282771" target="_blank" title="大学英语六级词汇单选专项训练十七">大学英语六级词汇单选专项训练十七</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">4</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7917&tc=3579147917" >医技三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282769" target="_blank" title="医学影像三基考试练习题集（27）">医学影像三基考试练习题集（27）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         <dl>
                              <dt><span class="fs2"><a target="_blank"  href="http://www.51mokao.com/testlist2.html?id=7917&tc=3579147917" >医技三基</a>
                                   </span><a href="http://www.51mokao.com/testpractice?id=282767" target="_blank" title="医学影像三基考试练习题集（26）">医学影像三基考试练习题集（26）</a>
                              </dt>
                              <dd>
                                  <span class="stats stats-wrap"><span>浏览次数：<em class="fs1">2</em>
                                   </span><span>做题次数：<em class="fs1">
                                   0</em></span><span>平均分数：<em class="fs1">
                                      0%</em></span>
                                    <span class="right-wrap" style="margin-right:0px;"><em class="fs0">2015-06-25</em></span>
                                   </span>
                              </dd>
                         </dl>
                         </div>
                         <div class="paging">
                 
	<a href="" class="common-icon">首页</a>
<a href="" class="common-icon">上页</a>
 <strong>1</strong>
	<a href="#" onclick="nextPage(2)">2</a>
	<a href="#" onclick="nextPage(3)">3</a>
	<a href="#" onclick="nextPage(4)">4</a>
	<a href="#" onclick="nextPage(5)">5</a>
	<a href="#" onclick="nextPage(6)">6</a>
	<a href="#" onclick="nextPage(7)">7</a>
	<a href="#" onclick="nextPage(8)">8</a>
	<a href="#" class="common-icon" onclick="nextPage(2)">下页</a>
	<a href="#"  class="common-icon" onclick="nextPage(4496)">尾页</a>
	<a href="" class="common-icon">第1页</a>
	<a href="" class="common-icon">共4496页</a>

<script type="text/javascript">
function nextPage(page){		var url = document.location+'';
		if(url.indexOf('?')>-1){
			if(url.indexOf('cp')>-1){
				var reg = /cp=\d*/g;
				url = url.replace(reg,'cp=');
			}else{
				url += "&cp=";
			}
		}else{url += "?cp=";}
     url=url.replace("#","");      	
		document.location = url + page;
	}
</script>
</div>
                    </div>  
               </div>
               <div class="right-sidebar right-wrap">
                 
                  <ul class="list">
                                        <li class="margin-b"><a href="https://www.qingyidai.com/" target="_blank"><img src="img/qingyidais.png" /></a></li>
                 </ul>
                 
                                   <ul class="list">
                                        <li class="margin-b"><a href="parttimejobapps.html" target="_blank"><img src="images/jz.jpg" /></a></li>
                                   </ul>
     	  <div id="faq" class="card">
                     <h3 class="card-header">最新话题<span class="right-wrap more"><a class="fs1 sz14" href="http://www.51mokao.com/groups.html">更多</a>
                              </span></h3>
                     <div class="card-body">
                                   <ul class="list">
                                        <li><a href="http://www.51mokao.com/forumpostscont.html?id=99526" title="高考志愿填报：弄清3个“分数线”很重要">
     						
                                   	高考志愿填报：弄清3个“分数线”很重
</a></li>
                                        <li><a href="http://www.51mokao.com/forumpostscont.html?id=99521" title="陕西2015年高考录取率有望达80%">
     						
                                   	陕西2015年高考录取率有望达80%
</a></li>
                                        <li><a href="http://www.51mokao.com/forumpostscont.html?id=99517" title="河南高考志愿填报技巧：4步法">
     						
                                   	河南高考志愿填报技巧：4步法
</a></li>
                                        <li><a href="http://www.51mokao.com/forumpostscont.html?id=99512" title="专家：高考报志愿关键是让分数“最大化”">
     						
                                   	专家：高考报志愿关键是让分数“最大化
</a></li>
                                        <li><a href="http://www.51mokao.com/forumpostscont.html?id=99510" title="分散农业巨灾风险 农业保险共同体保障规模达2500亿元">
     						
                                   	分散农业巨灾风险 农业保险共同体保障
</a></li>
                                        <li><a href="http://www.51mokao.com/forumpostscont.html?id=99508" title="安徽高考女生包揽省文理科状元引广泛关注">
     						
                                   	安徽高考女生包揽省文理科状元引广泛关
</a></li>
                                        <li><a href="http://www.51mokao.com/forumpostscont.html?id=99507" title="雷克萨斯开发悬浮滑板原型 飞行汽车不是梦">
     						
                                   	雷克萨斯开发悬浮滑板原型 飞行汽车不
</a></li>
                                        <li><a href="http://www.51mokao.com/forumpostscont.html?id=99506" title="平安好车斥资60亿元 推中国二手车保障计划">
     						
                                   	平安好车斥资60亿元 推中国二手车保障
</a></li>
                                        <li><a href="http://www.51mokao.com/forumpostscont.html?id=99505" title="高考状元调查报告：九成状元选择进京">
     						
                                   	高考状元调查报告：九成状元选择进京
</a></li>
                                        </ul>
                              </div>
                    </div>
                    
                    
                   	  <div id="faq" class="card">
                     <h3 class="card-header">最新答疑<span class="right-wrap more"><a class="fs1" target="_blank" href="questions.html">更多</a>
                              </span></h3>
                     <div class="card-body">
                                   <ul class="list">
                                   <li><a target="_blank" href="http://www.51mokao.com/questioncont.html?id=1933756" title="这是考其他的试题，【单选题】术中见乙状结肠顺时针扭转600，肠管已发黑，行乙状结肠切除后，在左下腹部行暂时性造口，此时对病人的护理措施中错误的是（　　）">
                                         	这是考其他的试题，【单选题】术中见乙
</a></li>
                                        <li><a target="_blank" href="http://www.51mokao.com/questioncont.html?id=1933755" title="这个是考其他的考题，【单选题】最适宜的处理方案是（　　）">
                                         	这个是考其他的考题，【单选题】最适宜
</a></li>
                                        <li><a target="_blank" href="http://www.51mokao.com/questioncont.html?id=1933754" title="看看这个其他考试试题，【单选题】病人的腹部立位X线摄片见马蹄状巨大双腔充气肠袢，为进一步明确诊断，最适合的检查是（　　）">
                                         	看看这个其他考试试题，【单选题】病人
</a></li>
                                        <li><a target="_blank" href="http://www.51mokao.com/questioncont.html?id=1933753" title="这是复习其他的在线做题，【单选题】此时病人的水、电解质、酸碱代谢改变主要是（　　）">
                                         	这是复习其他的在线做题，【单选题】此
</a></li>
                                        <li><a target="_blank" href="http://www.51mokao.com/questioncont.html?id=1933752" title="这是其他在线练习题，【单选题】若为乙状结肠扭转，其肠梗阻类型不属于（　　）">
                                         	这是其他在线练习题，【单选题】若为乙
</a></li>
                                        <li><a target="_blank" href="http://www.51mokao.com/questioncont.html?id=1933751" title="这个是考其他的在线练习题，【单选题】对该病人应首先考虑（　　）">
                                         	这个是考其他的在线练习题，【单选题】
</a></li>
                                        <li><a target="_blank" href="http://www.51mokao.com/questioncont.html?id=1933750" title="这是考其他的试题，【单选题】经治疗后，肠梗阻解除的主要标志是（　　）">
                                         	这是考其他的试题，【单选题】经治疗后
</a></li>
                                        <li><a target="_blank" href="http://www.51mokao.com/questioncont.html?id=1933749" title="这个是考其他的考题，【单选题】非手术治疗期间，如出现下列哪一种性质腹痛，说明产生了肠绞窄（　　）">
                                         	这个是考其他的考题，【单选题】非手术
</a></li>
                                        <li><a target="_blank" href="http://www.51mokao.com/questioncont.html?id=1933748" title="这是其他考试的在线做题，【单选题】与上述诊断相符的体征是（　　）">
                                         	这是其他考试的在线做题，【单选题】与
</a></li>
                                        </ul>
                              </div>
                    </div>
                <div class="box-wrap-nb">
                   <h3><em class="fs1">最新专题</em><span class="right-wrap more sz14"><a class="fs1"  target="_blank"  href="specialtopics.html">更多</a> 
                              </span></h3>
                     <div class="note-list fs6">
                                   <ul class="list">
                                        <li class="margin-b"><a href="testlist2?id=288&ptid=200&tc=200288"><img src="img/ztr01.jpg" /></a></li>
                                        
                                        <li class="margin-b"><a href="testlist2?id=7698&ptid=300&tc=3007698"><img src="img/ztr02.jpg" /></a></li>
                                        
                                           <li><a href="testlist2?id=7653&ptid=308&tc=3003087653"><img src="img/ztr03.jpg" /></a></li>
                                   </ul>
                              </div>
                          </div>
                        
                                <div id="faq" class="card">
                                <h3 class="card-header">
                                    推荐考友群组<span class="right-wrap more"><a class="fs1 sz14" href="groups.html" target="_blank">更多</a>
                              </span>
                                </h3>    <div class="card-body">
                    <div class="group-recom">
                         <div class="bd">
                              <ul>
                                                   <li>
                                        <div class="pic">
                                             <a  target="_blank" href="http://www.51mokao.com/groupinfo.html?gid=278">
                                             <img height="48" width="48"  src="/GroupLogos/201408/u71207-1407935565300.gif"/>
                                             </a>
                                        </div>
                                        <div class="info">
                                             <div class="title">
                                                  <a  target="_blank" class="" href="http://www.51mokao.com/groupinfo.html?gid=278">
											Carol English</a>
                                             </div>
                                             <span class="num"> 75个成员 </span>
                                             <span class="join">
                                             <a target="_blank" href="http://www.51mokao.com/addtogroup.html?gid=278&where=0"><i>+</i>加入小组</a>
                                             </span>
                                             </div>
                                   </li>
                                   <li>
                                        <div class="pic">
                                             <a  target="_blank" href="http://www.51mokao.com/groupinfo.html?gid=11">
                                             <img height="48" width="48"  src="/GroupLogos/g-11-20090706021319915.jpg"/>
                                             </a>
                                        </div>
                                        <div class="info">
                                             <div class="title">
                                                  <a  target="_blank" class="" href="http://www.51mokao.com/groupinfo.html?gid=11">
											英语阅读训练营</a>
                                             </div>
                                             <span class="num"> 210个成员 </span>
                                             <span class="join">
                                             <a target="_blank" href="http://www.51mokao.com/addtogroup.html?gid=11&where=0"><i>+</i>加入小组</a>
                                             </span>
                                             </div>
                                   </li>
                                   <li>
                                        <div class="pic">
                                             <a  target="_blank" href="http://www.51mokao.com/groupinfo.html?gid=12">
                                             <img height="48" width="48"  src="/GroupLogos/g-12-20090911134317429.jpg"/>
                                             </a>
                                        </div>
                                        <div class="info">
                                             <div class="title">
                                                  <a  target="_blank" class="" href="http://www.51mokao.com/groupinfo.html?gid=12">
											英语听力训练营</a>
                                             </div>
                                             <span class="num"> 333个成员 </span>
                                             <span class="join">
                                             <a target="_blank" href="http://www.51mokao.com/addtogroup.html?gid=12&where=0"><i>+</i>加入小组</a>
                                             </span>
                                             </div>
                                   </li>
                                   <li>
                                        <div class="pic">
                                             <a  target="_blank" href="http://www.51mokao.com/groupinfo.html?gid=16">
                                             <img height="48" width="48"  src="/GroupLogos/g-16-20090801135057512.jpg"/>
                                             </a>
                                        </div>
                                        <div class="info">
                                             <div class="title">
                                                  <a  target="_blank" class="" href="http://www.51mokao.com/groupinfo.html?gid=16">
											英语口语训练营</a>
                                             </div>
                                             <span class="num"> 222个成员 </span>
                                             <span class="join">
                                             <a target="_blank" href="http://www.51mokao.com/addtogroup.html?gid=16&where=0"><i>+</i>加入小组</a>
                                             </span>
                                             </div>
                                   </li>
                                   <li>
                                        <div class="pic">
                                             <a  target="_blank" href="http://www.51mokao.com/groupinfo.html?gid=13">
                                             <img height="48" width="48"  src="/GroupLogos/201407/u115-1404351034951.png"/>
                                             </a>
                                        </div>
                                        <div class="info">
                                             <div class="title">
                                                  <a  target="_blank" class="" href="http://www.51mokao.com/groupinfo.html?gid=13">
											英语写作训练营</a>
                                             </div>
                                             <span class="num"> 115个成员 </span>
                                             <span class="join">
                                             <a target="_blank" href="http://www.51mokao.com/addtogroup.html?gid=13&where=0"><i>+</i>加入小组</a>
                                             </span>
                                             </div>
                                   </li>
                                   <li>
                                        <div class="pic">
                                             <a  target="_blank" href="http://www.51mokao.com/groupinfo.html?gid=2">
                                             <img height="48" width="48"  src="/GroupLogos/201407/u256-1404290892966.png"/>
                                             </a>
                                        </div>
                                        <div class="info">
                                             <div class="title">
                                                  <a  target="_blank" class="" href="http://www.51mokao.com/groupinfo.html?gid=2">
											英语乐园</a>
                                             </div>
                                             <span class="num"> 166个成员 </span>
                                             <span class="join">
                                             <a target="_blank" href="http://www.51mokao.com/addtogroup.html?gid=2&where=0"><i>+</i>加入小组</a>
                                             </span>
                                             </div>
                                   </li>
                                   <li>
                                        <div class="pic">
                                             <a  target="_blank" href="http://www.51mokao.com/groupinfo.html?gid=40">
                                             <img height="48" width="48"  src="/GroupLogos/g-40-20100308150559441.jpg"/>
                                             </a>
                                        </div>
                                        <div class="info">
                                             <div class="title">
                                                  <a  target="_blank" class="" href="http://www.51mokao.com/groupinfo.html?gid=40">
											英文音乐</a>
                                             </div>
                                             <span class="num"> 192个成员 </span>
                                             <span class="join">
                                             <a target="_blank" href="http://www.51mokao.com/addtogroup.html?gid=40&where=0"><i>+</i>加入小组</a>
                                             </span>
                                             </div>
                                   </li>
                                   <li>
                                        <div class="pic">
                                             <a  target="_blank" href="http://www.51mokao.com/groupinfo.html?gid=17">
                                             <img height="48" width="48"  src="/GroupLogos/g-17-20090807131536887.jpg"/>
                                             </a>
                                        </div>
                                        <div class="info">
                                             <div class="title">
                                                  <a  target="_blank" class="" href="http://www.51mokao.com/groupinfo.html?gid=17">
											读原版英语</a>
                                             </div>
                                             <span class="num"> 106个成员 </span>
                                             <span class="join">
                                             <a target="_blank" href="http://www.51mokao.com/addtogroup.html?gid=17&where=0"><i>+</i>加入小组</a>
                                             </span>
                                             </div>
                                   </li>
                                   <li>
                                        <div class="pic">
                                             <a  target="_blank" href="http://www.51mokao.com/groupinfo.html?gid=21">
                                             <img height="48" width="48"  src="/GroupLogos/g-21-20090901200304879.jpg"/>
                                             </a>
                                        </div>
                                        <div class="info">
                                             <div class="title">
                                                  <a  target="_blank" class="" href="http://www.51mokao.com/groupinfo.html?gid=21">
											英语四级联盟</a>
                                             </div>
                                             <span class="num"> 145个成员 </span>
                                             <span class="join">
                                             <a target="_blank" href="http://www.51mokao.com/addtogroup.html?gid=21&where=0"><i>+</i>加入小组</a>
                                             </span>
                                             </div>
                                   </li>
                                   </ul>
                         </div>
                    </div>
               </div>
               </div>
               </div>
          </div>
     </div>
</div>
<!--公用底部  -->
<div class="width-wrap">
     <div class="help-wrap cl">
          <h3>新手帮助</h3>
          <a href="/help.html" target="_blank">新手必读</a>
          <a href="/helpmakess.html" target="_blank">怎样赚学分</a>
          <a href="/helpdownload.html" target="_blank">如何下载学习资料</a>
           <a href="/helpphone.html" target="_blank">手机也能上网站</a>
     </div>
</div>
<div class="plugin_wx" id="wx">
            <a class="wx_close" title="点击关闭" href="javascript:hideWX();">
            <img src="/img/close_wx.gif"/>
            </a>
            <div><img src="/img/wx.jpg"/></div>
            <div class="wx_title">
                扫码 微信做题更方便
                www.51mokao.com
            </div>
			</div>
<div id="footer">
     <div class="width-wrap">
          <p><a href="/aboutus.html" target="_blank">关于我要模考网</a>
        <span class="pipe">|</span><a href="/serviceterms.html" target="_blank">使用协议</a>
               <span class="pipe">|</span><a href="/copyright.html" target="_blank">版权声明</a>
               <span class="pipe">|</span><a href="/kfjobs.html" target="_blank">工作机会</a>
               <span class="pipe">|</span><a href="/contactus.html" target="_blank">联系我们</a>
                  <span class="pipe">|</span><a href="/feedback.html" target="_blank">意见反馈</a>
          </p>
        <p>Copyright &copy; 2008 - 2015 我要模考网 版权所有 </p>
                  <p>我要模考网交流群：100586814 客服QQ：41460770    沪ICP备13047312号-1</p>
     </div>
</div>

<script type="text/javascript">
function hideWX(){

document.getElementById('wx').style.display='none'
}

</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-6859996-1', 'auto');
  ga('send', 'pageview');
</script>
<script>
document.getElementById("mu2").className="a";
document.getElementById("mu1").className="";
document.getElementById("mu4").className="";
document.getElementById("mu3").className="";
document.getElementById("mu5").className="";
</script>
</body>
</html>


