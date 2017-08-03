//首页js
$(document).ready(function{
    GetBaseInfo(false);
    $("#btn").click(function{
        alert("同意");
    });
    
    $("#btnNo").click(function{
        alert("不同意");
    });
});