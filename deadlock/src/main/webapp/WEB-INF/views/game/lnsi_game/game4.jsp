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
td.tb{
	margin-left:100px;
	//background-image: url('${root}/image/dm4.JPG'); 
	background-repeat:no-repeat; 
	background-position:center; 
	width:400px; 
	height:350px; 

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
		"솔데스크에 다니는 한정환이 살해당했다.<br>",
  		"죽어가며 남긴 메세지는 <b><span style='color:orange;'>'302'</span></b>.<br>",
  		"사건 조사 결과, 용의자는 5명으로 추려졌다.<br>",
  		"<br>",
  		"이민규 : 정환이에게 돈 500만원을 빌린 후 못 갚았다.<Br>",
  		"오정훈 : 정환이와 짝궁. 키보드 소음으로 몸싸움이 있었다.<br>",
  		"안서현 : 정환이의 여자친구. 최근 정환이의 외도를 목격했다.<br>",
  		"이나슬이 : 옆 강의실 학생. 나에 대해 안 좋은 소문을 말하고 다니는 것을 들었다.<br>",
  		"박영부 : 솔데스크 직원. 정환의 실수로 직장에서 해고를 당했다.<br>",
  		"<br>",
  		"과연 용의자들 중 범인은 누굴까?"
  		
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
		

	}else if(f2.answer.value=='박영부,won'||f2.answer.value=='박영부,WON'||f2.answer.value=='박영부,원'||f2.answer.value=='박영부,영'){
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


function keydowncheck(){
	var result=true;
	var keycode=event.keyCode;
	if(123==keycode ||keycode==13||keycode==9){
		result=false;
	}
	return result;
}

</script>
</head>

<body onkeydown="return keydowncheck()" oncontextmenu="return false" ondragstart="return false" onselectstart="return false"  onload="loadText()" style="background-image: url('${root}/image/background.jpg');">
<!-- top -->
<div class="w3-container" >
	<table style="width:100%; margin:0 auto;">
	<tr>
		<td>
		<div style="float:left;">
			<img alt="DeadLock" src="${root}/image/Deadlock.png" style="width:40%;">
		</div>
		<div style="float:right; margin-bottom:0px;">
			<h1 class="h2" style="color:white; bottom: 0px; right: 0px;"><span class="glyphicon glyphicon-th-list"></span>#4. soldesk 살인사건-다잉메세지</h1>
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
<BR><br><br>

<FORM class="w3-container" name='frm' method='POST' action="game5">

  <TABLE>
  
  	  <TR>
	      <TD class="tb">
	      	<img src="${root}/image/dm4-1.JPG" onmouseover="this.src='${root}/image/dm4.JPG'" onmouseout="this.src='${root}/image/dm4-1.JPG'">
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
			</td>
			<td>
			    <input class="form-control btn-color" style="height:33px;" type="text" name="answer" placeholder="ex)한글답,힌트">
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