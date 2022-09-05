<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Checking My Book</title>

<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>

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
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='bkDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#bkDes {
	width: 400px;
	height: 180px;
}

.oriImg{ width:500px; height: auto;}
.thumbImg {}

.bkDes img { max-width: 600px; height: auto;}
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

				<td>
					<h1>${books.bkName}</h1>
				</td>

				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="n" value="${books.bkNum}" />

					<div class="inputArea">
						<label>대분류</label> <span class="category1">> ${books.cateName}</span> 
						<label>중분류</label> <span class="category2">> ${books.cateName}</span>
					</div>


					<div class="inputArea">
						<label for="bkImg">이미지</label>
						<img src="${books.bkThumbImg}" class="thumbImg" />
					</div>
					
					<div class="inputArea">
						<label for="bkName">제목</label> <span>${books.bkName}</span>
					</div>

					<div class="inputArea">
						<label for="bkAuthor">작가</label> <span>${books.bkAuthor}</span>
					</div>

					<div class="inputArea">
						<label for="bkDes">후기</label> 
						
						<!-- <span>${books.bkDes}</span> -->
						<div class="bkDes">${book.bkDes}</div>
					</div>

					<div class="inputArea">
						<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
						<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
						<script>
							var formObj = $("form[role='form']");

							$("#modify_Btn").click(function() {
								formObj.attr("action", "/user/book/modify");
								formObj.attr("method", "get")
								formObj.submit();
							});

							$("#delete_Btn").click(
									function() {

										var con = confirm("정말로 삭제하시겠습니까?")

										if (con) {
											formObj.attr("action",
													"/user/book/delete");
											formObj.submit();
										}
									});
						</script>
					</div>

				</form>


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