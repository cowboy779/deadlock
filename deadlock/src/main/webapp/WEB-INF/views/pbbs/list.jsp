<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 *{  
   font-family: gulim;  */
   font-size: 10px;  */
 }  

.table{
	width: 60%;	
	margin: 0 auto;
}

.line{border-bottom:1px solid black;}

input[type=button], input[type=submit], input[type=reset]{
    background-color:#555555;;
    border: none;
    color: white;
    text-decoration: none;
}


#d1{ 
 	position: relative; 
 	left:490px; 
 	color:blue; 
 	font-size:1em;
 } 
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				var url ="./view";
				 url += "?bnum="+data.bnum;
				 
				location.href=url; 
			}
		}
	 
	 )
 }

 function c_create(){
 var param = $("#form1").serialize();
	 
	 $.post(
		"create",
		param,
		function(data,textStatus){
			var flag = data.flag;
			if(flag == false){
				alert("등록실패");
				return false;
			}else{
				 var url ="./list"; 
				location.href=url; 
			}
		}
	 
	 )
 }
 
//  function real_cc(data){
// 	 var url ="./list"; 
// 	location.href=url; 
//  }
 
 
 function incheck(f){
		
		if(f.bname.value==""){
			alert("작성자를 입력하시요");
			f.bname.focus();		
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
	<center>
    <h2>글 작성</h2>
    </center>
    <form id="form1" 
    	  method="post" 
    	  action="./create"
    	  onsubmit="return incheck(this)">
    <table align="center" width="60%">
        <tr>
        <td>작성자</td>
            <td>
            <input name="bname" size="20" value="">
            </td>
         </tr>
           <tr>
            <td>비밀번호</td>
            <td>
            <input type="password" name="passwd" size="20">
            </td>
           </tr>
       
        <tr>
        <td>내용</td>
            <td colspan="2">
            <textarea name="content" id="content" rows="10" cols="146"></textarea></td>
        </tr>
 

        <tr style="border-bottom-style: hidden; border-left-style: hidden; border-right-style: hidden; text-align: right; ">
            <td colspan="3" align="right">
				<div>
	            <input type="button" value="등록" onclick="c_create()">
	            <input type="reset" value="취소">
	            </div>
            </td>
        </tr>    
        </table>
    </form>
    <br>
    <hr>
    <div id="d1">
        현제 페이지 게시물수:${ylistsize}
    </div>
	<center>
    <h2>글 목록</h2>
    </center>
    
    <br>
    <c:forEach var="row" items="${ylist}">
        <form 
        action="${root}/pbbs/view" 
        id="update_form"
        >
    	<br><Br>
            <table border="0" width="900" align="center" border="1">
                <tr>
                    <td class="line" >작성자:
                    ${row.bname}</td>
                    </tr>
                    <tr>
                    <td class="line" >날짜  :
                    ${row.bdate}</td>
                </tr>
                <tr>
                    <td class="line"  colspan="4">${row.content}</td>
                </tr>
                <tr>
 
            <!-- 게시물 번호는 hidden field로 넘김 -->
                    <td colspan="4" class="line">비밀번호 
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