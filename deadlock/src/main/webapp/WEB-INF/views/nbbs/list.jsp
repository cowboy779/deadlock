<%@page import="www.deadlock.model.nbbs.NBbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<script type="text/javascript">
var arr = new Array();		

function create() {
	var url = "./create";
	location.href = url;
}

function read(nnum) {
	var url = "./read";
	url += "?nnum=" + nnum;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href = url;
}


window.onload = function () {
	search("${col}");
	if("${grade}"=="A"){
		goChk();
	}
	
/* 	alert("${arr}");
	if("${arr}"!=""){
		arr = "${arr}";
	} */
	
}
function search(col){
	
	if(col=='category'){
		$("#colinp").val("");
		$("#colsel").show();
		$("#colinp").hide();
	}else{
		$("#colsel").val('');
		$("#colsel").hide();
		$("#colinp").show();
	}
}

function totalList(){
	var url = "./list";
	url += "?col=total";
	
	location.href = url;
	
}

function gofix() {
	var fix = document.getElementsByName("fix");
	alert("수정 되었습니다.");
	var chkFrm = document.getElementById("chkFrm");
	chkFrm.submit();
	
}

// 등록되어있는 가져오기.. 
function goChk() {
/* 
	$.ajax({
	    method      : 'POST',
	    url         : './list',
	    data        : {
	        'test' : arr
	    },
	    error       : function(request, status, error) {
	        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	    },
	    success     : function(msg) {
	    }
	 
	}); */
	
	for(var i=0; i<arr.length; i++){
		var fix = '#' + arr[i];
		//alert($(fix).length);
		if($(fix).length){
			document.getElementById(arr[i]).checked = true;
		}else{
			$('<input>').attr({
			    type: 'hidden',
			    value: arr[i],
			    name: 'fix'
			}).appendTo('#chkFrm');
			
		}
	}
	

	
}
</script>
<style type="text/css">
Table{
/* 	r : 0.5px solid;
 */	font-size : 14px;
	text-align: center;
	width: 100%;
	max-width: 700px;
	margin: auto;
}
TD {
	padding-bottom: 5px;
}
caption{
	font-size : 20px;
	text-align: left;
	padding-top: 50px;
}

.subject{
	text-align: left;
	padding-left: 10px;
}
.category{
 	width: 50px;
 	font-size : 12px;
 	color: #595757;
}

BUTTON{
	text-align: right;
	
}
THEAD{
	font-size: 14px;
	text-align: center;
}

TH {
	text-align: center;
}
.rel{
	position: relative;	
	text-align: center;
	width: 50%;
	margin: 0 auto;
	margin-top : 15px;
	margin-bottom : 30px;
	padding-top: 50px;
}	

.ab{
	position: absolute;
	right: 10px;
	bottom : -30px;
	width: 100%;
	//background-color: pink;
}
a:link {
	text-decoration: none;
	color: #646464;
}
a:visited {
	text-decoration: none;
	color: #646464;
}
a:active {
	text-decoration: none;
	color: #646464;
}
a:hover {
	text-decoration: none;
	color: #646464;
}

.topnoti{
	background-color: #f4f2f2;
	border: solid 3px white;
}
.admin {
	float: left;
}
</style>
</head>
</head>
<body>


<div class="rel">

<h1 class="h2" style="float:left; "><span class="glyphicon glyphicon-th-list"></span>02 : 공지사항</h1>

<table class="table table-hover">
	<!-- <caption>공지사항</caption> -->
	
	<thead>
		<tr>
			<th></th>
			<th colspan="2">제목</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
	</thead>
	
	<tbody>
	
	<c:forEach var="dto" items="${fixlist}"  >
		<tr class="topnoti" >
			<td></td>
			<td class="category"><span>${dto.category } </span></td>
			<td class="subject">
				<b><a href="javascript:read(${dto.nnum })">${dto.title }</a></b>
			</td>
			<td class="date">${dto.ndate }</td>
			<td class="count">${dto.ncount }</td>
			<script>
			arr.push("${dto.nnum}");
			</script>
		</tr>

	</c:forEach>

	<form id="chkFrm" action="./fix" method="post" >
	<c:forEach var="dto" items="${list}">
		<tr>
		<td>
		<c:if test="${grade eq 'A'}">
		<input type="checkbox" id="${dto.nnum }" name="fix" value="${dto.nnum }">
		</c:if>
		</td>
		
			<td class="category"><span>${dto.category } </span></td>
			<td class="subject">
				<a href="javascript:read(${dto.nnum })">${dto.title }</a>
				
				<!--string ndate를 date형식으로 변환  -->				
				<fmt:parseDate value="${dto.ndate}" var="ndate" pattern="yyyy-MM-dd"/>
				<!--글 작성시간이 7일이 지나지않았으면 -->
				<c:if test="${today.time-ndate.time <(1000*60*60*24*7 ) }">
				<img src="${root}/storage_nbbs/new.png" width="10" height="10" alt="new">
				</c:if>
			</td>
			<td class="date">${dto.ndate }</td>
			<td class="count">${dto.ncount }</td>
		</tr>
		</c:forEach>	
	</form>
	
	</tbody>	
</table>
	
	<div class="search" >
		<form id='colfrm' action="./list" method="post">	
			<div id="cword">
					<select name="col" style="border:1px solid black;" onchange="search(col.value)">
						<option value="title" <c:if test="${col=='title'}">selected</c:if>>제목</option>
						<option value="content" <c:if test="${col=='content'}">selected</c:if>>내용</option>
						<option value="category" <c:if test="${col=='category'}">selected</c:if>>분류</option>
						<%-- <option value="total" <c:if test="${col=='total'}">selected</c:if>>전체출력</option> --%>
					</select>
					<select id="colsel"  name="word" style="display:none; border:1px solid black;" >
						<option value="공지" <c:if test="${word=='공지'}">selected</c:if>>공지</option>
						<option value="이벤트" <c:if test="${word=='이벤트'}">selected</c:if>>이벤트</option>
						<option value="점검" <c:if test="${word=='점검'}">selected</c:if>>점검</option>
					</select>
			
					<input  id="colinp" type="search" name="word" value="${word}" style="border:1px solid black;">
					<button class="btn btn-default btn-sm">검색</button>
			</div>
			
		</form>
	</div>
	
	<DIV class='bottom'>${paging}</DIV>

	

	
	<div class="ab">
	<c:if test="${grade eq 'A'}">
		<div class="admin">
		<button  class="btn btn-default btn-sm" onclick="create()" >공지 등록</button>
		<button class="btn btn-default btn-sm" onclick="gofix()" style="font-size: 10px">상단 수정</button>
		<!-- <button onclick="goChk()">상단 수정</button> -->
		</div>
	</c:if>
	
		<button class="btn btn-default btn-sm" onclick="totalList()" style="float: right;">전체 목록</button>
	</div>
</div>


</body>
</html>