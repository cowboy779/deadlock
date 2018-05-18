<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.d1{
	magin:auto;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
 function c_update(){
	 
	 var param = $("#update_form").serialize();
	 
	 $.post(
		"passwd_check",
		param,
		function(data,textStatus){
			var flag = data.flag;
			
			if(flag == false){
				alert("비밀번호가 틀렸습니다.");
				return false;
			}else{
				real_update(data);
			}
		}
	 
	 )
 }
 function real_update(data){
	 var url ="./view";
	 url += "?bnum="+data.bnum;
	 
	location.href=url; 
 }


 function incheck(f){
		
		
		if(f.bname.value==""){
			alert("작성자를 입력하시요");
			f.title.focus();		
			return false;
		}	
		
		if(f.passwd.value==""){
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			
			return false;
		}
		
		
		if(f.content.value==""){
			alert("내용을 입력하시요");
			f.content.focus();
			
			return false;
		}	
		
		
		
	}
</script>
</head>
<body>
<div class="d1">
    <h2 align="center">방명록 작성</h2>
</div>    
    <form name="form1" 
    	  method="post" 
    	  action="./create"
    	  onsubmit="return incheck(this)">
    <table align="center">
        <thead>
        <tr>
            <td>작성자</td>
            <td><input name="bname" size="20" value=""></td>
            
        </tr>   
 		</thead>
 		
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="passwd" size="20"></td>
            
        </tr>
 
 
        <tr>
            <td colspan="2">
            <textarea name="content" id="content" rows="20" cols="80"></textarea></td>
        </tr>
 
        <tr>
            <td colspan="2">
            <input type='submit' value='등록'>
            <input type="reset" value="취소"></td>
        </tr>    
        </table>
    </form>

    <h2>글 목록</h2>
    <div>
        게시물수:${ylistsize}
    </div>
    <br>
    <c:forEach var="row" items="${ylist}">
        <form action="${root}/pbbs/view" id="update_form">
        
            <!-- 방명록리스트 --> 
            
            <table align="center">
                <tr>
                    <td>작성자</td>
                    <td>${row.bname}</td>
                    <td>날짜</td>
                    <td>${row.bdate}</td>
                </tr>
                <tr>
                    <td colspan="4">${row.content}</td>
                </tr>
                <tr>
 
            <!-- 게시물 번호는 hidden field로 넘김 -->
                    <td colspan="4">비밀번호 
                    <input type="hidden" name="bnum" value="${row.bnum}">
                     <input type="password" name="passwd">                      
                    <input type="button" value="수정/삭제" onclick="c_update()">
                    </td>
                </tr>
            </table>
        </form>
</c:forEach>
 
<br>
 
<div class="search" align="center">
<form action="./list" method="post">
<select name= "col"><!-- 검색할 컬럼 -->
	<option value="bname" 
	<c:if test="${col=='bname'}">
	selected</c:if>
	>작성자</option>
	<option value="content"
	<c:if test="${col=='content'}">
	selected</c:if>
	>내용</option>
	<option value="total">전체출력</option>
</select>

<!-- 검색어 -->
<input type="search" name="word" value="${word}">
<button>검색</button>
</form>
</div> 

<br>
<hr>

 <DIV class='bottom'>
   ${paging3}
  </DIV>
</body>
</html>