//首页js
var OpenMM="";
var msg = new YearWnd("请输入关闭程序密码",480,460,"password"); 
$(document).ready(function(){
    GetBaseInfo(true);
    var run=new S_S_Cmd();
    var re=run.run("House","closeSXT");
    window.external.speech($("#hysy").html());
    $("#marquee").html(run.run("House","marquee_txt"));
    statr_idcard();
    msg.show_wnd(show);
    msg.close();
    window.external.setMain(true);
    $("#btn").click(function(){
        toUrl("SSFZDL.html");
    });
    logout();  
    $("#closeExe").click(function(){
        if(OpenMM=="tr")
        {
            msg.Open();
     //alert("msg.open execute");
        }
        OpenMM="";
    });
    
    window.onbeforeunload = function(){
	var run=new S_S_Cmd();
        run.run("House","end_idcard");
        window.external.speechStop();
    }
});

function logout()
{
    var run=new S_S_Cmd();
    var re=run.run("house","logout");
}

function show(val)
{
    var run=new S_S_Cmd;
    run.addParam(val);
    var re=run.run("house","getPassword");
    if(re.substring(0,3)=="[T]")
    {
        if(re.substring(3,re.length)==val)
        {
            toUrl("ht.html");
            //return window.external.closeWnd();
        }else
        {
            msg.showError("密码输入有误！");
        }
    }
}
function login_setUser(xm,xb,cs,mz,dz,sfzhm,qfjg,yxqx)
{
	toUrl("SSFZDL.html");
}

function statr_idcard()
{
    var  run = new S_S_Cmd();
    var  re = run.run("House","statr_idcard"); 
} 

function add_MM(val)
{
    OpenMM+=val;
  //alert(OpenMM);
}

