<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">

  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
<link href="${root }/univers/main.3f6952e4.css" rel="stylesheet">
<style type="text/css">
#toTop{
position:fixed; 
bottom:1px; 
right:1px; 
cursor:pointer; 
border-radius:5px; 
-moz-border-radius:5px; 
-webkit-border-radius:5px; 
padding:15px}


</style>
</head>
<body class="minimal">
<div id="site-border-left"></div>
<div id="site-border-right"></div>
<div id="site-border-top"></div>
<div id="site-border-bottom"></div>

<tiles:insertAttribute name="header"/>
<div class="container">


<div style="padding-top: 100px;">
<tiles:insertAttribute name="body"/>

</div>
</div>
<tiles:insertAttribute name="footer"/>
<script type="text/javascript" src="${root }/univers/main.70a66962.js"></script>

<a class="btn btn-default btn-md" id="toTop" href="#">TOP</a>


</body>
</html>