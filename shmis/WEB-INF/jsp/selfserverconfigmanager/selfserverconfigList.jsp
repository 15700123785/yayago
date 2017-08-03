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
				fields : [ 'id','createByTime','modifiedByTime','deletedbyTime','configName','printerName','printerPort',
				  'idCardName','idCardPort','icon','backgrondImageURL','deptName','motto','bottomtitle',
				  'welcometitle','rigthPicture','systemName','declareTitle','declareContent'],
				// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
				proxy : new Ext.data.HttpProxy({
					url : '/shmis/background/selfserverconfigmanager/data/selfservers'
				})
			});
			var sm = new Ext.grid.CheckboxSelectionModel({
				handleMouseDown:Ext.emptyFn
			});
			var MyViewport = new Ext.Viewport({
				layout: 'fit',
				items : [ {
					id:"selfserversgrid",
					xtype : "grid",
					title : "",
					store : gridstore,
					sm:sm,
					columns : [
					      new Ext.grid.RowNumberer(),
					      sm,
					      {
						header : "自助机配置名称",
						sortable : true,
						resizable : true,
						dataIndex : "configName",
						width : 100
						},
					      {
						header : "打印机名称",
						sortable : true,
						resizable : true,
						dataIndex : "printerName",
						width : 100},
					     {
						header : "打印机端口",
						sortable : true,
						resizable : true,
						dataIndex : "printerPort",
						width : 80},
					      {
						header : "身份证卡名称",
						sortable : true,
						resizable : true,
						dataIndex : "idCardName",
						width : 80},
					      {
						header : "身份证端口",
						sortable : true,
						resizable : true,
						dataIndex : "idCardPort",
						width : 80},
					      {
						header : "logo地址",
						sortable : true,
						resizable : true,
						dataIndex : "icon",
						width : 80},
					     {
						header : "背景图地址",
						sortable : true,
						resizable : true,
						dataIndex : "backgrondImageURL",
						width : 80},
					     {
						header : "部门名称",
						sortable : true,
						resizable : true,
						dataIndex : "deptName",
						width : 80},
					     {
						header : "部门口号",
						sortable : true,
						resizable : true,
						dataIndex : "motto",
						width : 80},
					     {
						header : "底部标题",
						sortable : true,
						resizable : true,
						dataIndex : "bottomtitle",
						width : 80},
					     {
						header : "右边的图片",
						sortable : true,
						resizable : true,
						dataIndex : "rigthPicture",
						width : 80},
					     {
						header : "欢迎标题",
						sortable : true,
						resizable : true,
						dataIndex : "welcometitle",
						width : 80},
					    {
						header : "系统名称",
						sortable : true,
						resizable : true,
						dataIndex : "systemName",
						width : 80},
					      {
						header : "创建时间",
						sortable : true,
						resizable : true,
						dataIndex : "createByTime",
						renderer: function(v){
							if (v != null) {
								return Ext.util.Format.date(new Date(v),'Y/m/d H:m:s');
							} else {
								return '';
							}
						},
						width : 150}
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
							       var rs=Ext.getCmp("selfserversgrid").getSelectionModel().getSelections();
					                       if(rs==null||rs.length!=1){
					                    	   top.Ext.Msg.alert('提示', "请选择一条要删除的数据");
					                       }else{
					                    	   Ext.MessageBox.confirm("确认","确认要删除吗",function(btn){    
		                    	          			console.log(rs);
					                               if(btn=="yes"){
						                               	 Ext.Ajax.request({
					             			  	    url:'/shmis/background/selfserverconfigmanager/d/'+rs[0].json.id,
					             			  	    method:'POST',
				             				  	    success:function(response, option){
				             				  			  var res = Ext.util.JSON.decode(response.responseText);
				             				  			  top.Ext.Msg.alert('提示', res.content);
				             				  	     		  gridstore.reload();
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
	        	url = "/shmis/background/selfserverconfigmanager/c/selfserverconfig"; 
		}else{
			record = (function() {
				 return Ext.getCmp("selfserversgrid").getSelectionModel().getSelected();
			})();
// 			alert(record.length);
			if(record == null ){
				   top.Ext.Msg.alert('提示', "请选择一条要修改的数据");
				   return ;
			}else {
				   var title="修改";
			           var url ="/shmis/background/selfserverconfigmanager/u/selfserverconfig"; 
		  	}
		}
		//弹出windows的界面
		var MyWindow = new top.Ext.Window({
					title:title,
					width:400,
					height:520,
					autoDestroy:true,
					hideBorders:false,
					autoScroll:false,
					modal:true,
					items:[
						{
							id:"selfserver",
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
										 var addform = top.Ext.getCmp("selfserver");
										 if (addform.getForm().isValid()) {
											  addform.getForm().submit({
													url : url,
													method : 'post',
													waitTitle : "请稍候",
													waitMsg : "正在提交表单数据，请稍候。。。。。。",
													success : function(form, action) {
														var isSuccess = action.result.success;
														top.Ext.Msg.alert('提示');
														MyWindow.destroy();
														gridstore.reload();
													},
													failure : function(form, action) {
															alert("hello");
														top.Ext.Msg.alert('错误');
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
									name:"configName",
									fieldLabel:"自助机配置名称",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("configName") : ''
								},
								{
									xtype:"textfield",
									name:"printerName",
									fieldLabel:"打印机名称",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("printerName") : ''
								},
								{
									xtype:"textfield",
									name:"printerPort",
									fieldLabel:"打印机端口",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("printerPort") : ''
								},
								{
									xtype:"textfield",
									name:"idCardName",
									fieldLabel:"身份证名称",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("idCardName") : ''
								},
								{
									xtype:"textfield",
									name:"idCardPort",
									fieldLabel:"身份证端口号",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("idCardPort") : ''
								},
								{
									xtype:"textfield",
									name:"icon",
									fieldLabel:"logo图标",
									inputType:'file',
									anchor:"100%"
								},
								{
									xtype:"textfield",
									name:"backgrondImageURL",
									fieldLabel:"背景图地址",
									inputType:'file',
									anchor:"100%",
								},
								{
									xtype:"textfield",
									name:"deptName",
									fieldLabel:"部门名称",
									anchor:"100%",
									value:record ? record.get("deptName") : ''
								},
								{
									xtype:"textfield",
									name:"motto",
									fieldLabel:"口号",
									anchor:"100%",
									value:record ? record.get("motto") : ''
								},
								{
									xtype:"textfield",
									name:"bottomtitle",
									fieldLabel:"首页底部标题",
									anchor:"100%",
									value:record ? record.get("bottomtitle") : ''
								},
								{
									xtype:"textfield",
									name:"rigthPicture",
									fieldLabel:"身份证右边图片",
									inputType:"file",
									anchor:"100%"
								},
								
								{
									xtype:"textfield",
									name:"welcometitle",
									fieldLabel:"欢迎标题",
									anchor:"100%",
									value:record ? record.get("welcometitle") : ''
								},
								{
									xtype:"textfield",
									name:"systemName",
									fieldLabel:"系统名称",
									anchor:"100%",
									value:record ? record.get("systemName") : ''
								},
								{
									xtype:"textfield",
									name:"declareTitle",
									fieldLabel:"风险声明标题",
									anchor:"100%",
									value:record ? record.get("declareTitle") : ''
								},
								{
									xtype:"textarea",
									name:"declareContent",
									fieldLabel:"风险声明标题",
									anchor:"100%",
									value:record ? record.get("declareContent") : ''
								}
								
								
								
// 								 'idCardName','idCardPort','icon','backgrondImageURL','title','subtitle','bottomtitle',
// 								  'welcometitle','rigthPicture','systemName','declareTitle','declareContent']
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