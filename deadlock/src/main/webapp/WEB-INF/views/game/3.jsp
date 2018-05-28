<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body{
	background-image: "${root}/univers/images/maing.png"

}

</style>
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
<div class="hero-full-container background-image-container white-text-container" style="background-image: url('${root }/univers/images/maing.png')">
<h1 class="h2"><b>
<span id="text" style="position:absolute;left:20px; top:50px; width:400px;">
맞출줄 알고있었어요! 이번 문제도 쉬우니까 빨리 다음문제를 풀러가죠!
</span>
</b></h1>

</div>

</body>
</html>