<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/ssi/ssi.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function list() {
	var url = "./list";
	url += "?col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	location.href = url;
}
function ndelete() {
	
	if(confirm("공지를 삭제하시겠습니까?")){
		var url =  "./delete";
		url += "?nnum=${dto.nnum}";
		location.href = url;
	}
}
function nupdate() {
	var passwd = prompt("비밀번호를 입력해 주세요.");
	var url =  "./update";
	url += "?nnum=${dto.nnum}";
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	url += "&passwd="+passwd;
	
	location.href = url;
}

window.onload = function(){
	var pwError = "${param.pwError}";
	if(pwError != ''){
		alert(pwError);	
	}
	
}
</script>
<style type="text/css">
Table{
/* 	border : 0.5px solid;
 */	font-size : 14px;
	
	width: 100%;
	max-width: 700px;
	margin: auto;
}
.content {
	padding-bottom: 10px;
	font-size: 12px;
	text-align: left;
}
.title {
	text-align: center;
	font-size: 14px;
	padding-bottom: 10px;
	
}
caption{
	font-size : 20px;
	text-align: left;
	padding-top: 50px;
}

.subject{
	text-align: left;
	padding-left: 10px;
}

BUTTON{
	text-align: right;
	
}
THEAD{
	font-size: 16px;
}
.rel{	
	position: relative;	
	text-align: center;
	width: 50%;
	margin: auto;
	padding-top: 50px;
	padding-bottom : 100px;
	
}
.ab{
	position : absolute;
	right: 10px;
	bottom : 40px;
}

.inde{
	font-size : 12px;
	text-align: right;
}

.edit {
	font-size : 12px;
	color : #bfbfbf;
	text-align: left;
}

</style>
</head>
<body>

	
<div class="rel">
<table>
	<caption>공지사항</caption>
	<thead>
		<tr class='title'>
			<th>${dto.title }</th>
		</tr>
		
		<c:if test="${grade=='A'}">
		<tr class='inde'>
			<td>
			<a href="javascript:nupdate()">수정</a>
			|
			<a href="javascript:ndelete()">삭제</a>
			</td>
		</tr>
		
		
		<tr>
		<td class='edit'>
		작성자 : ${dto.noname }  |  
		수정자 : ${dto.corname }  | 
		최종수정일 : ${dto.cordate }
		</td>
		</tr>
		</c:if>
		
		<tr class='content'>
			<td>
			${content }
			</td>
		</tr>
	</thead>
	<tbody>
	
	</tbody>
	
</table>
	<div class="ab">
	<button onclick="list()" >목록</button>
	</div>
</div>


</body>
</html>