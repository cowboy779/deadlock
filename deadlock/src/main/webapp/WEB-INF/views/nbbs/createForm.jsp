<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
TH{
	width:10%;
	font-size: 12px;
	text-align: left;

}
TD{
	width : 100%;
	height:100%;
	text-align: center;
	padding-bottom: 5px;
	font-size: 12px;
	
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
	/* border: 1px solid; */
}
.ab{
	position: absolute;
	right: 10px;
	bottom : -25px;
}


</style>
<script type="text/javascript">
function incheck(f){
	
	if(f.title.value=="") { 
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false; 
	}
 	if(f.content.value=="") { 
		alert("내용을 작성해주세요.");
		f.content.focus();
		return false; 
	} 
	if(f.noname.value=="") { //폼의 인풋태그를 name으로 가져온다.
		alert("작성자를 입력해주세요.");
		f.noname.focus();
		return false; // 그대로 멈춰라. submit되지 말고.
	}
}
</script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>


	<div class="rel">
	<form name="frm" action="./create" method="POST" onsubmit="return incheck(this)" enctype="multipart/form-data">
	<table>
		<caption>공지사항 등록</caption>
		<tr>
		<th>
		<select name="category">
			<option value="공지">공지</option>
			<option value="이벤트">이벤트</option>
			<option value="점검">점검</option>
		</select>
		</th>
		</tr>
		<tr>
		<td><input type="text" name="title" placeholder="제목을 입력하세요" size="102" value="" ></td>
		</tr>

		<tr>
		<td><textarea cols="100" rows="20" id="content" name="content" placeholder="공지사항을 입력하세요." value=""></textarea></td>
		</tr>
		
	</table>
	
<!-- 	<div id="testNfile" contentEditable="true">
	 대표 이미지를 텍스트와 함께 입력이 가능
	</div> -->
	
	
	<table style="border: 1px solid #ededef; width: 97%;">
		<tr style="text-align: left;">
		<th  style="background-color: #ededef; width: 20%; text-align:left;">알림</th>
		<td   style="text-align: left; font-size: 12px;">
		<input type="radio" name="alert" checked="checked"/>알림 없음
		<input type="radio" name="alert"/>메일 알림
		</td>
		</tr>
		
		<tr style="text-align: left;">
		<th  style="background-color: #ededef; width: 20%; text-align:left;">작성자 </th>
		<td   style="text-align: left; font-size: 12px;">
		<input type="text" name="noname" size="30px" value="">
		</td>
		
		<tr style="text-align: left;">
		<th  style="background-color: #ededef; width: 20%; text-align:left;">첨부 파일 </th>
		<td   style="text-align: left; font-size: 12px;">
		<input type="file" id="nfile" name="fnameMF" onchange="javascript:fileUpload(this)">		
		</td>
	
		</tr>
	
	</table>
	
	<div class="ab">
	<input type="submit" value="등록">
	</div>
	</form>

</div>

<script type="text/javascript">

function fileUpload() {
	var fileValue = $("#nfile").val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명
 	var cont = document.getElementById('content');
 	var testNfile = document.getElementById('testNfile');
	cont.focus();
	cont.value += '<br><img alt="" src="${root}/storage/' + fileName +'" /><br>';
	testNfile.append('<img alt="" src="${root}/storage/0000.jpg" >');
	alert($("content").value);
	
	cont.focus();
}
</script>



</body>
</html>