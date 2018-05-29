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
<link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">



<title>Insert title here</title>

<script type="text/javascript">
//Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}


function qdelete(qnum,fname){
	if(${not empty qrlist}){
		if(confirm("댓글이 달려있는 글입니다. 정말 삭제하시겠습니까?")){
			var url="./delete";
			url+="?qnum="+qnum;
			url+="&oldfile="+fname;
			url+="&col=${col}";
			url+="&word=${word}";
			url+="&nowPage=${nowPage}";
			
			location.href=url;
		}
	}else{
		if(confirm("정말 삭제하시겠습니까?")){
			var url="./delete";
			url+="?qnum="+qnum;
			url+="&oldfile="+fname;
			url+="&col=${col}";
			url+="&word=${word}";
			url+="&nowPage=${nowPage}";
			
			location.href=url;
		}
	}
}

function qcreate(){
	if(${not empty sessionScope.id}){
		var url="create";
		url+= "?col=${col}";
		url+= "&word=${word}";
		url+= "&nowPage=${nowPage}";
		location.href=url;
	}else{
		if(confirm("로그인 후 이용해주세요.")){
			location.href="${root}/member/loginForm";
		}
	}
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
	f.rsubmit.value="submit";
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
<div style=" text-align: center;">
	<h1 class="h2"><span class="glyphicon glyphicon-th-list"></span>${util:sepvalue(dto.gamenum) } - ${util:sepvalue(dto.qsep) }</h1>
</div>

<br><br>

<div class="w3-card-4" style="width:40%; max-width:400px; margin: 0 auto;">
	<p style="text-align: left">${dto.id }(${dto.qcount })</p>
	<a href="${root }/storage_qbbs/${dto.fname}" download>
		<img src="${root }/storage_qbbs/${dto.fname}" style="width:100%; display:block;  height: auto;"  class="w3-hover-opacity" 
							alt="<c:set var="a" value="${fn:indexOf(dto.fname,'.') }" />  
 				      		 	${fn:substring(dto.fname, 0, a) } 
 				      		    ">
	</a>
    <div class="container" style="width:auto;">
      <h4 style="width:100%; "><b>${dto.title }</b></h4>
      <span class="fa fa-pencil"></span>&nbsp;&nbsp;
      <p  style="width:100%;" >${content }</p>
    </div>
	<p style="text-align: right;">${dto.qdate }</p>
</div>
<br>
  
  <DIV class='w3-center'>
  	<input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='regit' onclick="qcreate()">
    <c:if test="${sessionScope.grade=='A' ||sessionScope.id==dto.id }">
	    <input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='modify' onclick="qupdate()">
	    <input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='delete' onclick="qdelete('${dto.qnum}','${dto.fname }')">
    </c:if>
    
    <input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='list' onclick="qlist()">
  </DIV>

<!-- 댓글 -->
<hr>
<div class="w3-center" style=" width:60%;  margin: 0 auto;"> 

	  	<table class="w3-table w3-table-all" style="padding:0; width:100%;">
	  		<c:choose>
				<c:when test="${empty qrlist }">
					<tr>
						<td style="text-align:center">등록된 댓글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="rdto" items="${qrlist }">
				  		<tr>				  		
				  			<td>
				  				<img src='${root }/storage_qbbs/화살표.jpg' width='25px'> <img src='${root }/storage_qbbs/re.jpg' width='30px'> 
				  				<b>${rdto.id }</b>
				  			</td>
				  			
							<td >
					  			<c:if test="${not empty sessionScope.id && sessionScope.id==rdto.id ||sessionScope.grade=='A'}">
										<span style="float:right">
										<a href="javascript:qrupdate('${rdto.qrenum }','${rdto.content }')">modify</a>|<a href="javascript:qrdelete('${rdto.qrenum }')">delete</a>
										</span>
								</c:if>
							</td>
				  		
				  		</tr>
				  		<tr>
				  			<td>${rdto.content }</td>
				  			<td style=" text-align: right;">${rdto.qredate }</td>
						 </tr>
					 </c:forEach>
			 	</c:otherwise>
			 </c:choose>

		  </table>
</div>
	<br>
	<div class="w3-center" >${paging2}</div>

  <br><br>
  
<form name="rform" action="./rcreate" method="post" onsubmit="return input(this)">
  <div class="w3-center" >
  	  	<c:choose>
	  	  	<c:when test="${not empty sessionScope.id }">
	  	  		${sessionScope.id} : 
		  	  	<textarea rows="1" name="content" style="width: 45%; resize:none;"  required></textarea>
		  	  	<input class="btn btn-default btn-sm" style="font-size:small; margin-bottom: 20px;" type="submit" name="rsubmit" value="submit">
	  	  	</c:when>
	  	  	<c:otherwise>	  	  	
		  	  	<textarea rows="1" name="content_log" style="width: 30%; resize:none;" readonly>로그인 후 이용해주세요.</textarea>
	  	  	</c:otherwise>
  	  	</c:choose>
  	  	
  	  	<input type="hidden" name="id" value="${sessionScope.id}">
  	  	<input type="hidden" name="nowPage" value="${param.nowPage}">
  	  	<input type="hidden" name="col" value="${param.col}">
  	  	<input type="hidden" name="qnum" value="${dto.qnum}">
  	  	<input type="hidden" name="word" value="${param.word}">
  	  	<input type="hidden" name="qrenum" value="${0 }">
  	  	<input type="hidden" name="nPage" value="${nPage}">

  </div>
</form>

<!-- 댓글 끝 -->
<br> 
<hr>
<br>

<!-- 리스트 -->  
<!-- <div> -->
<%-- <jsp:include page="./list2.jsp"  flush="false"/> --%>
<!-- </div> -->



<div class="container" style=" width:60%; margin: 0 auto;"> 
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
<div class="form-group template-example" > 
<FORM method='POST' action='${root }/qbbs/list'>

<table style=" margin: 0 auto;">
<tr>
	<td>
		<select class="form-control" name="col" style="width:100px; height:33px;" >
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
	<td>
		<input class="form-control" type="search" style="width:300px; height:33px;"  name="word" value="${word }" required>
	</td>
	<td>
		&nbsp;
		<button class="btn btn-default btn-sm" style="font-size:small;">search</button>
	</td>
</tr>
</table>
</FORM>
</div>
<br>
<!-- 검색 끝 -->

  <DIV class='w3-center'>
	${paging3 }
  </DIV>
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

<c:if test="${not empty str }">
 <script type="text/javascript"> 
	  alert('${str}'); 
 </script> 
	<c:remove var="Update" scope="session" />
</c:if>
