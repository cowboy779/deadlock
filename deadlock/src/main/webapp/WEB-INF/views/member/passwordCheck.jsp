<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
<script type="text/javascript">


</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
 
 <div class="w3-white">
<div class="w3-center">
<h2>비밀번호 확인</h2>
<FORM name='frm' method='POST' action='updatePasswdForm.jsp'>


		<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
		<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
		<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
		

 <input type="password" name="passwd1" value="" required>
 <input class="w3-button w3-red" type='submit' value='수정하러가기'>
</FORM>
 
 </div>
 </div>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 