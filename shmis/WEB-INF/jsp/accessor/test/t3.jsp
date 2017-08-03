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

<script type="text/javascript">	
Ext.onReady(function(){  
    	var toolbar = new Ext.Toolbar({
    	        renderTo:'toolbar', 
    	        width:1000,
    	        height:50,
    	        items: [
    	                {
    	                    // xtype: 'button', // default for Toolbars, same as 'tbbutton'
    	                    text: '新建',
    	                    handler: function() {
    	                    	
    	                    }
    	                },
    	                {
    	                    xtype: 'splitbutton', // same as 'tbsplitbutton'
    	                    text: 'Split Button'
    	                },
    	                // begin using the right-justified button container
    	                '->', // same as {xtype: 'tbfill'}, // Ext.Toolbar.Fill
    	                {
    	                    xtype: 'textfield',
    	                    name: 'field1',
    	                    emptyText: 'enter search term'
    	                },
    	                // add a vertical separator bar between toolbar items
    	                '-', // same as {xtype: 'tbseparator'} to create Ext.Toolbar.Separator
    	                'text 1', // same as {xtype: 'tbtext', text: 'text1'} to create Ext.Toolbar.TextItem
    	                {xtype: 'tbspacer'},// same as ' ' to create Ext.Toolbar.Spacer
    	                'text 2',
    	                {xtype: 'tbspacer', width: 50}, // add a 50px space
    	                'text 3'
    	            ]});       
    	var menu = new Ext.menu.Menu({
    		id:'mainMenu',
    		items:[
    		       {text:'新增'},
    		       {text:'保存'}
    		       ]
    	});
    	toolbar.add({
            text:'Button w/ Menu',
            menu: menu  // assign menu by instance
        });
    	///toolbar.disable(); //禁用工具栏
    	toolbar.doLayout();
});  
</script>
</head>

<body>
	<div id="toolbar"></div>
</body>
</html>