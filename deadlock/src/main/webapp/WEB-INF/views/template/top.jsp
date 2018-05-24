<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1, minimum-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">
 <link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">
  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  <link rel="apple-touch-icon" sizes="180x180" href="${root }/univers/apple-icon-180x180.png">
  <link href="${root }/univers/favicon.ico" rel="icon">

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<title>Insert title here</title>
<script type="text/javascript">
function chat(){
	var url="${root}/chat/list";
	
	var wr = window.open(url,"채팅창","width=440, height=610, resizable=no");
	wr.moveTo(((window.screen.width-500)/2),((window.screen.height-500)/2));
	
}
</script>
</head>

<body class="">


<!-- Add your content of header -->
<header>
  <nav class="navbar  navbar-fixed-top navbar-default" >
    <div class="container" style="background-color: ">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav ">
          <li><a href="${root}" title="">01 : Home</a></li>
          <li><a href="${root}/template/bbslist" title="Board">02 : Board</a></li>
          <li><a href="${root}/pbbs/list" title="방명록">03 : Game</a></li>
          <li><a href="${root}/nbbs/list" title="Infomation">04 : Infomation</a></li>
          <li><a href="${root}/template/about" title="About">05 : About</a></li>
          <li><a href="javascript:chat()" title="Chat">06: Chat</a></li>
        </ul>

		<ul class="nav navbar-nav" style="float: right;">
		  <c:if test="${empty sessionScope.id }">
			  <li style="padding-right: 1px;" ><a href="${root}/member/loginForm" title="로그인"> Sign in</a></li>
			  <li style="float:right;" ><a href="${root}/member/agreement" title="회원가입"> Sign up</a></li>
		  </c:if>
		  <c:if test="${not empty sessionScope.id }">
	          <li style="float:right;" ><a href="${root}/member/read" title="내 정보"> MyPage</a></li>
	          <li style="float:right;" ><a href="${root}/member/logout" title="로그아웃"> Logout</a></li>
	          <c:choose>
		          <c:when test="${sessionScope.grade == 'A'}">
		          	<li style="float:right;" ><a href="${root}/admin/list" title="회원목록"> 회원목록</a></li>
		          </c:when>
		          <c:otherwise>
		          	<li style="float:right;" ><a href="${root}/member/deleteForm" title="회원탈퇴"> 회원탈퇴</a></li>
		          </c:otherwise>
	          </c:choose>
		  </c:if>
		</ul>
      </div> 
    </div>
  </nav>
</header>

</body>
</html>