<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form   name='frm'
		method='POST'
		action='chatCreateProc'>
		<input type="hidden" name="id" value="${sessionScope.id }"/>
<table style="margin: auto; width: 60%;" class="table table-hover">
	<tr>
		<th>방장 이름</th>
		<td><input type="text" name="chat_nickname" size="20" value="${chat_nickname}" readonly></td>
	</tr>
	<tr>
		<th>채팅방 제목</th>
		<td><input type="text" name="chat_title" size="20" required="required"></td>
	</tr>
</table>
	<div align="center">
	<button>채팅방 생성</button>
	</div>
</form>
	

</body>
</html>