<%@ page contentType="text/html; charset=UTF-8" %> 
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

<FORM name='frm' method='POST' action='deleteProc'>
<input type="hidden" name="id" value="${id }">
<input type="hidden" name="fname" value="${fname }">

<h2>정말 탈퇴 하시겠습니까?</h2><br>
<h4>회원 탈퇴시 복구하실 수 없습니다.</h4>
 

    <input type='submit' value='회원탈퇴' onclick="mdelete()">
    <input type='button' value='취소' onclick='history.back()'>

 </FORM>
 </div>
 </div>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 