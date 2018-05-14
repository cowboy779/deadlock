<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function fileDown(filename){
	var url = "${root}/download";
	url += "?filename="+filename;
	url += "&dir=/ynum/storage";
	
	location.href=url;
}

// function bcreate(){
// 	var url = "./createForm";
// 	location.href=url;
// }
function read(ynum){
	var url = "./read";
	url += "?ynum="+ynum;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href=url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
.search{
	width:80%;
	margin:2px auto;
	text-align: center;
}
</style> 
</head> 

<body>

<div class="search">
<form action="./list" method="post">
<select name= "col"><!-- 검색할 컬럼 -->
	<option value="title" 
	<c:if test="${col=='title'}">
	selected</c:if>
	>제목</option>
	<option value="content"
	<c:if test="${col=='content'}">
	selected</c:if>
	>내용</option>
	<option value="total">전체출력</option>
</select>
<!-- 검색어 -->
<input type="search" name="word" value="${word}">
<button>검색</button>
<button type="button" onclick="location.href='./create'">등록</button>
</form>
</div> 

<div class="container-fluid">
<h2><span class="glyphicon glyphicon-th-list"></span>게시판 목록</h2>

  <TABLE class="table table-condensed">
  <thead>
    <tr>
      <TH>번호</TH>
      <TH>제목</TH>
      <TH>내용</TH>
      <th>등록날짜</th>
      <th>조회수</th>
      <th>id</th>
      <th>파일명</th>
	</tr>
	</tbody>

	<c:forEach var="dto" items="${list}">
	<tbody>
    <tr>
    	<td>${dto.ynum}</td>
    	<td>
    	<a href ="javascript:read('${dto.ynum}')">${dto.title}</a>
    	</td>
    	<td>${dto.content}</td>
    	<td>${dto.ydate}</td>
    	<td>${dto.ycount}</td>
    	<td>${dto.id }</td>
    	<td>
    	<c:choose>
    	<c:when test="${empty dto.fname }">${dto.fname}
    	</c:when>
    	<c:otherwise>
    	<a href="javascript:fileDown('${dto.fname}')">${dto.fname}</a>
    	</c:otherwise>
    	</c:choose>
 
    	</td>
   		</tr>
   		</c:forEach>
    </tbody>
  </TABLE>
  
  <DIV class='bottom'>
   ${paging }
  </DIV>
</div>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
