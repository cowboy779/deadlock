<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
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
	var url = "./delete";
	url += "?ynum=${dto.ynum}";
	url += "&oldfile=${dto.fname}";
	url += "&col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
		
	location.href=url;
}

function yyupdate(ynum){
	var url ="./update";
	url += "?ynum="+ynum;
	url += "&col=${param.col}"; 
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
}
</script>

</head> 
<body>
 
<DIV class="title">조회</DIV>
 
  <TABLE>
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
     <textarea id="content" rows="100" cols="100" name="content">
     ${content }
      	</textarea>
    </td>
    </tr>
  </TABLE>

<DIV>
   <input type='button' value='수정' onclick="yyupdate('${dto.ynum}')">
   <button id = "button" onclick="del()">삭제</button>
</DIV>

<hr>

<div class="ycreate">
	<form name="yform" 
	action="./ycreate" 
	method="post" 
	onsubmit="return input(this)">
	<textarea rows="3" cols="28" name="content"></textarea>	
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


<c:forEach var="ydto" items="${ylist}">
<div class="ylist">
${ydto.id}<br>
<p>${ydto.content }</p>
${ydto.yredate }
<c:if test="${id==ydto.id}">
<span style="float:right">
<a href="javascript:yupdate('${ydto.yrenum }','${ydto.content}')">수정</a>
<a href="javascript:ydelete('${ydto.yrenum}')">삭제</a>
</span>
</c:if>
</div>
</c:forEach>
<div class="bottom">
${paging}
</div>

</body>
</html> 
