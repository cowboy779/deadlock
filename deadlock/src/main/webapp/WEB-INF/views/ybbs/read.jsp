<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.ycreate{
  position:relative; top: 20px; left: 380px;
}

.line{border-bottom:1px solid black;}

input[type=button], input[type=submit], input[type=reset]{
    background-color:#555555;;
    border: none;
    color: white;
    text-decoration: none;
}
</style>
<script type="text/javascript">

function del(){
	var url = "./delete";
	url += "?ynum=${dto.ynum}";
	url += "&oldfile=${dto.fname}";
	url += "&col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
		
	location.href=url;
}




function input(f){
	if(id==null){
		if(confirm("로그인후 댓글을 쓰세요")){
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
	var url ="./ydelete";
	url += "?yrenum="+yrenum;
	url += "&ynum=${dto.ynum}";
	url += "&nPage=${nPage}";
	url += "&col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
		
	location.href=url;
}
	
function yupdate(yrenum,ycontent){
	var f = document.yform;
	f.content.value = ycontent;
	f.yrenum.value = yrenum;
	f.ysubmit.value="수정";
	f.action = "./yupdate";
}


function del(){
// 	if('${sessionScope.id}'=='${dto.id}'){
	var url = "./delete";
	url += "?ynum=${dto.ynum}";
	url += "&oldfile=${dto.fname}";
	url += "&col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
// 	}else{
// 		alert("본인글이 아니면 수정할 수 없습니다");
// 	}
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
</script>

</head> 
<body>

<DIV class="title" align="center">
<h2>조회</h2>
</DIV>

  <TABLE  style="width:60%; margin:auto;" border="1">
  	<TR>
      <TH>조회수</TH>
      <TD>${dto.ycount}</TD>
    </TR>
    
    <TR>
      <TH>등록날짜</TH>
      <TD>${dto.ydate}</TD>
    </TR>
  	
    <TR>
      <TH>제목</TH>
      <TD>${dto.title}</TD>
    </TR>
    
    <TR>
      <TH>파일명</TH>
      <td>
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
    
    <tr>
    <th>내용</th>
    <td>
    <textarea id="content" rows="10" cols="100" name="content">${content}</textarea>
    </td>
    </tr>
    <tr>
    <th>아이디</th>
    <td>${dto.id }</td>
    </tr>

	<tr style="border-bottom-style: hidden; border-left-style: hidden; border-right-style: hidden; text-align: right; ">
	<td colspan="2" >
		<DIV >
		<c:if test="${sessionScope.id == dto.id || sessionScope.grade == 'A'}">
			<input type='button' value='수정' onclick="yyupdate('${dto.ynum}')">
			<button id = "button" onclick="del()">삭제</button>
		</c:if>
		</DIV>
	</td>
	</tr>
  </TABLE>

<hr>

<div class="ycreate">
	<form name="yform" 
	action="./ycreate" 
	method="post" 
	onsubmit="return input(this)">
	<textarea rows="3" cols="60" name="content"></textarea>	
	<br>
	<input type ="submit" name="ysubmit" value="등록">
	<input type ="hidden" name = "id" value="${id }">
	<input type ="hidden" name = "ynum" value="${dto.ynum }">
	<input type ="hidden" name = "col" value="${param.col }">
	<input type ="hidden" name = "word" value="${param.word }">
	<input type ="hidden" name = "nowPage" value="${param.nowPage }">
	<input type ="hidden" name = "yrenum" value="${0} ">
	<input type ="hidden" name = "nPage" value="${nPage}">
</form>
</div>

<hr>
<!-- <div class="rlist"> -->
<div id="Layer1">
<table style="margin-left: 330px;">
<c:forEach var="ydto" items="${ylist}">
<tr>
<%--  <img src='${root}/images/re.jpg' width=20 height=15> --%>
<td>
<i class="fa fa-address-book-o"></i>
${ydto.id}
</td>
<td>
<i class="fa fa-calendar"></i>
${ydto.yredate }</td>
</tr>
<tr>
<td>
${ydto.content }
</td>
<c:if test="${id==ydto.id}">
<tr>
 <td colspan="3" align="right">
<a href="javascript:yupdate('${ydto.yrenum }','${ydto.content}')">수정</a>
<a href="javascript:ydelete('${ydto.yrenum}')">삭제</a>
</Td>
</tr>

</c:if>
</tr>
</c:forEach>
</table>
</div>
<div class="bottom">
${paging2}
</div>

<hr>

<jsp:include page="list.jsp" flush="false" />
<div>
${paging4}
</div>
</body>
</html> 
