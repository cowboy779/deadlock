<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body class="minimal">

<tiles:insertAttribute name="header"/>
<div style="padding-top: 100px">
<tiles:insertAttribute name="body"/>

</div>
<tiles:insertAttribute name="footer"/>

</body>
</html>