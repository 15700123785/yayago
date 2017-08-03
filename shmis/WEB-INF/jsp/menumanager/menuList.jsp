<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>根菜单管理</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/ext-all.css" />
<script type="text/javascript" src="${ctx}/js/ext3/ext-base.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ext-all.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ux/TabCloseMenu.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/layouts/m-component.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/js/definite/mycomponent.js"></script>
<script type="text/javascript" src="${ctx}/js/definite/multiselect.js"></script>


<script type="text/javascript">


Ext.onReady(function(){
	
	
var gridstore;
Ext.onReady(function(){
		
 	gridstore = new Ext.data.JsonStore( {
		root : 'root',
		totalProperty : 'results',
		idProperty : 'id',
		fields : [ 'id','createByTime','modifiedByTime','deletedbyTime','text','url','description'],
		// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
		proxy : new Ext.data.HttpProxy({
			url : '/shmis/background/menumanager/data/menus'
		})
	});
	//表格选择框
	var sm = new Ext.grid.CheckboxSelectionModel({
				handleMouseDown:Ext.emptyFn
	});
	var MyVewport = new Ext.Viewport({
		layout:"fit",
		items : [ {
			id:"menugrid",
			xtype : "grid",
			title : "",
			store : gridstore,
			sm:sm,
			columns : [
			      new Ext.grid.RowNumberer(),
			      sm,
			      {
				header : "菜单名",
				sortable : true,
				resizable : true,
				dataIndex : "text",
				width : 100
				},
			      {
				header : "url",
				sortable : true,
				resizable : true,
				dataIndex : "url",
				width : 100},
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
				width : 150},
				  {
					header : "修改时间",
					sortable : true,
					resizable : true,
					dataIndex : "modifiedByTime",
					renderer: function(v){
						if (v != null) {
							return Ext.util.Format.date(new Date(v),'Y/m/d H:m:s');
						} else {
							return '';
						}
					},
					width : 150},
			       {
				header : "描述",
				sortable : true,
				resizable : true,
				dataIndex : "description",
				width : 150
				}
				
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
			       var rs=Ext.getCmp("menugrid").getSelectionModel().getSelections();
		               if(rs==null||rs.length!=1){
		                    top.Ext.Msg.alert('提示', "请选择一条要删除的数据");
		               }else{
		                    top.Ext.MessageBox.confirm("确认","确认要删除吗",function(btn){    
	                               if(btn=="yes"){
		                           Ext.Ajax.request({
	             			   url:'/shmis/background/menumanager/d/'+rs[0].json.id,
	             			   method:'POST',
             				   success:function(response, option){
             				  	var res = Ext.util.JSON.decode(response.responseText);
             				  	top.Ext.Msg.alert('提示', res.content);
             				  	    gridstore.reload();
                				}
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
	});
	//menu数据加载
	gridstore.load();
})

	//新增和更新方法
	function addorupdate(type){   //0为新增，1为修改
		var record = null;
		var title = "";
		var url = "";
		
		if(type==0){
	        	title = "新增";
	        	url = "/shmis/background/menumanager/c/menu"; 
		}else{
			record = (function() {
				 return Ext.getCmp("menugrid").getSelectionModel().getSelected();
			})();
// 			alert(record.length);
			if(record == null ){
				   top.Ext.Msg.alert('提示', "请选择一条要修改的数据");
				   return ;
			}else {
				   var title="修改";
			           var url ="/shmis/background/menumanager/u/menu"; 
		  	}
		}
		
// 		var mstore = new Ext.data.JsonStore( {
// 			root : 'root',
// 			totalProperty : 'results',
// 			idProperty : 'id',
// 			fields : [ 'id','createByTime','modifiedByTime','deletedbyTime','text','url','description',
// 			           'leaf','pMenu'],
// 			// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
// 			proxy : new Ext.data.HttpProxy({
// 				method:'GET',
// 				url : '/shmis/background/menumanager/data/pmenus'
// 			})
// 		});
// 		var data = [
// 		            ['value1','text1'],
// 		            ['value2','text2']
// 		            ];
// 		var lstore = new Ext.data.SimpleStore({
// 			fields:['value','text'],
// 			data:data
// 		});
		
		var MyWindow = new Ext.Window({
					title:title,
					width:400,
					height:210,
					autoDestroy:true,
					hideBorders:false,
					autoScroll:false,
					modal:true,
					items:[
						{
							id:"menu",
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
										var addform = Ext.getCmp("menu");
// 										 var addform = top.Ext.getCmp("menu");
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
														top.Ext.Msg.alert('错误');
														MyWindow.destroy();
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
									fieldLabel:"菜单主键",
									anchor:"100%",
									hidden:true,
									value:record ? record.get("id") : ''
								},
								{	
									xtype:"textfield",
									name:"text",
									fieldLabel:"菜单名",
									anchor:"100%",
									value:record ? record.get("text") : ''
								},
								{
									
									xtype:"textfield",
									name:"url",
									fieldLabel:"url",
									anchor:"100%",
									value:record ? record.get("url") : ''
								},
								{	
									xtype:"textfield",
									name:"description",
									fieldLabel:"描述",
									anchor:"100%",
									value:record ? record.get("description"): ''
								}
// 								{
// 									xtype:'combo',
// 									name:'ptext',
// 									store:mstore,
// 									displayField:'text',
// 									fieldLabel:'根菜单',
// 									typeAhead: true,
// 								        mode: 'remote',
// 								        forceSelection: true,
// 								        triggerAction: 'all',
// 								        emptyText:'请选择',
// 								        selectOnFocus:true
								
// 								}
								
							]
						}
					]
				});
		MyWindow.show();
	}	
		

});

</script>
</head>

<body>


</body>
</html>