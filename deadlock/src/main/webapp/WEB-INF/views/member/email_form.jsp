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
<style type="text/css"> 
TABLE{
  margin: 0 auto;            /* 테이블 가운데 정렬 */
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
  font-size: 15px;
  border-spacing:0px;
  border-style:none;
  padding:0px;
}

h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}

body {font-family: "Open Sans"}

</style> 
</head> 
<body>
<div class="container">
<p class="w3-center">
		<img src="${root}/chat_util/image/apple-icon-180x180.png" style="margin-top: 20px;">
	</p>
<h4 align="center">이메일 중복 확인</h4>

<FORM name='frm' method='POST' action='email_proc'>
  <TABLE style="margin: auto;">
    <TR>
      <TD>이메일 입력  : <input type="email" name="email" size="20" required></TD>
    </TR>
  </TABLE>
  <p class="w3-center">
    <button class="w3-button w3-red ">중복확인</button>
  <button class="w3-button w3-black" type="button" onclick="window.close()">취소</button>
  
</FORM>
</div>
 
</body>
</html> 