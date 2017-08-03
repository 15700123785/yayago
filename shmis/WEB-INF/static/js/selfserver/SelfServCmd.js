// JavaScript Document
function S_S_Cmd(){
	S_S_Cmd.parmList = null;
}

S_S_Cmd.prototype.addParam = function(val){
	if (S_S_Cmd.parmList == null)
		S_S_Cmd.parmList = new Array;
	
	S_S_Cmd.parmList.push(val);
}

S_S_Cmd.prototype.clear = function(){
	S_S_Cmd.parmList = null;
}

S_S_Cmd.prototype.run = function(appName,funName){
	var param = "";
	if (S_S_Cmd.parmList == null)
		param = "";
	
	var len = S_S_Cmd.parmList==null?0:S_S_Cmd.parmList.length;
		
	for(var i=0;i<len;i++){
		if (param==""||param=="undefined"){
			param = S_S_Cmd.parmList[i];
		}
		else
			param += "[`<@>^]" + S_S_Cmd.parmList[i];
	}
	
	return window.external.runCmd(appName,funName,param);
}