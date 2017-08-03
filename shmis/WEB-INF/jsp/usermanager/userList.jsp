 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>t3</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/ext-all.css" />
<script type="text/javascript" src="${ctx}/js/ext3/ext-base.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ext-all.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ux/TabCloseMenu.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/layouts/m-component.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ext-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/js/definite/mycomponent.js"></script>

<script type="text/javascript">
Ext.onReady(function(){
	var gridstore;
	Ext.onReady(function(){
		 gridstore = new Ext.data.JsonStore( {
				root : 'root',
				totalProperty : 'results',
				idProperty : 'id',
				fields : [ 'id','createByTime','modifiedByTime','deletedbyTime','name','passwd','email',
				           'phone','department',{name:'role', type: 'object'}],
				// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
				proxy : new Ext.data.HttpProxy({
					url : '/shmis/background/usermanager/data/users'
				})
			});
			var sm = new Ext.grid.CheckboxSelectionModel({
				handleMouseDown:Ext.emptyFn
			});
			var MyViewport = new Ext.Viewport({
				layout:"fit",
				items : [ {
					id:"usersgrid",
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
						header : "用户名",
						sortable : true,
						resizable : true,
						dataIndex : "name",
						width : 100
						},
					      {
						header : "邮箱",
						sortable : true,
						resizable : true,
						dataIndex : "email",
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
							header : "部门",
							sortable : true,
							resizable : true,
							dataIndex : "department",
							width : 100
							}
							,
						    {
							header : "密码",
							sortable : true,
							resizable : true,
							dataIndex : "passwd",
							width : 100
							},
						    {
							header : "角色名",
							sortable : true,
							resizable : true,
							dataIndex : "role",
							width : 100,
							renderer: function(v){
								if (v != null) {
									return v.name;
								} else {
									return '';
								}
							}
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
							       var rs=Ext.getCmp("usersgrid").getSelectionModel().getSelections();
					                       if(rs==null||rs.length!=1){
					                    	   top.Ext.Msg.alert('提示', "请选择一条要删除的数据");
					                       }else{
					                    	   Ext.MessageBox.confirm("确认","确认要删除吗",function(btn){    
		                    	          		
				                               if(btn=="yes"){
					                               	 Ext.Ajax.request({
				             			  	    url:'/shmis/background/usermanager/d/'+rs[0].json.id,
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

			gridstore.load({
			callback:function(){
					console.log(gridstore);
				}
			});

			
		});
	//获取角色数据
	var rstore = new Ext.data.JsonStore( {
        root : 'root',
        totalProperty : 'results',
        idProperty : 'id',
        fields : [ 'id','name'],
        // 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
        proxy : new Ext.data.HttpProxy({
            url : '/shmis/background/rolemanager/data/roles',
            method: 'GET'
        })
    });
	
	
		
	function addorupdate(type){   //0为新增，1为修改
		var record = null;
		var title = "";
		var url = "";
		
		if(type==0){
	        	title = "新增";
	        	url = "/shmis/background/usermanager/c/user"; 
		}else{
			record = (function() {
				 return Ext.getCmp("usersgrid").getSelectionModel().getSelected();
			})();
			console.log("record=" + record);
			if(record == null ){
				   top.Ext.Msg.alert('提示', "请选择一条要修改的数据");
				   return ;
			}else {
				   var title="修改";
			           var url ="/shmis/background/usermanager/u/user"; 
		  	}
		}
		
		var LocalMyWindow = new Ext.Window({
					title:title,
					width:400,
					height:230,
					autoDestroy:true,
					hideBorders:false,
					autoScroll:false,
					modal:true,
					items:[
						{
							id:"user",
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
										 var addform = Ext.getCmp("user");
										 if (addform.getForm().isValid()) {
											  addform.getForm().submit({
													url : url,
													method : 'post',
													waitTitle : "请稍候",
													waitMsg : "正在提交表单数据，请稍候。。。。。。",
													success : function(form, action) {
														var isSuccess = action.result.success;
														top.Ext.Msg.alert('提示');
														LocalMyWindow.destroy();
														gridstore.reload();
													},
													failure : function(form, action) {
														top.Ext.Msg.alert('错误');
														LocalMyWindow.destroy();
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
									   LocalMyWindow.destroy();
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
									fieldLabel:"用户名",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("name") : ''
								},
								{
									id:"email",
									xtype:"textfield",
									name:"email",
									fieldLabel:"email",
									anchor:"100%",
// 									disabled:true,
									value:record ? record.get("email") : ''
								},
								{	id:'passwd',
									xtype:"textfield",
									name:"passwd",
									fieldLabel:"密码",
									anchor:"100%",
									value:record ? record.json.passwd: ''
								},
								{	id:'department',
									xtype:"textfield",
									name:"department",
									fieldLabel:"部门",
									anchor:"100%",
									value:record ? record.get("department"): ''
								},
								{	id:'phone',
									xtype:"textfield",
									name:"phone",
									fieldLabel:"联系方式",
									anchor:"100%",
									value:record ? record.get("phone"): ''
								},
								{
                                    xtype:'combo',
                                    fieldLabel:'用户角色',
                                    hiddenName:'roleid',
                                    store:rstore,
                                    valueField:'id',
                                    displayField:'name',
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
				});
		
		      LocalMyWindow.show(); 
			 
	              if(type==0){
	            	  top.Ext.getCmp("name").enable();
	              }
	              if(type==1){
	            		  console.log(record.get("role"));
	            	  if(record && record.get("role")){
	            		  console.log("=================");
		            	  Ext.getCmp("roleid").setValue(record.get("role").name);
	            	  } else {
	            		  Ext.getCmp("role").setValue();
	            	  }
	            	  
	              }

			 
		 }	
		

})


</script>
</head>

<body>


</body>
</html>