<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript">
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
	}
}




</script>
</head>
<body onLoad="main()">
<div class="hero-full-container background-image-container white-text-container">
<h1 class="h2"><b>
<span id="text" style="position:absolute;left:20px; top:50px; width:400px;">
마지막까지 잘오셨네요!
방금 적은 정답이 마지막 정답이였어요! 잘가요!
</span>
</b></h1>

</div>

</body>
</html>