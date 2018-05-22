<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script src="//cdn.ckeditor.com/4.9.2/basic/ckeditor.js"></script>
<script type="text/javascript">
function incheck(f){
	
	
	if(f.title.value==""){
		alert("제목을 입력하시요");
		f.title.focus();		
		return false;
	}	
	
	if(f.content.value==""){
		alert("내용을 입력하시요");
		f.content.focus();
		
		return false;
	}	
	
}
 
</script>
</head> 

<body>
<div>
<center>
<h2>등록</h2>
</center>
<FORM name='frm'
 	  method='POST' 
 	  action='./create'
  	  onsubmit="return incheck(this)"
  	  enctype="multipart/form-data">
 
 <TABLE align="center" width="60%">
   <TR>
      <Td>제목</td>
      <td>
      <input type="text" name="title"></TD>
        <Td>id
      <input type="text" name="id" value="${id}" readonly></TD>
    </TR>
  
    <TR>
      <Td>내용</Td>
      <TD colspan="2" >
      	<textarea id="content" rows="30" cols="30" name="content">
      	</textarea>
      	<script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace('content');
        </script>
      </TD>
    </TR>

 
    <TR>
      <Td>파일</Td>
      <TD><input type="file" name="fnameMF"></TD>
    </TR>
   
  </TABLE>
  
  <DIV class='bottom' style="position: relative; left: 1150px;">
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </div>
 
</body>

</html> 
