<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
</style> 
</head> 
<body>
 
 
<h2 align="center">비밀번호 확인</h2>
<div align="center">
<FORM name='frm' method='POST' action='updatePasswdForm'>

		<input type="hidden" name="id" value="${param.id }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">

 <input type="password" name="passwd1" value="" required>
 <input type='submit' value='비밀번호 확인'>
</FORM>
</div>
 
</body>
</html> 