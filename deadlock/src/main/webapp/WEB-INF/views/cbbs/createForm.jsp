<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title>


</head>
<body>

<div class="col-sm-8 col-sm-offset-2 section-container-spacer ">
        <div class="text-center">
          <h1 class="h2">Recommend</h1>
        </div>
</div>

<form name='frm' 
	method='post' 
	enctype="multipart/form-data" 
	action='./create'>

   <table class="table table-horver" style="width:60%; height:50% ;margin:0 auto;">
    
    <TR>
      <TH width="130">Labyrinth Image</TH>
      <TD><input type="file" name="filenameMF"></TD>
    </TR>
    <TR>
      <TH>Title</TH>
      <TD><input type="text" name="title" size="30" required="required"></TD>
    </TR>
    <TR>
      <th></th>
      <TD>
	      <textarea cols="30" rows="10" name="content" required="required"></textarea>
      </TD>
    </TR>
 
    <tr>
    	<th>URL</th>
		<td>
		   <input type="text" name="urllink" size="30" value="http://">

		</td>
    </tr>
    <tr>
    	<th></th>
		<td>
		   <input type="submit" value='submit' class="btn btn-default btn-sm" style="font-size:small;">
		   <input type='button' value='cancle' onclick="history.back()" class="btn btn-default btn-sm" style="font-size:small;">
		</td>
    </tr>
  </TABLE>

</form>
<br>

</body>
</html>