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

<script type="text/javascript">
	
	Ext.onReady(function() {
	
// 		 var treePanel = new Ext.tree.TreePanel({
// 		    	id: 'tree-panel',
// 		    	renderTo: 'tree-div',
// 		    	title: '功能菜单',
// 		        region:'north',
// 		        split: true,
// 		        height: 300,
// 		        minSize: 150,
// 		        autoScroll: true,
		        
// 		        // tree-specific configs:
// 		        rootVisible: false,
// 		        lines: false,
// 		        singleExpand: true,
// 		        useArrows: true,
		        
// 		        loader: new Ext.tree.TreeLoader({
// 		        	dataUrl:'/shmis/json/tree-data.json',
// 		        	requestMethod:'get'
// 		        }),
		        
// 		        root: new Ext.tree.AsyncTreeNode()
// 		    });

 var tabpanel = new Ext.Panel({
	renderTo:"tree-div", 
	xtype:"panel",
	title:"",
	width:588,
	height:381,
	initComponent: function(){
		this.tbar=[
			{
				text:"新增"
			},
			{
				text:"编辑"
			},
			{
				text:"删除"
			}
		]
		this.items=[
			{
				xtype:"grid",
				title:"",
				columns:[
					{
						header:"Column 1",
						sortable:true,
						resizable:true,
						dataIndex:"data1",
						width:100
					},
					{
						header:"Column 2",
						sortable:true,
						resizable:true,
						dataIndex:"data2",
						width:100
					},
					{
						header:"Column 3",
						sortable:true,
						resizable:true,
						dataIndex:"data3",
						width:100
					},
					{
						header:"column",
						sortable:true,
						resizable:true,
						dataIndex:"",
						width:100
					},
					{
						header:"column",
						sortable:true,
						resizable:true,
						dataIndex:"",
						width:100
					}
				]
			}
		]
	}
});
	});
</script>
</head>

<body>
	<div id="toolbar"></div>
	<div id="tree-div"></div>
	<div id="tree-div1"></div>
</body>
</html>