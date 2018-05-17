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
</head> 
<body>
 
<div class="container">

<FORM name='frm' method='POST' action='deleteProc'>
<input type="hidden" name="id" value="${id }">
<input type="hidden" name="fname" value="${fname }">
<p class="w3-center">
	<img src="${root}/chat_util/image/apple-icon-180x180.png" style="margin-top: 50px;">
</p>
			<h3 align="center">
			정말 탈퇴 하시겠습니까?<br>
			회원 탈퇴시 복구하실 수 없습니다.
			</h3>
 			<br>
<p class="w3-center">
    <input class="w3-button w3-red" type='submit' value='회원탈퇴' onclick="mdelete()">
    <input class="w3-button w3-black" type='button' value='취소' onclick='history.back()'>
</p>

 </FORM>
 </div>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 