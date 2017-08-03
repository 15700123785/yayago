<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Feed Viewer 3</title>

    <link rel="stylesheet" type="text/css" href="${ctx}/css/ext-all.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/css/feed-viewer.css" />
	    
    <script type="text/javascript" src="${ctx}/js/ext3/ext-base.js"></script>
 	<script type="text/javascript" src="${ctx}/js/ext3/ext-all.js"></script>
    
<!--     <script type="text/javascript" src="../state/save-state.php"></script> -->
<!--     <script type="text/javascript" src="../state/get-state.php"></script> -->
<!--     <script type="text/javascript" src="../state/SessionProvider.js"></script> -->
<!--     <script type="text/javascript" src="../ux/TabCloseMenu.js"></script> -->
    <script type="text/javascript" src="${ctx}/js/accessor/FeedViewer.js"></script>
    <script type="text/javascript" src="${ctx}/js/accessor/FeedWindow.js"></script>
    <script type="text/javascript" src="${ctx}/js/accessor/FeedGrid.js"></script>
    <script type="text/javascript" src="${ctx}/js/accessor/MainPanel.js"></script>
    <script type="text/javascript" src="${ctx}/js/accessor/FeedPanel.js"></script>

</head>
<body>
<div id="header"><div style="float:right;margin:5px;" class="x-small-editor"></div></div>

<!-- Template used for Feed Items -->
<div id="preview-tpl" style="display:none;">
    <div class="post-data">
        <span class="post-date">{pubDate:date("M j, Y, g:i a")}</span>
        <h3 class="post-title">{title}</h3>
        <h4 class="post-author">by {author:defaultValue("Unknown")}</h4>
    </div>
    <div class="post-body">{content:this.getBody}</div>
</div>

</body>
</html>

