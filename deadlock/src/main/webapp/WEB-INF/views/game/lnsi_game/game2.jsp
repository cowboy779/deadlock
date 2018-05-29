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
	background-image: url('${root}/image/4people.jpg'); 
	background-repeat:no-repeat; 
	background-position:center; 
	width:400px; 
	height:700px; 

}

input.dd{
	width: 45px;
	height:52px;
	margin-bottom: 3px;
	margin-top:5px;
	margin-left:1.5px;
	visibility:  visible;
	opacity:0;
	
}

.btn-white{
	background-color:white;
}
</style>

<script type="text/javascript">

var gameText = [
		"솔데스크에서 정전과 함께 살인 사건이 일어났다.<br>",
  		"사건 발생 시간은 6시 30분. 피해자는 17강의실에서 수업을 받던 33살 의사 박영부.<br>",
  		"경찰이 솔데스크에 도착하였을 때는 이미 피해자는 죽은 후였고, <br>",
  		"사인은 목이 졸린 교살이었다.<br>",
  		"조사 결과, 피해자는 부러진 연필을 쥐고 있었으며, <br>",
  		"연필 바로 옆에는 <b><span style='color:yellow;'>'S'</span></b>자라고 쓰여 있었다.<Br>",
  		"이윽고, 용의자로 지목된 4명은 아래와 같은 알리바이를 주장하고 있었다.<br>",
  		"<br>",
  		"1. 이나슬이 (간호사)<br>피해자와 같은 병원에서 일했으며, 현재 17강의실에서 수업을 받고있다.<BR><알리바이 : 저는 그 시간에 자고 있었습니다.><br><br>",
  		"2. 이민규 (의사)<BR>역시 피해자와 같은 병원에서 일했으며, 현재 18강의실에서 수업을 받음.<br><알리바이 : 저는 그 때 TV를 보고 있었어요.><br><br>",
  		"3. 안서현 (아내)<BR>피해자의 아내로, 현재 피해자의 옆 강의실인 16강의실에서 수업을 받는다.<br><알리바이 : 전 그 때 잠깐 편의점에 가서 젤리를 사왔어요.><br><br>",
  		"4. 오정훈 (영화감독)<br>유명한 영화감독으로 피해자와는 친구사이였다. 현재 16강의실에서 수업을 받는다.<br><알리바이 : 전 그 때 산책을 하러 청계천에 갔으며, 그의 부인과 만났었습니다.><br>",
  		"<br>",
  		"과연, 위 용의자들 중 그를 죽인 범인은 누구인가?"
  		
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


function anscheck(){
	var f2=document.frm;

	if(f2.answer.value==""){
		alert("정답을 입력해주세요.");
		f2.answer.focus();
	}else if(f2.answer.value=="힌트"||f2.answer.value=="hint"){
		var hint=document.getElementById('g_hint');
		hint.disabled=false;
		//alert("힌트");
		
	}else if(f2.answer.value=='2,blackout,write'||f2.answer.value=='2,BLACKOUT,WRITE'){
		f2.submit();
		f2.answer.value="";
		
	}else{
		
		alert("정답이 아닙니다.");
		f2.answer.value="";
		f2.answer.focus();
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

function ghint(){
	alert("hint : blackout, write");
}


function keydowncheck(){
	var result=true;
	var keycode=event.keyCode;
	if(123==keycode||keycode==13||keycode==9){
		result=false;
	}
	return result;
}

</script>
</head>

<body onkeydown="return keydowncheck()" oncontextmenu="return false" ondragstart="return false" onselectstart="return false"  onload="loadText()" style="background-image: url('${root}/image/background.jpg');">
<!-- top -->
<div class="w3-container" >
	<table style="width:100%;">
	<tr>
		<td>
		<div style="float:left;">
			<img alt="DeadLock" src="${root}/image/Deadlock.png" style="width:40%;">
		</div>
		<div style="float:right; margin-bottom:0px;">
			<h1 class="h2" style="color:white; bottom: 0px; right: 0px;"><span class="glyphicon glyphicon-th-list"></span>#2. soldesk 살인사건-다잉메세지</h1>
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


<FORM class="w3-container" name='frm' method='POST' action="game3">

  <TABLE>
  
  	  <TR>
	      <TD class="tb">
		  </TD>
	      <TD >
	      	<p id="story" style="color:white; margin-left:10px;">
	      		
	      	</p>
		  </TD>
      </TR>
  </TABLE>

<br>
  
  
  
  
  <!-- bottom -->
  <DIV class='bottom' style="text-align:right; position: fixed; bottom: 5px; right: 5px;" >
  	<table>
  		<tr>
  			<td>
			  	<button class="btn btn-white btn-sm" style="position: fixed; bottom: 5px; left: 5px; font-size:small; text-align: left; " type="button" onclick="gmemo()">memo</button>
				<button id="g_hint" class="btn btn-white btn-sm" style=" position: fixed; bottom: 5px; left: 60px; font-size:small; text-align: left;" type="button" onclick="ghint()" disabled="true">hint</button>
			</td>
			<td>
			    <input class="form-control btn-color" style="height:33px;" type="text" name="answer" placeholder="ex)숫자답,힌트">
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