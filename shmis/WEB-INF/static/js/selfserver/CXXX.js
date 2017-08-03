var clickNum=0;
var sfzhm="220302198009081123";
var xm="王五";
var tjType=0;
var msg=new MsgBox("提示",480,200);
//查询信息js
$(document).ready(function(){
    GetBaseInfo(false);
    var run=new S_S_Cmd();
    var  re = run.run("House","ischeshi");
     if(re!="true")
     {
        $("#btnAddcnr").css("display","none");
     }
    $("#btn").click(function(){
        var run=new S_S_Cmd();
        var re=run.run("House","CheckCard");
        if(re=="[T]")
        {
            re=run.run("House","CaptureImage_Sucess");
            run.run("House","CloseWnd");            
            if(re=="true")
            {
                re=run.run("House","Is_hz");
                if(re=="true"){
                    toUrl("HZ_ZFQKL.html");
                }else
                {
                    toUrl("ZFQKL.html");
                }
            }else
            {
                toUrl("TK.html");
            }
        }else
        {
            msg.btn_wnd_show(re.substring(3));
        }
        //statr_idcard();
    });
    getUsers();
    //setTimeout(statr_idcard,500);
    
    window.onbeforeunload = function(){
        var run=new S_S_Cmd();
        run.run("House","end_idcard");
        window.external.speechStop();
    }
});


function getUsers()
{
    var run=new S_S_Cmd();
    var re=run.run("House","getUsers");
    if(re!=""&&re.substring(0,3)=="[T]")
    {
       BindPage(re);
       setTimeout(statr_idcard,500);
    }else
    {
        msg.btn_wnd_show("获取信息失败");
    }
}

function BindPage(val)
{
    var html="<table>";
    if(val!="[T]")
    {
        var strs=val.substring(3).split("~@~");
        for(var i=0;i<strs.length;i++)
        {
            html+="<tr><td class=\"deleteImg\"><table><tr>"
            var str=strs[i].split("~|~");
            html+="<td class=\"t1\"></td>";
            html+="<td class=\"t2\">"+str[0]+"</td>";
            html+="<td class=\"t3\"></td>";
            html+="<td class=\"t4\">&nbsp;&nbsp;&nbsp;"+str[1]+"</td><td style=\"width:20px;\"></td>";
            html+="<td class=\"t5\" onclick=\"addOrdelete('0','"+str[1]+"','"+str[0]+"');\" ><div  style=\"background-color:#7a2727;width:170px;height:52px;color:White;line-height:50px;cursor:pointer;font-family:微软雅黑;font-size:25px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;删除&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>";
            html+="<td></td></tr></table>";
        }
    }
    html+="<tr><td class=\"deleteImg\"><table><tr>"
    html+="<td class=\"t1\"></td>";
    html+="<td class=\"t2\">&nbsp;</td>";
    html+="<td class=\"t3\"></td>";
    html+="<td class=\"t4\">&nbsp;&nbsp;&nbsp;&nbsp;</td><td style=\"width:20px;\"></td>";
    html+="<td class=\"t5\" ><div  style=\"background-color:#7a2727;width:170px;height:52px;color:White;line-height:50px;cursor:pointer;font-family:微软雅黑;font-size:25px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新增&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>";
    html+="<td></td></tr></table>"
    $("#tab").html(html);
}

function addOrdelete(type,sfzhm,xm)
{
    var run=new S_S_Cmd();
    run.addParam(type);
    run.addParam(xm);
    run.addParam(sfzhm);
    var re=run.run("House","userupdate");
    BindPage(re);
}

function add()
{
    toUrl("TJSFZL.html");
}

function addwcnr_fun(){
    
//	$("#edit_area").val("");
//	$("#edit_code").val("");
//	$("#addInfo").css("display","block");
//	KB.create('kb','SHTEXT','zj');
//	checkid='edit_area';
//	language='CH';
//	wnd_show('CH',11);
//	document.getElementById("edit_area").focus();
     toUrl("addwcnr.html");
}

function qx(){
	$("#addInfo").css("display","none");
	$("#kb").html("");
	$("#edit_area").val("");
	$("#edit_code").val("");
	$("#kb").removeClass("kB_Back");
}

function addcnr_fun(){
   toUrl("TJSFZL.html");
}

function add_user()
{
    if(!($("#edit_area").val()==""||$("#edit_code").val()==""))
    {
        var run=new S_S_Cmd();
        run.addParam($("#edit_area").val());
        run.addParam($("#edit_code").val());
        run.addParam("1");
        var re=run.run("House","addUser");
        if(re.substring(0,3)=="[T]")
        {
            qx();
            getUsers();
        }else
        {
            msg.btn_wnd_show("<br>"+re.substring(3));
        }
    }else
    {
        msg.btn_wnd_show("<br>请输入身份证号码和姓名");
    }
}

function statr_idcard()
{
    var  run = new S_S_Cmd();
//    var  re = run.run("House","ischeshi");
//    if(re=="true")
//    {
//        toUrl("TJSFZL.html");
//    }else
//    {
//        msg.wait_wnd_show_html("请在感应区刷第二代身份证");
//        window.external.speech("请在感应区刷第二代身份证");
        re = run.run("House","statr_idcard");
//    }
} 

function login_setUser(xm,xb,cs,mz,dz,sfzhm,qfjg,yxqx)
{
    var run=new S_S_Cmd();
    run.addParam(xm);
    run.addParam(sfzhm);
    run.addParam("0");
    var re=run.run("House","addUser");
    if(re.substring(0,3)=="[T]")
    {
        msg.close();
        getUsers();
    }else
    {
        msg.btn_wnd_show("<br>"+re.substring(3));
    }
}
