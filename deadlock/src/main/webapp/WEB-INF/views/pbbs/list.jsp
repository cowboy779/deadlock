<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*  *{   */
/*    font-family: gulim;   */
/*    font-size: 14px;   */
/*  }   */

.table{
	width: 60%;	
	margin: 0 auto;
}

.line{
	border-top:1px;
	border-bottom:1px;
	border-left: 1px;
	border-right: 1px;	
}

	
.linee{
	border-top: 1px;
	border-bottom: 1px;
}

input[type=button], input[type=submit], input[type=reset]{
    background-color:#555555;;
    border: none;
    color: white;
    text-decoration: none;
}


#d1{ 
 	position: relative; 
 	left:900px; 
 	color:blue; 
 	font-size:0.4cm;
 } 
 
#d2{
	box-shadow: 10px 10px;
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
	
	<div align="center">
   <i class="fa fa-commenting" style="font-size:36px">방명록</i>  
   </div>
   <div style="font-family: monospace;" align="center">
   <br>
   방명록을 남겨주세요
   <div style="color: blue">
   바르고 고운말을 사용합시다!
	</div>
   </div>
    <form id="form1" 
    	  method="post" 
    	  action="./create"
    	  onsubmit="return incheck(this)">
    <table style="width:30%" align="center">
        <tr>
        <td width="40" height="40">
        <div style="color: red">
        name
        </div>
        </td>
        <c:choose>
        <c:when test="${not empty sessionScope.id }">
        <td>
         <input style="border-left-style: hidden; border-right-style: hidden; border-top-style: hidden;" name="bname" size="20" value="${sessionScope.id }" readonly="readonly">
        </td>
		</c:when>
		<c:otherwise>
		<td>
        <input style="border-left-style: hidden; border-right-style: hidden; border-top-style: hidden;" name="bname" size="20" value="">
		</td>
		</c:otherwise>
		</c:choose>
     	</tr>
     	<tr>
            <td height="60">
            <div style="color: red">
            Password
            </div>
            </td>
            <td>
            <input style="border-left-style: hidden; border-right-style: hidden; border-top-style: hidden;" type="password" name="passwd" size="20">
            </td>
          </tr>
       
        <tr>  
            <td colspan="2">
            <textarea name="content" id="content" rows="10" cols="80"></textarea></td>
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
  
  <br>
      <div id="d1">
        현제 페이지 게시물수:${ylistsize}
      </div>
    
    <br>
    
    <c:forEach var="row" items="${ylist}">
    
        <form 
        action="${root}/pbbs/view" 
        id="update_form"
        >
        <Br>
<!--             <table style="border="0" width="900" align="center"> -->
            <table style="box-shadow: 5px 5px grey;" border="1"; align="center" width="600">
                <tr>
				    <td class="line">
                <i class="fa fa-edit" style="font-size:12px; color: black">
				 </i>작성자:
                    ${row.bname}</td>    
               
                 <td class="line">
                <i class="fa fa-clock-o" style="font-size:12px; color: black">
                 </i>날짜 :
                    ${row.bdate}</td>
                </tr>
                <tr>
                    <td width="100" height="80" colspan="2">${row.content}</td>
                </tr>
                <tr>
 
            <!-- 게시물 번호는 hidden field로 넘김 -->
                    <td colspan="4" class="line">비밀번호 
                    <input type="hidden" name="bnum" value="${row.bnum}">
                     <input type="password" name="passwd">  
                     <span style="float: right;">          
                     <input type=button style="width: 60pt; height: 23pt;" value="수정/삭제" onclick="c_update()">
                     </span>
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