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
// 		var UserType = Ext.data.Record.create([
// 		    {name:'id',type:'string'},
// 		    {name:'createByTime',type:'string'},
// 		    {name:'modifiedByTime',type:'string'},
// 		    {name:'deletedbyTime',type:'string'},
// 		    {name:'name',type:'string'},
// 		    {name:'passwd',type:'string'},
// 		    {name:'email',type:'string'},
// 		    {name:'phone',type:'string'},
// 		    {name:'role',type:'string'}
// 		]);
// 		var xx = new UserType({
// 			id:1,
// 			date:'1989sdf'
// 		}); 
// 		alert(xx.get('date'));
		
// 		var store = new Ext.data.JsonStore({
// 		    // store configs
// 		    	root : 'data',
// 			totalProperty : 'results',
// 			idProperty : 'id',
// 			remoteSort : true,
// 			fields: ['id', 'createByTime','modifiedByTime','deletedbyTime','name','passwd', 'email','phone','role'],
// 			// 因为跨域，所以使用ScriptTagProxy，在同一个域里边用HttpProxy
// 			proxy : new Ext.data.HttpProxy({
// 				url : '/shmis/background/usermanager/data/users'
// 			})
// 		 });
		
// 		store.load();
// 		alert(store.getCount());
		//远程版
		var store =  new Ext.data.JsonStore({
			root:'data',
			totalProperty:'results',
			idProperty:'name',
			fields:['name','sex'],
			proxy: new Ext.data.HttpProxy({
				url:'/shmis/background/usermanager/data/users-test'
			})
		});
		store.load({
		     	callback: function(records) {
		     		alert(records[0].get('name'));
		     		
		     	}
		});
		alert(store.getCount());
		
		
// 		//本地版 无法加载到里面的数据
// 		var data = [{'name':'周星星','sex':'男'},{'name':'周星星','sex':'男'},{'name':'周星星','sex':'男'}];
// 		var UserType = Ext.data.Record.create([
// 		                             {name:'name',type:'string'},
// 		                             {name:'sex',type:'string'}
// 		                                       ]);
// 		var store = new Ext.data.Store({
// 			proxy: new Ext.data.MemoryProxy(data),
// 			reader:new Ext.data.ArrayReader({},UserType)
// 		});
// 		store.load();
// 		alert(store.getAt(0).get('name'));	
// 		store.each(function(record){
// 			alert(record.get('name'));
// 		}); 	
	})
</script>
</head>

<body>
</body>
</html>