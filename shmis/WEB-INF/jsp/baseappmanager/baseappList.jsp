<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自助机管理</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/ext-all.css" />
<script type="text/javascript" src="${ctx}/js/ext3/ext-base.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ext-all.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ux/TabCloseMenu.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/layouts/m-component.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ext-lang-zh_CN.js"></script>

<script type="text/javascript">

Ext.onReady(function(){
	var gridstore;
	Ext.onReady(function(){
		 gridstore = new Ext.data.JsonStore( {
				root : 'root',
				totalProperty : 'results',
				idProperty : 'id',
				fields : [
				          'id','selfServers','zzjid','hQServ',
				          'debug','printName','printName_xp','page_height',
				          'iDport','syImg','txmImg','paperCount',
				          'password','times','gnID','is_ceshi',
				          'dzyz','fwsl','isSxt','isOpenCard',
				          'isoPenXP','xp_port','xp_txt1','xp_txt2',
				          'xp_txt4','xp_txt5','saveLog','delete_Img',
				          'closeThread','marquee_txt','dzyz_left','dzyz_top',
				          'defaultPages','print_show','systemName','print_SystemName',
				          'dwmc','aREA','sM','backTime',
				          'shutdownCode','curentArea','allArea','remark2',
				          'remark1','remark11','print_fun_id','serverurl',
				          'updateurl','photourl','backurl'],
				// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
				proxy : new Ext.data.HttpProxy({
					url : '/shmis/service/data/baseapp'
				})
			});
			var sm = new Ext.grid.CheckboxSelectionModel({
				handleMouseDown:Ext.emptyFn
			});
			var MyViewport = new Ext.Viewport({
				layout: 'fit',
				items : [ {
					id:"baseappgrid",
					xtype : "grid",
					title : "",
					store : gridstore,
					sm:sm,
					columns : [
					      new Ext.grid.RowNumberer(),
					      sm,
					      {
						header : "自助机ID",
						sortable : true,
						resizable : true,
						dataIndex : "zzjid",
						width : 80},
					      {
						header : "服务地址",
						sortable : true,
						resizable : true,
						dataIndex : "hQServ",
						width : 100},
					     {
						header : "调试",
						sortable : true,
						resizable : true,
						dataIndex : "debug",
						width : 80},
					      {
						header : "打印机名称",
						sortable : true,
						resizable : true,
						dataIndex : "printName",
						width : 80},
					      {
						header : "打印机名称备选",
						sortable : true,
						resizable : true,
						dataIndex : "printName_xp",
						width : 80},
					      {
						header : "页面高度",
						sortable : true,
						resizable : true,
						dataIndex : "page_height",
						width : 80},
					     {
						header : "读卡器端口",
						sortable : true,
						resizable : true,
						dataIndex : "iDport",
						width : 80},
					     {
						header : "固化背景",
						sortable : true,
						resizable : true,
						dataIndex : "syImg",
						width : 80},
					     {
						header : "固化条形码",
						sortable : true,
						resizable : true,
						dataIndex : "txmImg",
						width : 80},
					     {
						header : "纸张数量",
						sortable : true,
						resizable : true,
						dataIndex : "paperCount",
						width : 80},
					     {
						header : "后台密码",
						sortable : true,
						resizable : true,
						dataIndex : "password",
						width : 80},
					     {
						header : "返回倒计时(s)",
						sortable : true,
						resizable : true,
						dataIndex : "times",
						width : 80},
					    {
						header : "显示打印全部",
						sortable : true,
						resizable : true,
						dataIndex : "gnID",
						width : 80},
					    {
						header : "测试添加成人",
						sortable : true,
						resizable : true,
						dataIndex : "is_ceshi",
						width : 80},
					    {
						header : "电子印章",
						sortable : true,
						resizable : true,
						dataIndex : "dzyz",
						width : 80},
					    {
						header : "房屋数量",
						sortable : true,
						resizable : true,
						dataIndex : "fwsl",
						width : 80},
					    {
						header : "打开摄像头",
						sortable : true,
						resizable : true,
						dataIndex : "isSxt",
						width : 80},
					    {
						header : "打开端口",
						sortable : true,
						resizable : true,
						dataIndex : "isOpenCard",
						width : 80},
					    {
						header : "打印章小票",
						sortable : true,
						resizable : true,
						dataIndex : "isoPenXP",
						width : 80},
					    {
						header : "小票端口",
						sortable : true,
						resizable : true,
						dataIndex : "xp_port",
						width : 80},
					    {
						header : "小票内容1",
						sortable : true,
						resizable : true,
						dataIndex : "xp_txt1",
						width : 80},
					    {
						header : "小票内容2",
						sortable : true,
						resizable : true,
						dataIndex : "xp_txt2",
						width : 80},
					    {
						header : "小票内容3",
						sortable : true,
						resizable : true,
						dataIndex : "xp_txt4",
						width : 80},
					    {
						header : "小票内容4",
						sortable : true,
						resizable : true,
						dataIndex : "xp_txt5",
						width : 80},
					    {
						header : "保存日志",
						sortable : true,
						resizable : true,
						dataIndex : "saveLog",
						width : 80},
					    {
						header : "删除图像",
						sortable : true,
						resizable : true,
						dataIndex : "delete_Img",
						width : 80},
					    {
						header : "关闭线程",
						sortable : true,
						resizable : true,
						dataIndex : "closeThread",
						width : 80},
					    {
						header : "滚动文字",
						sortable : true,
						resizable : true,
						dataIndex : "marquee_txt",
						width : 80},
					    {
						header : "印章距离左",
						sortable : true,
						resizable : true,
						dataIndex : "dzyz_left",
						width : 80},
					    {
						header : "印章距离上",
						sortable : true,
						resizable : true,
						dataIndex : "dzyz_top",
						width : 80},
					    {
						header : "默认纸张数目",
						sortable : true,
						resizable : true,
						dataIndex : "defaultPages",
						width : 80},
					    {
						header : "打印后提示语",
						sortable : true,
						resizable : true,
						dataIndex : "print_show",
						width : 80},
					    {
						header : "系统名称",
						sortable : true,
						resizable : true,
						dataIndex : "systemName",
						width : 80},
					    {
						header : "打印提示系统名称",
						sortable : true,
						resizable : true,
						dataIndex : "print_SystemName",
						width : 80},
					    {
						header : "单位名称",
						sortable : true,
						resizable : true,
						dataIndex : "dwmc",
						width : 80},
					    {
						header : "单位区域",
						sortable : true,
						resizable : true,
						dataIndex : "aREA",
						width : 80},
					    {
						header : "声明",
						sortable : true,
						resizable : true,
						dataIndex : "sM",
						width : 80},
					    {
						header : "页面返回时间(s)",
						sortable : true,
						resizable : true,
						dataIndex : "backTime",
						width : 80},
					    {
						header : "关闭代码",
						sortable : true,
						resizable : true,
						dataIndex : "shutdownCode",
						width : 80},
					    {
						header : "当前区域",
						sortable : true,
						resizable : true,
						dataIndex : "curentArea",
						width : 80},
					    {
						header : "所有区域",
						sortable : true,
						resizable : true,
						dataIndex : "allArea",
						width : 80},
					    {
						header : "房改提示",
						sortable : true,
						resizable : true,
						dataIndex : "remark2",
						width : 80},
					    {
						header : "房屋权属提示",
						sortable : true,
						resizable : true,
						dataIndex : "remark1",
						width : 80},
					    {
						header : "普通提示",
						sortable : true,
						resizable : true,
						dataIndex : "remark11",
						width : 80},
					    {
						header : "print_fun_id",
						sortable : true,
						resizable : true,
						dataIndex : "print_fun_id",
						width : 80},
					    {
						header : "serverurl",
						sortable : true,
						resizable : true,
						dataIndex : "serverurl",
						width : 80},
					    {
						header : "updateurl",
						sortable : true,
						resizable : true,
						dataIndex : "updateurl",
						width : 80},
					    {
						header : "photourl",
						sortable : true,
						resizable : true,
						dataIndex : "photourl",
						width : 80},
					    {
						header : "backurl",
						sortable : true,
						resizable : true,
						dataIndex : "backurl",
						width : 80}
						],

					tbar : [{
						text : "新增",
						handler:function(){
						   	addorupdate(0);
						}
						
						}, 
						"-", 
						{
						text : "修改",
						handler:function(){
							addorupdate(1);
						}
						},
						"-", 
						{
							text : "删除",
							handler:function(){
							       var rs=Ext.getCmp("baseappgrid").getSelectionModel().getSelections();
					                       if(rs==null||rs.length!=1){
					                    	   top.Ext.Msg.alert('提示', "请选择一条要删除的数据");
					                       }else{
					                    	   Ext.MessageBox.confirm("确认","确认要删除吗",function(btn){    
		                    	          			console.log(rs);
					                               if(btn=="yes"){
						                               	 Ext.Ajax.request({
					             			  	    url:'/shmis/service/baseapp/del/'+rs[0].json.id,
					             			  	    method:'POST',
				             				  	    success:function(response, option){
				             				  	    	
				             				  			  var res = Ext.util.JSON.decode(response.responseText);
				             				  			  if(res.success == true){
				             				  				top.Ext.Msg.alert('提示', '删除成功');
				             				  	     		  gridstore.reload();
				             				  			  }else{
				             				  				top.Ext.Msg.alert('提示', '删除失败');
				             				  			  }
				                					    },
				                				    failure:function(response,option) {
				                				    	alert("shanchu");
				                				    	console.log(response);
				                				    	console.log(option);
				                				    	gridstore.reload();
				                				    },
				                					   
				                             			 })
		                               		        }
	                          			});
					               }}
						}],
					// 分页
					bbar : new Ext.PagingToolbar( {
						pageSize : 10,
						store : gridstore,
						displayInfo : true
					})
				} ]
			})

			gridstore.load();

			
		})
	function addorupdate(type){   //0为新增，1为修改
		var record = null;
		var title = "";
		var url = "";
		
		if(type==0){
	        	title = "新增";
	        	url = "/shmis/service/baseapp/save"; 
		}else{
			record = (function() {
				 return Ext.getCmp("baseappgrid").getSelectionModel().getSelected();
			})();

			if(record == null ){
				   top.Ext.Msg.alert('提示', "请选择一条要修改的数据");
				   return ;
			}else {
				   var title="修改";
			           var url ="/shmis/service/baseapp/update"; 
		  	}
		}
		//弹出windows的界面
		var MyWindow = new top.Ext.Window({
					title:title,
					width:420,
					height:520,
					autoDestroy:true,
					hideBorders:false,
					autoScroll:true,
					modal:true,
					items:[
						{
							id:"baesapp",
							xtype:"form",
							title:"",
							labelWidth:100,
// 							inputType:true,
							fileUpload:true,
							labelAlign:"left",
							layout:"form",
							padding:"2",
							fbar:[
								{
									text:"保存",
									handler:function(){
										 var addform = top.Ext.getCmp("baesapp");
										 if (addform.getForm().isValid()) {
											  addform.getForm().submit({
													url : url,
													method : 'post',
													waitTitle : "请稍候",
													waitMsg : "正在提交表单数据，请稍候。。。。。。",
													success : function(form, action) {
														var isSuccess = action.result.success;
														var ok = false;
														if (type == 0) {
															if (isSuccess) {
																top.Ext.Msg.alert('提示','新增成功！');
																ok = true;
															}else{
																top.Ext.Msg.alert('提示','自助机ID重复');
																ok = false;
															}
															
														} else {
															top.Ext.Msg.alert('提示','更新成功！');
															ok = true;
														}
														if (ok) {
															MyWindow.destroy();
															gridstore.reload();
														}
													},
													failure : function(form, action) {
														top.Ext.Msg.alert('错误','新增或更新失败！');
														MyWindow.destroy();
														gridstore.reload();
													}
												});
										   }
									}
								},
								" ",
								" ",
								{
									text:"取消",
									handler:function(){
									   MyWindow.destroy();
									}
								}
							],
							items:[
								{	
									xtype:"textfield",
									name:"id",
									fieldLabel:"用户主键",
									anchor:"100%",
									hidden:true,
									value:record ? record.get("id") : ''
								},
								{	
									xtype:"textfield",
									name:"zzjid",
									fieldLabel:"自助机ID",
									labelStyle : "text-align:right;",
									anchor:"100%",
 									disabled:type==0 ? false :true,
									value:record ? record.get("zzjid") : ''
								},
								{
									xtype:"textfield",
									name:"hQServ",
									fieldLabel:"服务地址",
									labelStyle : "text-align:right;",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("hQServ") : ''
								},
								{
									xtype:"textfield",
									name:"debug",
									fieldLabel:"调试",
									labelStyle : "text-align:right;",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("debug") : ''
								},
								{
									xtype:"textfield",
									name:"printName",
									fieldLabel:"打印机名称",
									labelStyle : "text-align:right;",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("printName") : ''
								},
								{
									xtype:"textfield",
									name:"printName_xp",
									fieldLabel:"打印机名称备选",
									labelStyle : "text-align:right;",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("printName_xp") : ''
								},
								{
									xtype:"textfield",
									name:"page_height",
									fieldLabel:"页面高度",
									labelStyle : "text-align:right;",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("page_height") : ''
								},
								{
									xtype:"textfield",
									name:"iDport",
									fieldLabel:"读卡器端口",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("iDport") : ''
								},
								{
									xtype:"textfield",
									name:"syImg",
									fieldLabel:"固化背景",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("syImg") : ''
								},
								{
									xtype:"textfield",
									name:"txmImg",
									fieldLabel:"固化条形码",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("txmImg") : ''
								},
								{
									xtype:"textfield",
									name:"paperCount",
									fieldLabel:"纸张数量",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("paperCount") : ''
								},
								{
									xtype:"textfield",
									name:"password",
									fieldLabel:"后台密码",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("password") : ''
								},
								
								{
									xtype:"textfield",
									name:"times",
									fieldLabel:"返回倒计时(s)",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("times") : ''
								},
								{
									xtype:"textfield",
									name:"gnID",
									fieldLabel:"显示打印全部",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("gnID") : ''
								},
								{
									xtype:"textfield",
									name:"is_ceshi",
									fieldLabel:"测试添加成人",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("is_ceshi") : ''
								},
								{
									xtype:"textfield",
									name:"dzyz",
									fieldLabel:"电子印章",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("dzyz") : ''
								},
								{
									xtype:"textfield",
									name:"fwsl",
									fieldLabel:"房屋数量",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("fwsl") : ''
								},
								{
									xtype:"textfield",
									name:"isSxt",
									fieldLabel:"打开摄像头",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("isSxt") : ''
								},
								{
									xtype:"textfield",
									name:"isOpenCard",
									fieldLabel:"打开端口",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("isOpenCard") : ''
								},
								{
									xtype:"textfield",
									name:"isoPenXP",
									fieldLabel:"打印章小票",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("isoPenXP") : ''
								},
								{
									xtype:"textfield",
									name:"xp_port",
									fieldLabel:"小票端口",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("xp_port") : ''
								},
								{
									xtype:"textfield",
									name:"xp_txt1",
									fieldLabel:"小票内容1",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("xp_txt1") : ''
								},
								{
									xtype:"textfield",
									name:"xp_txt2",
									fieldLabel:"小票内容2",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("xp_txt2") : ''
								},
								{
									xtype:"textfield",
									name:"xp_txt4",
									fieldLabel:"小票内容3",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("xp_txt4") : ''
								},
								{
									xtype:"textfield",
									name:"xp_txt5",
									fieldLabel:"小票内容4",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("xp_txt5") : ''
								},
								{
									xtype:"textfield",
									name:"saveLog",
									fieldLabel:"保存日志",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("saveLog") : ''
								},
								{
									xtype:"textfield",
									name:"delete_Img",
									fieldLabel:"删除图像",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("delete_Img") : ''
								},
								{
									xtype:"textfield",
									name:"closeThread",
									fieldLabel:"关闭线程",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("closeThread") : ''
								},
								{
									xtype:"textfield",
									name:"marquee_txt",
									fieldLabel:"滚动文字",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("marquee_txt") : ''
								},
								{
									xtype:"textfield",
									name:"dzyz_left",
									fieldLabel:"印章距离左",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("dzyz_left") : ''
								},
								{
									xtype:"textfield",
									name:"dzyz_top",
									fieldLabel:"印章距离上",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("dzyz_top") : ''
								},
								{
									xtype:"textfield",
									name:"defaultPages",
									fieldLabel:"默认纸张数目",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("defaultPages") : ''
								},
								{
									xtype:"textfield",
									name:"print_show",
									fieldLabel:"打印后提示语",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("print_show") : ''
								},
								{
									xtype:"textfield",
									name:"systemName",
									fieldLabel:"系统名称",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("systemName") : ''
								},
								{
									xtype:"textfield",
									name:"print_SystemName",
									fieldLabel:"打印提示系统名称",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("print_SystemName") : ''
								},
								{
									xtype:"textfield",
									name:"dwmc",
									fieldLabel:"单位名称",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("dwmc") : ''
								},
								{
									xtype:"textfield",
									name:"aREA",
									fieldLabel:"单位区域",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("aREA") : ''
								},
								{
									xtype:"textarea",
									name:"sM",
									fieldLabel:"声明",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("sM") : ''
								},
								{
									xtype:"textfield",
									name:"backTime",
									fieldLabel:"页面返回时间(s)",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("backTime") : ''
								},
								{
									xtype:"textfield",
									name:"shutdownCode",
									fieldLabel:"关闭代码",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("shutdownCode") : ''
								},
								{
									xtype:"textfield",
									name:"curentArea",
									fieldLabel:"当前区域",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("curentArea") : ''
								},
								{
									xtype:"textfield",
									name:"allArea",
									fieldLabel:"所有区域",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("allArea") : ''
								},
								{
									xtype:"textarea",
									name:"remark2",
									fieldLabel:"房改提示",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("remark2") : ''
								},
								{
									xtype:"textarea",
									name:"remark1",
									fieldLabel:"房屋权属提示",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("remark1") : ''
								},
								{
									xtype:"textarea",
									name:"remark11",
									fieldLabel:"普通提示",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("remark11") : ''
								},
								{
									xtype:"textfield",
									name:"print_fun_id",
									fieldLabel:"print_fun_id",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("print_fun_id") : ''
								},
								{
									xtype:"textfield",
									name:"serverurl",
									fieldLabel:"serverurl",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("serverurl") : ''
								},
								{
									xtype:"textfield",
									name:"updateurl",
									fieldLabel:"updateurl",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("updateurl") : ''
								},
								{
									xtype:"textfield",
									name:"photourl",
									fieldLabel:"photourl",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("photourl") : ''
								},
								{
									xtype:"textfield",
									name:"backurl",
									fieldLabel:"backurl",
									labelStyle : "text-align:right;",
									anchor:"100%",
									value:record ? record.get("backurl") : ''
								},
							]
						}
					]
				})
			 
		MyWindow.show(); 
// 	        if(type==0){
// 	            top.Ext.getCmp("code").enable();
// 	        }
	}	
		

})

</script>
</head>

<body>


</body>
</html>