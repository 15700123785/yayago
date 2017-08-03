<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>打印统计</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/ext-all.css" />
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
var searchTbar; 

Ext.onReady(function(){
	var gridstore;
	var gridstore1;
	
	Ext.onReady(function(){
		 gridstore = new Ext.data.JsonStore( {
				root : 'root',
				totalProperty : 'results',
				idProperty : 'id',
				fields : [ 'id','code','purposeName','printCount','sumtmp','privnt_rate','privnt_rate_s'],
				// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
				proxy : new Ext.data.HttpProxy({
					url : '/shmis/background/statClsfmanager/data/statClsfs'
				})
			});
		 
// 		 gridstore1 = new Ext.data.JsonStore( {
// 				root : 'root',
// 				totalProperty : 'results',
// 				idProperty : 'id',
// 				fields : [ 'id','code','purposeName','printCount','sumtmp','privnt_rate','privnt_rate_s'],
// 				// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
// 				proxy : new Ext.data.HttpProxy({
// 					url : '/shmis/background/statQuerymanager/data/stats?beginDate=1&endDate=2'
// 				})
// 			});
		 
		 /* searchTbar = new Ext.Toolbar({  
             items:[  
                 new Ext.Toolbar.TextItem('选择时间：'),  
                 {  
                      id:'cust_time',  
                      xtype:'combo',  
                      name:'cust_time',  
                      width:100,  
                      mode:'local',  
                      store: gridstore,  
                      hideLabel:true,  
                      valueField: 'id',  
                      triggerAction:"all",  
                      displayField: 'displayText',  
                      emptyText: '请选择...'  
                 },                    
                 {     
                     text:' 查询',tooltip:"查询",iconCls:'queryIcon',handler:function()  
                     {     
                         btnSearchClick();  
                     }  
                 }  
             ]  
         });  */
         
         var now = new Date();
         var deft = now.getYear()+1900+"-"+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate();

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
					columns : [
					      new Ext.grid.RowNumberer(),
					      {
						header : "自助机编号",
						sortable : true,
						resizable : true,
						dataIndex : "code",
						width : 100
						},{
						header : "用途名称",
						sortable : true,
						resizable : true,
						dataIndex : "purposeName",
						width : 200
						},{
						header : "打印次数",
						sortable : true,
						resizable : true,
						dataIndex : "printCount",
						width : 100
						},{
						header : "打印总数",
						sortable : true,
						resizable : true,
						dataIndex : "sumtmp",
						width : 100
						}
						//纸张数量百分比
						//
						//,{
						//header : "所占比率",
						//sortable : true,
						//resizable : true,
						//dataIndex : "privnt_rate_s",
						//width : 200
						//}
						],

 					tbar : [
			        '开始日期',
			        {
			        	id:"beginid",
			        	xtype:'datefield',
						format:'Y-m-d',
			            name     : 'field1',
			            value: new Date().add(Date.DAY, -7)
			        },
			        '结束日期',
			        {
			        	id:"endid",
			        	xtype:'datefield',
						format:'Y-m-d',
			            name     : 'field2',
			           value: new Date()
			        },
			        {
			            // xtype: 'button', // default for Toolbars
			            text: '查询',
			            x: 500,
			            y: 200,
			            handler:function()  
	                     {     
	                         btnSearchClick();  
	                     }  
			        }
			       
			        ],
					
					// 分页
					bbar : new Ext.PagingToolbar( {
						pageSize : 100,
						store : gridstore,
						displayInfo : true
					})
				},{  
					region:"east",  //设置位置  
					height:100,  
					title:"east",  
					collapsible:true   //是不是可以折叠  
					} ]
			})
			
		
		//	gridstore.load();
			

			
		})		

})



 function btnSearchClick(){  
	var gridstore;
	
	
	 if(Ext.getCmp("beginid").getRawValue().trim().length == 0)  
     {  
         Ext.MessageBox.alert("提示","请输入开始日期。");  
     }else if(Ext.getCmp("endid").getRawValue().trim().length == 0)  
     {  
         Ext.MessageBox.alert("提示","请输入结束日期。");  
     } 
     
     var beginDate = Ext.getCmp("beginid").getRawValue();
     var endDate = Ext.getCmp("endid").getRawValue();
     
	gridstore = new Ext.data.JsonStore( {
		root : 'root',
		totalProperty : 'results',
		idProperty : 'id',
		fields : [ 'id','code','purposeName','printCount','sumtmp','privnt_rate','privnt_rate_s'],
		// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
		proxy : new Ext.data.HttpProxy({
			url : '/shmis/background/statClsfQuerymanager/data/statClsfs?beginDate='+beginDate+'&endDate='+endDate
		})
	});
	
	
	
	var MyViewport = new Ext.Viewport({
		layout:"fit",
		
		items : [ {
			 
			id:"rolesgrid",
			xtype : "grid",
			title : "",
			store : gridstore,
//				height:Ext.getBody().getHeight(),
//// 					height:500,
//				autoHeight : true,
			columns : [
			      new Ext.grid.RowNumberer(),
			      {
				header : "自助机编号",
				sortable : true,
				resizable : true,
				dataIndex : "code",
				width : 100
				},{
				header : "用途名称",
				sortable : true,
				resizable : true,
				dataIndex : "purposeName",
				width : 200
				},{
				header : "打印次数",
				sortable : true,
				resizable : true,
				dataIndex : "printCount",
				width : 100
				},{
				header : "打印总数",
				sortable : true,
				resizable : true,
				dataIndex : "sumtmp",
				width : 100
				}
				//纸张数量百分比
				//
				//,{
				//header : "所占比率",
				//sortable : true,
				//resizable : true,
				//dataIndex : "privnt_rate_s",
				//width : 200
				//}
				],

				tbar : [
	        '开始日期',
	        {
	        	id:"beginid",
	        	xtype:'datefield',
				format:'Y-m-d',
	            name     : 'field1',
	            value: Ext.getCmp("beginid").getRawValue()
	        },
	        '结束日期',
	        {
	        	id:"endid",
	        	xtype:'datefield',
				format:'Y-m-d',
				name     : 'field2',
		        value: Ext.getCmp("endid").getRawValue()
	        },
	        {
	            // xtype: 'button', // default for Toolbars
	            text: '查询',
	            x: 500,
	            y: 200,
	            handler:function()  
                 {     
                     btnSearchClick();  
                 }  
	        },
	       
//		        // add a vertical separator bar between toolbar items
//		        '-', // same as {xtype: 'tbseparator'} to create Ext.toolbar.Separator
//		        'text 1', // same as {xtype: 'tbtext', text: 'text1'} to create Ext.toolbar.TextItem
//		        { xtype: 'tbspacer' },// same as ' ' to create Ext.toolbar.Spacer
//		        'text 2',
//		        { xtype: 'tbspacer', width: 50 }, // add a 50px space
//		        'text 3'
	        ],
			
			// 分页
			bbar : new Ext.PagingToolbar( {
				pageSize : 100,
				store : gridstore,
				displayInfo : true
			})
		} ]
	})
	

     gridstore.load();
             
        }  
</script>
</head>

<body>
</html>