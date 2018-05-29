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
td#cl{
	width:80px; 
	height:80px; 
}

.dd,#dd{
	width: 100%;
	height:100%;

	visibility:  visible;
 	opacity:0; 
}


.btn-white{
	background-color:white;
}
</style>

<script type="text/javascript">
var endcnt=0;

var gameText = [

		"짝.짝.짝.<br>",
  		"축하드립니다.<br>",
  		"<br>",
  		"다른 게임도 플레이 해보세요~<Br>",
  		"감사합니다."
  		
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


function aclick(a){
	var f=document.frm;
	f.answer.value+=a;
	
	endcnt+=1;
	if(endcnt==4)
		anscheck();
}

function anscheck(){
	var f2=document.frm;

	
	if(f2.answer.value=='rylbo'){
		$("#game5").hide();
		$("#end").show();
		$("#story").show();
		
		//f2.submit();
		f2.answer.value="";
		
	}else{
		alert("아니야 다시 다시!!!!!!!!!!!!!\r힘내 끝이라구");
		endcnt=0;
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


function keydowncheck(){
	var result=true;
	var keycode=event.keyCode;
	if(123==keycode ||keycode==13||keycode==9){
		result=false;
	}
	return result;
}

</script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>

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
			<h1 class="h2" style="color:white; bottom: 0px; right: 0px;"><span class="glyphicon glyphicon-th-list"></span>#5. soldesk 살인사건-다잉메세지</h1>
		</div>
		</td>
	</tr>
	</table>
</div>
<!-- top 끝 -->
<BR><br><br><br>

<FORM class="w3-container" name='frm' method='POST' action="window.close()">
<div id="game5">
<b style="text-align:center; float:center; font-size:20px; color:lightgrey;">1->2->3->4</b>
  <TABLE style="margin: 0 auto;">
  
  	  <TR>
	      <TD id="cl" style="background-color: yellow; ">
	      	<input class="dd" type="button" name="y" value="y" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: pink; ">
		  	<input class="dd" type="button" name="p" value="p" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: gray; ">
	      	<input class="dd" type="button" name="g" value="g" onclick="aclick(value)">
	      </TD>
		  <TD id="cl" style="background-color: white; ">
		  	<input class="dd" type="button" name="w" value="w" onclick="aclick(value)">
		  </TD>
      </TR>
  	  <TR>
	      <TD id="cl" style="background-color: red; ">
	      	<input class="dd" type="button" name="r" value="r" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: green; ">
	      	<input class="dd" type="button" name="g" value="g" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: orange; ">
	      	<input class="dd" type="button" name="o" value="o" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: lightgray; ">
	      	<input class="dd" type="button" name="lg" value="lg" onclick="aclick(value)">
		  </TD>
      </TR>
  	  <TR>
	      <TD id="cl" style="background-color: hotpink; ">
	      	      	<input class="dd" type="button" name="hp" value="hp" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: lightblue; ">
	      	      	<input class="dd" type="button" name="lb" value="lb" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: blue; ">
	      	      	<input class="dd" type="button" name="b" value="b" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: brown; ">
	      	      	<input class="dd" type="button" name="br" value="br" onclick="aclick(value)">
		  </TD>
      </TR>
  	  <TR>
	      <TD id="cl" style="background-color: beige; ">
	      	<input class="dd" type="button" name="be" value="be" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: lime; ">
	      	<input class="dd" type="button" name="li" value="li" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: #9F81F7; ">
	      	<input class="dd" type="button" name="v" value="v" onclick="aclick(value)">
		  </TD>
	      <TD id="cl" style="background-color: #886A08; ">
	      	<input class="dd" type="button" name="dd" value="dd" onclick="aclick(value)">
		  </TD>
      </TR>
  </TABLE>
</div>
<br>


<div onload="loadText()" id="end" style="text-align: center; display:none; color:white; margin:0 auto;" class="w3-panel w3-green w3-display-container">
	  <span onclick="window.close()"
	  class="w3-button w3-green w3-large w3-display-topright">&times;</span>
	  <h3>Clear!!!</h3>
	  	<p id="story" style="text-align: center; font-size: 15px;">
			
		</p>
</div>

  
  
  
  <!-- bottom -->
  <DIV class='bottom' style="text-align:right; position: fixed; bottom: 5px; right: 5px;" >
  	<table>
  		<tr>
  			<td>
			  	<button class="btn btn-white btn-sm" style="position: fixed; bottom: 5px; left: 5px; font-size:small; text-align: left; " type="button" onclick="gmemo()">memo</button>
			</td>
			<td>
			    <input id="dd" class="form-control btn-color" style="  height:33px;" type="text" name="answer" placeholder="ex)한글답,힌트" readonly>
			</td>
			<td>
				&nbsp;
			    <button id="dd" class="btn btn-white btn-sm" style="font-size:small;" type="button" onclick="anscheck()">submit</button>
			</td>
<!-- 			<td> -->
<!-- 			    <button class="btn btn-white btn-sm" style="font-size:small;" type="reset">reset</button> -->
<!--     		</td> -->
    	</tr>
    </table>
  </DIV>
  <!-- bottom 끝 -->
</FORM>
</body>
<!-- *********************************************** -->
</html>