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

</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
function use(){
 opener.frm.email.value="${param.email}";
 self.close();
}
function emailCheck(){
	//여기서 proc내에서 자체적으로 비동기통신 요청후 코드값 발송,
	//그 값을 입력시 받아와서 메소드 호출
	//flag 값 받아와서 트루면 사용, false면 다시시도
	
	var param = $("#checkEmail_form").serialize();
	
	//alert(param);
	
	$.post(
		"email_proc_send",
		param,
		function(data, textStatus){
			//alert(textStatus);
			var result = eval("("+data+")");
			
			sendMail(result);
		}
	)
	
}

function sendMail(result){
	var url = "sendMail";
	url+="?from="+result.from;
	url+="&to="+result.to;
	url+="&subject="+result.subject;
	url+="&content="+result.content;
	
	var ww = window.open(url,"코드발송","width=500, height=500");
	ww.moveTo(((window.screen.width-500)/2),((window.screen.height-500)/2));
	
	display_choose();
}

function display_choose(){
	
			$("#pass").css("display","none");
			$("#se").css("display","");
}

 function check_m(){
 	var emailcode = $("#ch_mail_code").val();
	var checkcode = ${code};
	
	if(checkcode==emailcode){
	$("#se").css("display","none");
	$("#check_success").css("display","");
	}else{
		alert("인증코드를 잘못 입력하셨습니다. \n 확인후 다시 입력해주세요.");
		return false;
	}
}

</script>
</head>
<body>
<div class="container">
	<p class="w3-center">
		<img src="${root}/chat_util/image/apple-icon-180x180.png">
	</p>
	<h3 align="center">이메일 중복 확인</h3>
	<p class="w3-center">
	입력된 Email:${param.email }<br><br>
 	</p>
	<c:choose>
		<c:when test="${flag == true }">
		<div align="center">
			중복되어서 사용할 수 없습니다.<br><br>
		    <button onclick="location.href='email_form'">다시시도</button>
		</div>
		</c:when>
		<c:otherwise>
	<div id="pass" align="center">
			중복아님, 사용 가능합니다.<br><br>
			<button class="w3-button w3-red" id='email_btn' onclick='emailCheck()'>이메일 인증코드 발송</button>
  			<button class="w3-button w3-black" id="btnclose" type="button" onclick="window.close()">닫기</button>
	</div>
		</c:otherwise>
	</c:choose>
 
 
 
 
 <div id="se" align="center" style="display: none;">
		발송된 코드를 입력해주세요.
<form id="checkEmail_form" action="sendMail" method="post">

<input type="hidden" name="from" value="deadlock7683@gmail.com">
<input type="hidden" name="to" value="${param.email }">
<input type="hidden" name="subject" value="메일 검증 코드">
<input type="hidden" id="mail_code" name="content" value="코드 인증창에 아래의 코드를 입력해주세요.<br>${code}">

<input type="text" id="ch_mail_code">
<button class="w3-button w3-red" type="button" id="check_try" onclick="check_m()">이메일 인증</button>
</form>
</div>


<div id="check_success" align="center" style="display: none;">
이메일 인증이 완료되었습니다.<br>
<button class="w3-button w3-red" type="button" onclick="use()">사용</button>
</div>
</div>
</body>
</html> 