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
	var url="${root}/member/read";
	url+="?id="+id;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	location.href=url;
}

//Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

</script>
</head> 
<body>
<br>
<div class="w3-container" style="width:60%; margin:0 auto;">
<div style="text-align: center;"> 
	<h1 class="h2" ><span class="glyphicon glyphicon-th-list"></span>회원 목록</h1>
</div>
<br>

	<c:forEach var="dto" items="${list }">
	  <TABLE class="table table-hover">
	    <TR>
	      <td rowspan="5" width="30%">
	      	<div style="width: 190px; height: 165px; overflow: hidden">
	      		<img src="${root}/storage_member/${dto.fname}"  onclick="onClick(this)" class="w3-hover-opacity" style=" display:block; width:190px; height: auto;">
	      	</div>
	      </td>
	      <TH width="20%">ID</TH>
	      <td width="50%"><a href="javascript:read('${dto.id }')">${dto.id }</a></td>
	    </tr>
	    <tr>
	      <th>Name</th>
	      <td>${dto.mname }</td>
	    </tr>
	    <tr>
	      <th>Phone</th>
	      <td>${dto.tel }</td>
	    </tr>
	    <tr>
	      <th>E-mail</th>
	      <td>${dto.email }</td>
	    </tr>
	    <tr>
	      <th>Address</th>
	      <td>${dto.address1 }
	    	  ${dto.address2 }
	      </td>
	    </tr>
	  </TABLE>
	  <br>
    </c:forEach>
 </div> 
 <br>
   
 <!-- 검색 -->   
<div class="template-example" >
<div class=" form-group ">
<form method="post" action='list'>
<table style=" margin:0 auto;">
<tr>
	<td>
		<select class="form-control" name="col" style="width:100px; height:33px;">
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
	</td>
	<td>
		<input class="form-control" type="search" name="word" value="${word }"  style="width:300px; height:33px;" required>
	</td>
	<td>
		&nbsp;
		<button type="submit" class="btn btn-default btn-sm" style="font-size:small;">search</button>
		<button class="btn btn-default btn-sm" style="font-size:small;"  type="button" onclick="location.href='${root}/member/agreement'">sign up</button>
	</td>
</tr>
</table>
</form>
</div>
</div>

    <br>
  	<DIV class='w3-center'>
 		${paging}
 	</div>
 	<br>


<!-- Modal for full size images on click-->
<div id="modal01" class="w3-modal w3-black" onclick="this.style.display='none'">
  <span class="w3-button w3-large w3-black w3-display-topright" title="Close Modal Image"><i class="fa fa-remove"></i></span>
  <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
    <img id="img01" class="w3-image">
    <p id="caption" class="w3-opacity w3-large"></p>
  </div>
</div> 

</body>
</html> 