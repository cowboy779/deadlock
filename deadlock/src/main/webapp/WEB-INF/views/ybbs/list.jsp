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
	url += "&dir=/storage_y";
	
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

function ycreate(){
	if(${empty sessionScope.id}){
		if(confirm("로그인 후 이용해주세요.")){
			location.href="${root}/member/loginForm";
		}
	}else{
		location.href="create";
	}
}
</script>

</head> 

<body>
<br>
<div class="w3-container" style="width:60%; margin:0 auto;">
<div style="text-align: left;"> 
	<h1 class="h2" ><span class="glyphicon glyphicon-th-list"></span>05 : 자유 게시판</h1>
</div>
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
  </TABLE>
</div>
<br>

<!-- 검색 -->  
<div class="template-example" >
<div class=" form-group ">
	<form method="post" action='list'>
	<table style=" margin:0 auto;">
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
			<button type="button" class="btn btn-default btn-sm" style="font-size:small;" onclick="ycreate()">regit</button>
		</td>
	</tr>

	</table>
	</form>
</div>
</div>

<!-- 검색 끝 --> 
  <br>
  <DIV class='w3-center'>
   ${paging }
  </DIV>
<br>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
