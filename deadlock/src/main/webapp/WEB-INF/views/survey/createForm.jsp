<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<title></title> 

<style type="text/css">
.backgroundimg{
	
	background-image: url('${root}/image/space.jpg');
	background-size:100%;
	font-family: monospace, monospace;
	background-position:bottom; 

}
th{
	font-family: Impact, Charcoal, sans-serif;
 	font-size: 15px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
var gameText = [

		"T","h","a","n","k"," ",
		"y","o","u"," ",
		"f","o","r"," ",
		"p","l","a","y","i","n","g"," ",
		"o","u","r"," ",
		"g","a","m","e","!","!"
		
]
	var cnt = 0;
	var speed = 100; //speed
	var timer = null;
	function loadText() {
	document.getElementById('story').innerHTML += gameText[cnt];
	cnt++;
	timer = setTimeout('loadText()',speed);
	if(gameText.length <= cnt){
		clearTimeout(timer); // timer delete
		cnt = 0; 
	}
}

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
			content += "<br><br><br><br><div class='alert alert-warning' style='width:50%; max-width:500px;'>";
			content += "<table class='table table-hover' style=' color:grey;'><tr><th class='w3-wide' style='text-align:right;'>총 설문자 수: </th><td>"+data.total+"명</td></tr>";
			content += "<tr><th class='w3-wide' style='text-align:right;'>투표한 게임: </th><td>"+data.content+"</td></tr>";
			content += "<br><tr><th class='w3-wide' style='text-align:right;'>비율: </th><td>"+data.percent+"%</td></tr>";
			content += "<br><tr><th class='w3-wide' style='text-align:right;'>투표한 인원: </th><td>"+data.count+"명 </td></tr>";
			content += "<br><tr><th class='w3-wide' style='text-align:right;'>남성비율: </th><td>"+data.man_percent+"%</td></tr>";
			content += "<br><tr><th class='w3-wide' style='text-align:right;'>여성비율: </th><td>"+data.woman_percent+"%</td></tr></table></div>";
			
			$("#in").html(content);
			alert("V 등급으로 등업되었습니다.");
		}
	)
}

$(function(){
	if(${empty sessionScope.id}){
		alert("로그인 하셔야 이용하실 수 있습니다.");
		window.close();
		opener.location.href="${root}/member/loginForm?page=/template/gintro";
	}
})

function sclose(){
	opener.location.href= "${root}";
	window.close();
}
</script>
</head> 

<body class="backgroundimg" onload="loadText()">
<br><br>
<div style=" text-align: center; color:white;">
	<h1 class="h2" id="aaa">| Survey |</h1>
</div>
<br>

<div id="survey" style=" width:100%; max-width:500px; margin: 0 auto; background-color: white;">
	<br>
	<div class="h2">
		<p id="story" >
		</p>
             
    </div>
	<br>
		<form class="w3-container" name="frm" action="createProc" method='POST'>
			<table style="margin:0 auto;">
				<tr>
					<th class="w3-wide">Gender<span style="color:red; font-size:20px;">*</span><br></th>
				</tr>
				<tr>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="radio" name="gender" value="남자">남자</label>&nbsp;
						<label><input type="radio" name="gender" value="여자">여자</label>
					</td>
				</tr>
				<tr>
					<th class="w3-wide"><br>Ages<span style="color:red; font-size:20px;">*</span></th>
				</tr>
				<tr>
					<td style="border-bottom-color: grey;">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="radio" name="age" value="10~20">10~20세</label>&nbsp;
						<label><input type="radio" name="age" value="21~30">21~30세</label>&nbsp;
						<label><input type="radio" name="age" value="31~40">31~40세</label>&nbsp;
						<label><input type="radio" name="age" value="41~50">41~50세</label>&nbsp;
						<label><input type="radio" name="age" value="51세 이상">51세 이상</label>
					</td>
				</tr>

				<tr>
					<td>
						<br><br>
						<div class="alert alert-danger" style="width:100%;">
						  <strong class="w3-wide" style="font-size: 20px;">당신이 평가하는 최고의 게임은?<br></strong>
						  <p style="text-align: right;">(여러분의 설문이 사이트의 발전에 많은 도움이 됩니다.)</p><br><br>
							<label><input type="radio" name="content" value="다잉메세지">&nbsp;다잉메세지</label><br>
							<label><input type="radio" name="content" value="다크솔데스크">&nbsp;다크솔데스크</label><br>
							<label><input type="radio" name="content" value="도리를찾아서">&nbsp;도리를찾아서</label><br>
							<label><input type="radio" name="content" value="도레미'솔'">&nbsp;도레미'솔'</label><br>
							<label><input type="radio" name="content" value="심리테스트">&nbsp;심리테스트</label>
						</div>
					</td>
				</tr>
			</table>
			<br>
			<div class="w3-center">
				<button class="btn btn-default btn-sm" style="font-size:small;" type="button" onclick="createProc()">submit</button>
				<button class="btn btn-default btn-sm" style="font-size:small;" type="button" onclick="window.close()">cancel</button>
			</div>

		</form>
		<br>
</div>
		<div id="result" style="display: none" align="center">
			<div id="in"></div>
			<button class="btn btn-default btn-sm" style="font-size:small;"  type="button" onclick="sclose()">home</button>
			<button class="btn btn-default btn-sm" style="font-size:small;"  type="button" onclick="window.close()">close</button>
		</div>
<br>
</body>

</html> 