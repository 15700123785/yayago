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

Ext.onReady(function(){
	var gridstore;
	Ext.onReady(function(){
		 gridstore = new Ext.data.JsonStore( {
				root : 'root',
				totalProperty : 'results',
				idProperty : 'id',
				fields : [ 'id','code','purposeName','printCount','sumtmp','privnt_rate','privnt_rate_s'],
				// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
				proxy : new Ext.data.HttpProxy({
					url : '/shmis/background/statmanager/data/stats'
				})
			});
	
			var MyViewport = new Ext.data.GridPanel({
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
						/*
						,{
						header : "所占比率",
						sortable : true,
						resizable : true,
						dataIndex : "privnt_rate_s",
						width : 200
						}*/
						],

					tbar : [],
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
			 var fieldDate = new Ext.form.DateField({

			        fieldLabel:'日期',

			        emptyText:'请选择',

			        format:'Y-m-d',

			        disabledDays:[0,6] //禁止选择的日期

			    }); 
		
			gridstore.load();
			

			
		})		

})

</script>
</head>

<body>
<input id="inputSearch" > </input>
<button id="buttonSearch" width:"100" height:"50" > </button>
</body>
<a>test</a>
</html>