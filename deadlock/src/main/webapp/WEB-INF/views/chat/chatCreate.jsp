<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${root}/chat_util/css/main.3f6952e4.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
var create = new function(){
	
	this.check = function(frm){
		
		$.post(
				"room_check",
				"",
				function(data, textStatus){
					
					if(data.room_flag == true){
						alert("채팅방은 1인당 한개만 생성하실 수 있습니다.");
						return false;
					}else{
						var url = "chatCreateProc";
						url += "?"+$("#form_id").serialize();
						location.href=url;
					}
				}
			)
	}
	
}
</script>
</head>
<body>
<form   name='frm'
		method='POST'
		onsubmit='create.check(this); return false;'
		id="form_id"
		>
<!-- 		action='chatCreateProc' -->
		<input type="hidden" name="id" value="${sessionScope.id}"/>
<table style="margin: auto; width: 60%;" class="table table-hover">
	<tr>
		<th>방장 이름</th>
		<td><input type="text" name="chat_nickname" size="20" value="${chat_nickname}" readonly></td>
	</tr>
	<tr>
		<th>채팅방 제목</th>
		<td><input type="text" name="chat_title" size="20" required="required"></td>
	</tr>
</table>
	<div align="center">
	<button>채팅방 생성</button>
	</div>
</form>
	

</body>
</html>