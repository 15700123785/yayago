//首页js
$(document).ready(function(){
     //window.external.speech("拍照不成功，请面对摄像头，并确保面部无遮挡");
    $("#btn").click(function(){
        var run=new S_S_Cmd();
        var re=run.run("House","CaptureImage");
        if(re=="[T]")
			{
				//var run=new S_S_Cmd();
				run.run("House","CloseWnd");
				re=run.run("House","Is_hz");
				if(re=="true"){
					toUrl("HZ_ZFQKL.html");
				}else
				{
					toUrl("ZFQKL.html");
				}
            }else
            {
		        window.external.speech("拍照不成功，请面对摄像头，并确保面部无遮挡");
            }
    });
    setTimeout(OpenWnd,800);
     $("#btnNo").click(function(){
        toUrl("SY.html");
    });
    
     window.onbeforeunload = function(){
        var run=new S_S_Cmd();
        run.run("House","CloseWnd");
        window.external.speechStop();
    }
});

function OpenWnd()
{
    var run=new S_S_Cmd();
    var re=run.run("House","OpenWnd");
}