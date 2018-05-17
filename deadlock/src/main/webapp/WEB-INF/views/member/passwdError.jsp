<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title></title> 
</head>
<body>
<div align="center" class="container">
<p class="w3-center">
		<img src="${root}/chat_util/image/apple-icon-180x180.png" style="margin-top: 20px;">
	</p>
<h4 align="center">로그인 확인</h4>
		아이디/패스워드를 잘못 입력하셨거나<br>
	 	아이디가 존재하지 않습니다. 회원가입 하셔야 합니다.
</div>
<div align="center">
    <input class="w3-button w3-red w3-small" type='button' value='다시시도' onclick="history.back()">
    <input class="w3-button w3-black w3-small" type='button' value='회원가입' onclick="location.href='./agreement'">
</div>
</body>
</html>