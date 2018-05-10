<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 게시판</title>
<script type="text/javascript">



</script>
</head>
<body>

<div class="container-fluid">
<h2 class="main"><span class="glyphicon glyphicon-th-list"></span>MongchongE List</h2>

 <div class="search">
 <form action="${root }/bbs/list" method = "post">
 <select name="col">
 	<option value="wname"
 	
 	<c:if test="${col=='wname' }">selected</c:if>
 	>이름</option>
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
<button type="button" onclick="location.href='${root}/bbs/createForm'">regit</button>
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
    <td>${dto.bbsno }</td>
    <td>${dto.wname }</td>
    <td>
<c:if test="${dto.indent>0 }">
<c:forEach begin="1" end="${dto.indent }">
[re]
</c:forEach>
    <img src="${root}/images/re.png" height="50%">

</c:if>

<a href="javascript:read('${dto.bbsno }')">   ${dto.title }   </a>
<c:if test="${util:newimg(dto.wdate) }">
		<img src="${root }/images/new.gif">
</c:if>
<c:set var="rcount" value="${util:rcount(dto.bbsno,rdao) }"/>
<c:if test="${rcount>0 }">
<span style="color:blue">[${rcount }]</span>
</c:if>
    </td>
    <td>${dto.wdate }</td>
    <td>${dto.viewcnt }</td>
    <td>
<c:if test="${not empty dto.filename }">
<a href="javascript:fileDown('${dto.filename }')">${dto.filename }</a>
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