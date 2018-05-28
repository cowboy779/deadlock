<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html>
<head>


</head>

<body>




<div style="position: fixed; bottom: 5px; right: 5px;">
<form action="${root}/game/
<c:if test="${empty param.next }">
${2}
</c:if>
<c:if test="${not empty param.next }">
${param.next}
</c:if>
" method="get" >
<a href="#header">
<h5>위로가기</h5></a>
<input name="ans" type="text" height="20">
<input type='hidden' name="next" value='${param.next+1}'>
<button onclick="submit">정답!</button>
</form>
</div>

<div style="position: fixed; bottom: 5px; left: 5px;">
<input type='button' value="게임 나가기" onclick="location.href='${root}/template/bbslist'">
</div>



</body>
</html>

