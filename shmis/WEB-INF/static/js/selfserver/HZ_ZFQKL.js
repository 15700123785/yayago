var msg=new MsgBox("提示",480,200);
var isPrint=false;
var RecordCount;
var pageIndex=1;
var fwsl;
var isPrintAll=false;
var print_status;
var pring_show;
$(document).ready(function(){
    GetBaseInfo(false);
	var run=new S_S_Cmd();
	pring_show=run.run("House","print_show");
	 $("#btnyyqh").click(function(){
       var run=new S_S_Cmd();
       var re=run.run("House","yyqh");
       if(re!="[T]")
        {
            msg.btn_wnd_show_html_("<br>"+re.substring(3));
        }
    });
    var run=new S_S_Cmd();
    var re=run.run("House","get_YT_ID");
    if(re!=7)
    {
        $("#tx_show").html("");
    }
    fwsl=run.run("House","PageSL");
    
    msg.wait_wnd_show("请稍候，正在查询信息");
    setTimeout(getHouseInfo,800);
    
    $("#BackSY").click(function(){
        var run=new S_S_Cmd();
        var re=run.run("House","is_print");
        if(re=="[F]")
        {
           var str="<br>";
           str+="<table style=\"width:100%\">";
           str+="<tr>";
           str+="<td colspan=\"2\">您本次查询未打印任何结果，是否确认结束查询？</td>";
           str+="</tr><tr><td>&nbsp;</td></tr>";
           str+="<tr>";
           str+="<td><div class=\"btn\" onclick=\"toback();\"><div>确定</div></div></td>";
           str+="<td><div class=\"btn\" onclick=\"msg.close();\"><div>取消</div></div></td>"
           str+="</tr>";
           str+="</table>";
           msg.btn_wnd_show_html(str);
        }else
        {
            toUrl("SY.html");
        }
    });
    
    $("#btnPrint").click(function(){
       isPrint=true;
       msg.wait_wnd_show("正在打印，请稍候");
//       print("-1");
       print_status="-1";
       setTimeout(_print,500);
    });
    
     $("#btnPrintAll").click(function(){
     isPrintAll=true;
     isPrint=true;
     msg.wait_wnd_show("正在打印，请稍候");
//       print("-2");
       print_status="-2";
       setTimeout(_print,500);
    });
    
     $("#up").click(function(){
        pageIndex--;
        get_FWZL(); 
    });
    
     $("#down").click(function(){
        pageIndex++;
        get_FWZL(); 
    });
    
    window.onbeforeunload = function(){
       clearInterval(fun);
       window.external.speechStop();
    }
});

function _print()
{
    print(print_status);
}

var fun;
function getHouseInfo()
{
    window.external.speech("请稍候，正在查询信息");
    pageIndex=1;
    var run=new S_S_Cmd();
    var re=run.run("House","getHouseInfo");
   if(re.substring(0,3)=="[T]")
   {
       get_FWZL(); 
   }else if((re.substring(0,3)=="[F]")&& re!="[F]没有查到相关信息")
   {
        times=10;
        fun=setInterval(Error_info,1000);
        window.external.speechStop();
        window.external.speech("程序查询出错，请到窗口办理");
   }else if( re=="[F]没有查到相关信息")
   {
        times=10;
        fun=setInterval(No_info,1000);
        window.external.speechStop();
        window.external.speech("按照被查询人姓名及身份证查询，无相应记录");
   }
}

function No_info()
{
    if(times<=0)
    {
        msg.close();
        return;
    }
    msg.ok_wnd_show("<br>按照被查询人姓名及身份证查询，无相应记录！<br>"+times+"秒");
    times--;
}

function Error_info()
{
    if(times<=0)
    {
        msg.close();
        return;
    }
    msg.ok_wnd_show("<br>程序查询出错，请到窗口办理！<br>"+times+"秒");
    times--;
}

function get_FWZL()
{
    var run=new S_S_Cmd();
    run.addParam(pageIndex);
    var re=run.run("House","getMenu");
    RecordCount=re.split("~@~")[1];
    show_Menu(re.split("~@~")[2]);
    
}

function show_Menu(val)
{
    html="";
    html+="<div style=\"height:10px;\">&nbsp;</div><table style=\"width:100%\"><tr style=\"height:50px;width:100%;\">";
    var strs=val.split("~.~");
    var len=strs.length;
    var wH=3;
    if(len<=7)
        wH=30;
    for(var i=0;i<len;i++)
    {
        if(i>0&&(i%2==0||len<=7)){
            html+="</tr><tr style=\"height:50px;width:100%;\">";
        }
        var cssName="unchecked";
        
        if(strs[i].split("~|~")[1]=="1")
        {
            cssName="checked";
            html+="<td style=\"text-align:right;width:"+wH+"%\">&nbsp;&nbsp;&nbsp;"+(Number(strs[i].split("~|~")[2])+1)+".</td><td style=\"text-align:left\"><input id="+strs[i].split("~|~")[2]+" onclick=\"Menu_click("+strs[i].split("~|~")[2]+")\" checked=\"checked\" id=\"check"+strs[i].split("~|~")[2]+"\" type=\"checkbox\" style=\"height:40px;\"></input><input type=\"button\" value=\""+strs[i].split("~|~")[0]+"\" class=\""+cssName+"\" onclick=\"Menu_click("+strs[i].split("~|~")[2]+")\"></input><input type=\"button\" onclick=yl(\""+strs[i].split("~|~")[2]+"\") style=\"height:40px;; width:60px;\" value=\"预览\"></input></td>";
        }else if (strs[i].split("~|~")[1]=="0")
        {
             html+="<td style=\"text-align:right;width:"+wH+"%\">&nbsp;&nbsp;&nbsp;"+(Number(strs[i].split("~|~")[2])+1)+".</td><td style=\"text-align:left\"><input id="+strs[i].split("~|~")[2]+" onclick=\"Menu_click("+strs[i].split("~|~")[2]+")\" id=\"check"+strs[i].split("~|~")[2]+"\" type=\"checkbox\" style=\"height:40px;\"></input><input type=\"button\" value=\""+strs[i].split("~|~")[0]+"\" class=\""+cssName+"\" onclick=\"Menu_click("+strs[i].split("~|~")[2]+")\"></input><input type=\"button\" style=\"height:40px;; width:60px;\" onclick=yl(\""+strs[i].split("~|~")[2]+"\") value=\"预览\"></input></td>";
        }else if (strs[i].split("~|~")[1]=="2")
        {
            cssName="print";
             html+="<td style=\"text-align:right;width:"+wH+"%\">&nbsp;&nbsp;&nbsp;"+(Number(strs[i].split("~|~")[2])+1)+".</td><td style=\"text-align:left\"><input id="+strs[i].split("~|~")[2]+" onclick=\"Menu_click("+strs[i].split("~|~")[2]+")\" id=\"check"+strs[i].split("~|~")[2]+"\" type=\"checkbox\" style=\"height:40px;\"></input><input type=\"button\" value=\""+strs[i].split("~|~")[0]+"\" class=\""+cssName+"\" onclick=\"Menu_click("+strs[i].split("~|~")[2]+")\"></input><input type=\"button\" style=\"height:40px; width:60px;\" onclick=yl(\""+strs[i].split("~|~")[2]+"\") value=\"预览\"></input></td>";
        }else
        {
            cssName="Nody";
            html+="<td style=\"text-align:right;width:"+wH+"%\">&nbsp;&nbsp;&nbsp;"+(Number(strs[i].split("~|~")[2])+1)+".</td><td style=\"text-align:left\"><input id="+strs[i].split("~|~")[2]+" disabled=disabled onclick=\"Menu_click("+strs[i].split("~|~")[2]+")\" id=\"check"+strs[i].split("~|~")[2]+"\" type=\"checkbox\" style=\"height:40px;\"></input><input type=\"button\" value=\""+strs[i].split("~|~")[0]+"\" class=\""+cssName+"\" onclick=\"Menu_click("+strs[i].split("~|~")[2]+")\"></input><input type=\"button\" style=\"height:40px; width:60px;\" onclick=yl(\""+strs[i].split("~|~")[2]+"\") value=\"预览\"></input></td>";
        }
    }
    if(len<5){
        tab_H=len;
    }else  if(len%2==1){
        tab_H=(len+1)/2;
    }else
    {
        tab_H=len/2;
    
    }
    html+="</table>";
    $("#zfqkcxjl").html(html);
    $("#RowCount").html(RecordCount);
    $("#up").css("display","block");
    $("#down").css("display","block");
    if(pageIndex==1)
    {
        $("#up").css("display","none");
    }
    if(pageIndex*fwsl>RecordCount)
    {
        $("#down").css("display","none");
    }
    msg.close();
}

function Menu_click(val)
{
    var run=new S_S_Cmd();
    run.addParam(val.toString());
    run.addParam(pageIndex);
    var re=run.run("House","checked_FC");
    if(re.substring(0,3)=="[F]")
    {
        document.getElementById(val).checked=false;
        msg.btn_wnd_show_html_("<div>&nbsp;</div>"+re.substring(3));   
    }else
    {
        RecordCount=re.split("~@~")[0];
        show_Menu(re.split("~@~")[1]);
    }
    
}

function yl(val)
{
    var run=new S_S_Cmd();
    run.addParam(val);
    var re=run.run("House","yl_FC");
    toUrl("yl_ZFQKL.html");
}

function mousePos(e){
    var x,y;

    var e = e||window.event;
    return {
    x:e.clientX+document.body.scrollLeft+document.documentElement.scrollLeft,
    y:e.clientY+document.body.scrollTop+document.documentElement.scrollTop
    };
};
function test(e,val){
        if (e.button=="1"){
            var y=mousePos(e).y;
            var div=document.getElementById(val);
            div.scrollTop +=(click_y-y);
            click_y=e.clientY+document.body.scrollTop+document.documentElement.scrollTop; 
	    }
	    $("#xm").html(mousePos(e).y+","+mousePos(e).x);
	
};

var click_y="";
var isClick="false";
function getXY()
{
   if (event.button=="1")
    {
    var e = e||window.event;
    click_y=e.clientY+document.body.scrollTop+document.documentElement.scrollTop;
    }
}

function print(page_index)
{
   window.external.speech("正在打印，请稍候");
   var run=new S_S_Cmd();
   run.addParam(page_index);
   var re=run.run("House","print");
   if(re.substring(0,3)=="[T]")
   {
        checkNum=0;
        checkPrintStatus();
   }else
   {
        msg.btn_wnd_show("<div>&nbsp;</div>"+re.substring(3));
   }
}

var checkNum=0;
var pintPages;
function checkPrintStatus()
{
    if(checkNum>200)
    {
        msg.ok_wnd_show("打印异常");
        return;
    }
    checkNum++;
    //var run=new S_S_Cmd();
    //var re=run.run("House","printerStatus");
    re="[T]";
    if(re=="[T]")
    {
        get_FWZL(); 
        var run=new S_S_Cmd();
        re=run.run("House","getTimes");
        times=re;
        fun=setInterval(btn_show,1000);
        run.clear();
        pintPages=run.run("House","getPages");
        window.external.speech("本次打印结果共"+pintPages+"页，请及时取走证明并携带好证件等随身物品，"+pring_show+"谢谢使用!");
        btn_show();
//        msg.btn_wnd_show_html_("<div style=\"height=15px;\">&nbsp;</div>打印完毕，请及时取走证明并携<br>带好证件等随身物品，谢谢使用!<br> "+times+"秒");
//        setTimeout(btn_show,1000);
    }else
    {
        setTimeout(checkPrintStatus,3000);
    }
}
var fun;
var times;
function btn_show()
{
    if(times<1)
        {
            msg.close();
            clearInterval(fun);
            if(isPrintAll)
            {
                toback();
            }
            return;
        }
    //msg.ok_wnd_show("打印完毕，请及时取走证明并携带好证件等随身物品，谢谢使用! "+times+"s");
    if(isPrintAll)
    {
        msg.ok_wnd_show_html("<div style=\"height=15px;\">&nbsp;</div>本次打印结果共"+pintPages+"页，请及时取走证明并携带好证件等随身物品，谢谢使用!"+times+"秒<br><span style=\"font-size:28px;\">"+pring_show+"</span> ");
    }else
    {
        msg.btn_wnd_show_html_("<div style=\"height=15px;\">&nbsp;</div>本次打印结果共"+pintPages+"页，请及时取走证明并携带好证件等随身物品，谢谢使用!"+times+"秒<br><span style=\"font-size:28px;\">"+pring_show+"</span> ");
    }
    times--;
}