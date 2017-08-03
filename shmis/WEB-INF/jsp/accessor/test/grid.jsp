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
<script	type="text/javascript">
	Ext.onReady(function(){
// 		var cm = new Ext.grid.ColumnModel([
// 		                                   {header:'编号',dataIndex:'id'}
// 		                                   ]);
// 		var data = [
// 		            ['1']
// 		            ];
// 		var store = new Ext.data.Store({
// 			proxy: new Ext.data.MemoryProxy(data),
// 			reader:new Ext.data.ArrayReader({},[{name:'id'}])
// 		});
		
// 		var grid = new Ext.grid.GridPanel({
// 			renderTo:'grid',
// 			store:store,
// 			cm:cm
// 		});
		HZMOKO.createGrid();
	})
</script>
</head>

<body>
	<div id="my-grid"></div>
	
	<div id="tree-div"></div>
	<div id="tree-div1"></div>
	<div id="grid"></div>
</body>
</html>