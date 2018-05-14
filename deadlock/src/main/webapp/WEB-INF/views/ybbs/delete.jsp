<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
</head> 
<body>

<FORM name='frm' method='POST' action='delete'>
<input type="hidden" name="nowPage" value="${param.nowPage}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="ynum" value="${param.ynum}">
<input type="hidden" name="oldfile" value="${param.oldfile}">
  
  <DIV class='bottom'>
    <input type='submit' value='삭제'>
    <input type='button' value='목록' onclick="location.href='list'">
  </DIV>
</FORM>

</body>

</html> 
