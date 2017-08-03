/*   名称: base.js

--   Copyright   (c)   2011-2012   杭州摩科商用设备有限公司技术开发部 

--   创建人: 俞小元

--   日   期: 20120622

--   修改人: 

--   日   期: 

--   描   述: 通用操作JS

--   版   本: v 1.0.0.0
--------------------------------------------------------------------------*/
var backTime;
$(document).ready(function(){
   var run=new S_S_Cmd();
   backTime=run.run("House","getBackTime");
   $("<div id=\"timeoutbox\"><span id=\"outsec\">00</span></div>").appendTo("body");
   $("#btnBackSY").click(function(){
        toUrl("SY.html");
   });
});

//页面跳转
function toUrl(url)
{
    window.external.playStop();
	window.external.setMain(false);
	window.external.resetTime();
	//是首页则不倒计时
	if(url=="SY.html")
	{
	    window.external.setMain(true);
	}
	location.href=url;
} 

function toback()
{
    toUrl("SY.html");
}


//更新超时退出时间提示
function update_timeout_box(time){
	var now=new Date();
	var timeTxt = now.getYear()+"-";
	timeTxt += now.getMonth()>8 ? parseInt(now.getMonth()+1)+"-":"0"+parseInt(now.getMonth()+1)+"-";
	timeTxt += now.getDate()>9  ? now.getDate()+" ":"0"+now.getDate()+" ";
	timeTxt += now.getHours()>9 ?now.getHours()+":":"0"+now.getHours()+":";
	timeTxt += now.getMinutes()>9 ? now.getMinutes()+":":"0"+now.getMinutes()+":";
	timeTxt += now.getSeconds()>9 ? now.getSeconds(): "0"+now.getSeconds();
	$("#timeshow").html(timeTxt);
	if (time>Number(backTime)-1){
		try{
			$("#timeoutbox").css("display","none");
		}
		catch(err){
		}
	}
	else if (time>0){
		try{
			$("#outsec").html(time);
			$("#timeoutbox").css("display","block");
		}
		catch(err){
			
		}
	}
	else{
        	//清空登录信息
			window.external.setMain(true);
            location.href="SY.html";
	}
	
}

//设置是否超时计数
function setTimeState(ok){
	window.external.timeState(ok);
}


function GetBaseInfo(IsSy)
{
    
//    var run=new S_S_Cmd();
//    if(IsSy)
//    {
//        $("#xtmc").html("杭州市房产档案馆");
//        $("#show").html("房产档案 服务民生");
//        $("#hysy").html("欢迎使用房产档案自助查询系统");
//    }else
//    {
//        $("#xtmc").html("杭州市房产档案馆");
//        $("#show").html("房产档案 服务民生");
//        $("#zzcx_show").html("房产档案自助查询系统");
//    }
    var run=new S_S_Cmd();
    var re,str;
    re=run.run("House","getSY_info");
    if(IsSy)
    {
        str=re.split("~|~"); 
        $("#xtmc").html(str[0]);
        $("#show").html(str[1]);
        $("#hysy").html("欢迎使用"+str[2]);
    }else
    {
        str=re.split("~|~"); 
        $("#xtmc").html(str[0]);
        $("#show").html(str[1]);
        $("#zzcx_show").html(str[2]);
    }
}