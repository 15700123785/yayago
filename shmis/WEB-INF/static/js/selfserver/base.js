/*   ����: base.js

--   Copyright   (c)   2011-2012   ����Ħ�������豸���޹�˾���������� 

--   ������: ��СԪ

--   ��   ��: 20120622

--   �޸���: 

--   ��   ��: 

--   ��   ��: ͨ�ò���JS

--   ��   ��: v 1.0.0.0
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

//ҳ����ת
function toUrl(url)
{
    window.external.playStop();
	window.external.setMain(false);
	window.external.resetTime();
	//����ҳ�򲻵���ʱ
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


//���³�ʱ�˳�ʱ����ʾ
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
        	//��յ�¼��Ϣ
			window.external.setMain(true);
            location.href="SY.html";
	}
	
}

//�����Ƿ�ʱ����
function setTimeState(ok){
	window.external.timeState(ok);
}


function GetBaseInfo(IsSy)
{
    
//    var run=new S_S_Cmd();
//    if(IsSy)
//    {
//        $("#xtmc").html("�����з���������");
//        $("#show").html("�������� ��������");
//        $("#hysy").html("��ӭʹ�÷�������������ѯϵͳ");
//    }else
//    {
//        $("#xtmc").html("�����з���������");
//        $("#show").html("�������� ��������");
//        $("#zzcx_show").html("��������������ѯϵͳ");
//    }
    var run=new S_S_Cmd();
    var re,str;
    re=run.run("House","getSY_info");
    if(IsSy)
    {
        str=re.split("~|~"); 
        $("#xtmc").html(str[0]);
        $("#show").html(str[1]);
        $("#hysy").html("��ӭʹ��"+str[2]);
    }else
    {
        str=re.split("~|~"); 
        $("#xtmc").html(str[0]);
        $("#show").html(str[1]);
        $("#zzcx_show").html(str[2]);
    }
}