<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
function clist(){
	var url="./list";
	
	location.href=url;
	
}
</script>

</head>
<body>

<DIV class="content">
	<c:choose>
	  <c:when test="${flag}">
	      게시물 등록완료
	  </c:when>
	  <c:otherwise>
	    글 등록에 실패하였습니다.
	  </c:otherwise>
	</c:choose>

</DIV>

<DIV class='bottom'>
	<input type='button' value='목록' onclick="clist()">
</DIV>

</body>
</html>