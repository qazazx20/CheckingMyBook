<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<html>
<head>
<style>
html, body {
	height: 100%
}

body {
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
}
header#header a {
	 text-decoration: none;
}

div#root {
	min-height: 100%;
	position: relative;
	padding-bottom: 60px;
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
	text-align: center;
	
}

nav#nav ul li {
	display: inline-block;
	margin-left: 10px;
}

div#container_box {
	float: center;
}

section#container {
	text-align: center;
	padding: 20px 0;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
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
			<div id="container_box">

				<section id="content">
					<form role="form" method="post" autocomplete="off">
						<div class="input_area">
							<label for="userId"><p>ID<p></label> <input type="email" id="userId"
								name="userId" placeholder="example@email.com"
								required="required" />
						</div>

						<div class="input_area">
							<label for="userPass"><p>Password<p></label> <input type="password"
								id="userPass" name="userPass" placeholder="4자 이상 입력해 주세요"
								required="required" />
						</div>

						<div class="input_area">
							<label for="userName"><p>Name<p></label> <input type="text"
								id="userName" name="userName" placeholder="닉네임을 입력해 주세요"
								required="required" />
						</div>

						<div class="input_area">
							<label for="userPhon"><p>Phone Number<p></label> <input type="text"
								id="userPhon" name="userPhon" placeholder="연락처를 입력해 주세요"
								required="required" />
						</div>

						<button type="submit" id="signup_btn" name="signup_btn">Submit</button>

					</form>
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