<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">
</head>
<body>
<div class="container">
<h2 class="main"><span class="glyphicon glyphicon-th-list"></span>04 : 건의하기</h2>

	<FORM	name='frm' method='POST' 
		onsubmit = "return incheck(this)"
		action='./reply'
		enctype = 'multipart/form-data'>
		
		<input type="hidden" name="rnum" value="${param.rnum }">
		<input type="hidden" name="grpno" value="${grpno }">
		<input type="hidden" name="indent" value="${indent }">
		<input type="hidden" name="ansnum" value="${ansnum }">
  <TABLE>
    <TR>
      <TH>분류</TH>
      <TD>
		<select onchange="impot(this.value)" name="imp">
			<option value="V">문의</option>
			<option value="G">건의</option>
			<option value="J">질문</option>
			<option value="D">답변</option>
		</select>
      </TD>
    </TR>
    
<!-- 임시방편 -->
    <tr>
    <th>id</th>
    <td><input type="text" name="id"></td>
    </tr>
    
    
<!-- 임시방편 -->

    <TR>
      <TH>Title</TH>
      <TD><input type="text" name="title"></TD>
    </TR>
    <TR>
      <TH>Content</TH>
      <TD><textarea rows="10" cols="45" name="content" id="content"></textarea></TD>
    </TR>

    <TR>
      <TH>File</TH>
      <TD><input type="file" name="fnameMF"></TD>
    </TR>

    	
  </TABLE>
  
  <DIV class='bottom'>
    <input class="btn btn-default btn-sm" type='submit' value='summit'>
    <input class="btn btn-default btn-sm" type='reset' value='reset'>
    <input class="btn btn-default btn-sm"  type='button' value='cancel' onclick="history.back()">
  </DIV>
  <script>
      CKEDITOR.replace( 'content' );
  </script>
  
</FORM>
</div>
</body>
</html>