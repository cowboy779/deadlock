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
		url = url + "?bnum=${dto.ynum}";
		url = url + "&nowPage=${param.nowPage}"
		url = url + "&col=${col}"
		url = url + "&word=${word}"
		url = url + "&flag=../pbbs/read"
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
	
</script>

</head> 
<body>

<div class="bcreate">
	<form name="bform" 
	action="./bcreate" 
	method="post" 
	onsubmit="return input(this)">
	<textarea rows="3" cols="28" name="content"></textarea>	
	<br>
	<input type ="submit" name="bsubmit" value="등록">
	<input type ="hidden" name = "bnum" value="${dto.bnum }">
	<input type ="hidden" name = "col" value="${param.col }">
	<input type ="hidden" name = "word" value="${param.word }">
	<input type ="hidden" name = "nowPage" value="${param.nowPage }">
</form>
</div>


<c:forEach var="bdto" items="${blist}">
<div class="blist">
${bdto.bname}<br>
<p>${bdto.content }</p>
${bdto.bdate }
<c:if test="${id==bdto.id}">
<span style="float:right">
<a href="javascript:yupdate('${bdto.bnum }','${bdto.content}')">수정</a>
<a href="javascript:ydelete('${bdto.bnum}')">삭제</a>
</span>
</c:if>
</div>
</c:forEach>
<div class="bottom">
${paging}
</div>
</body>
</html> 
