<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css">
#list
{
	overflow-y		: scroll;
	width			: 400px;
	height			: 600px;
	margin			: 0;
	padding			: 5px;
	border			: 1px solid #ccc;
	font-size		: 9pt;
	font-family		: 'dotum', '돋움';
}
#list dt
{
	float			: left;
	width			: 100px;
	font-weight		: 700;
}
#list dd
{
	float			: left;
	clear			: right;
	width			: 270px;
	margin			: 0;
	margin-bottom	: 5px;
}
form
{
	width			: 400px;
	padding			: 5px;
	margin-top		: 5px;
	border			: 1px solid #ffdd88;
	background		: #ffffe3;
	font-size		: 0;
}
form input#nickname
{
	width			: 90px;
	margin-right	: 5px;
	padding			: 2px;
	border			: 1px solid #ccc;
	font-size		: 9pt;
	font-family		: 'dotum', '돋움';
}
form input#msg
{
	width			: 240px;
	margin-right	: 5px;
	padding			: 2px;
	border			: 1px solid #ccc;
	font-size		: 9pt;
	font-family		: 'dotum', '돋움';
}
form input#btn
{
	width			: 48px;
	font-size		: 9pt;
	font-family		: 'dotum', '돋움';
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
var chatManager = new function(){
	
	var dup_Flag	= true;
	var interval	= 500;
	var finalDate	= '';
	
	this.write = function(frm)
	{
		var param = $("#Please_chat").serialize();
		
		$post(
			"chat_content",
			param,
		
		)
		
	}
	
	
}

</script>
</head> 
<body>
<h3>방제목: ${dto.chat_title}</h3>
<c:choose>
	<c:when test="${not empty sessionScope.id}">
		<dl id="list" style="font-weight:bold"></dl>
	</c:when>
	<c:otherwise>
		<dl id="list"></dl>
	</c:otherwise>
</c:choose>

<form onsubmit="chatManager.write(this); return false;"
	  name="frm"
	  id="Please_chat">
<c:choose>
	<c:when test="${not empty sessionScope.id}">
		<input name="nickname" id="nickname" type="text" value="${dto.chat_nickname}" readonly/>
	</c:when>
	<c:otherwise>
		<input name="nickname" id="nickname" type="text" required="required">
	</c:otherwise>
</c:choose>
	<input name="msg" id="msg" type="text" required="required"/>
	<input name="btn" id="btn" type="submit" value="입력" />
</form>


</body>
</html> 