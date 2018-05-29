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
	background-image: url('${root}/image/44.jpg'); 
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
		"조심스럽게 문을 열고 나온 정훈<br>",
  		"손목에 찬 시계를 보니 망가졌는지 시침이 가지 않는다<br>",
  		"망가지기전 신호였을까 항상 일정 시간마다 불빛이 반짝이던 시계였는데..<br>",
  		"일단 무시하고 상황을 살피려는 순간<br>",
  		"시계에서 불빛이 반짝인다<br>",  	    
  	    "지금 창봑을 보니 해가 뜨지않았다 아마 편의점에서 정신을 잃은후 얼마 지나지 않은 것 같은데<Br>",
  	    "그렇다면 지금 시간은 몇시일까?<br>",
  	    "다음은 불빛이 났던 시간이다<br><br>",
  	  	"일터 :   <b><span style='color:yellow;'>'01:05'</span></b><br>",
	    "퇴근 :   <b><span style='color:yellow;'>'02:55'</span></b><br>",
	    "편의점 :  <b><span style='color:yellow;'>'04:35'</span></b><br>",
	    "<br><br>"
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
	else if(f2.answer.value!='0605'){
		alert("정답이 아닙니다.");
		alert("힌트: 패턴을 잘봐");
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
			<h1 class="h2" style="color:white; bottom: 0px; right: 0px;"><span class="glyphicon glyphicon-th-list"></span>#Chapter2 - 분석 or 회상</h1>
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
<FORM class="w3-container" name='frm' method='POST' action="game3">

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