/****************************************************************** 

**   �ļ���:choose.js

**   Copyright   (c)   2011-2012   ����Ħ�������豸���޹�˾���������� 

**   ������: ���

**   ��   ��: 20120627

**   �޸���: 

**   ��   ��: 

**   ��   ��: js ��������ʾ�������  Ŀǰ��֧��IE
**  

**   ��   ��: v 1.0.0.0

**--------------------------------------------------------------------------*/

//ȷ����ť mouse_up ״̬ͼƬ��ַ
var choose_but_s_s_close_up = "/shmis/images/selfserver/choose_up.png";
//ȷ����ť mouse_down ״̬ͼƬ��ַ
var choose_but_s_s_close_down = "/shmis/images/selfserver/choose_down.png";
//�ȴ�ͼ��ͼƬ��ַ/// 

var choose_ico_s_s_waitting = "/shmis/images/selfserver/waitting.gif";

function choose(title,width,height){
	choose.Width = width;
	choose.Height = height;
	choose.Title = title;
	choose.IsShow = false;	
	choose.hTime = null;
	choose.maxTime = 0;
	choose.time = 0;
	choose.ok = true; //�Ƿ���ʾ��ť
	choose.isWait = false; //�Ƿ���ʾ�ȴ�ͼ��
}

//�رտؼ�
choose.close=function(){
	$("#choose_s_backgroud").css("display","none");
	$("#choose_s_msgwnd").css("display","none");
}

choose.prototype.close = function(){
    window.external.setMain(false);
	choose.close();
}

//�޸�����
choose.prototype.show_content_html = function(html){
	$("#choose_s_msgwndcont").html(html);
}

choose.prototype.show_content_text = function(text){
	$("#choose_s_msgwndcont").text(text);
}

//��ʾ������
choose.prototype.show_or_hidden_w_ico = function(show){
	if (show==false){
		$("#choose_s_msg_ico").css("display","none");
	}
	else{
		$("#choose_s_msg_ico").html("<img  src=\""+choose_ico_s_s_waitting+"\" border=\"0\" style=\"margin-top:20px;\">");
		$("#choose_s_msg_ico").css("display","block");
		$("#choose_s_msg_ico").css("height","100px");
		$("#choose_s_msgwndcont").css("height",(choose.Height-200)+"px");
	}
}

//��ʾ����
choose.prototype.show=function(){
	if ($("#choose_s_backgroud").html()==null){
		var obj = $("<div id=\"choose_s_backgroud\" onclick=\" event.returnValue = false\"></div>").appendTo("body");
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

	if ($("#choose_s_msgwnd").html()==null){
		var msgWnd = $("<div id=\"choose_s_msgwnd\"><div id=\"choose_s_msgwndtitle\"><span style=\"padding-left:12px;\">"+choose.Title+"</span><span id=\"closeDiv\" style=\"cursor:pointer;\" onselectstart=\"return false;\" onclick=\"choose.close();\">X</span></div><div id=\"choose_s_msg_ico\"></div><div id=\"choose_s_msgwndcont\"></div><div align=\"center\"></div></div>").appendTo("body");
		msgWnd.css("width",choose.Width + "px");
		msgWnd.css("height",choose.Height + "px");
		msgWnd.css("backgroundColor","#FFF");
		msgWnd.css("top",parseInt((window.screen.height - choose.Height)/2)+"px");
		msgWnd.css("left",parseInt((window.screen.width - choose.Width)/2)+"px");
		msgWnd.css("z-index","501");
		msgWnd.css("position","absolute");
		msgWnd.css("border","#7a2727 solid 3px");
		$("#choose_s_msgclose").css("width","150px");
		$("#choose_s_msgclose").css("height","53px");
		$("#choose_s_msgclose").css("font-family","΢���ź�");
		$("#choose_s_msgclose").css("lineHeight","53px");
		$("#choose_s_msgclose").css("color","#FFF");
		$("#choose_s_msgclose").css("backgroundImage","url('/shmis/images/selfserver//choose_up.png')");
		$("#choose_s_msg_ico").css("text-align","center");
		$("#choose_s_msgwndtitle").css("backgroundColor","#7a2727");
		$("#choose_s_msgwndtitle").css("height","40px");
		$("#choose_s_msgwndtitle").css("width","100%");
		$("#choose_s_msgwndtitle").css("lineHeight","40px");
		$("#choose_s_msgwndtitle").css("text-align","center");
		//$("#choose_s_msgwndtitle").css("fontWeight","bolder");
		$("#choose_s_msgwndtitle").css("font-family","΢���ź�");
		$("#choose_s_msgwndtitle").css("fontSize","24px");
		$("#choose_s_msgwndtitle").css("color","#FFF");
		$("#choose_s_msgwndtitle").css("borderBottom","#7a2727 solid 3px");
		
		$("#choose_s_msgwndcont").css("font-family","΢���ź�");
		$("#choose_s_msgwndcont").css("paddingLeft","10px");
		$("#choose_s_msgwndcont").css("fontSize","18px");
		$("#choose_s_msgwndcont").css("lineHeight","28px");
//		$("#choose_s_msgwndcont").css("height",(choose.Height-100)+"px");
		$("#choose_s_msgwndcont").css("text-align","center");
		
		$("#closeDiv").css("position","absolute");
		$("#closeDiv").css("left",(choose.Width -35)+"px");
		$("#closeDiv").css("backgroundColor","#7a2727");
		$("#closeDiv").css("width","30px");
		$("#closeDiv").css("height","40px");
	}
	else{
		$("#choose_s_msgwndtitle").html("<span style=\"padding-left:12px;\">"+choose.Title+"</span><span id=\"closeDiv\" style=\"cursor:pointer;\" onselectstart=\"return false;\" onclick=\"choose.close();\">X</span>");
		$("#choose_s_msgwndcont").html(msg);
		$("#choose_s_backgroud").css("display","block");
		$("#choose_s_msgwnd").css("height",choose.Height+"px");
		$("#choose_s_msgwnd").css("width",choose.Width+"px");
		$("#choose_s_msgwndcont").css("height",(choose.Height-100)+"px");
		$("#choose_s_msgwnd").css("top",parseInt((window.screen.height - choose.Height)/2)+"px");
		$("#choose_s_msgwnd").css("left",parseInt((window.screen.width - choose.Width)/2)+"px");
		$("#choose_s_msgwnd").css("display","block");
		//$("#choose_s_msgclose").attr("disabled ","true");
		
		$("#closeDiv").css("position","absolute");
		$("#closeDiv").css("left",(choose.Width -35)+"px");
		$("#closeDiv").css("backgroundColor","#7a2727");
		$("#closeDiv").css("width","30px");
		$("#closeDiv").css("height","40px");
	}
	if (choose.ok == false){
	    
	//	$("#choose_s_msgclose").attr("disabled ","true");
		$("#choose_s_msgclose").css("display","none");
	}
	else{
	//	$("#choose_s_msgclose").attr("disabled ","false");
		$("#choose_s_msgclose").css("display","block");
	}
	
	if (choose.isWait == false){
		$("#choose_s_msg_ico").css("display","none");
	}
	else{
		$("#choose_s_msg_ico").html("<img src=\""+choose_ico_s_s_waitting+"\" border=\"0\" style=\"margin-top:20px;\">");
		$("#choose_s_msg_ico").css("display","block");
		$("#choose_s_msg_ico").css("height","100px");
		$("#choose_s_msgwndcont").css("height",(choose.Height-200)+"px");
	}
	
}

choose.prototype.ok_wnd_show = function(msg){
	choose.isWait = false;
	choose.ok= true;
	choose.prototype.show();
	choose.prototype.show_content_text(msg);
	$("#choose_s_msgclose").css("display","block");
	$("#choose_s_msgclose").css("background-image","url('"+choose_but_s_s_close_up+"')");
	choose.doFun=toback;
	window.external.setMain(false);
}

choose.prototype.ok_wnd_show_html = function(msg,Hg,R_W){
    if(Hg>600)
        Hg=600;
    choose.Height=Hg;
    choose.Width=R_W;
    window.external.setMain(false);
	choose.isWait = false;
	choose.ok= true;
	choose.prototype.show();
	choose.prototype.show_content_html(msg);
    choose.doFun=toback;
	$("#choose_s_msgclose").css("display","block");
	$("#choose_s_msgclose").css("background-image","url('"+choose_but_s_s_close_up+"')");
}

choose.prototype.wait_wnd_show=function(msg){
    window.external.setMain(true);
    window.external.resetTime();
	choose.isWait = true;
	choose.doFun=null;
	choose.prototype.show();
	choose.prototype.show_content_text(msg);	
	$("#choose_s_msgclose").css("display","none");
}

choose.prototype.wait_wnd_show_html=function(msg){
	choose.isWait = true;
	choose.prototype.show();
	choose.prototype.show_content_html(msg);	
	$("#choose_s_msgclose").css("display","none");
}

choose.prototype.btn_wnd_show = function(msg){
    window.external.setMain(false);
	choose.isWait = false;
	choose.ok= true;
	choose.prototype.show();
	choose.prototype.show_content_html(msg);

	$("#choose_s_msgclose").css("display","block");
	$("#choose_s_msgclose").css("background-image","url('"+choose_but_s_s_close_up+"')");
	
}


choose.prototype.logout_wnd_show = function(msg){
    window.external.setMain(false);
	choose.isWait = false;
	choose.ok= true;
	choose.prototype.show();
	choose.prototype.show_content_text(msg);
	$("#choose_s_msgclose").css("display","block");
	$("#choose_s_msgclose").css("background-image","url('"+choose_but_s_s_close_up+"')");
	choose.doFun=logout;
}




