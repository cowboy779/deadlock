<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
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
<div align="center">
<c:choose>
	<c:when test="${flag == false }">
		비밀번호가 틀렸습니다.
		<br><input type='button' value='다시시도' onclick='history.back()'>
	</c:when>
	<c:otherwise>
	<DIV>비밀번호 변경</DIV>
<FORM 	name='frm'
		method='POST'
		action='updatePasswdProc'
		>
		<input type="hidden" name="id" value="${param.id }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
  <TABLE style="width: 60%; margin: auto;">
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
    <input type='button' value='비밀번호 수정' onclick="inCheck()">
    <input type='button' value='목록' onclick="mlist()">
  </DIV>
</FORM>
	</c:otherwise>
</c:choose>
</div>
 
</body>
</html> 