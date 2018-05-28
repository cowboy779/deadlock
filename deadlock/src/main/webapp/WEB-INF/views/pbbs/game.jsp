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
	background-image: url('${root}/image/solclass.jpg'); 
	background-repeat:no-repeat; 
	background-position:center; 
	width:400px; 
	height:357px; 

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
		"솔데스크 학원 교실에 19명의 학생들이 있었다.<br>",
  		"그러던 어느날 자습 시간에 갑자기 정전이 되었고, 순간 비명소리가 들렸다.<br>",
  		"어둠 속에서 신음 소리가 이어졌고, 그 소리는 이내 멈추었다.<br>",
  		"그리고, 정확히 7분 후에 교실에 다시 불이 켜졌다.<Br>",
  		"확인해보니 11번 '이나슬이' 학생이 숨져있었고, ",
  		"그녀의 주변에는 그녀가 죽기 직전에 쓴 것으로 보이는 <b><span style='color:red;'>'LION'</span></b>이라는 핏빛 글자가 있었다.<br>",
  		"그녀의 주변의 학생들이 곧 용의자로 지목 되었다.",
  		"<br><br>",
  		"1. 13번 이민규<br>",
  		"2. 15번 오정훈<br>",
  		"3. 17번 한정환<br>",
  		"4. 20번 박영부<br>",
  		"5. 22번 안서현"
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
	else if(f2.answer.value!='3'){
		alert("정답이 아닙니다.");
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

<body onkeydown="return keydowncheck()" oncontextmenu="return false" ondragstart="return false" onselectstart="return false"  onload="loadText()" style="background-image: url('${root}/image/background.jpg');">
<!-- top -->
<div class="w3-container" >
	<table style="width:100%;">
	<tr>
		<td>
		<div style="float:left; ">
			<img alt="DeadLock" src="${root}/image/Deadlock.png" style="width:40%;">
		</div>
		<div style="text-align:right; margin-bottom:0px;">
			<h1 class="h2" style="color:white; bottom: 0px; right: 0px;"><span class="glyphicon glyphicon-th-list"></span>#1. soldesk 살인사건-다잉메세지</h1>
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
<FORM class="w3-container" name='frm' method='POST' action="game2">

  <TABLE>
  
  	  <TR>
	      <TD class="tb">
	      	<input class="dd" type="button" name="a" style="margin-left:50px;" onclick="aclick()">
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