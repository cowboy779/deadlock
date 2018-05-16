<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript">


 $(document).ready(function(){
        
        $("#content").summernote({
            
            height:300,
            width:800
            
        });
    });

</script>
</head>

<body>
<div class="search">
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



  
    <h2 style="text-align:center;">방명록 작성</h2>
    
    <form name="form1" 
    	  method="post" 
    	  action="./create">
    <table border="1" style="width:800px;" align="center">
        
        <tr>
            <td>작성자</td>
            <td><input name="bname" size="20" value=""></td>
            
        </tr>   
 
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
            <input type="submit" value="확인">
            <input type="reset" value="취소"></td>
        </tr>    
        </table>
    </form>


    <!-- <div style="text-align: center;"> -->
   
    <h2 style="text-align: center;">오예 성공ㄴ</h2>
 
    <div style="text-align:center; width: 600px;">
        게시물수:${listsize}, 
    
    <br>
    
    
    <!-- 컨트롤러에서 redirect 로 넘어오면 앞에 param을 붙여준다. -->
    
    <span style="color:red;">${param.message}</span>
    </div>
 
    <c:forEach var="row" items="${list}">
 
        <!-- 폼이 테이블을 감싼 구조 -->
        <form action="${root}/pbbs/view">
            <!-- 방명록리스트 -->
            <table align="center" border="1" style="width: 600px;">
 
 
                <tr>
                    <td>이름</td>
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
                    <input type="submit" value="수정/삭제">
                  
 
                    </td>
                </tr>
 
            </table>
        </form>
    </c:forEach>
 <DIV class='bottom'>
   ${paging}
  </DIV>
 
</body>
</html>