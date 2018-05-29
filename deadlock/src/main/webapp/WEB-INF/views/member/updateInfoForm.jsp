<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title></title> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
 
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;
 
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script> 
<script type="text/javascript">
function emailCheck(email){
		var url="email_form";
		url+="?email="+email;
		
		var wr = window.open(url,"새창이름","width=500, height=500");
		wr.moveTo(((window.screen.width-500)/2),((window.screen.height-500)/2));
}
function emailCheck2(f){
	f.blur();
	alert("이메일을 변경하시려면 \n이메일 중복 확인 버튼을 사용하세요");
}
</script>
</head> 
<body>
<br>
<div style=" text-align: center;">
	<h1 class="h2"><span class="glyphicon glyphicon-th-list"></span>정보 수정</h1>
</div>
<br><br>

<FORM 	name='frm'
		method='POST'
		action='updateInfoProc'
		onsubmit="return incheck(this)"
		enctype="multipart/form-data"
		>
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="col" value="${param.col }">
	<input type="hidden" name="word" value="${param.word }"> 
	<input type="hidden" name="nowPage" value="${param.nowPage }">
	<input type="hidden" name="oldfile" value="${oldfile }">
	<input type="hidden" name="dto" value="${dto}">

<div style=" width:60%; max-width:600px; margin: 0 auto;">

  <TABLE class="table table-hover" >
  <TR>
      <TH>원본파일</TH>
      <TD colspan="2">
      <img src="${root }/storage_member/${oldfile }">
      원본파일명:${oldfile }
      </TD>
    </TR>
    <tr>
    	<th>변경파일</th>
    	<td colspan="2">
    	<input type='file' name='filenameMF' accept=".jpg,.png,.gif" required="required">
    	</td>
    </tr>
    <TR>
      <TH>아이디</TH>
      <TD colspan="2">${dto.id }</TD>
    </TR>
    <tr>
    	<th>닉네임</th>
    	<td colspan="2">
    	<input class="form-control"  style="height:33px; width:200px;" type="text" name="mname" value="${dto.mname }">
		</td>
    </tr>
    <tr>
    	<th>연락처</th>
    	<td colspan="2"><input class="form-control" style="height:33px; width:200px;" type="text" name="tel" value="${dto.tel }"></td>
    </tr>
    <tr>
    	<th>이름</th>
    	<td colspan="2">${dto.mname }</td>
    </tr>
    <tr>
    	<th>이메일</th>
    	<td style="width:225px;">
	    	<input class="form-control" type="text" name="email"
	    	style="width:200px; height:33px; vertical-align:middle" value="${dto.email }" onkeydown="emailCheck2(this)">
	    </td>
	    <td>
	    	<button class="w3-button w3-blue btn-sm" style="font-size:small; vertical-align:middle" type="button" onclick="emailCheck(document.frm.email.value)">이메일 중복 확인</button>
    	</td>
    </tr>
    <tr>
    	<th>우편번호</th>
    	<td colspan="2">
    		<div style="width:20%; float:left;">
	    		<input class="form-control" style="width:80px; height:33px;" size="7" type='text' name='zipcode' id="sample6_postcode" placeholder="우편번호"
		    	value="${dto.zipcode }">
	    	</div>
	    	<div style="width:80%; float:left;">
	    		&nbsp;
	    		<button class="w3-button w3-blue btn-sm" style="font-size:small;" type="button" onclick="sample6_execDaumPostcode()">주소검색</button>
    		</div>
    	</td>
    </tr>
    <tr>
    	<th>주소</th>
    	<td colspan="2">
	    	<input class="form-control"  style="height:33px; width:300px;" type="text" name="address1" size="40" value="${dto.address1 }"
	    	id="sample6_address" placeholder="주소">
	    	<input class="form-control"  style="height:33px; width:300px;" type="text" name="address2" size="40" value="${dto.address2 }"
	    	id="sample6_address2" placeholder="상세주소">
    	</td>
    </tr>
    <tr>
    	<th>직업</th>
    	<td colspan="2">
    	<select name="job" class="form-control" style="height:33px; width:130px;" >
    		<option value="0">선택하세요</option>
    		<option value="A01">회사원</option>
    		<option value="A02">전산관련직</option>
    		<option value="A03">연구전문직</option>
    		<option value="A04">학생</option>
    		<option value="A05">일반자영업</option>
    		<option value="A06">공무원</option>
    		<option value="A07">의료인</option>
    		<option value="A08">법조인</option>
    		<option value="A09">종교/언론/예술인</option>
    		<option value="A10">기타</option>
    	</select>
    	<script type="text/javascript">
    	document.frm.job.value="${dto.job}"
    	</script>
    	</td>
    </tr>
    
  </TABLE>
</div>

<br>
  <div align="center">
    <input class="btn btn-default btn-sm" style="font-size:small;"  type='submit' value='submit'>
    <input class="btn btn-default btn-sm" style="font-size:small;"  type='button' value='cancel' onclick="history.back()">
  </div>
</FORM>
 <br>
 

</body>
</html> 