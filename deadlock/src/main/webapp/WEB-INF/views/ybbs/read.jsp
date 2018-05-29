<%@ page contentType="text/html; charset=UTF-8" %> 
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapais.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title> 

<script type="text/javascript">

function del(){
	if(${not empty ylist}){
		if(confirm("댓글이 달려있는 글입니다. 정말 삭제하시겠습니까?")){
			var url = "./delete";
			url += "?ynum=${dto.ynum}";
			url += "&oldfile=${dto.fname}";
			url += "&col=${param.col}"; 
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}";
				
			location.href=url;
		}
	}else{
		if(confirm("정말 삭제하시겠습니까?")){
			var url = "./delete";
			url += "?ynum=${dto.ynum}";
			url += "&oldfile=${dto.fname}";
			url += "&col=${param.col}"; 
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}";
				
			location.href=url;
		}
	}
}

function input(f){
	if(id==null){
		if(confirm("로그인 후 이용해주세요.")){
		//로그인 창으로 
		var url = "../member/login";
		url = url + "?ynum=${dto.ynum}";
		url = url + "&nowPage=${param.nowPage}"
		url = url + "&col=${col}"
		url = url + "&word=${word}"
		url = url + "&nPage=${nPage}";
		url = url + "&flag=../ybbs/read"
		location.href=url;
		return false;
		}else{
			return false;
		}
	}else if(f.content.value==""){
	alert("댓글 내용을 입력하세요");
	f.content.focus();
	return false;
	}
}
	
function ydelete(yrenum){
	if(confirm("정말 삭제하시겠습니까?")){
		var url ="./ydelete";
		url += "?yrenum="+yrenum;
		url += "&ynum=${dto.ynum}";
		url += "&nPage=${nPage}";
		url += "&col=${param.col}"; 
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
			
		location.href=url;
	}
}
	
function yupdate(yrenum,ycontent){
	var f = document.yform;
	f.content.value = ycontent;
	f.yrenum.value = yrenum;
	f.ysubmit.value="submit";
	f.action = "./yupdate";
}



function yyupdate(ynum){
// 	if('${sessionScope.id}'=='${dto.id}'){
	var url ="./update";
	url += "?ynum="+ynum;
	url += "&col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href=url;
// 	}else{
// 		alert("본인글이 아니면 수정할 수 없습니다");
// 	}
}


function ylist(){
	var url="list";
	url+= "?col=${col}";
	url+= "&word=${word}";
	url+= "&nowPage=${nowPage}";
	location.href=url;
}
</script>

</head> 
<body>
<br>
<div style=" text-align: center;">
	<h1 class="h2"><span class="glyphicon glyphicon-th-list"></span>게시글 조회</h1>
</div>

<br><br>
<div class="w3-container" style="width:50%; margin:0 auto;">
  <TABLE class="table table-hover" >
  	<TR>
      <TH style="width:30%;">${dto.id }</TH>
      <TD style="width:70%; text-align:right;">(조회수:${dto.ycount})</TD>
    </TR>

    
    <tr>
    <td colspan="2">
    	<h3>${dto.title}</h3>
    	<span class="fa fa-pencil"></span><textarea id="content" rows="8" style="width:100%; resize:none;" name="content" readonly>${content}</textarea>
    	<p style="text-align: right; ">${dto.ydate}</p>
    </td>
    </tr>

	<TR>
      <TH style="width:30%;">File(download)</TH>
      <td style="width:70%;">
	      <c:choose>
	      <c:when test="${empty dto.fname}">파일없음
	      </c:when>
	      <c:otherwise>
	      <a href="javascript:fileDown('${dto.fname}')">
	      ${dto.fname}(${dto.filesize})</a>
	      </c:otherwise>
	      </c:choose>
      </td>
    </TR>

    
    
	<tr style="border-bottom-style: hidden; border-left-style: hidden; border-right-style: hidden; text-align: right; ">
	<td colspan="2" >
		<DIV >
		<c:if test="${sessionScope.id == dto.id || sessionScope.grade == 'A'}">
			<input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='modify' onclick="yyupdate('${dto.ynum}')">
			<button class="btn btn-default btn-sm" style="font-size:small;" id = "button" onclick="del()">delete</button>
		</c:if>
		    <input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='list' onclick="ylist()">
		
		</DIV>
	</td>
	</tr>
  </TABLE>
</div>


<!-- 댓글 -->
<hr>

<div class="w3-center" style=" width:60%;  margin: 0 auto;">
<table class="w3-table w3-table-all" style="padding:0; width:100%;">
	<c:choose>
		<c:when test="${empty ylist }">
			<tr>
				<td style="text-align:center">등록된 댓글이 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>

			<c:forEach var="ydto" items="${ylist}">
				<tr>
					<%--  <img src='${root}/images/re.jpg' width=20 height=15> --%>
					<td>
						<i class="fa fa-address-book-o"></i>
						<b>${ydto.id}</b>
					</td>
					<td>
						<c:if test="${id==ydto.id}">
							<span style="float:right">
							<a href="javascript:yupdate('${ydto.yrenum }','${ydto.content}')">modify</a>|<a href="javascript:ydelete('${ydto.yrenum}')">delete</a>
							</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>${ydto.content }</td>
					<td style=" text-align: right;">
						<i class="fa fa-calendar"></i>
						${ydto.yredate }
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>
<br>
<div class="w3-center">
${paging2}
</div>
<br><br>

<form name="yform" 
	action="./ycreate" 
	method="post" 
	onsubmit="return input(this)">
	<div class="w3-center" style="margin: auto;">
		<c:choose>
	  	  	<c:when test="${not empty sessionScope.id }">
	  	  	<div align="center">
	  	  		${sessionScope.id} : 
		  	  	<textarea rows="1" name="content" style="width: 45%; resize:none;"  required></textarea>
		  	  	<input class="btn btn-default btn-sm" style="font-size:small; margin-bottom: 20px;" type="submit" name="ysubmit" value="submit">
	  	  	</div>
	  	  		
	  	  	</c:when>
	  	  	<c:otherwise>	
	  	  	<div align="center">
		  	  	<textarea rows="1" name="content_log" style="width: 30%; resize:none;" readonly>로그인 후 이용해주세요.</textarea>
	  	  	</div>  
	  	  	</c:otherwise>
  	  	</c:choose>
	
	
				<input type ="hidden" name = "id" value="${id }">
				<input type ="hidden" name = "ynum" value="${dto.ynum }">
				<input type ="hidden" name = "col" value="${param.col }">
				<input type ="hidden" name = "word" value="${param.word }">
				<input type ="hidden" name = "nowPage" value="${param.nowPage }">
				<input type ="hidden" name = "yrenum" value="${0} ">
				<input type ="hidden" name = "nPage" value="${nPage}">
	  	
	</div>
</form>
<!-- 댓글 끝 -->
<br>
<hr>
<br>

<!-- 리스트 -->  
<jsp:include page="list.jsp" flush="false" />
<div>
${paging4}
</div>
<br>
</body>
</html> 
