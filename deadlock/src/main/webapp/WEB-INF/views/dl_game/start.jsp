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
table.tb{
	margin:0 auto; 
	background-image: url('${root}/image/alphabet.JPG'); 
	background-repeat:no-repeat; 
	background-position:center; 
	width:328px; 
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


function aclick(a){
	var f=document.frm;
	f.answer.value+=a;
}

function anscheck(){
	var f2=document.frm;

	if(f2.answer.value==""){
		alert("정답을 입력해주세요.");
		f2.answer.focus();
	}
	else if(f2.answer.value!='start'){
		alert("정답이 아닙니다.");
		f2.answer.value="";
		//f2.answer.focus();
		
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
<body onkeydown="return keydowncheck()" oncontextmenu="return false" ondragstart="return false" onselectstart="return false" style="background-image: url('${root}/image/background.jpg');">
<div class="w3-container" >
	<table style="width:100%;">
	<tr>
		<td>
		<div style="float:left; ">
			<img alt="DeadLock" src="${root}/image/Deadlock.png" style="width:40%;">
		</div>
		<div style="float:right; margin-bottom:0px;">
			<h1 class="h2" style="color:white; bottom: 0px; right: 0px;"><span class="glyphicon glyphicon-th-list"></span>#0. soldesk 살인사건-다잉메세지</h1>
		</div>
		</td>
	</tr>
	</table>
</div>


<br> <br>
<FORM class="w3-container" name='frm' method='POST' action="game">
	<div style="position:absolute; z-index:1; width:95%; height:40%; font-size:15px; text-align: center;" class="w3-panel w3-red w3-display-container">
	  <span onclick="this.parentElement.style.display='none'"
	  class="w3-button w3-red w3-large w3-display-topright">&times;</span>
	  <h3>Rules!</h3>
	  	<p>
			1. 본 게임은 다잉 메세지에 관련된 퀴즈로 구성되어있습니다.<br>
			2. 정답은 하단의 input박스에 작성해주세요.<br>
			3. 문제마다 힌트가 숨겨져있습니다. 힌트를 찾아서 정답과 같이 작성해주세요.<br>
			4. 힌트답은 힌트창에 적힌 그대로가 답일 수도 있고, 아닐 수도 있습니다.<br>
			5. 정답 예시)정답, 힌트답<br>
			6. 왼쪽 하단의 memo창에 작성한 글은 저장할 수 있으니 이용하셔도 좋습니다.<br><br>
			그럼 퀴즈를 시작해볼까요? 창을 닫아주세요.
		</p>
	</div>
	
  <TABLE class="tb" style=" z-index:0;" >
  
  	  <TR>
	      <TD>
		      <input class="dd" type="button" name="a" value="a" onclick="aclick(value)">
		      <input class="dd" type="button" name="b" value="b" onclick="aclick(value)">
		      <input class="dd" type="button" name="c" value="c" onclick="aclick(value)">
		      <input class="dd" type="button" name="d" value="d" onclick="aclick(value)">
		      <input class="dd" type="button" name="e" value="e" onclick="aclick(value)">
		      <input class="dd" type="button" name="f" value="f" onclick="aclick(value)">

		      <input class="dd" type="button" name="g" value="g" onclick="aclick(value)">
		      <input class="dd" type="button" name="h" value="h" onclick="aclick(value)">
		      <input class="dd" type="button" name="i" value="i" onclick="aclick(value)">
		      <input class="dd" type="button" name="j" value="j" onclick="aclick(value)">
		      <input class="dd" type="button" name="k" value="k" onclick="aclick(value)">
		      <input class="dd" type="button" name="l" value="l" onclick="aclick(value)">

		      <input class="dd" type="button" name="m" value="m" onclick="aclick(value)">
		      <input class="dd" type="button" name="n" value="n" onclick="aclick(value)">
		      <input class="dd" type="button" name="o" value="o" onclick="aclick(value)">
		      <input class="dd" type="button" name="p" value="p" onclick="aclick(value)">
		      <input class="dd" type="button" name="q" value="q" onclick="aclick(value)">
		      <input class="dd" type="button" name="r" value="r" onclick="aclick(value)">
		      
		      <input class="dd" type="button" name="s" value="s" onclick="aclick(value)">
		      <input class="dd" type="button" name="t" value="t" onclick="aclick(value)">
		      <input class="dd" type="button" name="u" value="u" onclick="aclick(value)">
		      <input class="dd" type="button" name="v" value="v" onclick="aclick(value)">
		      <input class="dd" type="button" name="w" value="w" onclick="aclick(value)">
		      <input class="dd" type="button" name="x" value="x" onclick="aclick(value)">

		      <input class="dd" type="button" name="y" value="y" onclick="aclick(value)">
		      <input class="dd" type="button" name="z" value="z" onclick="aclick(value)">
	      </TD>
      </TR>
  </TABLE>

<br>
  
  <DIV class='bottom' style="text-align:right; position: fixed; bottom: 5px; right: 5px;" >
  	<table>
  		<tr>
  			<td>
			  	<button class="btn btn-white btn-sm" style="position: fixed; bottom: 5px; left: 5px; textfont-size:small;" style="text-align: left; position: fixed; bottom: 5px; left: 5px;" type="button" onclick="gmemo()">memo</button>
			</td>
			<td>
			    <input class="form-control btn-color" style="height:33px;" type="text" name="answer" readonly>
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
</FORM>
</body>
<!-- *********************************************** -->
</html> 