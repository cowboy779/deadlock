<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapais.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<script type="text/javascript">

function qdelete(qnum,fname){
	if(confirm("댓글이 달려있는 글입니다. 정말 삭제하시겠습니까?")){
		var url="./delete";
		url+="?qnum="+qnum;
		url+="&oldfile="+fname;
		url+="&col=${col}";
		url+="&word=${word}";
		url+="&nowPage=${nowPage}";
		
		location.href=url;
	}
}

function qcreate(){
	var url="create";
	url+= "?col=${col}";
	url+= "&word=${word}";
	url+= "&nowPage=${nowPage}";
	location.href=url;
}

function qupdate(){
	var url="update";
	url+="?qnum=${qnum}";
	url+= "&col=${col}";
	url+= "&word=${word}";
	url+= "&nowPage=${nowPage}";
	location.href=url;
}

function qlist(){
	var url="list";
	url+= "?col=${col}";
	url+= "&word=${word}";
	url+= "&nowPage=${nowPage}";
	location.href=url;
}

function qrupdate(qrnum, qrcontent){
	var f=document.rform;
	f.content.value=qrcontent;
	f.qrenum.value=qrnum;
	f.rsubmit.value="수정";
	f.action="./rupdate";
}

function qrdelete(qrnum){
	if(confirm("정말 삭제하시겠습니까?")){
		var url="./rdelete";
		url+="?qrnum="+qrnum;
		url+="&qnum=${dto.qnum}";
		url+="&nowPage=${param.nowPage}";
		url+="&col=${param.col}";
		url+="&word=${param.word}";
		url+="&nPage=${nPage}";
			
		location.href=url;
	}
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

<br>
<DIV class="w3-panel w3-border-right w3-border-left w3-border-green w3-wide" style="width:25%; max-width:200px; margin:0 auto; font-size: x-large; text-align: center;">
	${util:sepvalue(dto.gamenum) } - <br>${util:sepvalue(dto.qsep) }
	
</DIV>
<br><br>

<div class="w3-card-4" style="width:40%; max-width:400px; margin: 0 auto;">
	<p style="text-align: left">${dto.id }(${dto.qcount })</p>
	<a href="${root }/storage_qbbs/${dto.fname}" download>
		<img src="${root }/storage_qbbs/${dto.fname}" style="width:100%; display:block;  height: auto;"  class="w3-hover-opacity" 
							alt="<c:set var="a" value="${fn:indexOf(dto.fname,'.') }" />  
 				      		 	${fn:substring(dto.fname, 0, a) } 
 				      		    ">
	</a>
    <div class="w3-container">
      <h4><b>${dto.title }</b></h4>
      <span class="glyphicon glyphicon-pencil"></span> <p>${content }</p>
    </div>
<p style="text-align: right;">${dto.qdate }</p>
</div>
<br><br>
  
  <DIV class='w3-center'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='등록' onclick="qcreate()">
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='수정' onclick="qupdate()">
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='삭제' onclick="qdelete('${dto.qnum}','${dto.fname }')">
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='목록' onclick="qlist()">
  </DIV>

<!-- 댓글 -->
<hr>
<div style=" width:60%; max-width:600px; margin: 0 auto;"> 
	  	<table class="w3-table w3-table-all " style="padding:0; width:100%;">
	  		<c:choose>
				<c:when test="${empty qrlist }">
					<tr>
						<td colspan="4" style="text-align:center">등록된 댓글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="rdto" items="${qrlist }">
				  		<tr>				  		
				  			<td colspan="3" style="border-bottom-color: white;">
				  				<img src='${root }/storage_qbbs/화살표.jpg' width='25px'> <img src='${root }/storage_qbbs/re.jpg' width='30px'> 
				  				<b>${dto.id }</b>
				  			</td>
				  		</tr>
				  		<tr>
	
				  			<td style="width:45%">${rdto.content }</td>
				  			<td style="width:35%; text-align: right;">${rdto.qredate }</td>
							<td style="width:20%">
								<span style="float:right">
								<a href="javascript:qrupdate('${rdto.qrenum }','${rdto.content }')">수정</a>|<a href="javascript:qrdelete('${rdto.qrenum }')">삭제</a>
								</span>
							</td>
						 </tr>
					 </c:forEach>
			 	</c:otherwise>
			 </c:choose>
		  </table>

  <br>
  <DIV class='w3-center'>
	${paging2}
  </DIV>
  <br>
  
  <div class="w3-center">
  	  <form name="rform" action="./rcreate" method="post" onsubmit="return input(this)">
  	  	<textarea rows="1" name="content" style="width: 85%;"></textarea>
  	  	<input type="submit" name="rsubmit" value="등록">
  	  	
  	  	<input type="hidden" name="id" value="${sessionScope.id}">
  	  	<input type="hidden" name="nowPage" value="${param.nowPage}">
  	  	<input type="hidden" name="col" value="${param.col}">
  	  	<input type="hidden" name="qnum" value="${dto.qnum}">
  	  	<input type="hidden" name="word" value="${param.word}">
  	  	<input type="hidden" name="qrenum" value="${0 }">
  	  	<input type="hidden" name="nPage" value="${nPage}">

  	  </form>
  </div>
</div>
<!-- 댓글 끝 -->
  <br>  <br>
<hr>


<!-- 리스트 -->  
<!-- <div> -->
<%-- <jsp:include page="./list2.jsp"  flush="false"/> --%>
<!-- </div> -->



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

<c:if test="${not empty str }">
 <script type="text/javascript"> 
	  alert('${str}'); 
 </script> 
	<c:remove var="Update" scope="session" />
</c:if>
