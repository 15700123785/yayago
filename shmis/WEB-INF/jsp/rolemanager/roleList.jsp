<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/example.css">
<style type="text/css">
    .complete .x-tree-node-anchor span {
        text-decoration: line-through;
        color: #777;
    }
</style>
<script type="text/javascript" src="${ctx}/js/ext3/ext-base.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ext-all.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ux/TabCloseMenu.js"></script>
<script type="text/javascript"
	src="${ctx}/js/ext3/layouts/m-component.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/js/definite/container.js"></script>

<script type="text/javascript">

Ext.onReady(function(){
	var gridstore;
	Ext.onReady(function(){
		 gridstore = new Ext.data.JsonStore( {
				root : 'root',
				totalProperty : 'results',
				idProperty : 'id',
				fields : [ 'id','createByTime','modifiedByTime','deletedbyTime','name','description','subroles',
				           'menus'],
				// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
				proxy : new Ext.data.HttpProxy({
					url : '/shmis/background/rolemanager/data/roles'
				})
			});
			var sm = new Ext.grid.CheckboxSelectionModel({
				handleMouseDown:Ext.emptyFn
			});
			var MyViewport = new Ext.Viewport({
				layout:"fit",
				items : [ {
					id:"rolesgrid",
					xtype : "grid",
					title : "",
					store : gridstore,
// 					height:Ext.getBody().getHeight(),
// // 					height:500,
// 					autoHeight : true,
					sm:sm,
					columns : [
					      new Ext.grid.RowNumberer(),
					      sm,
					      {
						header : "角色名称",
						sortable : true,
						resizable : true,
						dataIndex : "name",
						width : 100
						},
					      {
						header : "描述",
						sortable : true,
						resizable : true,
						dataIndex : "description",
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
							       var rs=Ext.getCmp("rolesgrid").getSelectionModel().getSelections();
					                       if(rs==null||rs.length!=1){
					                    	   top.Ext.Msg.alert('提示', "请选择一条要删除的数据");
					                       }else{
					                    	   Ext.MessageBox.confirm("确认","确认要删除吗",function(btn){    
		                    	          		
				                               if(btn=="yes"){
					                               	 Ext.Ajax.request({
				             			  	    url:'/shmis/background/rolemanager/d/'+rs[0].json.id,
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
			})

			gridstore.load();

			
		})
	function addorupdate(type){   //0为新增，1为修改
		var record = null;
		var title = "";
		var url = "";
		
		if(type==0){
	        	title = "新增";
	        	url = "/shmis/background/rolemanager/c/role"; 
		}else{
			record = (function() {
				 return Ext.getCmp("rolesgrid").getSelectionModel().getSelected();
			})();
// 			alert(record.length);
			if(record == null ){
				   top.Ext.Msg.alert('提示', "请选择一条要修改的数据");
				   return ;
			}else {
				   var title="修改";
			           var url ="/shmis/background/rolemanager/u/role"; 
		  	}
		}
		var checkedId = new Array();
		var MyWindow = new top.Ext.Window({
					title:title,
					width:400,
					height:320,
					autoDestroy:true,
					hideBorders:false,
					autoScroll:false,
					modal:true,
					items:[
						{
							id:"role",
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
										 var addform = top.Ext.getCmp("role");
										 if (addform.getForm().isValid()) {
											 console.log(addform.getForm);
											  addform.getForm().submit({
													url : url,
													method : 'post',
												    params:{
												    	 checkedId: checkedId
												    },
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
								{	id:'id',
									xtype:"textfield",
									name:"id",
									fieldLabel:"用户主键",
									anchor:"100%",
									hidden:true,
									value:record ? record.get("id") : ''
								},
								{	id:"name",
									xtype:"textfield",
									name:"name",
									fieldLabel:"角色名称",
									anchor:"100%",
									disabled:true,
									value:record ? record.get("name") : ''
								},
								{
									id:"description",
									xtype:"textfield",
									name:"description",
									fieldLabel:"角色名称描述",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("description") : ''
								},
								{
									xtype:'treepanel',
									name:'treepanel',
									title: '分配功能菜单',
								    height: 180,
								    width: 390,
								    useArrows:true,
								    autoScroll:true,
								    animate:true,
								    enableDD:true,
								    containerScroll: true,
								    rootVisible: false,
								    frame: true,
								    root: {
								         nodeType: 'async'
								    },
								    dataUrl:'/shmis/background/menumanager/data/menus/array',
								    listeners: {
							            'checkchange': function(node, checked){
							                if(checked){
							                	checkedId.push(node.id);
							                	console.log(checkedId);
							                }else{
							                    for(i=0 ; i < checkedId.length; i++) {
							                    	if (checkedId[i] == node.id) {
							                    		checkedId.splice(i,1);
							                    		console.log(checkedId);
							                    	}
							                    } 
							                }
							            }
							        }
								}
							]
						}
					]
				})
			 
		      MyWindow.show(); 
	              if(type==0){
	            	  top.Ext.getCmp("name").enable();
	              }

			 
		 }	
		

})

</script>
</head>

<body>


</body>
</html>