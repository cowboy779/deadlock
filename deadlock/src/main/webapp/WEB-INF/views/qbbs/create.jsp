<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<title>Insert title here</title>

<script src="//cdn.ckeditor.com/4.9.2/basic/ckeditor.js"></script>
<script type="text/javascript">
function inCheck(f){
	if(f.title.value==""){
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;
	}
	if (CKEDITOR.instances['content'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['content'].focus();
	      return false;
	}
}
</script>
</head>
<body>
<br>

<DIV class="w3-panel w3-border-right w3-border-left w3-border-green" style="width:30%; max-width:200px; margin:0 auto; font-size: x-large; text-align: center;">글 쓰기</DIV>
<br><br>
<FORM class="w3-container" name='frm' method='POST' enctype="multipart/form-data" onsubmit="return inCheck(this)" action='create'>

<div style=" width:60%; max-width:600px; margin: 0 auto;"> 
  <TABLE class="w3-table w3-white w3-bordered">
    <tr>
  	  <TH class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444;">작성자</TH>
  	  <td>${id}</td>
    </tr> 
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444;">게시판 분류<span style="color:red;">*</span></TH>
      <TD>
      	<select name="qsep">
      		<option value="0">---선택---</option>
      		<option value="A" selected>질문</option>
      		<option value="B">정답</option>
      	</select>
      	<select name="gamenum">
      		<option value="0">---선택---</option>
      		<option value="C" selected>1번 게임</option>
      		<option value="D">2번 게임</option>
      	</select>
      </TD>
    </TR>
    
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444;">이미지업로드</TH>
      <TD>
      	<input class="w3-input w3-border-0" type="file" name="filenameMF" accept=".jpg,.png,.gif">(JPG, PNG, GIF 파일)
      </TD>
    </TR>
    
    <TR>
      <TH class="w3-teal w3-text-white w3-wide" style="font-size:15px; text-shadow:1px 1px 0 #444;">제목<span style="color:red;">*</span></TH>
      <TD>
      	<input class="w3-input w3-border-0" type="text" name="title">
      </TD>
    </TR>
    
    
    <TR >
      <TD colspan="2">
      	<textarea id="content" name="content" style="width:100%; height:400px;"></textarea>
      	<script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'content' );
        </script>
      </TD>
    </TR>
    
  </TABLE>
</div>
<br>
  
  <DIV class='w3-center'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='submit' value='등록'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='reset' value='다시쓰기'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>

</body>
</html>