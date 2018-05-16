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

	//중복 실행을 막기 위한 flag값
	var dup_flag = true;
	//시간 설정
	var interval = 500;
	//마지막으로 읽어온 시간을 저장, 그 값을 토대로 읽어오기 위함
	var finalDate = "";
	//계속해서 시간이 초기화 되는 것 방지
	var timeFlag = true;
	//DB의 변화를 캐치하기 위한 변수
	var table_cnt = 0;
	
	
	
var chatManager = new function(){
	
	this.time_Get = function(){
		
		if(!timeFlag){
			return false;
		}else{
			timeFlag = false;
			
			$.post(
				"chat_time",
				"",
				function(data,textStatus){

					var result = eval("("+data+")");
					finalDate = result.realtime;
					chatManager.check();
				}
			)
		}
	}
	
	this.check = function(){
		
		$.post(
			"chat_check",
			"table_cnt="+table_cnt+"&chat_index=${dto.chat_index}",
			function(data,textStatus){
				var result = eval("("+data+")");
				
				if(result.flag=='true'){
					dup_flag = true;
					
					table_cnt = result.count;
					chatManager.show();
				}
			}
			
		)
	}
	
	this.show = function(){
		
		if(table_cnt == 0){
			return false;
		}
		
		$.post(
			"chat_show",
			"table_cnt="+table_cnt+"&chat_index=${dto.chat_index}&finalDate="+finalDate,
			function(data,textStatus){
				var result = eval("("+data+")");
				
				res = data.list;
				alert(res);
				if(data.cflag =='true'){
					chatManager.chat_print();
				}
			}
		)
	}
	
	this.chat_print = function(){
		var o = document.getElementById("list");
		var dt, dd;
		// 채팅내용 추가 하기
			alert(res[0]);
			alert(res[1]);
			
			$.each(res, function(index, list) { // 이치를 써서 모든 데이터들을 배열에 넣음

				var items = [];

				items.push("<td>" + list.nickname + "</td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤
				alert(list.val());
				items.push("<td>" + list.chat_content + "</td>");
				
				$("<tr/>", {

					html : items // 티알에 붙임,

				}).appendTo("table"); // 그리고 그 tr을 테이블에 붙임

			});//each끝



		
			dt = document.createElement("dt");
			dt.appendChild(document.createTextNode());
			o.appendChild(dt);
			
			dd = document.createElement("dd");
			dd.appendChild(document.createTextNode());
			o.appendChild(dd);
		
		//스크롤 가장 아래로 내리기
		o.scrollTop = o.scrollHeight;
		timeFlag = true;
// 		chatManager.time_Get();
	}
	
// 	this.proc = function() {
// 		//중복 방지 플래그 확인
// 		if(!dup_flag){
// 			return false;
// 		}
		
// 		//중복 방지를 위한 false값 할당
// 		dup_flag = false;
		
// 		$.post(
// 			//controller를 이용, 메소드를 호출함과 동시에
// 			//저장 된 date값을 넘겨주면서
// 			//마지막으로 읽어온 date값을 토대로 그 이후의 내용만 읽어온다.
// 			"chat_proc",
// 			"chat_index=${dto.chat_index}",
// 			function(data,textStatus){
// 				var result = eval("("+data+")");
				
// 				//채팅방 primary key를 기준으로 count 쿼리문 실행, 이전의 것과 비교하여 변화가 있다면
// 				//채팅 내용을 새롭게 읽어오기 위함.
// 				table_cnt = result.count;
// 				chatManager.show();
// 			}
// 		)
		
// 	}//proc close
	
	//채팅 내용 및 닉네임을 입력후 서브밋을 하면 누르게 되면, 비동기 통신
	this.write = function(frm) {
		//폼 내의 input 태그 값을 가져오기 위함
		//비동기 통신 요청시 parameter로 보내준다.
		var param = $("#Please_chat").serialize();
		
		//비동기 통신과 동시에 DB에 채팅 내용을 저장한다.
		$.post(
			"chat_write",
			param,
			function(data, textStatus){
				//alert(textStatus);
				
				//JSON data값을 받아온다.				
// 				var result = eval("("+data+")");
				//채팅 내용 비워주기
				$("#msg").val("");
				//채팅내용 갱신을 위한 메소드 호출
				chatManager.check();
			}
		)//post close
		
	}//write close
	
	//정해둔 시간마다 호출
	setInterval(this.time_Get, interval);
	
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
		<input name="nickname" id="nickname" type="text" value="${nickname}" readonly/>
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