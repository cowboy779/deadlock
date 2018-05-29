<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title></title> 
<script type="text/javascript">
function mdelete(id){
	var url="deleteForm";
	url+="?id="+id;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}

function pwUpdate(id){
	var url="passwordCheck";
	url+="?id="+id;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}

function infoUpdate(id){
	var url="updateInfoForm";
	url+="?id="+id;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}


function mlist(){
	var url = "../admin/list";
	location.href=url;
}

</script>
</head> 
<body>
<br>
<div style=" text-align: center;">
	<h1 class="h2"><span class="glyphicon glyphicon-th-list"></span>${dto.id }님</h1>
</div>

<br>
 <div class="w3-container" style="width:50%; margin:0 auto;">
  <TABLE class="table table-hover">
    <tr style="text-align: center; border-top-style: hidden;">
    	<td colspan="2" >
    		<a href="${root }/storage_member/${dto.fname}" download>
    			<img src="${root }/storage_member/${dto.fname }" width="300px;" height="250px;"/>
    		</a>
    	</td>
    </tr>

    <tr>
      <Th>이름</Th>
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
    	<th>우편번호</th>
    	<td>${dto.zipcode }</td>
    </tr>
    <tr>
    	<th>주소</th>
    	<td>
    	${dto.address1 }
    	<br>
    	${dto.address2 }
    	</td>
    </tr>
    <tr>
    	<th>직업</th>
    	<td>${util:jobvalue(dto.job) }</td>
    </tr>
    <tr>
    	<th>가입날짜</th>
    	<td>${dto.mdate }</td>
    </tr>
    <tr>
    	<th>등급</th>
    	<td>${dto.grade }</td>
    </tr>
  </TABLE>
  <br>
   <div align="center">
  <c:if test="${(not empty sessionScope.id) && (sessionScope.grade=='A')}">
  	<input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='list' onclick="mlist()">
  </c:if>
    <input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='modify' onclick="infoUpdate('${dto.id}')">
  <c:if test="${(not empty sessionScope.id) && !(sessionScope.grade=='A')}">
  	<input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='changeP/W' onclick="pwUpdate('${dto.id}')">
  	<input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='withdrawal' onclick="mdelete('${dto.id}')">
  </c:if>
  <c:if test="${(not empty sessionScope.id) && (sessionScope.grade=='A')}">
    <input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='expel' onclick="mdelete('${dto.id}')">
  </c:if>
<!--      <input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='download' -->
<%--                 onclick="location.href='${root }/download?dir=/storage_member&filename=${dto.fname }'">   --%>
  </DIV>
 </div>
 
<br>
</body>
</html> 