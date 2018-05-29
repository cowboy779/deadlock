<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title>
<script type="text/javascript">



function cupdate(cnum){
	var url="cupdate";
	
	url+="?cnum="+cnum;
	url+= "&nowPage=${nowPage}";
	url+= "&col=${param.col}";
	url+= "&word=${param.word}";
		
			
	location.href=url;
}

function like_func(cnum) { 
	if(${empty sessionScope.id}){
		alert("로그인 후 이용해주세요.");
		var url="${root}/member/loginForm";
		
		location.href=url;
		
	}else{
		if(${param.update=='update'}){
			alert("수정 창에서는 추천을 할 수 없습니다.");
		}else
			location.href="./ccount?cnum="+cnum;
	}
}
 

function fileDown(fname) {
	var url = "${root}/download";

	url += "?filename=" + fname;
	url += "&dir=/storage_cbbs";

	location.href = url;
}
function ccreate() {
	if(${not empty sessionScope.id}){
		var url="./create";
			
		location.href=url;
	}else{
		alert("로그인 후 이용해주세요");
		var url="${root}/member/loginForm";
				
		location.href=url;
	}
}
function cdelete(cnum,fname){
		if(confirm("정말 삭제 하시겠습니까?")){
		var url="./delete"
			
		url = url+ "?cnum="+cnum;
			
		url = url+ "&oldfile="+fname;
		url = url+ "&nowPage=${nowPage}";
		url = url+ "&col=${param.col}";
		url = url+ "&word=${param.word}";
		
		location.href=url;
		}
}
	
function calert(){
	alert("수정 창에서는 추천을 할 수 없습니다.");
}
	
	function imgfile(){
		document.frm2.filenameMF.click();
		document.frm2.text1.value=document.frm2.filenameMF.value;
	}
	function cupsub(){
		document.frm2.submit.click();
		document.frm2.text2.value=document.frm2.submit.value;
	}
	
function inCheck(f){
	if(f.title.value==""){
		alert("제목을 입력해주세요.")	;
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력해주세요.")	;
		f.content.focus();
		return false;
	}
		
}
	
</script>
<style type="text/css">
.search{
width: 70%;
margin : 10px auto;
text-align: center;
}
</style>
</head>
<body>




<!-- 제목 -->
<div class="col-sm-8 col-sm-offset-2 section-container-spacer ">
        <div align="center">
          <h1 class="h2" >04 : 추천사이트</h1>
        </div>
</div>
<br>
<br>




<!-- 본문시작 -->
<br>
	<table class="w3-table" style="width:60%; height:50% ;margin:0 auto;">
	
		<tr>
			<td colspan="3">
		 	<span class="pull-right">
		 		<button type="button" onclick="ccreate()" class="btn btn-default btn-sm" style="font-size:small;">create</button>
		 	</span>
		 	</td>
		</tr>
		
	<!-- 게시글 시작 -->	

	<c:choose>
		<c:when test="${empty list }">
		 	<tr>
		 		<td colspan="3">
		 			등록된 게시글이 없습니다.
		 		</td>
		 	</tr>
		</c:when>
	
	
	
	<c:otherwise>
		
		<c:set var="i" value="0" />
		<c:set var="j" value="3" />

		<c:forEach var="dto" items="${list }">
		<c:if test="${i%j==0 }">
			<tr>
		</c:if>
		
			<td>
			<c:choose>
				<c:when test="${param.update=='update' && param.cnum==dto.cnum }">
				<form name="frm2" method="post" onsubmit="return inCheck(this)" enctype="multipart/form-data" action="cupdate">
				
				<input type="hidden" name="oldfile" value="${dto.fname }">
				<input type="hidden" name="cnum" value="${dto.cnum }">
				<input type="hidden" name="col" value="${col}">
				<input type="hidden" name="word" value="${word}">
				<input type="hidden" name="nowPage" value="${nowPage}">
				
				
					<div class="w3-card-4" style="width: 310px;">
						<div class="head">
							<!-- 제목, id -->
							<span style="float:left;">${dto.id }</span>
								<c:if test="${util:newimg(dto.cdate)}">
					    			<img src="${root }/storage_cbbs/new.gif">
					  			</c:if>
							<span style="float:right;">
								 <a href="javascript:calert()"><i class="fa fa-thumbs-o-up"></i></a>
									추천수(${dto.ccount })
							</span>
						</div>
						<!-- 사진 -->
						<div >
							<input type="file" name="filenameMF" style="display:none;">
							<input type="hidden" name="text1" size="10">
							<a href="javascript:imgfile()">
								<img src="${root }/storage_cbbs/${dto.fname}" style="width:100%; height:150px; display:block;" >
							</a>
						</div>
	
						<div class="w3-container">
							<!-- title -->
							<div>
								<h4>
								<b>
								<input type="text" name="title" style="width:100%;" value="${dto.title }"  maxlength="13" 
								autofocus>
								</b>
								</h4>
							</div>
						
									      	
							<!-- 내용 -->
							<div align="center" style="width:100%;">
								<textarea rows="5" cols="35" name="content" style="resize:none;">${dto.content }</textarea>
							</div>
							
							<!-- update 버튼 -->
							<div class="tcontent">
								<input type="submit" name="submit" style="display:none;">
								<input type="hidden" name="text2" size="10">
									<a href="javascript:cupsub()"><i class="fa fa-pencil"></i></a>
									&nbsp;
									<span style="float:right;">${dto.cdate }</span>
							</div>
						</div>
					 
					</div>
				</form>
				</c:when>
				
				<c:otherwise>
				
					
				<div class="w3-card-4" style="width: 310px;">
					<div class="head">
						<!-- 제목, id -->
						<span style="float:left;">${dto.id }</span>
							<c:if test="${util:newimg(dto.cdate)}">
				    			<img src="${root }/storage_cbbs/new.gif">
				  			</c:if>
				  			   <!-- glyphicon glyphicon-thumbs-up -->
								<span style="float:right;">
									 <a href="javascript:like_func('${dto.cnum }')"><i class="fa fa-thumbs-o-up"></i></a> 추천수(${dto.ccount })
								</span>
								
					</div>
					<!-- 사진 -->
					<div class="file">
					<a href="${dto.urllink }">
						<img src="${root }/storage_cbbs/${dto.fname}" style="width:310px; height:150px; display:block;" class="w3-hover-opacity" align="middle">
					</a>
					</div>
					
							    <div class="w3-container">
							    <!-- title -->
							      	<div id="${dto.cnum }utitle"><h4><b>${dto.title }</b></h4></div>
							
								<!-- 내용 -->
								    <div align="center" style="width:100%;">
									      <textarea rows="5" cols="35" style="resize:none;" readonly>${dto.content }</textarea>
								    </div>
								      
								      
									 <!-- update delete 버튼 -->
									 <div class="tcontent">
								     	<c:if test="${sessionScope.id == dto.id || sessionScope.id =='admin' }">
									      	<a href="javascript:cupdate('${dto.cnum }')"><i class="fa fa-pencil"></i></a>
											  &nbsp;
											<a href="javascript:cdelete('${dto.cnum }','${dto.fname }')"><i class="fa fa-trash" ></i></a>
								 	 	</c:if>
											<span style="float:right;">${dto.cdate }</span>
									 </div>
								 	 
								 	 
								 </div>				 
				</div>
				
				
				</c:otherwise>
				</c:choose>
				
			</td>
				
			  <c:if test="${i%j == j-1 }">
                </tr>
              </c:if>
		   	<c:set var="i" value="${i+1 }" />

			</c:forEach>
			
		</c:otherwise>
	</c:choose>
	</table>
	
	
<!-- 검색 서치 -->
<br>
<div class="template-example">
<div class="form-group">
<div class="search">

<form name = "frm" 
	  action="./list" 
	  method="post">
	 
 <table style="margin:auto;">
	<tr>
  		<td>
<select name="col" class="form-control" style="width:100px;height:33px;"><!-- 검색할 컬럼 -->
    <option value="id"
    <c:if test="${col == id}">
        selected
    </c:if>
    >ID</option>
    <option value="title"
    <c:if test="${col == title}">
        selected
    </c:if>
    >제목</option>
    <option value="content"
    <c:if test="${col == content}">
        selected
    </c:if>
    >내용</option>
     <option value="total"
    <c:if test="${col == total}">
        selected
    </c:if>
    >전체</option>
</select>

 </td>

<!-- 검색어 -->
<td>
<input type="search" class="form-control" name="word" style="width:300px; height:33px;" value="${word}" required>
</td>
<td>
&nbsp;
<button type="submit" class="btn btn-default btn-sm" style="font-size:small;">search</button>
</td>

</tr>
</table>
</form>

</div>
</div>
</div>
	
	
	
	<br>
	<DIV class='bottom'>
    	${paging }
    </DIV>
    <br>



</body>
</html>

<c:if test="${not empty str }">
	<script>
		alert('${str}');
	</script>
	<c:remove var="Update" scope="session"/>
</c:if>