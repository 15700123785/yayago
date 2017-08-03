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
	 Ext.onReady(function(){    
	     Ext.QuickTips.init();    
	     Ext.form.Field.prototype.msgTarget="qtip";    
	     var loginform = new Ext.form.FormPanel({    
	         renderTo:'container',    
	         title:'用戶登陆',    
	         labelSeparator:":",    
	         collapsible :true,    
	         width:300,    
	         height:150,    
	         id:'login',    
	         labelWidth: 80,    
	         bodyStyle: 'padding:5px 5px 0 0',    
	         border: false,    
	         name:'login',    
	         frame:true,    
	         defaults:{width:178,xtype:'textfield'},    
	         items:[    
	             new Ext.form.TextField({    
	             frame:true,    
	             fieldLabel:"用户名",    
	             name:'userName',    
	             allowBlank:false,    
	             blankText:'用户名不能为空'    
	         }),{    
	             fieldLabel:"密码",    
	             name:'password',    
	             allowBlank:false,    
	             inputType:'password',    
	             blankText:'密码不能为空'    
	         }],   
	         keys:{    
	             key: 13,    
	             fn:login    
	         },    
	         buttons:[{    
	             text:'提 交',    
	             handler:login    
	         },{    
	            text:'重 置',  
	            handler:function reset(){    
	               loginform.form.reset();    
	            }    
	         }]    
	     });    
	     function login(){  
	        var form=Ext.getCmp("login").getForm();  
	        form.submit({  
	          //clientValidation: true,  
	          url:"/Env_1/BarCode/selectUser.action",  
	          params:{  
	            
	          },  
	          success: function(form, action) {  
	          Ext.Msg.alert('Success', "恭喜，登陆成功！");  
	              location.href = 'index.jsp';  
	          },  
	          failure: function(form, action) {  
	            switch (action.failureType) {  
	                case Ext.form.Action.CLIENT_INVALID:  
	                    Ext.Msg.alert('Failure', 'Form fields may not be submitted with invalid values');  
	                    break;  
	                case Ext.form.Action.CONNECT_FAILURE:  
	                    Ext.Msg.alert('Failure', 'Ajax communication failed');  
	                    break;  
	                case Ext.form.Action.SERVER_INVALID:  
	                   Ext.Msg.alert('Failure', "您的输入有误，请核实后重新输入");  
	                   loginform.form.reset();    
	            }  
	          });
	         
	        });  
	    
</script>
</head>

<body>
 <div id="outer" align="center">  
  <br><br><br><br><br><br><br><br>   
    <div id="container"></div>  
  </div>  
</body>
</html>