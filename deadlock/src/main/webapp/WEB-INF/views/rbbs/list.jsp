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
	var url = "${root}/rbbs/read"
	url += "?rnum="+rnum;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}"
	
	location.href = url;
}
</script>
</head>
<body>

<div class="container-fluid">
<h2 class="main"><span class="glyphicon glyphicon-th-list"></span>MongchongE List</h2>

 <div class="search">
 <form action="${root }/rbbs/list" method = "post">
 <select name="col">
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
<input type="search" name = "word" value="${word }" required>
<button>search</button>
<button type="button" onclick="location.href='${root}/rbbs/create'">regit</button>
</form>
 </div>
<br>
<TABLE class="table table-hover">
<thead>
    <TR>
      <TH>Number</TH>
      <th>Name</Th>
      <th>Title</th>
      <th>Date</th>
      <th>View</th>
      <th>file</th>

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
    <img src="${root}/images/re.png" height="50%">

</c:if>

<a href="javascript:read('${dto.rnum }')">   ${dto.title }   </a>
<c:if test="${util:newimg(dto.rdate) }">
		<img src="${root }/images/new.gif">
</c:if>
    </td>
    <td>${dto.rdate }</td>
    <td>${dto.rcount}</td>
    <td>
<c:if test="${not empty dto.fname }">
${dto.fname }
</c:if>
	</td>
    </tr>
    </tbody>
</c:forEach>
</c:otherwise>
</c:choose>


</TABLE>
  
  <DIV class='bottom'>
    
    ${paging }

  </DIV>
</div>

</body>
</html>