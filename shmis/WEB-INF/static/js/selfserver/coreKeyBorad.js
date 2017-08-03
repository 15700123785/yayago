// JavaScript Document
var Lock=false;
function JSKB()
{
	
			JSKB.keyVal = new Array(39);
			JSKB.keyVal = [[12,16,"1","keyboard-1.bmp",0],[12,16,"2","keyboard-2.bmp",0],[12,16,"3","keyboard-3.bmp",0],[12,16,"4","keyboard-4.bmp",0],
		  [12,16,"5","keyboard-5.bmp",0],[12,16,"6","keyboard-6.bmp",0],[12,16,"7","keyboard-7.bmp",0],[12,16,"8","keyboard-8.bmp",0],
		  [12,16,"9","keyboard-9.bmp",0],[12,16,"0","keyboard-0.bmp",0],[12,16,"-","keyboard-11.bmp",0],[12,16,"CH/EN","keyboard-CH.bmp",1],[12,16,"Q","keyboard-q.bmp",0],[12,16,"W","keyboard-w.bmp",0],[12,16,"E","keyboard-e.bmp",0],[12,16,"R","keyboard-r.bmp",0],	[12,16,"T","keyboard-t.bmp",0],
		  [12,16,"Y","keyboard-y.bmp",0],[12,16,"U","keyboard-u.bmp",0],[12,16,"I","keyboard-i.bmp",0],[12,16,"O","keyboard-o.bmp",0],
			[12,16,"P","keyboard-p.bmp",0],[12,16,"+","keyboard-17.bmp",0],[12,-38,"A","keyboard-a.bmp",0],[12,-38,"S","keyboard-s.bmp",0],
			[12,-38,"D","keyboard-d.bmp",0],[12,-38,"F","keyboard-f.bmp",0],[12,-38,"G","keyboard-g.bmp",0],[12,-38,"H","keyboard-h.bmp",0],
			[12,-38,"J","keyboard-j.bmp",0],[12,-38,"K","keyboard-k.bmp",0],[12,-38,"L","keyboard-l.bmp",1],[12,-38,"Z","keyboard-z.bmp",0],
			[12,-38,"X","keyboard-x.bmp",0],[12,-38,"C","keyboard-c.bmp",0],[12,-38,"V","keyboard-v.bmp",0],[12,-38,"B","keyboard-b.bmp",0],
			[12,-38,"N","keyboard-n.bmp",0],[12,-38,"M","keyboard-m.bmp",0],[12,-38," ","keyboard-15.bmp",0],[12,-38,"Lock","keyboard-max.bmp",0]];
}


JSKB.prototype.KB_key_down = function(id){
	var imgUrl = JSKB.keyVal[id][3].replace(".bmp","");
	document.getElementById("key"+id).innerHTML = "<img src=\"/shmis/images/selfserver/"+imgUrl+"-.bmp\" border=\"0\" />";
}

wnd_show = function(val,id){
    language=val;
     var imgUrl = JSKB.keyVal[id][3];
	document.getElementById("key"+id).innerHTML = "<img src=\"/shmis/images/selfserver/"+imgUrl+"\" border=\"0\" />";
    if(JSKB.keyVal[id][2]=="CH/EN")
    {
        if(val=="EN")
        {
            document.getElementById("key"+id).innerHTML = "<img src=\"/shmis/images/selfserver/"+imgUrl+"\" border=\"0\" />";
        }else
        {
            imgUrl = JSKB.keyVal[id][3].replace(".bmp","");
	        document.getElementById("key"+id).innerHTML = "<img src=\"/shmis/images/selfserver/"+imgUrl+"-.bmp\" border=\"0\" />";
        }
        $("#code_field").html("");
        $("#list_area").html("");
        document.getElementById(JSKB.outId).value="";
        return;
    }
}

JSKB.prototype.KB_key_up = function(id){
    var imgUrl = JSKB.keyVal[id][3];
	document.getElementById("key"+id).innerHTML = "<img src=\"/shmis/images/selfserver/"+imgUrl+"\" border=\"0\" />";
    if(JSKB.keyVal[id][2]=="CH/EN")
    {
        if(language=="CH")
        {
            language="EN";
            document.getElementById("key"+id).innerHTML = "<img src=\"/shmis/images/selfserver/"+imgUrl+"\" border=\"0\" />";
        }else
        {
            language="CH";
            imgUrl = JSKB.keyVal[id][3].replace(".bmp","");
	        document.getElementById("key"+id).innerHTML = "<img src=\"/shmis/images/selfserver/"+imgUrl+"-.bmp\" border=\"0\" />";
        }
        $("#code_field").html("");
        $("#list_area").html("");
        document.getElementById(JSKB.outId).value="";
        return;
    }else if(JSKB.keyVal[id][2]=="Lock")
    {
        if(!Lock&&language=="EN")
        {
            Lock=true;
        }else
        {
            Lock=false;
        }
        return;
    }
    if(language=="CH"){
	    
	    var keyV = JSKB.keyVal[id][2];
	    var txt = document.getElementById(JSKB.outId).value;
	    if (keyV=="-"){
		    if (txt!=""){
			    if (txt.length==1)
				    txt="";
			    else
				    txt = txt.substr(0,txt.length-1);
		    }else 
		        {
		       //     if(checkid=="edit_area"){
			        document.getElementById(checkid).value=document.getElementById(checkid).value.substr(0,document.getElementById(checkid).value.length-1);
			   /*     }else
			        {
			            passwordvalue=(passwordvalue.substring(0,passwordvalue.length-1));
			            document.getElementById(checkid).value=replacestr(passwordvalue,"*");
			        }
			    }*/
		}
			     
	    }
	    else if (keyV == "+"){
		    //document.getElementById(JSKB.Id).style.display = "none";JSKB.enterID
		    word_list = new Array();
//		    document.getElementById(JSKB.enterID).click();
		    return;
	    }
	    else{
		    txt = txt + keyV;
	    }
	    document.getElementById(JSKB.outId).value= txt;
	    if(!isNaN(keyV)||keyV==" ")
	    {
	        if(word_list.length>0)
	        {
	            if(word_list[Number(keyV)-1]==""||txt=="")
                {
                    document.getElementById(JSKB.outId).value="";
                 //   if(checkid=="edit_area"){
	                document.getElementById(checkid).value+=keyV;
	          //      }else
	        /*        {
	                    passwordvalue+=keyV;
	                    document.getElementById(checkid).value=replacestr(passwordvalue,"*");
	                }*/
                    return;
                }
                var key;
	            if(keyV==" ")
	                key=1;
	            else if(keyV==0)
	                key=10;
	            else
	                key=keyV;
	        //    if(checkid=="edit_area"){
	                if(word_list[Number(key)-1]=="")
	                    document.getElementById(checkid).value+=keyV;
	                else
	                document.getElementById(checkid).value+=word_list[Number(key)-1];
	       /*     }else
	            {
	                passwordvalue+=word_list[Number(key)-1];
	                document.getElementById(checkid).value=replacestr(passwordvalue,"*");
	            }*/
	            $("#code_field").html("");
	            $("#list_area").html("");
	            word_list = new Array();
	        }else
	        {
	          //  if(checkid=="edit_area"){
	                document.getElementById(checkid).value+=keyV;
	         /*   }else
	            {
	                passwordvalue+=keyV;
	                document.getElementById(checkid).value=replacestr(passwordvalue,"*");
	            }*/
	        }
	        document.getElementById(JSKB.outId).value="";
	    }else
	    {
	        on_code_change(txt.toLowerCase());
	    }
	}else
	{
	    var keyV = JSKB.keyVal[id][2];
	    var txt = document.getElementById(JSKB.outId).value;
	    if (keyV=="-"){
		    if (txt!=""){
			    if (txt.length==1)
				    txt="";
			    else
				    txt = txt.substr(0,txt.length-1);
		    }else 
			    {
			//     if(checkid=="edit_area"){
			        document.getElementById(checkid).value=document.getElementById(checkid).value.substr(0,document.getElementById(checkid).value.length-1);
			  /*   }else{
			         passwordvalue=passwordvalue.substring(0,passwordvalue.length-1);
			         document.getElementById(checkid).value=replacestr(passwordvalue,"*");
			     }*/
			    }

	    }
	    else if (keyV == "+"){
		    //document.getElementById(JSKB.Id).style.display = "none";JSKB.enterID
		    word_list = new Array();
//		    document.getElementById(JSKB.enterID).click();
	    }
	    else{
	        if(Lock){
		        txt = txt + keyV;
		        Lock=false;
		    }else
		    {
		        txt = txt + keyV.toLowerCase();
		    }
	    }
	//    if(checkid=="edit_area"){
	        document.getElementById(checkid).value+=txt;
	/*    }else
	    {
	        passwordvalue+=txt;
	        document.getElementById(checkid).value=replacestr(passwordvalue,"*");
	    }*/
	}
}


JSKB.prototype.create = function(id,OutId,enterId){
	var html = new Array();
	JSKB.enterID = enterId;
	JSKB.outId = OutId;
	JSKB.Id = id;
	document.getElementById(id).className = "kB_Back";
	document.getElementById(id).style.display = "";
	for (var i=0;i<JSKB.keyVal.length;i++){
		if (JSKB.keyVal[i][4]==0){
			html.push("<div id=\"key"+i+"\" class=\"key\" style=\"left:"+JSKB.keyVal[i][0]+"px; top:"+JSKB.keyVal[i][1]+"px\" onmousedown=\"JSKB.prototype.KB_key_down("+i+")\" onmouseup=\"JSKB.prototype.KB_key_up("+i+")\"  >");
		}
		else{
			html.push("<div id=\"key"+i+"\" class=\"key\" style=\"left:"+JSKB.keyVal[i][0]+"px; top:"+JSKB.keyVal[i][1]+"px; float:none  \" onmousedown=\"JSKB.prototype.KB_key_down("+i+")\" onmouseup=\"JSKB.prototype.KB_key_up("+i+")\"   >");
		}
		html.push("<img src=\"/shmis/images/selfserver/"+JSKB.keyVal[i][3]+"\" border=\"0\" />");
		html.push("</div>");
		
	}
	document.getElementById(id).innerHTML = html.join("");
	if ($("#code_field").size()==0){
		
		$("body").append("<div id=\"code_field\"></div>");
		$("body").append("<div id=\"list_area\"></div>");
	}
}

function replacestr(str,replacestr)
{
    var newstr="";
    if(str.length>0)
    {
       for(var i=0;i<str.length-1;i++)
       {
            newstr+=replacestr;
       }
       newstr+=str.substring(str.length-1);
    }
    return newstr;
}
