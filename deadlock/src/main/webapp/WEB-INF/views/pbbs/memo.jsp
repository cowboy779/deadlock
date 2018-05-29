<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">


<title>Insert title here</title>
<script type="text/javascript">
function incheck(){
	
	if(confirm("내용을 txt파일로 저장합니다.")){
		var f=document.frm;
		var resultText = f.content.value;
	
		var hiddenElement = document.createElement('a');
	
		hiddenElement.href = 'data:attachment/text,' + encodeURI(resultText);
		hiddenElement.target = '_blank';
		hiddenElement.download = 'dlgameMemo.txt';
		hiddenElement.click();
	}

	
}


</script>
</head>
<body>
<div style="text-align: center; width:100%; height:60%; margin: 0 auto;"> 

<h2>Memo</h2>
<FORM class="w3-container" name='frm' method='POST' action=''>
  <TABLE class="w3-table">
    <TR>
      <TD>
      	<textarea class="form-control" rows="17" style="width:100%; resize: none;" rows="25" id="content" name="content"></textarea>      
     	
      </TD>
    </TR>
  </TABLE>

<br>
  
  <DIV class='w3-center'>
    <input class="btn btn-default btn-sm" style="font-size:small;" type='reset' value='reset'>
    <button class="btn btn-default btn-sm" style="font-size:small;" type='button' onclick="incheck()">save</button>
    <button class="btn btn-default btn-sm" style="font-size:small;" type='button' onclick="window.close()">close</button>
  </DIV>
</FORM>
 </div>
</body>
</html>