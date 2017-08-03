//首页js
$(document).ready(function(){
    GetBaseInfo(false);
     window.external.speech("请阅读风险提示，确认无异议后继续操作");
    $("#btn").click(function(){
        toUrl("GNLIST_New.html");
    });
    
     $("#btnNo").click(function(){
        toUrl("SY.html");
    });
    window.onbeforeunload = function(){
        window.external.speechStop();
    }
});
