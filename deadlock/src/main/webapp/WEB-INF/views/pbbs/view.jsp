<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

*{ 
/*   font-family: gulim;  */
/*   font-size: 20px;  */
/*   font-family:돋움; */
} 
.textarea{
	border:0px;
}

input[type=button], input[type=submit], input[type=reset]{
    background-color:#555555;;
    border: none;
    color: white;
    text-decoration: none;
}

</style>
<script>
$(function() {
        $("#yyUpdate").click(function() {
 
            alert("성공?");
            //버튼 클릭이벤트
            
            //Controller로 수정할 자료 전송
            document.form1.action = "${root}/pbbs/update";
            document.form1.submit();
 
        });
        
        //삭제하기 
        $("#yyDelete").click(function(){
            
            /* confirm 에서 확인 눌렀을때 true를 리턴한다. */
            
            if(confirm("삭제하시겠습니까?")){
            
                //document.폼 이름 . action = 주소 
            
                //controller로 감 
                document.form1.action ="${root}/pbbs/delete";
                
                document.form1.submit();
            }
            
        });
    });
</script>
 
 
</head>
<body>
<center>
<h2>글 수정/삭제</h2>
</center>
    <!-- //폼의 이름을 써줘야 한다. -->
    <form name="form1">
        <!-- 방명록리스트 -->
        <table align="center" border="1" width="60%">
            <tr>
                <td>이름</td>
                <!-- td에 수정할수 있게 input type 태그를 지정해 줬다. -->
                <td>
                <input name="bname" value="${dto.bname}">
                </td>
                <td>날짜</td>
                <td>${dto.bdate}</td>         
            </tr>
         
            <tr>
                <td colspan="4"><textarea name="content" id="content" rows="15" cols="110">${dto.content}</textarea></td>
            </tr>
            
            <tr>
                <!-- 게시물 번호는 hidden field로 넘김 -->
                <td colspan="4">
                <input type="hidden" name="bnum" value="${param.bnum}"> 
                <input type="button" id="yyUpdate" value="수정"> 
                <input type="button" id="yyDelete" value="삭제">
                </td>
            </tr>
 
        </table>
    </form>
</body>
</html>