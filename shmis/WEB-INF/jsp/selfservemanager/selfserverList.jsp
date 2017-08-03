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
				fields : [ 'id','createByTime','modifiedByTime','deletedbyTime','code','ip','mac',
				           'user'],
				// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
				proxy : new Ext.data.HttpProxy({
					url : '/shmis/background/selfservermanager/data/selfservers'
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
						header : "自助机编码",
						sortable : true,
						resizable : true,
						dataIndex : "code",
						width : 100
						},
					      {
						header : "自助机ip",
						sortable : true,
						resizable : true,
						dataIndex : "ip",
						width : 300},
					     {
							header : "自助机MAC地址",
							sortable : true,
							resizable : true,
							dataIndex : "mac",
							width : 300},
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
					             			  	    url:'/shmis/background/selfservermanager/d/'+rs[0].json.id,
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
	//定义store 和 data
// 	var data = [
// 	            ['value1','text1'],
// 	            ['value2','text2'],
// 	            ['value3','text3'],
// 	            ['value4','text4'],
// 	            ];
// 	var lstore = new Ext.data.SimpleStore({
// 		fields:['value','text'],
// 		data:data
// 	});
	
	var rstore = new Ext.data.JsonStore( {
		root : 'root',
		totalProperty : 'results',
		idProperty : 'id',
		fields : [ 'id','configName'],
		// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
		proxy : new Ext.data.HttpProxy({
			url : '/shmis/background/selfserverconfigmanager/data/selfservers',
			method: 'GET'
		})
	});
	function addorupdate(type){   //0为新增，1为修改
		var record = null;
		var title = "";
		var url = "";
		
		if(type==0){
	        	title = "新增";
	        	url = "/shmis/background/selfservermanager/c/selfserver"; 
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
			           var url ="/shmis/background/selfservermanager/u/selfserver"; 
		  	}
		}
		
		var MyWindow = new top.Ext.Window({
					title:title,
					width:400,
					height:200,
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
								{	id:'selfserverId',
									xtype:"textfield",
									name:"id",
									fieldLabel:"用户主键",
									anchor:"100%",
									hidden:true,
									value:record ? record.get("id") : ''
								},
								{	id:"code",
									xtype:"textfield",
									name:"code",
									fieldLabel:"自助机编号",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("code") : ''
								},
								{
									id:"ip",
									xtype:"textfield",
									name:"ip",
									fieldLabel:"IP地址",
									anchor:"100%",
									value:record ? record.get("ip") : ''
								},
								{
									id:"mac",
									xtype:"textfield",
									name:"mac",
									fieldLabel:"mac地址",
									anchor:"100%",
									value:record ? record.get("mac") : ''
								},
								{
									xtype:'combo',
									fieldLabel:'自助机配置',
									hiddenName:'configId',
									store:rstore,
									valueField:'id',
									displayField:'configName',
								        typeAhead: true,
								        mode: 'remote',
								        forceSelection: true,
								        triggerAction: 'all',
								        emptyText:'请选择',
								        selectOnFocus:true,
								        allowBlank:false
								}
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