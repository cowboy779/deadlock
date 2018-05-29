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

function inCheck(f) {
	if(f.an.value==""){
		alert("정답을 입력해주세요");
		f.an.focus();
		return false;
	}else if(f.an.value=="START"){
		f.an.focus();
	}else{
		alert("스타트라구욧!");
		f.an.focus();
		return false;
	}
}

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
</style>

</head>
<body onkeydown="return keydowncheck();" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

<br><br>

<div class="con" align="center">
<h2>솔데스크 미스테리를 찾아서</h2>
<br><br>

(bgm이 울린다)
<br><br><br><br>

게임을 시작하시려면
<br><br>

<b>Start</b>를 입력해주세요

</div>
	
	
<form name="frm" 
	onsubmit="return inCheck(this)"
	action="./ex2"
	method="POST"
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