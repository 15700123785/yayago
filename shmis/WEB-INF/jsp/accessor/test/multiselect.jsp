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
<script type="text/javascript" src="${ctx}/js/definite/my-component.js"></script>

<script type="text/javascript">
	
Ext.onReady(function () {   
//     var m = new Ext.MyViewport({});  //Ext.MyGrid这里的名字是Ext Designer 中GRID的名字  
    var rolem = new Ext.RoleField({});
    rolem.render(Ext.getBody());
//      m.render(Ext.getBody());  
 });
</script>
</head>
<body>
	<script type="text/javascript" src="${ctx}/js/test.js"></script>
</body></html>
