

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
function formatDateTime (ordate){
    var date= new Date(ordate.time);  
	var y = date.getFullYear();  
    var m = date.getMonth() + 1;  
    m = m < 10 ? ('0' + m) : m;  
    var d = date.getDate();  
    d = d < 10 ? ('0' + d) : d;  
    var h = date.getHours();  
    var minute = date.getMinutes();  
    minute = minute < 10 ? ('0' + minute) : minute;  
    return y + '-' + m + '-' + d+' '+h+':'+minute;  
}

//设置button效果，开始计时
var InterValObj; //timer变量，控制时间
var count = 50; //间隔函数，1秒执行
var curCount=count;//当前剩余秒数
var btnId ="";
function setButtonRemainTime(id){
	btnId=id;
	$(btnId).attr("disabled", "true");
	$(btnId).val( + curCount + "秒再获取");
	InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
}

function SetRemainTime() {
	if (curCount == 0) {                
		window.clearInterval(InterValObj);//停止计时器
		$(btnId).removeAttr("disabled");//启用按钮
		$(btnId).val("重发验证码");
		curCount=50;
	}
	else {
		curCount--;
		$(btnId).val( + curCount + "秒再获取");
	}
}