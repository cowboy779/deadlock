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
	<h1 class="h2"><span class="glyphicon glyphicon-th-list"></span>게시물 수정</h1>
</div>
<br><br>


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
 
<div style=" width:60%;  margin: 0 auto;">
 <TABLE class="table table-hover">
 	<tr>
 		<td colspan="2" style="border-top-style: hidden;">
 			<b>${dto.id } </b>
 		</td>
 	</tr>
 	<TR>
      <Th>File</Th>
      <TD>
      	<input class="w3-input w3-border-0" type="file" name="fnameMF">
      	기존파일:${dto.fname}
      </TD>
    </TR>
    
 	<TR>
      <Th>Title<span style="color:red;">*</span></th>
      <td>
      	<input class="w3-input w3-border-0" type="text" name="title" value="${dto.title }">
      </TD>
    </TR>
  
    <TR>
      <TD colspan="2" >
      	<textarea id="content" rows="30" cols="30" style="width:100%; height:400px;" name="content">
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
