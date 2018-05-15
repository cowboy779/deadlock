<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function oneclick(wh){
	var url = "${root}/rbbs/"+wh;
	url += "?rnum=${rnum}";
	
	
	location.href = url;
}
</script>
 <link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">
</head>
<body>
		<table width="699" border="1" cellspacing="0" cellpadding="0">
			<tr>
				<td>제목</td>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<td>날짜</td>
				<td>${dto.rdate }</td>
			</tr>

			<tr>
				<td>분류</td>
				<td>건의</td>
			</tr>
			<tr id="impo" style="visibility: visible;">
				<td>중요도</td>
				<td>${dto.imp }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${dto.content }</td>
			</tr>

		</table>
		<br>
		<div id="button">
		<a type="button" onclick="javascript:oneclick('list')" >리스트로</a>
		<input type="button" onclick="oneclick('reply')" value="답변">
		<input type="button" onclick="oneclick('update')" value="수정">
		<form action="javascript:oneclick('delete')">
		<input type="submit" value="삭제">
		<input type="hidden" name="oldfile" value="${dto.fname }">
		</form>
		</div>

</body>
</html>