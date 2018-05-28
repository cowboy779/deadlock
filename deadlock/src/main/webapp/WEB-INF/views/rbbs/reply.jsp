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
<div class="container" style="width:60%;">
<h2 class="h2"><span class="glyphicon glyphicon-th-list"></span>04 : 건의하기</h2>
<br>
	<FORM	name='frm' method='POST' 
		onsubmit = "return incheck(this)"
		action='./reply'
		enctype = 'multipart/form-data'>
		
		<input type="hidden" name="rnum" value="${param.rnum }">
		<input type="hidden" name="grpno" value="${grpno }">
		<input type="hidden" name="indent" value="${indent }">
		<input type="hidden" name="ansnum" value="${ansnum }">
  <TABLE class="table table-hover">
    <TR>
      <TH>분류</TH>
      <TD>
		<select onchange="impot(this.value)" name="imp">
			<option value="Ans">답변</option>
			<option value="Qes">질문</option>
		</select>
      </TD>
    </TR>
    
    <tr>
    <th>ID</th>
    <td><input type="hidden" name="id" value="${sessionScope.id }">${sessionScope.id }</td>
    </tr>

    <TR>
      <TH>Title</TH>
      <TD><input type="text" class="form-control" name="title"  placeholder='${dto.title }'></TD>
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
    <br>
  
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