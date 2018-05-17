<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
TABLE{
  margin: 0 auto;            /* 테이블 가운데 정렬 */
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
  font-size: 15px;
  border-spacing:0px;
  border-style:none;
  padding:0px;
}

h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}

body {font-family: "Open Sans"}

</style> 
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
function use(){
	var id = $("#id_form_data").serialize();
	var real_id = id.split('=');
	opener.frm.id.value=real_id[1];
	
	self.close();
}

function id_dup_check(){
	if(document.frm.id.value==""){
		alert("아이디를 입력해주세요");
		document.frm.id.focus();
		return false;
	}
	
	var param = $("#id_form_data").serialize();
	
// 	alert(param);
	
	$.post(
		"id_proc_check",
		param,
		function(data, textStatus){
			//alert(textStatus);
			var result = eval("("+data+")");
			
			duplCheck(result);
		}
	)
}

function duplCheck(result){
	
	if(result.flag=='true'){
		alert("중복된 아이디입니다.");
	}else{
		$("#id_form").css("display","none");
		$("#id_proc").css("display","");
		
		var id = $("#id_form_data").serialize();
		var real_id = id.split('=');
		var real_id_get = real_id[1];
		
		$("#select_id").text("입력한 아이디: "+real_id_get);
	}
}
$(function(){
	 $('.onlyAlphabetAndNumber').keyup(function(event){
		                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
		                        var inputVal = $(this).val();
		                        $(this).val($(this).val().replace(/[^_a-z0-9]/gi,''));
								//_(underscore), 영어, 숫자만 가능
		                    }
		                });
});

</script>
</head>
<body>
<h2 align="center"><span class="glyphicon glyphicon-th-list"></span>아이디 중복 확인</h2>

<div align="center" id="id_form">
<FORM id="id_form_data" name='frm' method='POST'>
      <label>10자 이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다.
      <input type="text" name="id" 
      class="onlyAlphabetAndNumber" size="20" data-rule-required="true" maxlength="10">
      </label>
      
</FORM>
    <button type="button" onclick="id_dup_check()">중복확인</button>
  <button type="button" onclick="window.close()">취소</button>
</div>



<div id="id_proc" align="center" style="display: none">
 		<h3 id="select_id"></h3>
 		<br>
		<input type='button' value='사용' onclick='use()'>
    	<input type='button' value='닫기' onclick="window.close()">
 </div>
 
</body>
</html> 