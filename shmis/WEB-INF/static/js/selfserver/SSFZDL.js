//首页js
var isSk=false;
var msg=new MsgBox("提示",480,200);
$(document).ready(function(){
    GetBaseInfo(false);
    $("#btnNext").click(function(){
        if( $("#xm").val()!=""|| $("#sfzhm").val()!="")
        {
            var run=new S_S_Cmd();
            run.addParam($("#xm").val());
            run.addParam($("#sfzhm").val());
            run.addParam("0")
            var re=run.run("House","addUser");
            if(re=="[T]")
            {
                run.clear();
                var re=run.run("House","CaptureImage_Thread");
 		run.clear();
		re=run.run("House","SM_HTML");
                toUrl(re+"SM.html");
            }else
            {
                msg.btn_wnd_show(re.substring(3));
            }
        }
    });
    window.external.speech($("#titleshow").html());
    var run=new S_S_Cmd();
    run.run("House","getCardinfo");
    setTimeout(statr_idcard,500);
    
    window.onbeforeunload = function(){
        var run=new S_S_Cmd();
        run.run("House","end_idcard");
        window.external.speechStop();
    }
});

function login_setUser(xm,xb,cs,mz,dz,sfzhm,qfjg,yxqx)
{
    $("#xm").val(xm);
    $("#xb").val(xb);
    $("#cs").val(cs);
    $("#mz").val(mz);
    $("#dz").val(dz);
    $("#sfzhm").val(sfzhm);
    $("#qfjg").val(qfjg);
    $("#yxqx").val(yxqx);
    window.external.speech("请取走身份证");
}

function show()
{
	login_setUser("测试","","","汉","","330103196807211617","","") ;
}


function statr_idcard()
{
    var  run = new S_S_Cmd();
    var  re = run.run("House","statr_idcard"); 
//dakait
    setTimeout(show,100);
} 

