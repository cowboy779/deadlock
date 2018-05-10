<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 

<title></title> 
<style type="text/css"> 
.search{
	width:80%;
	margin:2px auto;
	text-align: center;
}
</style> 
<script type="text/javascript">
function create(){
	var url = "createForm";
	location.href=url;
}
function read(id){
	var url="${root}/member/read.jsp";
	url+="?id="+id;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	location.href=url;
}
</script>
</head> 
<body>
<div class="search">
<form method="post" action='list'>
<select name="col">
<option value="id"
<c:if test="${col == 'id' }">selected</c:if>
>ID</option>
<option value="mname"
<c:if test="${col == 'mname' }">selected</c:if>
>이름</option>
<option value="email"
<c:if test="${col == 'email' }">selected</c:if>
>이메일</option>
<option value="total">전체출력</option>
</select>
<input type="search" name="word" value="${word }" required>
<button>검색</button>
<button type="button" onclick="location.href='${root}/member/agreement'">회원가입</button>
</form>

<div class="container-fluid">
<h2><span class="glyphicon glyphicon-th-list"></span>회원 목록</h2>
</div>

	
	<c:forEach var="dto" items="${list }">
  <TABLE class="table table-hover" style="width: 60%">
    <TR>
      <td rowspan="5" width="30%"><img src="${root }/storage_member/${dto.fname}" width="300px" height="200px"></td>
      <TH width="20%">ID</TH>
      <td width="50%"><a href="javascript:read('${dto.id }')">${dto.id }</a></td>
    </tr>
    <tr>
      <th>이름</th>
       <td>${dto.mname }</td>
    </tr>
    <tr>
      <th>연락처</th>
      <td>${dto.tel }</td>
    </tr>
    <tr>
      <th>이메일</th>
      <td>${dto.email }</td>
    </tr>
    <tr>
    	<th>주소</th>
    	<td>${dto.address1 }
    		${dto.address2 }
    	</td>
    </tr>
  </TABLE>
    </c:forEach>
 
    
  <DIV class='bottom'>
 	${paging }
  </DIV>
  </div>
 
</body>
</html> 