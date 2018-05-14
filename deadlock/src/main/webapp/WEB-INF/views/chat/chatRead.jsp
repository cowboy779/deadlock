<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css">
#list
{
	overflow-y		: scroll;
	width			: 400px;
	height			: 600px;
	margin			: 0;
	padding			: 5px;
	border			: 1px solid #ccc;
	font-size		: 9pt;
	font-family		: 'dotum', '돋움';
}
#list dt
{
	float			: left;
	width			: 100px;
	font-weight		: 700;
}
#list dd
{
	float			: left;
	clear			: right;
	width			: 270px;
	margin			: 0;
	margin-bottom	: 5px;
}
form
{
	width			: 400px;
	padding			: 5px;
	margin-top		: 5px;
	border			: 1px solid #ffdd88;
	background		: #ffffe3;
	font-size		: 0;
}
form input#nickname
{
	width			: 90px;
	margin-right	: 5px;
	padding			: 2px;
	border			: 1px solid #ccc;
	font-size		: 9pt;
	font-family		: 'dotum', '돋움';
}
form input#msg
{
	width			: 240px;
	margin-right	: 5px;
	padding			: 2px;
	border			: 1px solid #ccc;
	font-size		: 9pt;
	font-family		: 'dotum', '돋움';
}
form input#btn
{
	width			: 48px;
	font-size		: 9pt;
	font-family		: 'dotum', '돋움';
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
var chatManager = new function(){
	//중복 실행을 막기 위한 flag값
	var dup_flag	= true;
	//시간 설정
	var interval	= 500;
	//마지막으로 읽어온 시간을 저장, 그 값을 토대로 읽어오기 위함
	var finalDate	= '';
	
	//*******************************************
	//시작하자마자 호출 될 AJAX.
	//이 때엔 현재 시간을 가져와 finalDate에 저장한다.
	//*******************************************
	
	//채팅 내용 가져오기
	this.proc = function() {
		//중복 방지 플래그 확인
		if(!dup_flag){
			return false;
		}
		
		//중복 방지를 위한 false값 할당
		dup_flag = false;
		
		$post(
			//controller를 이용, 메소드를 호출함과 동시에
			//저장 된 date값을 넘겨주면서
			//마지막으로 읽어온 date값을 토대로 그 이후의 내용만 읽어온다.
			"chat_proc",
			param,
			function(data,textStatus){
				var result = eval("("+data+")");
				//호출할 메소드 아마도 show가 될 것.
			}
		)
		
	}//proc close
	
	//채팅 내용 및 닉네임을 입력후 서브밋을 하면 누르게 되면, 비동기 통신
	this.write = function(frm) {
		//폼 내의 input 태그 값을 가져오기 위함
		//비동기 통신 요청시 parameter로 보내준다.
		var param = $("#Please_chat").serialize();
		
		//비동기 통신과 동시에 DB에 채팅 내용을 저장한다.
		$post(
			"chat_write",
			param,
			function(data, textStatus){
				//alert(textStatus);
				
				//JSON data값을 받아온다.				
				var result = eval("("+data+")");
				//채팅 내용 비워주기
				$("#msg").text("");
				//채팅내용 갱신을 위한 메소드 호출
				chatManager.proc();
			}
		)//post close
		
	}//write close
	
	//정해둔 시간마다 호출
	setInterval(this.proc, interval);
	
}//chatManager close

</script>
</head> 
<body>
<h3>방제목: ${dto.chat_title}</h3>
<!-- 로그인 여부를 물은 후, 로그인 한 회원의 채팅 내용은 글자를 굵게 만들어준다. -->
<c:choose>
	<c:when test="${not empty sessionScope.id}">
		<dl id="list" style="font-weight:bold"></dl>
	</c:when>
	<c:otherwise>
		<dl id="list"></dl>
	</c:otherwise>
</c:choose>

<form onsubmit="chatManager.write(this); return false;"
	  name="frm"
	  id="Please_chat">
	  <!-- 로그인 여부를 물어본 이후, 로그인 한 회원이면 닉네임값을 읽어와서 입력 아니라면 새로 등록하도록 해준다. -->
<c:choose>
	<c:when test="${not empty sessionScope.id}">
		<input name="nickname" id="nickname" type="text" value="${dto.chat_nickname}" readonly/>
	</c:when>
	<c:otherwise>
		<input name="nickname" id="nickname" type="text" required="required">
	</c:otherwise>
</c:choose>
	<input name="msg" id="msg" type="text" required="required"/>
	<input name="btn" id="btn" type="submit" value="입력" />
	<input type="hidden" name="chat_index" value="${dto.chat_index }"/>
</form>


</body>
</html> 