//首页js
var isSk=false;
var msg=new MsgBox("提示",480,200);
$(document).ready(function(){
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
                toUrl("CXXX.html");
            }else
            {
                msg.btn_wnd_show(re.substring(3));
            }
        }
    });
    window.external.speech("请刷取被查询人的身份证");
    //statr_idcard();
    
    window.onbeforeunload = function(){
        var run=new S_S_Cmd();
        run.run("House","end_idcard");
        window.external.playStop();
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
	login_setUser("顾锋强","女","","","","330125197709176216","","2011.11.12至2030.11.12") ;
   //login_setUser("胡国军","男","1994年8月7日","汉","236-2号","330183198309195635","","2011.11.12至2030.11.12") ;
}


function statr_idcard()
{
    var  run = new S_S_Cmd();
    var  re = run.run("House","statr_idcard"); 
} 

