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

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<title></title> 
<style type="text/css">
TABLE{
  margin: 0 auto;            /* 테이블 가운데 정렬 */
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
  font-size: 20px;
  border-spacing:0px;
  border-style:none;
  padding:0px;
}
.r{
	margin:500px;
}
</style> 
<script type="text/javascript">
function agreement(){
	var url = "${root}/member/agreement";
	location.href=url;
}
</script>
</head> 
<body>
<div class="container">
	<p class="w3-center">
		<img src="${root}/chat_util/image/apple-icon-180x180.png" style="margin-top: 50px; margin-right: 20px;">
	</p>
		
<FORM name='frm' method='POST' action='${root }/member/loginProc'>
  <TABLE>
    <TR>
      <TH>아이디</TH>
      <TD><input type="text" name="id" value='${c_id_val }' required>
      <c:choose>
      	<c:when test="${c_id == 'Y' }">
      		<input type='checkbox' name='c_id' value='Y' checked='checked'> ID저장
      	</c:when>
      	<c:otherwise>
      		<input type='checkbox' name='c_id' value='Y'> ID 저장
      	</c:otherwise>
      </c:choose>
      </TD>
    </TR>
    <tr>
    	<th>비밀번호</th>
    	<td><input type="password" name="passwd" value="" required></td>
    </tr>
  </TABLE>
  <br>
  <p class="w3-center">
	  <button class="w3-button w3-red">로그인</button>
	  <button class="w3-button w3-black" type="button" onclick="agreement()">회원가입</button>
	</p>
</FORM>
 </div>
</body>
</html> 