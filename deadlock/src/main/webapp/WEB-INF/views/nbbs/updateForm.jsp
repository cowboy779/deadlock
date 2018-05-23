<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 수정</title>
<style type="text/css">
TH{
	width:20%;
	font-size: 12px;
	text-align: left;

}
TD{
	width : 100%;
	height:100%;
	text-align: center;
	padding-bottom: 5px;
	
}
Table{
	font-size : 14px;
	text-align: center;
	width: 40%;	
	margin: auto;
	
}

caption{
	font-size : 20px;
	text-align: left;
	padding-top: 50px;
	padding-bottom: 5px;
}
.rel{
	position: relative;	
	text-align: center;
	width: 45%;
	margin: auto;
	padding-top: 50px;
	
}
.ab{
	position: absolute;
	right: 10px;
	bottom : -15px;
}


</style>
</head>
<body>

	<div class="rel">
	<form name="frm" action="./update" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="nnum" value="${dto.nnum }">
	<table>
		<caption>공지사항 수정</caption>
		<tr>
		<th>
		<select>
			<option>이벤트</option>
			<option>점검</option>
			<option>알림</option>
		</select>
		</th>
		</tr>
		<tr>
		<td><input type="text" name="title" size="102" value="${dto.title }" ></td>
		</tr>

		<tr>
		<td><textarea cols="100" rows="30" name="content">${dto.content }</textarea></td>
		</tr>

	</table>
	
	<table style="border: 1px solid #ededef; width: 97%;">
		<tr style="text-align: left;">
		<th  style="background-color: #ededef; width: 20%; text-align:left;">알림</th>
		<td   style="text-align: left; font-size: 12px;">
		<input type="radio" name="alert" checked="checked"/>알림 없음
		<input type="radio" name="alert"/>메일 알림
		</td>
		</tr>
	
		<tr style="text-align: left;">
		<th  style="background-color: #ededef; width: 20%; text-align:left;">수정자 </th>
		<td   style="text-align: left; font-size: 12px;">
		<input type="text" name="corname" size="30px" value="">
		<input type="file" name="fnameMF">${dto.fname }
		</td>
		</tr>
	
	
	</table>
	
	<div class="ab">
	<input type="submit" value="등록">
	</div>
	</form>
	
</div>
</body>
</html>