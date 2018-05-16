<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${flag }">
		<script>
		location.href="${root}/qbbs/read?qnum=${qnum}&col=${col}&word=${word}&nowPage=${nowPage}";
		</script>
	</c:when>
	<c:otherwise>
		<script>
		alert("글 수정에 실패했습니다.");
		history.back();
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>