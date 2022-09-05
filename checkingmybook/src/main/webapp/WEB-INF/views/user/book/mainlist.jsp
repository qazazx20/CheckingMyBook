<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<html>
<head>
<title>Checking My Book</title>

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
	section#content ul li { display:inline-block; margin:10px; }
	section#content div.bookThumb img { width:200px; height:200px; }
	section#content div.bookName { padding:10px 0; text-align:center; }
	section#content div.bookName a { color:#000; }
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
		
		<aside id="aside">
					<%@ include file="../include/aside.jsp"%>
				</aside>
				
			<div id="container_box">
				<section id="content">
					<ul>
						<c:forEach items="${list}" var="list">
							<li>
								<div class="bookThumb">
									<img src="${list.bkThumbImg}">
								</div>
								<div class="bookName">
									<a href="/user/book/view?n=${list.bkNum}">${list.bkName}</a>
								</div>
							</li>
							
						</c:forEach>
					</ul>
				</section>
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
