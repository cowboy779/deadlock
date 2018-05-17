<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
table{
	width:60%;
}
</style>
<script type="text/javascript">
//Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

function read(qnum){
	var url="./read";
	url+="?qnum="+qnum;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	
	location.href=url;
}

</script>
</head>
<body>
<br><br><br>

<div style=" width:60%; margin: 0 auto;"> 
<table class="w3-table w3-white w3-bordered">
	<tr>
		<th class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444; width:17% ;">이미지</th>
		<th class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444; width:13% ;">분류</th>
		<th class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444; width:30% ;">제목</th>
		<th class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444; width:20% ;">작성자</th>
		<th class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444; width:20% ;">작성일자</th>
	</tr>
	
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="5" style="text-align:center">등록된 글이 없습니다.</td>
			</tr>
		</c:when>
		
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>
					<div style="width:100px; height:60px;">
						<img src="${root }/storage_qbbs/${dto.fname}" style="width:100%; display:block;  height: 100%;" onclick="onClick(this)" class="w3-hover-opacity" 
					    alt="<c:set var="a" value="${fn:indexOf(dto.fname,'.') }" />  
 				      		 ${fn:substring(dto.fname, 0, a) } 
					    	">
				
				    </div>
				    </td>
					<td>${util:sepvalue(dto.qsep) }</td> 
					<td>
						<a href="javascript:read('${dto.qnum }')">${dto.title }</a>
						<c:if test="${util:newimg(dto.qdate)}">
				    		<img src="${root }/storage_qbbs/new2.jpg" width="30px">
				    	</c:if>
					</td>
					<td>${dto.id }</td>
					<td>${dto.qdate }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>

<br>
<!-- 검색 -->
<FORM class="w3-container" method='POST' action='list'>
<div style="width:100%; max-width:500px; margin: 0 auto;"> 


<table class="w3-table" >
<tr>
	<td style="width:30%;">
		<select class="w3-select" name="col">
			<option value="title"
			<c:if test="${col=='title' }">selected</c:if>
			 >제목</option>
			<option value="qsep"
			<c:if test="${col=='qsep' }">selected</c:if>
			>분류</option>
			<option value="mname"
			<c:if test="${col=='mname' }">selected</c:if>
			>작성자</option>
			<option value="total" selected>전체보기</option>
		</select>
	</td>
	<td style="width:50%; align-content: center;">
		<input class="w3-input w3-border" type="search" name="word" value="${word }" required>
	</td>
	<td style="width:20%;">
		<button class="w3-button w3-border w3-padding-small w3-hover-teal">검색</button>
	</td>
</tr>
</table>
</div>
</FORM>
<br>
<!-- 검색 끝 -->

<br>

  <DIV class='w3-center'>
	${paging3 }
  </DIV>


</body>
</html>