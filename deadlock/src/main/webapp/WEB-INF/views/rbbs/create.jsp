<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">
</head>
<body class="minimal">
<div id="site-border-left"></div>
<div id="site-border-right"></div>
<div id="site-border-top"></div>
<div id="site-border-bottom"></div>

<div class="col-md-10 col-md-offset-1">
	<FORM	name='frm' method='POST' 
		onsubmit = "return incheck(this)"
		action='./create'
		enctype = 'multipart/form-data'
		class="reveal-content">
  <TABLE>
    <TR>
      <TH>분류</TH>
      <TD>
		<select onchange="impot(this.value)" name="imp">
			<option value="V">문의</option>
			<option value="G">건의</option>
			<option value="J">질문</option>
		</select>
      </TD>
    </TR>
    
<!-- 임시방편 -->
    <tr>
    <th>id</th>
    <td><input type="text" name="id" class="form-control"></td>
    </tr>
    
    
<!-- 임시방편 -->

    <TR>
      <TH>Title</TH>
      <TD><input type="text" class="form-control" name="title" placeholder='title'></TD>
    </TR>
    <TR>
      <TH>Content</TH>
      <TD><textarea rows="10" class="form-control" cols="45" name="content" id="content"></textarea></TD>
    </TR>

    <TR>
      <TH>File</TH>
      <TD><input type="file" name="fnameMF"></TD>
    </TR>

    	
  </TABLE>
  <br>
  
  <DIV class='bottom'>
    <button type='submit' class="btn btn-default btn-sm">저장</button>
    <input type='reset' value='다시쓰기' class="btn btn-default btn-sm">
    <input type='button' value='취소' onclick="history.back()" class="btn btn-default btn-sm">
  </DIV>
  <script>
      CKEDITOR.replace( 'content' );
  </script>
  
</FORM>
</div>
</body>
</html>