<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
function createProc(){
	
	if(!$(':input:radio[name=gender]:checked').val()){
		alert("성별을 선택해주세요");
	}else if(!$(':input:radio[name=age]:checked').val()){
		alert("나이를 선택해주세요");
	}else if(!$(':input:radio[name=content]:checked').val()){
		alert("게임을 선택해주세요");
	}else{
		var parameter = $("[name=frm]").serialize();
		$.post(
			"createProc",
			parameter,
			function(data, textStatus){
				if(data.grade_flag == false){
					alert("게임을 하나이상 클리어하셔야 설문조사를 작성하실 수 있습니다.");
					return false;
				}else{
					if(data.id_flag){
						alert("이미 설문조사를 작성하셨습니다.");
						return false;
					}else{
						result(data);
					}
				}
			}
		)
	}
	
}
function result(res){
	var parameter = {
			num: res.num
	}
	
	$.post(
		"result",
		parameter,
		function(data, textStatus){
			$("#survey").css("display","none");
			$("#result").css("display","");
			var content = "";
			$("#aaa").html("설문완료");
			content += "<tr><th>게임목록: </th><td>다잉메세지,</td></tr>"
			content += "<table><tr><th>총 설문자 수: </th><td>"+data.total+"명</td></tr>";
			content += "<tr><th>투표한 게임: </th><td>"+data.content+"</td></tr>";
			content += "<br><tr><th>비율: </th><td>"+data.percent+"%</td></tr>";
			content += "<br><tr><th>투표한 인원: </th><td>"+data.count+"명 </td></tr>";
			content += "<br><tr><th>남자비율: </th><td>남성: "+data.man_percent+"%</td></tr>";
			content += "<br><tr><th>여성비율: </th><td>여성: "+data.woman_percent+"%</td></tr></table>";
			
			$("#in").html(content);
			alert("V 등급으로 등업되었습니다.");
		}
	)
}

$(function(){
	if(${empty sessionScope.id}){
		alert("로그인 하셔야 이용하실 수 있습니다.")
		location.href="${root}/member/loginForm";
	}
	
})
</script>
</head> 
<body>
	<h1 align="center" class="h2" id="aaa"> 설문조사</h1>
	<div id="survey">
		<form class="w3-container" name="frm" action="createProc" method='POST'>
			<table style="margin: auto;">
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="gender" value="남자">남자</label>
						<label><input type="radio" name="gender" value="여자">여자</label>
					</td>
				</tr>
				<tr>
					<th>연령대</th>
					<td>
						<label><input type="radio" name="age" value="10~20">10~20세</label>
						<label><input type="radio" name="age" value="21~30">21~30세</label>
						<label><input type="radio" name="age" value="31~40">31~40세</label>
						<label><input type="radio" name="age" value="41~50">41~50세</label>
						<label><input type="radio" name="age" value="51세 이상">51세 이상</label>
					</td>
				</tr>
				<tr>
					<th>설문조사</th>
					<td>
						<h2>여러분의 설문이 사이트의 발전에 많은 도움이 됩니다.</h2>
						<h2>당신이 평가하는 최고의 게임은?</h2>
						<br>
						<label><input type="radio" name="content" value="다잉메세지">다잉메세지</label>
						<label><input type="radio" name="content" value="다크솔데스크">다크솔데스크</label>
						<label><input type="radio" name="content" value="도리를찾아서">도리를찾아서</label>
						<label><input type="radio" name="content" value="도레미'솔'">도레미'솔'</label>
						<label><input type="radio" name="content" value="심리테스트">심리테스트</label>
					</td>
				</tr>
			</table>
			<br>
			<button type="button" onclick="createProc()">submit</button>
			<button type="button" onclick="history.back()">cancel</button>
		</form>
	</div>
	
	<div id="result" style="display: none" align="center">
		<div id="in"></div>
		<button type="button" onclick="location.href='${root}'">홈으로</button>
	</div>


</body>
</html> 