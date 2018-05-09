<%@ page contentType="text/html; charset=UTF-8" %> 
<%-- <% --%>
// 		if(dto.getId()==null) dto.setId((String)session.getAttribute("id"));
// 		String fname = dao.getFname(dto.getId());
<%-- %> --%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

</style> 
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
 <div class="w3-white">
<div class="w3-center">

<FORM name='frm' method='POST' action='deleteProc.jsp'>
<%-- <input type="hidden" name="id" value="<%=dto.getId() %>"> --%>
<%-- <input type="hidden" name="fname" value="<%=fname %>"> --%>

<h2>정말 탈퇴 하시겠습니까?</h2><br>
<h4>회원 탈퇴시 복구하실 수 없습니다.</h4>
 

    <input type='submit' class="w3-button w3-black" value='회원탈퇴' onclick="mdelete()">
    <input type='button' class="w3-button w3-red" value='취소' onclick='history.back()'>

 </FORM>
 </div>
 </div>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 