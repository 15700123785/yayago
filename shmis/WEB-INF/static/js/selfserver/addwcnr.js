var clickNum=0;
var sfzhm="220302198009081123";
var xm="王五";
var tjType=0;
var msg=new MsgBox("提示",480,200);
//查询信息js
$(document).ready(function(){
    GetBaseInfo(false);
    addwcnr_fun();
//    $("#btn").click(function(){
//        add_user();
//    });
    
    $("#_btnBack").click(function(){
        toUrl("CXXX.html");
    });
    
    window.onbeforeunload = function(){
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
    }else
    {
        alert("获取信息失败");
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
            html+="<td class=\"t4\">"+str[1]+"</td>";
            html+="<td class=\"t5\" onclick=\"addOrdelete('0','"+str[1]+"','"+str[0]+"');\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
            html+="<td></td></tr></table>";alert(html);
        }
    }
  /*  html+="<tr><td class=\"addImg\"><table><tr>";
    html+="<td class=\"t1\"></td>";
    html+="<td class=\"t2\"></td>";
    html+="<td class=\"t3\"></td>";
    html+="<td class=\"t4\">&nbsp;</td>";
    html+="<td class=\"t5\" onclick=\"add();\"></td>";
    html+="</tr></table></td></tr></table>";*/
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
    
	$("#edit_area").val("");
	$("#edit_code").val("");
	$("#addInfo").css("display","block");
	KB.create('kb','SHTEXT','zj');
	checkid='edit_area';
	language='CH';
	wnd_show('CH',11);
	document.getElementById("edit_area").focus();
}

function qx(){
//	$("#addInfo").css("display","none");
//	$("#kb").html("");
	$("#edit_area").val("");
	$("#edit_code").val("");
//	$("#kb").removeClass("kB_Back");
    document.getElementById("edit_area").focus();
}

function addcnr_fun(){
	statr_idcard();
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
            toUrl("CXXX.html");
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
    var  re = run.run("House","ischeshi");
    if(re=="true")
    {
        toUrl("TJSFZL.html");
    }else
    {
        msg.wait_wnd_show_html("请在感应区刷第二代身份证");
        window.external.speech("请在感应区刷第二代身份证");
        re = run.run("House","statr_idcard");
    }
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
