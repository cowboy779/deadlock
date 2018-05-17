<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
<script type="text/javascript">
function use(){
	opener.frm.id.value="${param.id}";
	self.close();
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<h2 align="center"><span class="glyphicon glyphicon-th-list"></span>아이디 중복 확인</h2>

 <div align="center">
 <div>입력된 ID:${param.id} <br><br></div>
 
 <c:choose>
	<c:when test="${flag == true }">
		중복되어서 사용할 수 없습니다.<br><br>
		</c:when>
	<c:otherwise>
		중복아님, 사용 가능합니다.<br><br>
		<input type='button' value='사용' onclick='use()'>
	</c:otherwise>
</c:choose>

  
    <input type='button' value='다시시도' onclick='location.href="id_form"'>
    <input type='button' value='닫기' onclick="window.close()">
 </div>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 