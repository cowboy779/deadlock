<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapais.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.9.2/basic/ckeditor.js"></script>

<title>Insert title here</title>

<script type="text/javascript">

function qdelete(qnum,fname){
	if(confirm("댓글이 달려있는 글입니다. 정말 삭제하시겠습니까?")){
		var url="./delete";
		url+="?qnum="+qnum;
		url+="&oldfile="+fname;
		url+="&col=${col}";
		url+="&word=${word}";
		url+="&nowPage=${nowPage}";
		
		location.href=url;
	}
}

function qcreate(){
	var url="create";
	url+= "?col=${col}";
	url+= "&word=${word}";
	url+= "&nowPage=${nowPage}";
	location.href=url;
}

function qupdate(){
	var url="update";
	url+="?qnum=${qnum}";
	url+= "&col=${col}";
	url+= "&word=${word}";
	url+= "&nowPage=${nowPage}";
	location.href=url;
}

function qlist(){
	var url="list";
	url+= "?col=${col}";
	url+= "&word=${word}";
	url+= "&nowPage=${nowPage}";
	location.href=url;
}

function qrupdate(qrnum, qrcontent){
	var f=document.rform;
	f.content.value=qrcontent;
	f.qrenum.value=qrnum;
	f.rsubmit.value="수정";
	f.action="./rupdate";
}

function qrdelete(qrnum){
	if(confirm("정말 삭제하시겠습니까?")){
		var url="./rdelete";
		url+="?qrnum="+qrnum;
		url+="&qnum=${dto.qnum}";
		url+="&nowPage=${param.nowPage}";
		url+="&col=${param.col}";
		url+="&word=${param.word}";
		url+="&nPage=${nPage}";
			
		location.href=url;
	}
}

function upCheck(f){
	if(f.filenameMF.value==""){
		if(confirm("사진 변경이 되지 않았습니다.\n사진을 변경하시려면 '확인'을 \n그대로 사용하시려면 '취소'를 눌러주세요.")==true){
		f.filenameMF.click();
		return false;
		}
	}
	
	if (CKEDITOR.instances['content'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['content'].focus();
	      return false;
	}
}

function imgfile(){
	document.frm.filenameMF.click();
	document.frm.text1.value=document.frm.filenameMF.value;
}
</script>
</head>
<body>

<br>
<DIV class="w3-panel w3-border-right w3-border-left w3-border-green w3-wide" style="width:30%; max-width:200px; margin:0 auto; font-size: x-large; text-align: center;">글 수정</DIV>
<br><br>

<FORM class="w3-container" name='frm' method='POST' enctype="multipart/form-data" onsubmit="return upCheck(this)" action='updateProc'>
<input type="hidden" name="qnum" value="${qnum }">
<input type="hidden" name="oldfile" value="${fname }">
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage}">

	<div class="w3-card-4" style="width:60%; max-width:400px; margin: 0 auto;">
		<p style="text-align: left">${dto.id }(${dto.qcount })</p>
		
		<input type="file" name="filenameMF" style="display:none;">
		<input type="hidden" name="text1" size="10" >
		<a href="javascript:imgfile();">
		<img src="${root }/storage_qbbs/${dto.fname}" style="width:100%; display:block;  height: auto;" ></a>
	
	    <div class="w3-container">
	      <h4><b><input class="w3-input w3-border" type="text" name='title' value='${dto.title }' style="width:100%;"></b></h4>
	      <span class="glyphicon glyphicon-pencil"></span> 
	      <p>
	      <textarea name="content" id="content" style="width:100%; height:100px;">${content }</textarea>
	      <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'content' );
          </script>
	      </p>
	    </div>
	<p style="text-align: right;">${dto.qdate }</p>
	</div>

<br><br>
  
  <DIV class='w3-center'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='submit' value='수정'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='reset' value='다시쓰기'>
    <input class="w3-button w3-round-large w3-padding-small w3-teal" type='button' value='취소' onclick="history.back()">
  </DIV>

</FORM>


</body>

</html>