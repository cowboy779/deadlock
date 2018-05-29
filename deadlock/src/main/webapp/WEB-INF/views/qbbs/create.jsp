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

<div style=" text-align: center;">
	<h1 class="h2"><span class="glyphicon glyphicon-th-list"></span>게시물 작성</h1>
</div>
<br><br>
<FORM class="w3-container" name='frm' method='POST' enctype="multipart/form-data" onsubmit="return inCheck(this)" action='create'>

<div style=" width:60%; max-width:600px; margin: 0 auto;"> 
  <TABLE class="table table-hover">
    <tr>
  	  <TH>Name</TH>
  	  <td>${id}</td>
    </tr> 
    <TR>
      <TH>Sperate<span style="color:red;">*</span></TH>
      <TD>
      	<div>
      	<select class="form-control" name="qsep" style="width:80px; height:35px;">
      		<option value="0">---선택---</option>
      		<option value="A" selected>질문</option>
      		<option value="B">정답</option>
      	</select>
      	<select class="form-control" name="gamenum" style="width:100px; height:35px;">
      		<option value="0">---선택---</option>
      		<option value="C" selected>Dark Soldesk</option>
      		<option value="D">다잉메세지</option>
      		<option value="E">도레미마켓</option>
      		<option value="F">도리를찾아서</option>
      		<option value="G">심리테스트</option>
      	</select>
      	</div>
      </TD>
    </TR>
    
    <TR>
      <TH>Image</TH>
      <TD>
      	<input class="w3-input w3-border-0" type="file" name="filenameMF" accept=".jpg,.png,.gif">(JPG, PNG, GIF 파일)
      </TD>
    </TR>
    
    <TR>
      <TH>Title<span style="color:red;">*</span></TH>
      <TD>
      	<input class="w3-input w3-border-0" type="text" name="title">
      </TD>
    </TR>
    
    
    <TR>
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
    <input class="btn btn-default btn-sm" style="font-size:small;" type='submit' value='submit'>
    <input class="btn btn-default btn-sm" style="font-size:small;" type='reset' value='reset'>
    <input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='cancel' onclick="history.back()">
  </DIV>
</FORM>
<br>
</body>
</html>