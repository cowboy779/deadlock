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
	margin-left:50px;
	background-image: url('${root}/image/dm3.JPG'); 
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
		"솔데스크에서 살인 사건이 일어났다.<br>",
  		"피해자는 '이민규', 살해 도구는 칼이었다.<br>",
  		"피해자는 죽기 직전에 <a href='' title='english'><b><span style='color:lightblue;'>'#'</span></b></a>이라는 메세지를 남기고 죽었다.<br>",
  		"이민규와 관련이 있는 인물은 총 5명, 다음은 그들의 알리바이다.<br>",
  		"<br>",
  		"이나슬이 : 어제 전 혼자 술을 먹고 잤어요. 집에서 마셔서 본 사람은 없습니다.<Br>",
  		"오정훈 : 전 가게를 운영해서, 직원들은 다 퇴근시키고 혼자 남아서 정리하다가 집에 갔죠.<br>",
  		"안서현 : 전 어제 부모님 댁에 가서 하룻밤 자고 왔습니다.<br>",
  		"한정환 : 전 친구들과 속초에 놀러갔다 방금 전에 도착했어요.<br>",
  		"박영부 : 어제 민규형을 만나긴 했지만, 저녁만 먹고 헤어졌어요. 그 뒤론 차를 타고 집에 갔죠.<br>",
  		"<br>",
  		"5명의 용의자 중, 이민규를 살해한 범인은 누구인가?"
  		
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
		

	}else if(f2.answer.value=='오정훈,shop'||f2.answer.value=='오정훈,가게'||f2.answer.value=='오정훈,english'){
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
	<table style="width:100%; margin:0 auto;">
	<tr>
		<td>
		<div style="float:left;">
			<img alt="DeadLock" src="${root}/image/Deadlock.png" style="width:40%;">
		</div>
		<div style="float:right; margin-bottom:0px;">
			<h1 class="h2" style="color:white; bottom: 0px; right: 0px;"><span class="glyphicon glyphicon-th-list"></span>#3. soldesk 살인사건-다잉메세지</h1>
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

<FORM class="w3-container" name='frm' method='POST' action="game4">

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