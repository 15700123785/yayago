<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>自助机管理系统后台登录界面</title>
<style>
body,html{
	height:100%;
	width:100%;}
*{
	font-family:"微软雅黑";
	margin:0;
	padding:0;
	}
.main{
	width:100%;
	height:100%;}
.main div.login_bt,.main div.login_form{
	width:100%;
	height:48%;
	min-height:260px;
	margin:0;
	padding:0;}
.main div.login_bt{
	position:relative;}
.main div.login_bt .logo{
	width:125px;
	height:125px;
	position:absolute;
	top:50%;
	left:50%;
	margin-top:-62.5px;
	margin-left:-62.5px;}	
.main div.login_bt .xt_name{
	position:absolute;
	bottom:0;
	width:100%;
	height:50px;
	background:#7a2626;
	text-align:center;}	
.main div.login_bt .xt_name h1{
	color:#fff;
	font-size:36px;
	height:45px;
	line-height:45px;
	font-weight:bold;
	} 
.login_form form{
	width:300px;
	height:auto;
	margin:0 auto;
	margin-top:20px;}	
.login_form p{
	height:35px;
	margin-top:20px;
	overflow:hidden;
	clear:both;}
.login_form p span{
	display:inline-block;
	text-align:right;
	width:80px;
	color:#333;}
.login_form p .t1{
	width:198px;
	height:33px;
	line-height:33px;
	border:1px #aaa solid;}
.login_form p.but{
	margin-top:30px;
	text-align:center;}
.login_form p.but .btn{
	height:35px;
	line-height:35px;
	color:#fff;
	background:#7a2626;
	border:0;
	width:120px;}
</style>
</head>

<body>
<div class="main">
<div class="login_bt">
<div class="logo"><img src="${ctx}/images/logo.png" /></div>
<div class="xt_name"><h1>自助机管理系统后台</h1></div>
</div>
<div class="login_form">
<form:form commandName="loginedUser">
<p><span>用户名：</span><input type="text"  name="name"class="t1" /></p>
<p><span>密码：</span><input type="password" name="passwd" class="t1" /></p>
<p class="but"><input type="submit" value="登录" class="btn" /></p>


</form:form>
</div>


</div>
</body>
</html>
