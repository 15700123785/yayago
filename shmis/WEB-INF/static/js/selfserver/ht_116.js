	var msg = new YearWnd("请输入纸张",480,460,"text"); 
	var msgw=new MsgBox("提示",480,200);
	var ID;
	var defaultPages;
	var shutdownCode;
	$(document).ready(function(){
		msg.show_wnd(update);
		msg.close();
	   //关机或重启设置
		$("#gjhcq").click(function(){
	      //alert(document.getElementById("srczm").value);
			if(document.getElementById("srczm").value=="")
			{
				msgw.btn_wnd_show_html_("<div>&nbsp;</div>操作码不能为空");
				return;
			}
			else if((document.getElementById("srczm").value  !='1') && (document.getElementById("srczm").value !='2'))
	        {
	             msgw.btn_wnd_show_html_("<div>&nbsp;</div>非法操作码");
				 return;
	        }
	        else if (document.getElementById("srczm").value=='1'||document.getElementById("srczm").value=='2' )
	        { 
	            //alert("exec opcode1-2");
	            var run=new S_S_Cmd();
	            run.addParam("ShutdownCode");
	            var re = run.run("House","getCS");
	            //alert(re);
	            document.getElementById("srczm").value=re;
	            run.addParam(re);
	   
	            re = run.run("House","shutdown");
		        run.clear();
	
	}else
	{
	  //alert("save opcode1-2");
			SaveNew("ShutdownCode",document.getElementById("srczm").value);
	   var run=new S_S_Cmd();
	   run.addParam("ShutdownCode");
	   var re = run.run("House","getCS");
	   alert(re);
	   document.getElementById("srczm").value=re;
	   run.addParam(re);
	   
	   re = run.run("House","shutdown");
		run.clear();
	
	}
		});
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
	
		$("#srczm").click(function(){
			OpenKey("srczm");
		});
	
	
	
		var run=new S_S_Cmd();
		run.addParam("PaperCount");
		var re=run.run("House","getCS");
		document.getElementById("syzzsl").value=re;
		run.clear();
		re=run.run("House","defaultPages");
		defaultPages=re;
		
	   //alert("opcode global set 1-2");
	   var run=new S_S_Cmd();
	   run.addParam("ShutdownCode");
	   var re = run.run("House","getCS");
	   document.getElementById("srczm").value=re;
	   //alert(document.getElementById("srczm").value);
	
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
	
	function SaveNew(key,val)
	{
		var run=new S_S_Cmd();
		run.addParam(key);
		run.addParam(val);
		var re=run.run("House","SaveCS");
		//msgw.btn_wnd_show_html_("<div>&nbsp;</div>修改成功");
	}