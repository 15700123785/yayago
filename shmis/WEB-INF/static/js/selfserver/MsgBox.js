/****************************************************************** 

**   �ļ���:MsgBox.js

**   Copyright   (c)   2011-2012   ����Ħ�������豸���޹�˾���������� 

**   ������: ���

**   ��   ��: 20120627

**   �޸���: 

**   ��   ��: 

**   ��   ��: js ��������ʾ�������  Ŀǰ��֧��IE
**  

**   ��   ��: v 1.0.0.0

**--------------------------------------------------------------------------*/
var fun;
//ȷ����ť mouse_up ״̬ͼƬ��ַ
var but_s_s_close_up = "/shmis/images/selfserver/msgbox_up.png";
//ȷ����ť mouse_down ״̬ͼƬ��ַ
var but_s_s_close_down = "/shmis/images/selfserver/msgbox_down.png";
//�ȴ�ͼ��ͼƬ��ַ/// 

var ico_s_s_waitting = "/shmis/images/selfserver/waitting.gif";

function MsgBox(title,width,height){
	MsgBox.Width = width;
	MsgBox.Height = height;
	MsgBox.Title = title;
	MsgBox.IsShow = false;	
	MsgBox.hTime = null;
	MsgBox.maxTime = 0;
	MsgBox.time = 0;
	MsgBox.ok = true; //�Ƿ���ʾ��ť
	MsgBox.isWait = false; //�Ƿ���ʾ�ȴ�ͼ��
}

//�رտؼ�
MsgBox.close=function(){
    clearInterval(fun);
	if (MsgBox.hTime!=null){
		clearInterval(MsgBox.hTime)
		MsgBox.hTime = null;
	}
	$("#s_s_backgroud").css("display","none");
	$("#s_s_msgwnd").css("display","none");
	if (MsgBox.doFun!=null){
		MsgBox.doFun();
	}
}

MsgBox.prototype.close = function(){
    	window.external.setMain(false);
	    MsgBox.close();
}

//�޸�����
MsgBox.prototype.show_content_html = function(html){
	$("#s_s_msgwndcont").html(html);
}

MsgBox.prototype.show_content_text = function(text){
	$("#s_s_msgwndcont").text(text);
}

//��ʾ������
MsgBox.prototype.show_or_hidden_w_ico = function(show){
	if (show==false){
		$("#s_s_msg_ico").css("display","none");
	}
	else{
		$("#s_s_msg_ico").html("<img  src=\""+ico_s_s_waitting+"\" border=\"0\" style=\"margin-top:20px;\">");
		$("#s_s_msg_ico").css("display","block");
		$("#s_s_msg_ico").css("height","100px");
		$("#s_s_msgwndcont").css("height",(MsgBox.Height-200)+"px");
	}
}

//��ʾ����
MsgBox.prototype.show=function(){
	if ($("#s_s_backgroud").html()==null){
		var obj = $("<div id=\"s_s_backgroud\" onclick=\" event.returnValue = false\"></div>").appendTo("body");
		obj.css("width",window.screen.width +"px");
		obj.css("height",window.screen.height+"px");
		obj.css("filter","progid:DXImageTransform.Microsoft.Alpha(startX=0, startY=0, finishX=100, finishY=100,style=1,opacity=80,finishOpacity=80)");
		obj.css("backgroundColor","#000");
		obj.css("position","absolute");
		obj.css("top","0");
		obj.css("left","0");
		obj.css("z-index","500");
		obj.css("display","block");
	}

	if ($("#s_s_msgwnd").html()==null){
		var msgWnd = $("<div id=\"s_s_msgwnd\"><div id=\"s_s_msgwndtitle\"><span style=\"padding-left:12px;\">"+MsgBox.Title+"</span></div><div id=\"s_s_msg_ico\"></div><div id=\"s_s_msgwndcont\"></div><div align=\"center\"><div  id=\"s_s_msgclose\" onmousedown=\" document.getElementById('s_s_msgclose').style.backgroundImage='url("+but_s_s_close_down+")';\"  onmouseup=\"document.getElementById('s_s_msgclose').style.backgroundImage='url("+but_s_s_close_up+")';\" onclick=\"MsgBox.close()\" onselectstart=\"return false;\"  >确定</div></div></div>").appendTo("body");
		msgWnd.css("width",MsgBox.Width + "px");
		msgWnd.css("height",MsgBox.Height + "px");
		msgWnd.css("backgroundColor","#FFF");
		msgWnd.css("top",parseInt((window.screen.height - MsgBox.Height)/2)+"px");
		msgWnd.css("left",parseInt((window.screen.width - MsgBox.Width)/2)+"px");
		msgWnd.css("z-index","501");
		msgWnd.css("position","absolute");
		msgWnd.css("border","#7a2727 solid 3px");
		$("#s_s_msgclose").css("width","150px");
		$("#s_s_msgclose").css("height","53px");
		$("#s_s_msgclose").css("font-family","微软雅黑");
		$("#s_s_msgclose").css("lineHeight","53px");
		$("#s_s_msgclose").css("color","#FFF");
		$("#s_s_msgclose").css("backgroundImage","url(images/msgbox_up.png)");
		$("#s_s_msg_ico").css("text-align","center");
		$("#s_s_msgwndtitle").css("backgroundColor","#7a2727");
		$("#s_s_msgwndtitle").css("height","40px");
		$("#s_s_msgwndtitle").css("width","100%");
		$("#s_s_msgwndtitle").css("lineHeight","40px");
		$("#s_s_msgwndtitle").css("text-align","center");
		//$("#s_s_msgwndtitle").css("fontWeight","bolder");
		$("#s_s_msgwndtitle").css("font-family","微软雅黑");
		$("#s_s_msgwndtitle").css("fontSize","24px");
		$("#s_s_msgwndtitle").css("color","#FFF");
		$("#s_s_msgwndtitle").css("borderBottom","#7a2727 solid 3px");
		
		$("#s_s_msgwndcont").css("font-family","微软雅黑");
		$("#s_s_msgwndcont").css("paddingLeft","10px");
		$("#s_s_msgwndcont").css("fontSize","18px");
		$("#s_s_msgwndcont").css("lineHeight","28px");
		$("#s_s_msgwndcont").css("height",(MsgBox.Height-100)+"px");
		$("#s_s_msgwndcont").css("text-align","center");
	
	
	}
	else{
		$("#s_s_msgwndtitle").html("<span style=\"padding-left:12px;\">"+MsgBox.Title+"</span>");
		$("#s_s_msgwndcont").html(msg);
		$("#s_s_backgroud").css("display","block");
		$("#s_s_msgwnd").css("height",MsgBox.Height+"px");
		$("#s_s_msgwnd").css("width",MsgBox.Width+"px");
		$("#s_s_msgwndcont").css("height",(MsgBox.Height-100)+"px");
		$("#s_s_msgwnd").css("top",parseInt((window.screen.height - MsgBox.Height)/2)+"px");
		$("#s_s_msgwnd").css("left",parseInt((window.screen.width - MsgBox.Width)/2)+"px");
		$("#s_s_msgwnd").css("display","block");
		//$("#s_s_msgclose").attr("disabled ","true");
	}
	if (MsgBox.ok == false){
	    
	//	$("#s_s_msgclose").attr("disabled ","true");
		$("#s_s_msgclose").css("display","none");
	}
	else{
	//	$("#s_s_msgclose").attr("disabled ","false");
		$("#s_s_msgclose").css("display","block");
	}
	
	if (MsgBox.isWait == false){
		$("#s_s_msg_ico").css("display","none");
	}
	else{
		$("#s_s_msg_ico").html("<img src=\""+ico_s_s_waitting+"\" border=\"0\" style=\"margin-top:20px;\">");
		$("#s_s_msg_ico").css("display","block");
		$("#s_s_msg_ico").css("height","100px");
		$("#s_s_msgwndcont").css("height",(MsgBox.Height-200)+"px");
	}
	
}

MsgBox.prototype.ok_wnd_show = function(msg){
	MsgBox.isWait = false;
	MsgBox.ok= true;
	MsgBox.prototype.show();
	MsgBox.prototype.show_content_html(msg);
	$("#s_s_msgclose").css("display","block");
	$("#s_s_msgclose").css("background-image","url('"+but_s_s_close_up+"')");
	MsgBox.doFun=toback;
	window.external.setMain(false);
}

MsgBox.prototype.ok_wnd_show_html = function(msg){
    window.external.setMain(false);
	MsgBox.isWait = false;
	MsgBox.ok= true;
	MsgBox.prototype.show();
	MsgBox.prototype.show_content_html(msg);
    MsgBox.doFun=toback;
	$("#s_s_msgclose").css("display","block");
	$("#s_s_msgclose").css("background-image","url('"+but_s_s_close_up+"')");
}

MsgBox.prototype.btn_wnd_show_html = function(msg){
    window.external.setMain(false);
	MsgBox.isWait = false;
	MsgBox.ok= true;
	MsgBox.prototype.show();
	MsgBox.prototype.show_content_html(msg);
	$("#s_s_msgclose").css("display","none");
	$("#s_s_msgclose").css("background-image","url('"+but_s_s_close_up+"')");
}

MsgBox.prototype.btn_wnd_show_html_ = function(msg){
    window.external.setMain(false);
	MsgBox.isWait = false;
	MsgBox.ok= true;
	MsgBox.prototype.show();
	MsgBox.prototype.show_content_html(msg);
	$("#s_s_msgclose").css("display","block");
	$("#s_s_msgclose").css("background-image","url('"+but_s_s_close_up+"')");
}


MsgBox.prototype.wait_wnd_show=function(msg){
    window.external.setMain(true);
    window.external.resetTime();
	MsgBox.isWait = true;
	MsgBox.doFun=null;
	MsgBox.prototype.show();
	MsgBox.prototype.show_content_text(msg);	
	$("#s_s_msgclose").css("display","none");
}

MsgBox.prototype.wait_wnd_show_html=function(msg){
	MsgBox.isWait = true;
	MsgBox.prototype.show();
	MsgBox.prototype.show_content_html(msg);	
	$("#s_s_msgclose").css("display","none");
}

MsgBox.prototype.btn_wnd_show = function(msg){
    window.external.setMain(false);
	MsgBox.isWait = false;
	MsgBox.ok= true;
	MsgBox.prototype.show();
	MsgBox.prototype.show_content_html(msg);

	$("#s_s_msgclose").css("display","block");
	$("#s_s_msgclose").css("background-image","url('"+but_s_s_close_up+"')");
	
}


MsgBox.prototype.logout_wnd_show = function(msg){
    window.external.setMain(false);
	MsgBox.isWait = false;
	MsgBox.ok= true;
	MsgBox.prototype.show();
	MsgBox.prototype.show_content_text(msg);
	$("#s_s_msgclose").css("display","block");
	$("#s_s_msgclose").css("background-image","url('"+but_s_s_close_up+"')");
	MsgBox.doFun=logout;
}




