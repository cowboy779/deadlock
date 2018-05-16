<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title>
<script type="text/javascript">

function tupdate(cnum){
	//var td = document.getElementById(cnum); //td id
	var id = cnum +"utitle";
	var title = document.getElementById(id); // 1.기존 title
	var upt = document.getElementById("upt"); // 2.추가할 div
	var input = document.createElement("input"); // 3.input 태그
	input.value = title.innerHTML; // 4. 기존 값 입력
	input.name = "title"
	upt.append(input); // 5. 새로운 div에 input 태그 삽입
	$("#"+ id).hide(); // 6. 기존 tag 숨김
	
	
	
	$("#uptbtn").attr("href", "javascript:asubmit()");
	alert(title.innerHTML);
}

function asubmit() {
	alert('test');
	document.forms[1].submit();
}


function cupdate(cnum){
	if("${id}"==""){
		alert("로그인 후 이용해주세요.");
	}else{
		if("${id}"=="admin"){
			location.href="./cupdate";
		}else {
			alert("다른 사람의 글은 수정할 수 없습니다.")
		}
	}
}

function like_func(cnum) { 
	if("${id}"==""){
		alert("로그인 후 이용해주세요.");
	}else{
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
		var url="./create"
		
		location.href=url;
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
        <div class="text-center">
          <h1 class="h2">CBBS</h1>
        </div>
</div>
<br>
<br>

<div class="search">
<form name = "frm" 
	  action="./list" 
	  method="post">

<select name="col"><!-- 검색할 컬럼 -->
    <option value="id"
    <c:if test="${col == id}">
        selected
    </c:if>
    >아이디</option>
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

<!-- 검색어 -->
<input type="search" name="word" value="${word}" required>
<button>검색</button>
</form>
</div>

<!-- 본문시작 -->
<br>
	<table class="w3-table" style="width:60%; height:50% ;margin:0 auto;">
		
		<tr>
			<td colspan="3">
		 	<span class="pull-right">
		 		<button type="button" onclick="ccreate()" class="btn btn-default">create</button>
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
		
			<td id="${dto.cnum }">
				<div class="w3-card-4" style="width: 310px;">
					<div class="head">
						<!-- 제목, id -->
						<span style="float:left;">${dto.id }</span>
							<c:if test="${util:newimg(dto.cdate)}">
				    			<img src="${root }/storage_cbbs/new.gif">
				  			</c:if>
						<span style="float:right;">
							 <a href="javascript:like_func('${dto.cnum }')">
	          					<span id="like" class="glyphicon glyphicon-thumbs-up"></span>
	       					 </a>
								추천수(${dto.ccount })
						</span>
					</div>
					<!-- 사진 -->
					<div class="file">
					<a href="javascript:fileDown('${dto.fname}')">
						<img src="${root }/storage_cbbs/${dto.fname}" style="width:310px; height:150px; display:block;" class="w3-hover-opacity" align="middle">
					</a>
					</div>
		<!-- form  -->
		<form name="uptFrm" action="./cupdate" method="POST">
			<input type="hidden" name="cnum" value=${dto.cnum }>
				    <div class="w3-container">
				    <!-- title -->
				      	<div id="${dto.cnum }utitle"><h4><b>${dto.title }</b></h4></div>
				      	<div id="upt"></div>
				      	
					    <div align="center" style="width:100%;">
						      <textarea rows="5" cols="35" style="resize:none;" readonly>${dto.content }</textarea>
					      </div>
					<!-- 내용 -->
					      <div class="tcontent">
					      <!-- update 버튼 -->
					      	<a id="uptbtn" href="javascript:tupdate('${dto.cnum }')">
							  <span class="glyphicon glyphicon-pencil"></span>
							</a>
							  &nbsp;
							<a href="javascript:cdelete('${dto.cnum }','${dto.fname }')">
							  <span class="glyphicon glyphicon-trash" ></span>
							</a>
							  <span style="float:right;">${dto.cdate }</span>
					 	 </div>
					 </div>
		</form>					 
				</div>
			</td>
			
			  <c:if test="${i%j == j-1 }">
                </tr>
              </c:if>
		   	<c:set var="i" value="${i+1 }" />

			</c:forEach>
			
		</c:otherwise>
	</c:choose>
	</table>
	
	<br>
	<DIV class='bottom'>
    	${paging }
    </DIV>
    <br>
	
	


</body>
</html>