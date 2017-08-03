//首页js
var pageIndex=1;
var pageCount=0;
var fcxx;
var msg=new MsgBox("提示",480,200);
var choose_Msg=new choose("请选择房产",800,500);
var qr_Msg=new choose("提示",800,500);
var html;
var tab_H=0;
var isPrint=false;
var ChooseID;
var pintPages;
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
    
    
    $("#btncsry").click(function(){
        toUrl("HZ_ZFQKL.html")
    });
    
    $("#btnPrint").click(function(){
       isPrint=true;
       msg.wait_wnd_show("正在打印，请稍候");
//       print(ChooseID);
       setTimeout(_print,500);
    });
    
     $("#btnPrintAll").click(function(){
     isPrint=true;
     msg.wait_wnd_show("正在打印，请稍候");
       print("-1");
    });
    getHouseInfo();
    
     $("#down").click(function(){
        if(pageIndex>=pageCount)
            return;
        pageIndex++;
        var run=new S_S_Cmd();
        run.addParam(pageIndex);
	    var re=run.run("House","getPage");
	    BindData(re);
	    var div=document.getElementById("zfqkcxjl");
        div.scrollTop =0;
    });
    
     $("#up").click(function(){
        if(pageIndex<=1)
            return;
        pageIndex--;
        var run=new S_S_Cmd();
        run.addParam(pageIndex);
	    var re=run.run("House","getPage");
	    BindData(re);
	    var div=document.getElementById("zfqkcxjl");
        div.scrollTop =0;
    });
    
    $("#BackSY").click(function(){
        if(!isPrint&&pageCount>0)
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
    
    window.onbeforeunload = function(){
       clearInterval(fun);
       window.external.speechStop();
    }
});

function _print()
{
    print(ChooseID);
}

function getHouseInfo()
{
   var run=new S_S_Cmd();
   var re=run.run("House","yl_getHouseInfo");
   ChooseID=re.split("~@~")[0];
   BindData(re.split("~@~")[1]);
   $("#Menu").css("display","none");
   $("#zfqkcxjl").css("width","800");
   $("#zfqkcxjl").css("left","112");
}

function BindData(re)
{
    pageCount=re.substring(3).split("~|~")[0];
    if(re!=""&&re.substring(0,3)=="[T]")
    {
	var hg_add=0;
       if(pageCount==pageIndex)
	{
		hg_add=12;
	}else
	{
		hg_add=5;
	}

       var HG=(Number(re.substring(3).split("~|~")[1]))/6+hg_add;
       var str="";
       for(var i=0;i<HG;i++)
       {
            str+="&nbsp;<br>";
       }
       $("#zfqkcxjl").css("background-image","");
       $("#zfqkcxjl").html("<div>&nbsp;<br>&nbsp;<br>&nbsp;<span style=\"font-size:11px;\" >第 "+pageIndex+" 页/共"+pageCount+" 页</span></div>"+str);
       $("#showPageCount").html("第 "+pageIndex+" 页<div style=\"height:1px;width:50px;background-color:Black;\"></div>共 "+pageCount+" 页");
//       $("#zfqkcxjl").html(str);
	   $("#zfqkcxjl").css("background-image","url("+re.split("~|~")[2]+")");
	   pageCount=re.substring(3).split("~|~")[0];
	   if(pageCount<2)
	   {
	     $("#down").css("display","none");
         $("#up").css("display","none");
	   }
	   if(pageIndex==1)
	       {
	            //setTimeout(MoveTitle,100);
	            $("#zfqkcxjl").html("<br><div><div style=\"text-align;right;\"><div class=\"txm\"><img style=\"width:300px;height:45px;\" src=\"/shmis/images/selfserver/txm.PNG\" /></div></div>&nbsp;<span style=\"font-size:11px;\" >第 "+pageIndex+" 页/共 "+pageCount+" 页</span></div>"+str);
	            $("#up").css("display","none");
//	            $("#zfqkcxjl").html("<img style=\"width:300px;\" src=\"/shmis/images/selfserver/txm.jpg\" />");
	        }else
	        {
	             $("#up").css("display","block");
	        }
	   if(pageIndex==pageCount)
	   {
	        $("#down").css("display","none");
	   }else
	   {
	        $("#down").css("display","block");
	   }
	   msg.close();
    }else
    {
        msg.btn_wnd_show(re.substring(3));
    }
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

var showtitle;
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
function checkPrintStatus()
{
    if(checkNum>200)
    {
        msg.ok_wnd_show("<div>&nbsp;</div>打印异常");
        return;
    }
    checkNum++;
    //var run=new S_S_Cmd();
    //var re=run.run("House","printerStatus");
    re="[T]";
    if(re=="[T]")
    {
        var run=new S_S_Cmd();
        re=run.run("House","getTimes");
        times=re;
        run.clear();
        pintPages=run.run("House","getPages");
        fun=setInterval(btn_show,1000);
        window.external.speech("本次打印结果共"+pintPages+"页，请及时取走证明并携带好证件等随身物品，"+pring_show+"。谢谢使用!");
        btn_show();
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
            clearInterval(fun);
            msg.close();
            return;
        }
    msg.ok_wnd_show_html("<div style=\"height=15px;\">&nbsp;</div>本次打印结果共"+pintPages+"页，请及时取走证明并携带好证件等随身物品，谢谢使用!"+times+"秒<br><span style=\"font-size:28px;\">"+pring_show+"</span> ");
    times--;
}


function show_Menu(val)
{
    html="";
    html+="<table style=\"width:100%\">";
    var strs=val.split("~|~");
    html+="<tr style=\"height:60px;width:100%;\">";
    var len=strs.length;
    for(var i=0;i<len;i++)
    {
        if(i>0&&(i%2==0||len<18)){
        html+="</tr><tr style=\"height:58px;width:100%;\">";
        }
        html+="<td style=\"width:50%;\"><input type=\"button\" value=\""+strs[i]+"\" class=\"Menu_title\" onclick=\"Menu_click("+i+")\"></input></td>";
    }
    if(len<5){
        tab_H=len;
    }else
    {
    if(len%2==1){
        tab_H=(len+1)/2;
    }else
    {
        tab_H=len/2;
    }
    }
    html+="</tr>"
    html+="</table>";
    if(len==1)
    {
       $("#btnPrintAll").css("display","none");
       $("#btncsry").css("display","none");
    }
;}

function Menu_click(val)
{
    choose_Msg.close();
    pageIndex=val+1;
    var run=new S_S_Cmd();
    run.addParam(pageIndex);
    var re=run.run("House","getPage");
    BindData(re);
    var div=document.getElementById("zfqkcxjl");
    div.scrollTop =0;
}

function showdiv() {           
     document.getElementById("bg").style.display = "block";
     document.getElementById("show").style.display = "block";
 }
 function hidediv() {
     document.getElementById("bg").style.display = 'none';
     document.getElementById("show").style.display = 'none';
 }


function MoveTitle()
{
   var div=document.getElementById("zfqkcxjl");
       div.scrollTop =70;
}


