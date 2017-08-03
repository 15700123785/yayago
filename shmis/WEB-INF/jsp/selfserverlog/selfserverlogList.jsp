<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日志管理</title>

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
			 	autoLoad :true,
				root : 'root',
				totalProperty : 'results',
				idProperty : 'id',
				fields : [ 'id','createByTime','modifiedByTime','deletedbyTime','zzjid','code','year','month','day','log',
				           'user'],
				// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
				proxy : new Ext.data.HttpProxy({
					url : '/shmis/background/selfserverlog/data/search'
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
						header : "自助机ID",
						sortable : true,
						resizable : true,
						dataIndex : "zzjid",
						width : 100
						},
					      {
						header : "产品编码",
						sortable : false,
						//resizable : true,
						dataIndex : "code",
						width : 100},
						  {
						header : "年",
						sortable : false,
						//resizable : true,
						dataIndex : "year",
						width : 50},
						  {
						header : "月",
						sortable : false,
						//resizable : true,
						dataIndex : "month",
						width : 50},
						  {
						header : "日",
						sortable : false,
						//resizable : true,
						dataIndex : "day",
						width : 50},
					     {
							header : "日志信息",
							sortable : true,
							resizable : true,
							dataIndex : "log",
							width : 300,
							renderer: function (data, metadata, record, rowIndex, columnIndex, store) {  
							      var logpath = store.getAt(rowIndex).get('log');  
							  
							      return '<a href="/file/' + logpath + '">' + "查看日志" +"</a>";  
							  
							  }  
						  },
						/* {
						  <a href='file://localhost/c:\\test.txt'> c:\\test.txt</a>
						  <a href='file://localhost/c:\\test.txt'> c:\\test.txt</a>
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
							width : 150} */
						],

					tbar : [{
						text : "按条件查询",
						handler:function(){
							searchByCondition();
						}
						
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
	
	/* var rstore = new Ext.data.JsonStore( {
		root : 'root',
		totalProperty : 'results',
		idProperty : 'id',
		fields : [ 'id','configName'],
		// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
		proxy : new Ext.data.HttpProxy({
			url : '/shmis/background/selfserverconfigmanager/data/selfservers',
			method: 'GET'
		})
	}); */
	function searchByCondition(){   //0为新增，1为修改
		var record = null;
		var title = "查询";
		var url = "/shmis/background/selfserverlog/data/search";
		
		
		
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
									text:"查询",
									handler:function(){
										 var addform = top.Ext.getCmp("selfserver");
										 if (addform.getForm().isValid()) {
											  addform.getForm().submit({
													url : url,
													method : 'post',
													waitTitle : "请稍候",
													waitMsg : "正在查询数据，请稍候。。。。。。",
													success : function(form, action) {
														//var isSuccess = action.result.success;
														/* top.Ext.Msg.alert('提示'); */
														Ext.apply(gridstore.baseParams,addform.form.getFieldValues());
														MyWindow.destroy();
														gridstore.load();
													},
													failure : function(form, action) {
														top.Ext.Msg.alert('查询失败');
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
								{	id:'zzjid',
									xtype:"textfield",
									name:"zzjid",
									fieldLabel:"自助机ID",
									anchor:"100%",
									value:record ? record.get("id") : ''
								},
								{	id:"code",
									xtype:"textfield",
									name:"code",
									fieldLabel:"产品编码",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("code") : ''
								},
								{
									id:"year",
									xtype:"textfield",
									name:"year",
									fieldLabel:"年",
									anchor:"100%",
									value:record ? record.get("ip") : ''
								},
								{
									id:"month",
									xtype:"textfield",
									name:"month",
									fieldLabel:"月",
									anchor:"100%",
									value:record ? record.get("mac") : ''
								},
								{
									id:"day",
									xtype:"textfield",
									name:"day",
									fieldLabel:"日",
									anchor:"100%",
									value:record ? record.get("mac") : ''
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
/* var el = Ext.get("aa"); //这个获取链接dom
	//给链接dom加点击事件
	el.on("click" , function(){
	    var win = Ext.create("Ext.Window" , {
	        title: "window" , 
	        height:200 , width:200
	    });
	    win.show();
	}) */

</script>
</head>

<body>

</body>
</html>