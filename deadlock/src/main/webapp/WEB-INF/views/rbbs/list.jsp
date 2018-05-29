<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 게시판</title>
<script type="text/javascript">
function bcreate(){
	var url = "/rbbs/create"
	location.href=url;
	
}
function read(rnum){
	if(${empty sessionScope.id}){
		alert("로그인을 해주세요");
		return;
	}else{
	
	
	var url = "${root}/rbbs/read"
	url += "?rnum="+rnum;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href = url;
	}
}
</script>

<link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">
</head>
<body>
<div class="container">
<div class="container-fluid" style="width:60%;">
<h1 class="h2"><span class="glyphicon glyphicon-th-li st"></span>01 : 건의하기</h1>

<TABLE class="table table-hover">
<thead>
    <TR>
      <TH>Number</TH>
      <th>ID</Th>
      <th>Title</th>
      <th>Date</th>
      <th>Class</th>

    </TR>
</thead>

<c:choose>
<c:when test="${empty list }">
    <tbody>
    <tr>
    <td colspan = "6"> No Title </td>
    </tr>
    </tbody>
</c:when>
<c:otherwise>
<c:forEach var="dto" items="${list }">
  <tbody>
    <tr>
    <td>${dto.rnum }</td>
    <td>${dto.id }</td>
    <td>
<c:if test="${dto.indent>0 }">
<c:forEach begin="1" end="${dto.indent }">
[re]
</c:forEach>
    <img src="${root}/univers/images/re.png" height="50%">

</c:if>

<a href="javascript:read('${dto.rnum }')">   ${dto.title }   </a>
<c:if test="${not empty dto.fname }">
		<img src="${root }/univers/images/file.gif">
</c:if>
<c:if test="${util:newimg(dto.rdate) }">
		<img src="${root }/univers/images/new.gif">
</c:if>
    </td>
    <td>${dto.rdate }</td>
    <td>${dto.imp }</td>

</tr>
</tbody>
</c:forEach>
</c:otherwise>
</c:choose>
<br>
<div class="template-example">
 <div class="form-group">
 <form action="${root }/rbbs/list" method = "post">
 <table style="margin:auto;">
 <tr>
 <td>
 <select name="col" class="form-control" style="width:100px;height:33px;">
 	<option value="id"
 	<c:if test="${col=='id' }">selected</c:if>
 	>ID</option>
 	<option value="title"
 	<c:if test="${col=='title' }">selected</c:if>
 	>제목</option>
 	<option value="content"
 	<c:if test="${col=='content' }">selected</c:if>
 	>내용</option>
 	<option value="total">전체출력</option>
 </select>
 </td>
 <td>
<input class="form-control" type="text" name="word" style="width:300px; height:33px;">
</td>
<td>
&nbsp;
<button type="submit" class="btn btn-default btn-sm">search</button>
<c:if test="${not empty sessionScope.id }">
<button type="button" onclick="location.href='${root}/rbbs/create'" class="btn btn-default btn-sm">regit</button>
</c:if>
</td>
</tr>
</table>
</form>
 </div>
 </div>

</TABLE>
  <br>
  <DIV class='bottom'>
    
    ${paging }

  </DIV>
  <br>
</div>
</div>
</body>
</html>