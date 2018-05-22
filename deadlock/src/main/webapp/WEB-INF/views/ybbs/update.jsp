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
function incheck(){
	var f = document.frm;
	
	if(f.title.value==""){
		alert("제목을 입력하시요");
		f.title.focus();
		
		return;
	}	
	
	if(f.content.value==""){
		alert("내용을 입력하시요");
		f.content.focus();

		return;
	}	
	f.submit();
}
 
</script>
</head> 

<body>
<div align="center">
<h2>수정</h2>
</div>
<FORM name='frm'
 	  method='POST' 
 	  action='./update'
  	  onsubmit="return incheck(this)"
  	  enctype="multipart/form-data">
  	  
<input type="hidden" name="nowPage" value="${param.nowPage}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="ynum" value="${dto.ynum}">
<input type="hidden" name="oldfile" value="${dto.fname}">
 
 
 <TABLE align="center" width="60%">
  <TR>
      <Td>제목</td>
      <TD>
       <input type="text" name="title" value="${dto.title}"></TD>
    </TR>
  
    <TR>
      <TH>내용</TH>
      <TD>
      	<textarea id="content" rows="300" cols="300" name="content">
      	${dto.content}
      	</textarea>
     
      	<script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'content' );
        </script>
         </TD>
      
    </TR>

<!--     <TR> -->
<!--       <TH>id<TH> -->
<%--       <TD><input type="text" name="id" value="${id}" readonly></TD> --%>
<!--     </TR> -->
 
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="fnameMF">
   	 기존파일:${dto.fname}</TD>
    </TR>
   
  </TABLE>
  
  <DIV class='bottom' style="position: relative; left: 1150px;">
    <input type='button' value='수정' onclick="incheck()">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
</body>

</html> 
