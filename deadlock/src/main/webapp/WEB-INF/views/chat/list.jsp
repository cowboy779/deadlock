<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css">
.search{
	width:80%;
	margin:2px auto;
	text-align: center;
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
function read(chat_index){
	var url = "chatRead";
	url += "?chat_index="+chat_index;
	url += "&nowPage=${nowPage}";
	url += "&col=${col}";
	url += "&word=${word}";
	
	location.href=url;
}
function create(){
	var url = "chatCreate";
	location.href=url;
}

function cdelete(chat_index){
	
	if(confirm("정말로 채팅방을 삭제하시겠습니까?")){
		
		$.post(
				"deleteProc",
				"chat_index="+chat_index,
				function(data,textStatus){
					if(data.flag){
						var url="delete";
						url += "?chat_index="+chat_index;
						location.href=url;
					}else{
						alert("본인이 생성한 채팅방이 아닙니다.");
						return false;
					}
				}
			)
			
	}else{
		return false;
	}
}

</script>
</head> 
<body>
<div class="search">
<form method="post" action='list'>
<select name="col">
<option value="chat_nickname"
<c:if test="${col == 'chat_nickname' }">selected</c:if>
>이름</option>
<option value="chat_title"
<c:if test="${col == 'chat_title' }">selected</c:if>
>제목</option>
<option value="total">전체</option>
</select>
<input type="search" name="word" value="${word }" required>
<button>검색</button>
</form>
</div>
  <TABLE class="table table-hover" style="margin: auto; width: 30%;">
	   <c:if test="${empty list}">
			    <tr>
			    	<td colspan="4">등록된 게시글이 없습니다.</td>
			    </tr>
	   </c:if>
    <tr>
	  <th>방 번호</th>
      <th>채팅방 제목</th>
      <th>방장</th>
      <c:if test="${not empty sessionScope.id}">
      <th>채팅방 삭제</th>
      </c:if>
    </tr>
<c:forEach var="dto" items="${list }">
    <tr>
      <td>${nowPage}-${i = i + 1 }</td>
       <td id="up"><a href="javascript:read('${dto.chat_index}')">${dto.chat_title}</a></td>
      <td>${dto.chat_nickname}</td>
      <c:if test="${not empty sessionScope.id}">
      <td>
      <a href="javascript:cdelete('${dto.chat_index}')">삭제하기</a>
      </td>
      </c:if>
    </tr>
</c:forEach>
  </TABLE>

<c:if test="${not empty sessionScope.id}">
<div align="center">
<button type="button" onclick="create()">채팅방 생성</button>
</div> 
</c:if>
    <div align="center">
 	${paging}
    </div>


</body>
</html> 