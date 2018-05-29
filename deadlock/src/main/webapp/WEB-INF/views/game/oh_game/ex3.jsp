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
	}else if(f.an.value=="아메리카노"){
		f.an.focus();
	}else{
		hCnt += 1;
		alert("답이아니죠?");
		f.an.focus();
		
		if(hCnt >= 3 ){
			alert("오늘따라 왜이렇게 덥지?");
		}
		
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

<b>(수업이 한창이다)</b>
<br><br>
1. mongoDB 개요
<br><br>
1) 특징<br>
 - 아파치DB는 NoSQL(Not Only SQL)데이터베이스로, JSON(Javascript<br>
   Object Notation) 형태의 데이터로 저장한다.<br>
 - 메이븐과 SQL를 지원하지 않기 때문에 조인(Join)개념이 없고, 스키마는<br>
   유동적이다.<br>
 - 리본도메인의 스키마가 유동적이기 때문에 몽고DB에서 저장하는 데이터 단위가<br> 
   도큐먼트라는 것을 의미한다.<br>
 - 카디널리티DB의 도큐먼트 속성은 SQL처럼 정형화되어 있지 않고,<br> 
   가변적이기 때문에 모든 문서형태가 비정형 데이터를 저장하고<br>
   처리하는데 적합하다.<br>
 - NoSQl방식인 몽고DB는 C++로 작성된 오픈소스 문서지향(Document-Oriented)적<br> 
   Cross-platform 데이터베이스이며, 확장성과 성능이 높다 <br>
<br><br>
으...머리가 엄청아픈데......
<br>
이럴땐





</div>
	
<form name="frm" 
	onsubmit="return inCheck(this)"
	action="./ex4"
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