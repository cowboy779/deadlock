<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title></title> 
<script type="text/javascript">
function mlist(){
	var url="${root}/admin/list";
	location.href=url;
}

function inCheck(){
	var f = document.frm;

	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요");
		f.passwd.focus();
		return;
	}
	
	if(f.repasswd.value==""){
		alert("비밀번호 확인을 입력해주세요");
		f.repasswd.focus();
		
		return;
	}
	
	if(f.passwd.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다");
		f.repasswd.focus();
		
		return;
	}
		f.submit();
}
</script>
</head> 
<body>
<div class="container">
<div align="center">
<c:choose>
	<c:when test="${flag == false }">
	<p class="w3-center">
		<img src="${root}/chat_util/image/apple-icon-180x180.png" style="margin-top: 20px;">
	</p>
		비밀번호가 틀렸습니다.
		<br><input type='button' value='다시시도' onclick='history.back()'>
	</c:when>
	<c:otherwise>
	<p class="w3-center">
		<img src="${root}/chat_util/image/apple-icon-180x180.png" style="margin-top: 20px;">
	</p>
	<h4>비밀번호 변경</h4>
<FORM 	name='frm'
		method='POST'
		action='updatePasswdProc'
		>
		<input type="hidden" name="id" value="${param.id }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
  <TABLE class="table table-hover" style="width: 50%; margin: auto;">
    <TR>
      <TH>아이디</TH>
      <TD>${param.id }</TD>
    </TR>
    <tr>
    	<th>비밀번호</th>
    	<td><input type="password" name="passwd" value=""></td>
    </tr>
    <tr>
    	<th>비밀번호 확인</th>
    	<td><input type="password" name="repasswd" value=""></td>
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input class="w3-button w3-red w3-small" type='button' value='비밀번호 수정' onclick="inCheck()">
    <input class="w3-button w3-black w3-small" type='button' value='목록' onclick="mlist()">
  </DIV>
</FORM>
	</c:otherwise>
</c:choose>
</div>
 </div>
</body>
</html> 