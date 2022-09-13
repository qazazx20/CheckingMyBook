<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Checking My Book</title>

<script src="/resources/jquery/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>

<style>
	
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; text-align : center;}
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	section#container { padding: 20px 0; border-top: 2px solid #eee; border-bottom: 2px solid #eee;}
	section#container::after { content: ""; display: block; clear: both;}
	div#container_box { float: right; width: calc(100% - 200px - 20px);}
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; font-size:18px;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; position : relative; transform : translateY(-100%);}
	footer#footer ul li { display:inline-block; margin-right:10px; } 

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

.select_img img {
	margin: 20px 0;
}
</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>

	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		<div id="container_box">
			<h2>수정</h2>

				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

					<input type="hidden" name="bkNum" value="${books.bkNum}" />

					<div class="inputArea">
						<label>대분류</label> <select class="category1">
							<option value="">전체</option>
						</select> <label>중분류</label> <select class="category2" name="cateCode">
							<option value="">전체</option>
						</select>
					</div>
					
					<div class="inputArea">
						<label for="bkName">제목</label> 
						<input type="text" id="bkName" name="bkName" value="${books.bkName}"/>
					</div>
					
					<div class="inputArea">
						<label for="bkAuthor">작가</label> 
						<input type="text" id="bkAuthor" name="bkAuthor" value="${books.bkAuthor}"/>
					</div>

					<div class="inputArea">
						<label for="bkDes">후기</label>
						<textarea rows="5" cols="50" id="bkDes" name="bkDes"
							value="${books.bkDes}"></textarea>

						<!-- <script>
							var ckeditor_config = {
								resize_enaleb : false,
								enterMode : CKEDITOR.ENTER_BR,
								shiftEnterMode : CKEDITOR.ENTER_P,
								filebrowserUploadUrl : "user/book/ckUpload"
							};

							CKEDITOR.replace("bkDes", ckeditor_config);
						</script> -->

					</div>

					<div class="inputArea">
						<label for="cmdImg">이미지</label> <input type="file" id="bkImg"
							name="file" />
						<div class="select_img">
							<img src="${books.bkImg}" /> 
							<input type="hidden" name="bkImg"value="${books.bkImg}" /> 
							<input type="hidden" name="bkThumbImg" value="${books.bkThumbImg}" />
						</div>

						<script>
				$("#bkImg").change(function(){
					if(this.files && this.files[0]){
						var reader = new FileReader;
						reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result).width(200);
						}
					reader.readAsDataURL(this.files[0]);
					}
				});
			</script>

						<%= request.getRealPath("/") %>

					</div>

					<div class="inputArea">
						<button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
						<button type="button" id="back_Btn" class="btn btn-warning">취소</button>

						<script>
							$("#back_Btn").click(function() {
								location.href = "/user/book/view?n=" + ${books.bkNum};
								//history.back();와 같은 기능 : 브라우저의 뒤로가기
							});
						</script>
					</div>
				</form>
			</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>
</div>

<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
var cate1Arr = new Array();
var cate1Obj = new Object();
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") {
		cate1Obj = new Object();  //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
	}
}
var cate1Select = $("select.category1")
for(var i = 0; i < cate1Arr.length; i++) {
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
						+ cate1Arr[i].cateName + "</option>");	
}
$(document).on("change", "select.category1", function(){
	
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].level == "2") {
			cate2Obj = new Object();  // 초기화
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			
			cate2Arr.push(cate2Obj);
		} 
	}
	
	var cate2Select = $("select.category2");
	
	/*
	for(var i = 0; i < cate2Arr.length; i++) {
			cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
								+ cate2Arr[i].cateName + "</option>");
	}
	*/
	
	cate2Select.children().remove();
 
	$("option:selected", this).each(function(){
		
		var selectVal = $(this).val();		
				
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");
		
		for(var i = 0; i < cate2Arr.length; i++) {
			if(selectVal == cate2Arr[i].cateCodeRef) {
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									+ cate2Arr[i].cateName + "</option>");
			}
		}		
	});
	
});

var select_cateCode = '${books.cateCode}';
var select_cateCodeRef = '${books.cateCodeRef}';
var select_cateName = '${books.cateName}';

if(select_cateCodeRef != null && select_cateCodeRef != '') {
 $(".category1").val(select_cateCodeRef);
 $(".category2").val(select_cateCode);
 $(".category2").children().remove();
 $(".category2").append("<option value='" + select_cateCode + "'>" + select_cateName + "</option>");
} else {
 $(".category1").val(select_cateCode);
 $(".category2").val(select_cateCode);
 // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
 $(".category2").append("<option value='" + select_cateCode + "'selectd='selected'>전체</option>");
}
</script>
</body>
</html>
