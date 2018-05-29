<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function oneclick(wh){
	var url = "${root}/rbbs/"+wh;
	url += "?rnum=${rnum}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}
</script>
 <link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">
</head>
<body class="">
<div class="container" style="width:60%;">
<h2 class="h2"><span class="glyphicon glyphicon-th-list"></span>04 : 건의하기</h2>
		<table class="table table-bordered" >
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
				<td>건의
				<c:if test="${dto.imp == 'V' }">
				<img alt="" src="">호잇
				</c:if>
				</td>
			</tr>
			<tr id="impo" style="visibility: visible;">
				<td>아이디</td>
				<td>${dto.id }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${dto.content }</td>
			</tr>
			<tr>
				<td>파일</td>
				<td><a href="${root }/storage_rbbs/${dto.fname }" download>${dto.fname }</a></td>
			</tr>

		</table>
		
		<br>
		<div id="button">
		<form action="javascript:oneclick('delete')">
		<input class="btn btn-default btn-sm" type="button" onclick="oneclick('list')" value="list">
		<c:if test="${grade }">
		<input class="btn btn-default btn-sm" type="button" onclick="oneclick('reply')" value="reply">
		</c:if>
		<input class="btn btn-default btn-sm" type="button" onclick="oneclick('update')" value="modify">
		<c:if test="${dto.id == sessionScope.id || grade}">
		<input class="btn btn-default btn-sm" type="submit" value="delete">
		</c:if>
		<input type="hidden" name="oldfile" value="${dto.fname }">
		</form>
		</div>
</div>
<br><br>
</body>
</html>