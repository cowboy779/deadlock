<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title>
<script type="text/javascript">
var hCnt = 0;
function inCheck(f) {
	
	if(f.an.value==""){
		alert("정답을 입력해주세요");
		f.an.focus();
		return false;
	}else if(f.an.value=="없다"){
		alert("축하합니다. 솔데스크 미궁을 탈출하셨습니다.");
		alert("우리 모두같이 취직합시다");
		alert("we go together!!!");
		f.an.focus();
	}else{
		hCnt += 1;
		alert("처단하라 " + hCnt + "명");
		f.an.focus();
		
		
		if(hCnt==3){
			alert("마지막의 마지막문제 입니다. 맞춰주세요.");
			f.an.focus();
		}
		if(hCnt==100){
			alert("100명을 처단! 신기록 달성!");
			f.an.focus();
		}
		
		
		return false;
	}
}//incheck

function keydowncheck()
{
var result = true;
var keycode = event.keyCode;
if(123 == keycode) //F12 키코드
{
result = false;
}
return result;
}

</script>

<style type="text/css">
.con{
	font-size: 13px;
}
.last{
	color: white;
}
</style>

</head>

<body onkeydown="return keydowncheck();" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<div class="last" style="text-align:right;">
없다
</div>
<br><br>


<div class="con" align="center">
	<h2>솔데스크 미스테리를 찾아서</h2>
	<br><br>
	
	<b>마지막 관문이다</b>
	<br><br>
	드디어 어렵게 모든 수강생들이 수료에 가까워져가고 있다.<br>
	그러나 그중에서 누군가가 먼저 취업할 기미이다.<br>
	<br><br>
	
	<br><br><br><br>

	
	<br><br><br><br>
	<p align="center">누구냐, 배신자는?</p>
</div>
	
<form name="frm" 
	onsubmit="return inCheck(this)"
	action="./list"

	style="text-align:center;"
>

  <!-- bottom -->
  <DIV class='bottom' style="text-align:right; position: fixed; bottom: 5px; right: 5px;" >
  	<table>
  		<tr>
			<td>
			    <input class="form-control btn-color" style="height:33px;" type="text" name="an" value="" placeholder="정답을 입력해주세요.">
			</td>
			<td>
				&nbsp;
			    <button class="btn btn-white btn-sm" style="font-size:small;" type="submit" >submit</button>
			</td>
			<td>
			    <button class="btn btn-white btn-sm" style="font-size:small;" type="reset">reset</button>
    		</td>
    	</tr>
    </table>
  </DIV>
  <!-- bottom 끝 -->


</form>


</body>
</html>