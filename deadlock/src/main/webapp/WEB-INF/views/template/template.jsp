<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body class="minimal">

<%-- <jsp:include page="top.jsp" flush="false"></jsp:include> --%>
<!-- <div style="padding-top: 50px"> -->
<%-- <jsp:include page="../home.jsp" ></jsp:include> --%>
<!-- </div> -->

<tiles:insertAttribute name="header"/>
<div style="padding-top: 100px">
<tiles:insertAttribute name="body"/>
</div>
<tiles:insertAttribute name="footer"/>

</body>
</html>