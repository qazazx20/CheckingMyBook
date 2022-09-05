<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

body a {
	text-decoration: none;
}
#logincon {
	float:right;
	padding: 10px 0;
}
#bookcategory ul {
 	width: 400px;
  	margin: 0 auto;
	}
#bookcategory li {
	width: 180px;
	position: relative;
}
#bookcategory li:hover{
	background:#eee;
}
#bookcategory ul li {
	text-align: center;
	
}
#bookcategory ul li a {
	display: block;
	width: 100%;
	padding: 10px 0;
	font-size: 20px;
}
#bookcategory ul li a:hover {
	background: #eee;
}	
#bookcategory li > ul.kolow {
   display:none; 
   position:absolute;
   top:50px; 
   right: 10px; 
   width: 100%;
}
#bookcategory li > ul.folow {
   display:none; 
   position:absolute; 
   top:50px; 
   right: 10px; 
   width: 100%;
}
#bookcategory li:hover > ul.kolow { 
   display:block; 
}
#bookcategory li:hover > ul.folow { 
   display:block; 
}
#bookcategory li:hover > ul.kolow li a {
   background:#eee; 
   border:1px solid #eee; 
   font-size:14px;
   }
#bookcategory li:hover > ul.folow li a {
   background:#eee; 
   border:1px solid #eee; 
   font-size:14px;
   }
#bookcategory li:hover > ul.kolow li a:hover { 
   background:#fff;
}
#bookcategory li:hover > ul.folow li a:hover { 
   background:#fff;
}
#bookcategory li > ul.kolow li {
   width:180px; 
}
#bookcategory li > ul.folow li {
   width:180px; 
}

</style>


<div id="logincon">
<ul>
<c:if test="${member != null}">
	<li>
		${member.userName}님 환영합니다
	</li>
	<li>
		<a href="/member/signout">로그아웃</a>
	</li>
</c:if>
</ul>
</div>

<div id="bookcategory" >
<ul id="menu">
	<li><a href="/user/book/mainlist?c=100&l=1">국내도서</a>	
		<ul class="kolow">
			<li><a href="/user/book/mainlist?c=101&l=2">시/희곡</a></li>
			<li><a href="/user/book/mainlist?c=102&l=2">소설</a></li>
			<li><a href="/user/book/mainlist?c=103&l=2">에세이</a></li>
			<li><a href="/user/book/mainlist?c=104&l=2">인문학</a></li>
			<li><a href="/user/book/mainlist?c=105&l=2">자기계발</a></li>		
		</ul>
	</li>
	
	<li><a href="/user/book/mainlist?c=200&l=1">외국도서</a>
		<ul class="folow">
			<li><a href="/user/book/mainlist?c=201&l=2">소설</a></li>
			<li><a href="/user/book/mainlist?c=202&l=2">여행</a></li>
			<li><a href="/user/book/mainlist?c=203&l=2">인문/사회</a></li>
			<li><a href="/user/book/mainlist?c=204&l=2">자기계발</a></li>
			<li><a href="/user/book/mainlist?c=205&l=2">예술</a></li>		
		</ul>
	</li>	
</ul>
</div>