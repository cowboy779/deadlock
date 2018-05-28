<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<html>
<head>
<title>checkbox관련 연습 </title>
<script language="javascript">
var count=0
function main(){
	msg=text.innerText
	comp=msg.length
	tatata()
}
function tatata(){
	if(count<=comp){
		text.innerText=msg.substring(0,count)
		count++
		setTimeout("tatata()",200)
	}
	else{
		count=0
		var goR = document.getElementById("goR");
		goR.style.backgroundColor="Red";
		alert("이러면 잘보이지않나요?");
	}
}


</script>
</head>
<body onLoad="main()" text="#5c0099">
<div id="goR">
<div class="hero-full-container background-image-container white-text-container">
<h2><b>
<span id="text" style="position:absolute;left:20px; top:50px; width:400px;">
안녕하세요!! 반가워요!!  글씨가 잘 안보이신다구요?
</span>
</b></h2>

</div>
</div>
</body>

</html>