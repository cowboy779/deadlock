<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

function qcreate(){
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
		<h1 class="h2" ><span class="glyphicon glyphicon-th-list"></span>03 : 정답/질문 게시판</h1>
	</div>
<br><br>

	<table class="table table-hover">
		<tr>
			<th style="width:17% ;">Image</th>
			<th style="width:13% ;">Seperate</th>
			<th style="width:30% ;">Title</th>
			<th style="width:20% ;">Name</th>
			<th style="width:20% ;">Date</th>
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
<div class="template-example">
<div class=" form-group ">
	<form method="post" action='list'>
	<table style="width:90%; max-width:550px; margin:0 auto;">
	<tr>
		<td>
			<select class="form-control" name="col" style="width:100px; height:33px;">
				<option value="title"
				<c:if test="${col=='title' }">selected</c:if>
				 >제목</option>
				<option value="qsep"
				<c:if test="${col=='qsep' }">selected</c:if>
				>분류</option>
				<option value="id"
				<c:if test="${col=='id' }">selected</c:if>
				>작성자</option>
				<option value="total" selected>전체보기</option>
			</select>
		</td>
		<td>
			<input class="form-control" type="search" name="word"
			value="${word }" style="width:300px; height:33px;">
		</td>
		<td>
			
			<button type="submit" class="btn btn-default btn-sm" style="font-size:small;">search</button>
			<button type="button" class="btn btn-default btn-sm" style="font-size:small;" onclick="qcreate()">regit</button>
		</td>
	</tr>
	</table>
	</FORM>
</div>
</div>

<!-- 검색 끝 -->
<br>
<div class="w3-center">
	${paging }

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