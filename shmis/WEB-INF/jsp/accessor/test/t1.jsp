<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>t1</title>

<link rel="stylesheet" type="text/css" href="${ctx}/css/ext-all.css" />
<script type="text/javascript" src="${ctx}/js/ext3/ext-base.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ext-all.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3/ui/TabCloseMenu.js"></script>

<script type="text/javascript">	
Ext.onReady(function(){
	var MyViewport1=new Ext.Viewport({
		layout:"border",
		items:[
			{
				title:"",
				region:"north",
				height:100,
				autoScroll:true,
				collapsible:true,
				html: '<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">'+
  				  '<tr><td width="254px" style="background:url(images/top_left.jpg)">&nbsp;</td>'+
  				  '<td style="background:#BFFAE6">&nbsp;</td>'+
  				  '<td width="544px" style="background:url(images/top_right.jpg)"><div id="clock" class="clock"></div></td>'+
  				  '</tr>'+
  				'</table>',
	            margins: '5 5 5 5'
			},
			{
				title:"菜单栏",
				region:"west",
				width:150,
				layout:"accordion",
				collapsible:true,
				id:"west-panel"
				
			},
			{
				title:"",
				region:"south",
				collapsible:true,
				height : 30,
				tbar : [{
							text : '退出系统',
							iconCls : 'btn-logout',
							handler : function() { 
					             window.location.href="admin/loginout.do";
							}
						},'-',{
							tag:'div',
							html:" 欢迎您！"
						}]
			},
			{
				xtype:"tabpanel",
				id:"centerTable",
				activeTab:0,    //默认打开第一个
  				region:"center",
				resizeTabs:true, // turn on tab resizing
		        minTabWidth: 115,
		        tabWidth:135,
		        width:600,
		        height:250,
				enableTabScroll:true,
				defaults: {autoScroll:true},
			    plugins: new Ext.ux.TabCloseMenu(),
				items:[
					{
						xtype:"panel",
						title:"分页1"
					}
				]
			}
		]
	})


	var buildTree = function(json) {
		return new Ext.tree.TreePanel({
					rootVisible : false,
					border : false,
					root : new Ext.tree.AsyncTreeNode({
									expanded : true,
									children : json.children
							}),
					listeners : {
						'click' : function(node,e) {
							if (Ext.isEmpty(node)) {
								return;
							}
							var url = node.attributes.url;
							 var centerTable = Ext.getCmp("centerTable");
							 if(!node.isLeaf()) return;
							 if(Ext.getCmp('center'+node.id)){
							 	Ext.getCmp('center'+node.id).show();
							 }else{
								 centerTable.add({
								 	 id:'center'+node.id,
					                 title: node.text,
					                 html:'<iframe style="width:100%;height:100%;border:0" frameborder="0" src="'+url+'"></iframe>',
					                 closable: true
								 }).show();

							 }
						}
					}
				});
	};
	Ext.Ajax.request({
		url : 'role/getMenu.do',
		success : function(resp,opts) {
			var json = Ext.util.JSON.decode(resp.responseText);
			var westPanel = Ext.getCmp("west-panel");
			
			Ext.each(json, function(el) {
					var elId = el.id+"";
					var text = el.text;
					var panel = new Ext.Panel({
								id :"id"+elId,
								title : text,
								layout : 'fit'
							});
					var treeNode = buildTree(el);
					panel.add(treeNode);
					westPanel.add(panel);
			});
			westPanel.doLayout();  
			
		},
		failure : function(request) {
			Ext.MessageBox.show({
						title : '操作提示',
						msg : "连接服务器失败",
						buttons : Ext.MessageBox.OK,
						icon : Ext.MessageBox.ERROR
					});
		},
		method : 'post'
	});

})
</script>
</head>

<body>
	
</body>
</html>