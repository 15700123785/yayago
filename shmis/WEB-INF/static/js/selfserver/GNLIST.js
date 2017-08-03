//功能列表js
$(document).ready(function(){
    window.external.speech($("#gnshow").html());
//    $("#HKQY").click(function(){
//        alert("户口迁移");
//    });
//    
//    $("#DK").click(function(){
//        alert("贷款");
//    });
//    
//    $("#QSJN").click(function(){
//        alert("契税缴纳");
//    });
//    
//    $("#RX").click(function(){
//        alert("入学");
//    });
//    
//    $("#TC").click(function(){
//        alert("停车");
//    });
//    
//    $("#FGXX").click(function(){
//        alert("房改信息");
//    });
//    
//    $("#FWJBXX").click(function(){
//        alert("房屋基本信息查询");
//    });
//    
//    $("#FWQSXX").click(function(){
//        alert("房屋权属信息查询");
//    });
//    
//    $("#FWTXXZ").click(function(){
//        alert("房屋他项限制查询");
//    });

//    $(".gn").click(function(){
//        toUrl("SM.html");
//    });
    window.onbeforeunload = function(){
        window.external.speechStop();
    }
});


function gn_click(YT,YT_ID)
{
    var run=new S_S_Cmd();
    run.addParam(YT);
    run.addParam(YT_ID);
    var re=run.run("House","Save_gninfo");
    if(re=="[T]")
    {
        toUrl("CXXX.html");
    }
}