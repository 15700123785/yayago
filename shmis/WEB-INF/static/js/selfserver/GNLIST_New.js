//功能列表js
var width=150;
var height=150;
var top=180;
var left=-70;
$(document).ready(function(){
    GetBaseInfo(false);
    window.external.speech($("#gnshow").html());
    //用途名称~|~用途ID~|~X坐标~|~Y坐标~|~显示文字名称~|~图片名称~|~是否显示
    //X坐标 170-330-490-650-810
    //YY坐标  0-160-320
    //杭州-------
    var html="户口迁移~|~0~|~170~|~0~|~户口迁移~|~HKQY.jpg~|~1";
    html+="~@~贷款~|~0~|~330~|~0~|~贷款~|~DK.jpg~|~1";
    html+="~@~契税缴纳~|~0~|~490~|~0~|~契税缴纳~|~QSJN.jpg~|~1";
    html+="~@~入学~|~0~|~650~|~0~|~入学~|~RX.jpg~|~1";
    html+="~@~停车~|~0~|~810~|~0~|~停车~|~TC.jpg~|~1";
    html+="~@~信用卡~|~0~|~650~|~160~|~信用卡~|~DK.jpg~|~0";
//    html+="~@~公积金~|~0~|~330~|~160~|~公积金~|~FWTXXZZK.jpg~|~1";
//    html+="~@~住房保障~|~0~|~490~|~160~|~住房保障~|~ZFBZ.jpg~|~1";
//    html+="~@~宅基地~|~0~|~650~|~160~|~宅基地~|~ZJD.jpg~|~1";
    html+="~@~房改~|~3~|~170~|~160~|~房改信息~|~FGXX.jpg~|~1";
//    html+="~@~房屋基本信息查询~|~5~|~330~|~160~|~房屋基本信息查询~|~FWJBXXCX.jpg~|~1~|~&nbsp;针对某具体房屋的坐<br>&nbsp;落、面积、层数、规<br>&nbsp;划用途等。";
    html+="~@~房屋权属信息查询~|~6~|~330~|~160~|~房屋权属信息查询~|~FWQSXXCX.jpg~|~1~|~&nbsp;针对某具体房屋的坐<br>&nbsp;落、所有权证号、所<br>&nbsp;有权人、登记时间等。";
	    	
//    html+="~@~房屋他项限制状况~|~7~|~650~|~160~|~房屋他项限制状况~|~FWTXXZZK.jpg~|~1~|~&nbsp;针对某具体房屋的坐<br>&nbsp;落、他项权证号、他<br>&nbsp;项权人、查封机关、<br>&nbsp;查封期限等。";
    //富阳功能
//    var html="户口迁移~|~0~|~170~|~0~|~户口迁移~|~HKQY.jpg~|~1";
//    html+="~@~购房~|~0~|~330~|~0~|~购房~|~FWJBXXCX.jpg~|~1";
//    html+="~@~计算生育~|~0~|~490~|~0~|~计算生育~|~JHSY.jpg~|~1";
//    html+="~@~入学~|~0~|~650~|~0~|~入学~|~RX.jpg~|~1";
//    html+="~@~购车~|~0~|~810~|~0~|~购车~|~TC.jpg~|~1";
//    html+="~@~信用卡~|~0~|~170~|~160~|~信用卡~|~DK.jpg~|~1";
//    html+="~@~公积金~|~0~|~330~|~160~|~公积金~|~FWTXXZZK.jpg~|~1";
//    html+="~@~住房保障~|~0~|~490~|~160~|~住房保障~|~ZFBZ.jpg~|~1";
//    html+="~@~宅基地~|~0~|~650~|~160~|~宅基地~|~ZJD.jpg~|~1";
//    html+="~@~房屋权属抵押查询~|~6~|~170~|~320~|~房屋权属信息查询~|~FWQSXXCX.jpg~|~1";//~|~&nbsp;针对某具体房屋的坐<br>&nbsp;落、所有权证号、所<br>&nbsp;有权人、登记时间等。";    
    BindList(html);
});

function BindList(val)
{
    var strs=val.split("~@~");
    var html="";
    for (var i=0;i<strs.length;i++)
    {
         var str=strs[i].split("~|~");
         if(str[6]==0)
            continue;
         var obj = $("<div style=\"cursor:pointer;\" onclick=\"gn_click('"+str[0]+"','"+str[1]+"')\" id=\"div"+i+"\"><div style=\"font-weight:bold;text-align:center;margin-top:"+(height-30)+";color:White;font-family:微软雅黑;\">"+str[0]+"</div></div>").appendTo("body");
         $("#div"+i).css("background-image","url('/shmis/images/selfserver/"+str[5]+"')");
         obj.css("position","absolute");
         obj.css("width",width+"px");
         obj.css("height",height+"px"); 
         obj.css("top",(Number(str[3])+Number(top))+"px");
         obj.css("left",(Number(str[2])+Number(left))+"px");
         if(str.length==8){
         var reobj = $("<div><div style=\"text-align:left;margin-top:"+(height-30)+";color:black;font-family:微软雅黑;\"><div style=\"margin-top:-80px;text:align:left;\">"+str[7]+"</div></div></div>").appendTo("body");
         reobj.css("background-image","url('/shmis/images/selfserver/fwxx.png')");
         reobj.css("position","absolute");
         reobj.css("background-repeat","no-repeat");
         reobj.css("width","165px");
         reobj.css("height",height+"px"); 
         reobj.css("top",(Number(str[3])+Number(top)+145)+"px");
         reobj.css("left",(Number(str[2])+Number(left))+"px");
         }
    }
}

function gn_click(YT,YT_ID)
{
    var run=new S_S_Cmd();
    run.addParam(YT);
    run.addParam(YT_ID);
    var re=run.run("House","Save_gninfo");
    alert(re);
    if(re=="[T]")
    { 
        if(YT_ID!="6")
           {
            alert("ChooseArea");
            toUrl("ChooseArea.html");
            }else
            {
             toUrl("CXXX.html");
            }
    }
}