<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title>

</head>
<body>

<div class="col-sm-8 col-sm-offset-2 section-container-spacer ">
        <div class="text-center">
          <h1 class="h2">CBBS 등록</h1>
        </div>
</div>

<form name='frm' 
	method='post' 
	enctype="multipart/form-data" 
	action='./create'>

   <table class="table table-bordered" style="width:60%; height:50% ;margin:0 auto;">
    
    <TR>
      <TH width="100">미궁 이미지</TH>
      <TD><input type="file" name="filenameMF"></TD>
    </TR>
    <TR>
      <TH>미궁 타이틀</TH>
      <TD><input type="text" name="title" size="30"></TD>
    </TR>
    <TR>
      <th></th>
      <TD>
	      <textarea cols="30" rows="10" name="content"></textarea>
      </TD>
    </TR>
 
    <tr>
    	<th></th>
		<td>
		   <input type="submit" value='등록'>
		   <input type='button' value='취소' onclick="history.back()">
		</td>
    </tr>
  </TABLE>

</form>

</body>
</html>