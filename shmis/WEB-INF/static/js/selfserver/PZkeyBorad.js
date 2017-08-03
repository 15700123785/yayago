// JavaScript Document

//确定按钮 mouse_up 状态图片地址
var but_up = "/shmis/images/selfserver/KeyUp.png";
//确定按钮 mouse_down 状态图片地址
var but_down = "/shmis/images/selfserver/KeyDown.png";

function YearWnd(title,width,height,type){
    YearWnd.title = title;
	YearWnd.width = width;
	YearWnd.height = height;
//	YearWnd.startYear = startYear;
//	YearWnd.nowStart = startYear;
	YearWnd.clickFun = null;
//	YearWnd.isall=Isall;
	YearWnd.type=type;
}

YearWnd.toback=function()
{
    YearWnd.close();
}

YearWnd.close = function(){
	$("#year_s_s_backgroud").css("display","none");
	$("#year_s_s_msgwnd").css("display","none");
}

YearWnd.prototype.Open=function(val){
    $("#year_s_s_backgroud").css("display","block");
	$("#year_s_s_msgwnd").css("display","block");
	$("#pwdtext").val("");
	$("#error").html("");
	$("#title").html(val);
    }

YearWnd.prototype.showError = function(val){
    $("#error").html(val);
    $("#pwdtext").val("");
}

YearWnd.prototype.close = function(){
   YearWnd.close();
}

YearWnd.click = function(val){
    if(val=="OK")
    {   //YearWnd.close();
	    YearWnd.clickFun($("#pwdtext").val());
    }
    else if(val=="-")
    {
        $("#pwdtext").val($("#pwdtext").val().substring(0,$("#pwdtext").val().length-1));
    }else if(val=="--")
    {
        $("#pwdtext").val("");
    }else
    {
         $("#pwdtext").val($("#pwdtext").val()+val);
    }
}


YearWnd.prototype.show_wnd=function(dofun){
	YearWnd.clickFun = dofun;
	if ($("#year_s_s_backgroud").html()==null){
		var obj = $("<div id=\"year_s_s_backgroud\"></div>").appendTo("body");
		obj.css("width",window.screen.width +"px");
		obj.css("height",window.screen.height+"px");
		obj.css("filter","progid:DXImageTransform.Microsoft.Alpha(startX=0, startY=0, finishX=100, finishY=100,style=1,opacity=80,finishOpacity=80)");
		obj.css("backgroundColor","#000");
		obj.css("position","absolute");
		obj.css("top","0");
		obj.css("left","0");
		obj.css("z-index","50");
		obj.css("display","block");
	}
	if ($("#year_s_s_msgwnd").html()==null){
		var msgWnd = $("<div id=\"year_s_s_msgwnd\"><div id=\"year_s_s_msgwndtitle\"><span id=\"title\" style=\"padding-left:12px;\">"+YearWnd.title+"</span><span id=\"closeDiv\" style=\"cursor:pointer;\" onselectstart=\"return false;\" onclick=\"YearWnd.toback()\">X</span></div><div>&nbsp;</div><div style=\"text-align:center;\"><input style=\"background-color:#d1d1d1;width:420px;text-align:center;line-height:30px; height:30px;font-size:30px;\" type=\""+YearWnd.type+"\" id=\"pwdtext\" / </div><div style=\"color:red\" id=\"error\">&nbsp;</div><div style=\"height:60px;\" id=\"year_s_s_msgwndcont\"></div></div>").appendTo("body");
		msgWnd.css("width",YearWnd.width + "px");
		msgWnd.css("height",YearWnd.height + "px");
		msgWnd.css("backgroundColor","#FFF");
		msgWnd.css("top",parseInt((window.screen.height - YearWnd.height)/2)+"px");
		msgWnd.css("left",parseInt((window.screen.width - YearWnd.width)/2)+"px");
		msgWnd.css("z-index","51");
		msgWnd.css("position","absolute");
		msgWnd.css("border","#7a2727 solid 3px");
		$("#year_s_s_msgwndtitle").css("font-family","微软雅黑");
		$("#year_s_s_msgwndtitle").css("backgroundColor","#7a2727");
		$("#year_s_s_msgwndtitle").css("fontSize","24px");
		$("#year_s_s_msgwndtitle").css("color","#FFF");
		$("#year_s_s_msgwndtitle").css("text-align","center");
		$("#year_s_s_msgwndtitle").css("borderBottom","#7a2727 solid 3px");
		$("#closeDiv").css("position","absolute");
		$("#closeDiv").css("left",(YearWnd.width -30)+"px");
		$("#closeDiv").css("backgroundColor","#7a2727");
		$("#closeDiv").css("width","30px");
		$("#closeDiv").css("hegth",(YearWnd.height-3)+"px");
		
	}
	$("#year_s_s_backgroud").css("display","block");
	$("#year_s_s_msgwnd").css("display","block");
	$("#year_s_s_msgwndcont").html("");
	var html = new Array();
	html.push("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" ><tr>");
	
	YearWnd.keyVal = new Array(13);
	YearWnd.keyVal = [["1","1",0],["2","2",0],["3","3",0],["-","退格",1],["4","4",0],
		  ["5","5",0],["6","6",0],["--","清除",1],["7","7",0],["8","8",0],
		   ["9","9",0],["OK","确定",1],["0","0",0]];
	
	for (var i=0;i<YearWnd.keyVal.length;i++){
		html.push("<td height=\"80\" valign=\"middle\">");
		html.push("<div style=\"background-image:url("+but_up+");font-size:28px; width:107px; height:80px;line-height:53px;font-family:'微软雅黑'; color:#FFF;text-align:center\" onmouseup=\"this.style.backgroundImage='url("+but_up+")'\" onmouseout=\"this.style.backgroundImage='url("+but_up+")'\" onclick=\"YearWnd.click('"+(YearWnd.keyVal[i][0])+"')\" onmousedown=\"this.style.backgroundImage='url("+but_down+")'\"><div style=\"margin-top:15px;\" onselectstart=\"return false;\">"+(YearWnd.keyVal[i][1])+"</div></div>");
//		html.push("<div style=\"width:107px; top:-40px; background-color:red; line-height:53px;font-family:'微软雅黑'; color:#FFF;text-align:center\" onclick=\"YearWnd.click('"+(YearWnd.keyVal[i][0])+"')\">"+(YearWnd.keyVal[i][1])+"</div>");
		html.push("</td>");
		if(YearWnd.keyVal[i][2]=="1")
	    {
	        html.push("</tr><tr>")
	    }
	}
	html.push("</tr>");
	html.push("</table>");
	$("#year_s_s_msgwndcont").html(html.join(""));
	$("#pwdtext").val("");
	//var count = 
}
