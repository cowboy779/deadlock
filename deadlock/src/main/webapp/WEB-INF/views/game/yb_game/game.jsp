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
	background-image: url('${root}/image/123.jpg'); 
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
		"-여긴 어디지?-<br>",
  		"늦은시각 정훈이가 일을 마치고 잠깐 편의점에 들렀다<br>",
  		"이내 무언가를 사고 집에 가는데 갑자기 정신을 잃었다<br>",
  		"눈을 떠보니 얼마전까지 다녔던 학원 안<Br>",
  		"우선 보이는건 오로지 자물쇠로 굳게 잠긴 문<Br>",
  	    "봒에서 미세하게 발소리가 들리는것으로 보아 큰소리를 내면 안 될것 같다<Br>",
  	    "우선 자물쇠를 풀어야할 것 같은데..<Br>",
  	    "주위를 둘러보니 커다란 액자가 본인다 액자속엔 학원에 다녔던 같은 반 친구들이 모습이 보인다<Br>",
		"이게 왜 이곳에 걸려있는지 모르지만<Br>",
		"사진을 자세히 들여다 보던 정훈 순간 무언가 떠오른듯 다급히 자물쇠 번호를 눌러보는데..<Br>",
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
	else if(f2.answer.value!='1205'){
		alert("정답이 아닙니다.");
		alert("힌트: 제목을 잘 떠올려봐");
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
			<h1 class="h2" style="color:white; bottom: 0px; right: 0px;"><span class="glyphicon glyphicon-th-list"></span>#Chapter1 - 어색했던 그 날</h1>
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