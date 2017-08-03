var msg = new YearWnd("请输入纸张",480,460,"text"); 
var msgw=new MsgBox("提示",480,200);
var ID;
var defaultPages;
$(document).ready(function(){
    msg.show_wnd(update);
    msg.close();
    //纸张设置
    $("#zzslsz").click(function(){
        if(document.getElementById("syzzsl").value=="")
        {
            msgw.btn_wnd_show_html_("<div>&nbsp;</div>纸张数量不能为空");
            return;
        }
        Save("PaperCount",document.getElementById("syzzsl").value);
    });
    //纸张设置
    $("#Reset").click(function(){
        Save("PaperCount",defaultPages);
        document.getElementById("syzzsl").value=defaultPages;
    });
    //密码修改
     $("#passwordbtn").click(function(){
        if(document.getElementById("password").value=="")
        {
            msgw.btn_wnd_show_html_("<div>&nbsp;</div>密码不能为空");
            return;
        }
        Save("password",document.getElementById("password").value);
    });
    
    $("#syzzsl").click(function(){
        OpenKey("syzzsl");
    });
    
    $("#passwrod").click(function(){
        OpenKey("passwrod");
    });

 $("#closeApp").click(function(){
					var run = new S_S_Cmd();
					run.addParam("SelfServ");
					alert("selfserv exec");
					var re = run.run("House","closeApp");
					alert("re");
					run.clear();
						  });
 

    var run=new S_S_Cmd();
    run.addParam("PaperCount");
    var re=run.run("House","getCS");
    document.getElementById("syzzsl").value=re;
    run.clear();
    re=run.run("House","defaultPages");
    defaultPages=re;
});


function OpenKey(val,text)
{
    ID=val;
    msg.Open(text);
}

function update(val)
{
    document.getElementById(ID).value=val;
    msg.close();
}

function Save(key,val)
{
    var run=new S_S_Cmd();
    run.addParam(key);
    run.addParam(val);
    var re=run.run("House","SaveCS");
    msgw.btn_wnd_show_html_("<div>&nbsp;</div>修改成功");
}
