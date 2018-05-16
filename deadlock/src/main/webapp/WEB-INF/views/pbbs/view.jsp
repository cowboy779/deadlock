<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
 
 
<script>
    
    $(document).ready(function(){
        
        $("#content").summernote({
            
            height:300,
            width:800
            
        });
    });
 
 
 
</script>
 
 
<script>
    $(document).ready(function() {
 
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

    
    
    <!-- //폼의 이름을 써줘야 한다. -->
    <form name="form1">
        <!-- 방명록리스트 -->
        <table align="center" border="1" style="width: 600px;">
 
 
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
                <td colspan="4">
                <textarea name="content" id="content" rows="5" cols="60">
                ${dto.content}</textarea>
                </td>
            </tr>
            
            <tr>
                <!-- 게시물 번호는 hidden field로 넘김 -->
                <td colspan="4">
                <input type="hidden" name="bnum" value="${dto.bnum}"> 
                <input type="button" id="yyUpdate" value="수정"> 
                <input type="button" id="yyDelete" value="삭제">
                </td>
            </tr>
 
        </table>
    </form>
</body>
</html>