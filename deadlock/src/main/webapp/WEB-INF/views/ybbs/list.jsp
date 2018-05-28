<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title> 

<script type="text/javascript">


function fileDown(filename){
	var url = "${root}/download";
	url += "?filename="+filename;
	url += "&dir=/ynum/storage";
	
	location.href=url;
}

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
/* *{  */
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/* }  */
/* .search{ */
/* 	width:80%; */
/* 	margin:2px auto; */
/* 	text-align: center; */
/* } */
</style> 
</head> 

<body>
<br>
<div style="width:60%; align:center; margin: 0 auto;"> 
<h1 class="h2" ><span class="glyphicon glyphicon-th-list"></span>02 : 자유 게시판</h1>
<br><br>

  <TABLE class="table table-hover">
    <tr>
      <TH style="width:12% ;">Number</TH>
      <TH style="width:16% ;">ID</TH>
      <TH style="width:29% ;">Title</TH>
      <th style="width:20% ;">Date</th>
      <th style="width:10% ;">View</th>
      <th style="width:13% ;">File</th>
     
	</tr>

	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="6" style="text-align:center">등록된 글이 없습니다.</td>
			</tr>
		</c:when>
		
		<c:otherwise>
			<c:forEach var="dto" items="${list}">
		    <tr>
		    	<td style="text-align: center;">${dto.ynum}</td>
		    	<td>${dto.id }</td>
		    	<td>
		    		<a href ="javascript:read('${dto.ynum}')">${dto.title}</a>
		    	</td>  	
<%--  				<c:set var = "rcount" value="${util:rcount(dto.ynum,rdao) }"></c:set> --%>
<%--     			<c:if test="${rcount>0 }"> --%>
<%--     			<span style="color:red">(${rcount})</span> --%>
<%--   				</c:if> --%>
 					
		    	<td>${dto.ydate}</td>
		    	<td style="text-align: center;">${dto.ycount}</td>
		    	<td>
			    	<c:choose>
				    	<c:when test="${empty dto.fname }">
				    		파일 없음
				    	</c:when>
				    	<c:otherwise>
				    		<a href="javascript:fileDown('${dto.fname}')">${dto.fname}</a>
				    	</c:otherwise>
			    	</c:choose>
		    	</td>
		   		</tr>
		   	</c:forEach>
		 </c:otherwise>
	</c:choose>
    </tbody>
  </TABLE>
</div>
<br>

<!-- 검색 -->  

<form action="./list" method="post">
<table  style="width:35%; margin:0 auto;">
<tr>
	<td>
		<select class="form-control" name= "col" style="width:100px; height:33px;"><!-- 검색할 컬럼 -->
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
	</td>
	<td>
		<input class="form-control" type="search" name="word" value="${word}" style="width:300px; height:33px;"  required>
	</td>
	<td>
		&nbsp;
		<button type="submit" class="btn btn-default btn-sm" style="font-size:small;">search</button>
		<button type="button" class="btn btn-default btn-sm" style="font-size:small;" onclick="location.href='./create'">regit</button>
	</td>
</tr>

</table>
</form>
<!-- 검색 끝 --> 
  <br><br>
  <DIV class='w3-center'>
   ${paging }
  </DIV>
<br>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
