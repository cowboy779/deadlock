<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title></title> 

<script src="//cdn.ckeditor.com/4.9.2/basic/ckeditor.js"></script>
<script type="text/javascript">
function incheck(f){
	
	
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
<FORM name='frm'
 	  method='POST' 
 	  action='./create'
  	  onsubmit="return incheck(this)"
  	  enctype="multipart/form-data">
 
<div style=" width:60%; max-width:600px; margin: 0 auto;">
 <TABLE class="table table-hover">
    <tr>
      <Th>ID</th>
      <td>${id}</Td>
    </TR>
     
    <TR>
      <Th>File</Th>
      <TD><input class="w3-input w3-border-0" type="file" name="fnameMF"></TD>
    </TR>
   
    <TR>
      <Th>Title<span style="color:red;">*</span></th>
      <td>
      	<input class="w3-input w3-border-0" type="text" name="title">
      </TD>
    </TR>
  
    <TR>
      <TD colspan="2" >
      	<textarea id="content" rows="30" cols="30" style="width:100%; height:400px;" name="content"></textarea>
      	<script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace('content');
        </script>
      </TD>
    </TR>


  </TABLE>
  </div>
  <br>
  
  <DIV class='w3-center' >
    <input class="btn btn-default btn-sm" style="font-size:small;" type='submit' value='submit'>
    <input class="btn btn-default btn-sm" style="font-size:small;" type='reset' value='reset'>
    <input class="btn btn-default btn-sm" style="font-size:small;" type='button' value='cancel' onclick="history.back()">
  </DIV>
</FORM>
<br>
</body>

</html> 
