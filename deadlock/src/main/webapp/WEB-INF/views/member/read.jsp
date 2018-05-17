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
  font-size: 20px;

}
</style> 
<script type="text/javascript">
function mcreate(){
	var url="createForm";
	location.href=url;
}

function mdelete(id){
	var url="deleteForm";
	url+="?id="+id;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}

function pwUpdate(id){
	var url="passwordCheck";
	url+="?id="+id;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}

function infoUpdate(id){
	var url="updateInfoForm";
	url+="?id="+id;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}


function mlist(){
	var url = "../admin/list";
	location.href=url;
}

</script>
</head> 
<body>
 
  <TABLE class="table table-hover" style="width: 60%">
    <tr>
    	<td colspan="2"><img src="${root }/storage_member/${dto.fname }"/></td>
    </tr>
    <TR>
		<TH>id</TH>
		<td>${dto.id }</td>
    </TR>
    <tr>
      <Th>이름</Th>
      <td>${dto.mname }</td>
    </tr>
    <tr>
    	<th>연락처</th>
    	<td>${dto.tel }</td>
    </tr>
    <tr>
    	<th>이메일</th>
    	<td>${dto.email }</td>
    </tr>
    <tr>
    	<th>우편번호</th>
    	<td>${dto.zipcode }</td>
    </tr>
    <tr>
    	<th>주소</th>
    	<td>
    	${dto.address1 }
    	<br>
    	${dto.address2 }
    	</td>
    </tr>
    <tr>
    	<th>직업</th>
    	<td>${util:jobvalue(dto.job) }</td>
    </tr>
    <tr>
    	<th>가입날짜</th>
    	<td>${dto.mdate }</td>
    </tr>
    <tr>
    	<th>등급</th>
    	<td>${dto.grade }</td>
    </tr>
  </TABLE>
  <br>
   <div align="center">
  <c:if test="${(not empty sessionScope.id) && (sessionScope.grade=='A') }">
  	<input type='button' value='목록' onclick="mlist()">
  </c:if>
    <input type='button' value='등록' onclick="mcreate()">
    <input type='button' value='정보수정' onclick="infoUpdate('${dto.id}')">
    <br><br>
  <c:if test="${(not empty sessionScope.id) && !(sessionScope.grade=='A') }">
  <input type='button' value='패스워드변경' onclick="pwUpdate('${dto.id}')">
    <input type='button' value='회원탈퇴' onclick="mdelete('${dto.id}')">
  </c:if>
     <input type='button' value='다운로드'
                onclick="location.href='${root }/download?dir=/storage_member&filename=${dto.fname }'">  
  </DIV>
 
 
</body>
</html> 