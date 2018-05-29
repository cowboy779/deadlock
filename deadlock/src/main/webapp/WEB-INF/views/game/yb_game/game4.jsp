<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">

<title></title> 
<style type="text/css">
.tb{
	margin-left:50px;
	background-image: url('${root}/image/qqq.jpg');
	background-repeat:no-repeat; 
	background-position:center; 
	width:600px; 
	height:357px; 

}

.tc{
	margin-left:100px;
	background-image: url('${root}/image/www.jpg');
 	background-repeat:no-repeat;  
	background-position:center; 
	width:300px; 
	height:300px; 

}

input.dd{
	width: 45px;
	height:52px;
	margin-bottom: 3px;
	margin-top:5px;
	margin-left:1.5px;
	visibility: visible;
	opacity:0;
	
}

.btn-white{
	background-color:white;
}
</style>

<script type="text/javascript">
var gameText = [
	
		"-뭐야이거-<br>",
  		"소름이 돋은 정훈 쪽지를 무시하고 다시 주위를 살핀다<br>",
  		"용케 데스크까지 온 정훈 데스크엔 사람도 없는데 이상하게 컴퓨터만 켜져있다<br>",
  		"무의식적으로 화면안을 들여다본 스크린안엔<br>",
  		"학원을 다녔던 친구들 10명이 피투성이가 된채 순서대로 앞을 보고있다 성별은 남자5명 여자5명<br>",
  		"앞만보도록 목이 고정된채 남자,여자,남자,여자 순으로 앉아있는데<br>",
  		"범인으로 보이는 형체가 모자 10개를 두고 남자들에겐 빨강,노랑,하얀색 모자를<br>",
  		"여자들에겐 파랑,초록,하얀색,중 하나를 씌우고<br>",
  		"이들 모두에게 모자를 씌우기전 빨간모자 곱하기 파란모자의 수를 알려주었다<br>",
  		"제일 뒤부터말해 자신의 모자색을 맞추면 전원 생존할 수 있다<br>",
  		"이들은 말도할수 없고 사전에 모의를 한적도 없다<br>",
  		"여자를 난쟁이이라 하고 남자를 죄인이라 한다면<br>",
  		"난쟁이5가 쓰고 있던 모자색은 무엇일까?<br>",
  		
  		
]
var cnt = 0;
var speed = 400; //speed
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

function aclick(){
	alert("hint : NUMBER");

}

function anscheck(){
	var f2=document.frm;

	if(f2.answer.value==""){
		alert("정답을 입력해주세요.");
		f2.answer.focus();
	}
	else if(f2.answer.value!='파랑'){
		alert("정답이 아닙니다.");
		alert("경우의 수를 잘생각해봐")
		f2.answer.value="";
		f2.answer.focus();
		
	}else{
		f2.submit();
	}
	
}

function gmemo(){
	var url="./memo";
	wr=window.open(url,"메모장","width=500,height=600");
	wr.moveTo((window.screen.width-500)/100,(window.screen.height-400)/2);
	document.focus();
}

function back(){
	history.back();
	var f2=document.frm;
	f2.answer.value=="";
	f2.answer.focus();
	
}

function keydowncheck(){
	var result=true;
	var keycode=event.keyCode;
	if(123==keycode||keycode==13){
		result=false;
	}
	return result;
}
</script>
</head>

<body onkeydown="return keydowncheck()" oncontextmenu="return false" ondragstart="return false" onselectstart="return false"  onload="loadText()" style="background-image: url('${root}/image/1234.jpg');">
<!-- top -->
<div class="w3-container" >
	<table style="width:100%;">
	<tr>
		<td>
		<div style="float:left; ">
			<img alt="DeadLock" src="${root}/image/Deadlock.png" style="width:40%;">
		</div>
		<div style="text-align:right; margin-bottom:0px;">
			<h1 class="h2" style="color:white; bottom: 0px; right: 0px;"><span class="glyphicon glyphicon-th-list"></span>#Chapter4 - 우물안의 개구리</h1>
			<br>
			<a href="javascript:back()">
				<i class="fa fa-arrow-circle-left" style="font-size:48px;color:red; float: right;"></i>
			</a>
		</div>
		</td>
	</tr>
	</table>
</div>
<!-- top 끝 -->


<br> <br>
<FORM class="w3-container" name='frm' method='POST' action="game5">

  <TABLE>
  
  	  <TR>
	      <TD class="tb">
	      	<input class="dd" type="button" name="a" style="margin-left:50px;" onclick="aclick()">
		  </TD>
		  <td class="tc">
		  </td>
	
	      <TD >
	      	<p id="story" style="color:white; margin-left:10px;">
	      	</p>
		  </TD>
		  </tr>
  </TABLE>

<br>
  
  
  
  
  <!-- bottom -->
  <DIV class='bottom' style="text-align:right; position: fixed; bottom: 5px; right: 5px;" >
  	<table>
  		<tr>
  			<td>
			  	<button class="btn btn-white btn-sm" style="position: fixed; bottom: 5px; left: 5px; textfont-size:small;" style="text-align: left; position: fixed; bottom: 5px; left: 5px;" type="button" onclick="gmemo()">memo</button>
			</td>
			<td>
			    <input class="form-control btn-color" style="height:33px;" type="text" name="answer" placeholder="숫자로 입력해주세요.">
			</td>
			<td>
				&nbsp;
			    <button class="btn btn-white btn-sm" style="font-size:small;" type="button" onclick="anscheck()">submit</button>
			</td>
			<td>
			    <button class="btn btn-white btn-sm" style="font-size:small;" type="reset">reset</button>
    		</td>
    	</tr>
    </table>
  </DIV>
  <!-- bottom 끝 -->
</FORM>
</body>
<!-- *********************************************** -->
</html>