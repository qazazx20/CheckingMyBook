<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Checking My Book</title>

<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<style>
html, body {
	height: 100%
}

body {
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
}

ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

div#root {
	min-height: 100%;
	position: relative;
	padding-bottom: 60px;
    width: 90%;
    margin: 0 auto;
}

header#header {
	font-size: 60px;
	padding: 20px 0;
	text-align: center;
}

header#header h1 a {
	color: #000;
	font-weight: bold;
}

nav#nav {
	padding: 10px;
	text-align: right;
}

nav#nav ul li {
	display: inline-block;
	margin-left: 10px;
}

aside {
	float: left;
	width: 200px;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

aside ul li a {
	display: block;
	width: 100%;
	padding: 10px 0;
	font-size: 18px;
}

aside ul li a:hover {
	background: #eee;
}

footer#footer {
	background: #f9f9f9;
	transform: translateY(-100%);
	position: relative;
	bottom: 0;
}

footer#footer ul li {
	display: inline-block;
	margin-right: 10px;
}
</style>

<style>
#container_box table{
	width: 90%;
}

#container_box table td {
	padding: 10px;
}
#container_box table th	{
	font-size: 20px;
	fotn-weight: bold;
	padding: 10px;
	border-bottom: 2px solid #666;
}
#container_box table tr:hover{
	background: #eee;
}

</style>

</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp"%>
			</aside>
			<div id="container_box">
				
				<table>
					<thead>
						<tr>
							<th>표지</th>
							<th>번호</th>
							<th>제목</th>
							<th>작가</th>
							<th>카테고리</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${list}" var="list"> 
							<tr>
								<td>
									<img src="${list.bkThumbImg}">
								</td>
								<td>${list.bkNum}</td>
								<td>
									<a href="/user/book/view?n=${list.bkNum}">${list.bkName}</a>
								</td>
								<td>${list.bkAuthor}</td>									
								<td>${list.cateName}</td>						
								<td>
									<fmt:formatDate value="${list.bkDate}" pattern="yyyy-MM-dd" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</section>
</div>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>

</body>
</html>