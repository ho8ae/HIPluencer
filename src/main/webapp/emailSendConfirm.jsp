<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!doctype html>

<html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="HIPluncer Community" />
<meta name="author" content="HIPLOVE" />



<!-- CSS include-->
<link href="./css/bootstrap-icons.css" rel="stylesheet" />
<link href="./css/login_style.css" rel="stylesheet" />
<link href="./css/sb-admin-2.min.css" rel="stylesheet" />

<!--script include-->
<script src="./js/common/jquery-3.7.1.min.js"></script>
<script src="./js/common/jquery.validate.min.js"></script>
<script src="./js/common/bootstrap.bundle.min.js"></script>
<script src="./js/common/sb-forms-latest.js"></script>
<script src="./js/common/cookieUtils.js"></script>
<script src="./js/feedback.js"></script>


<!-- include js -->

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>

<title>HIPluncer</title>
</head>
<body id="page-top">


	<!-- 이거 폰트 파일 경로 조 -->
	<link rel="preconnect" href="./fonts.gstatic.com/index.html" />
	<link
		href="./fonts.googleapis.com/css27803.css?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap"
		rel="stylesheet" />
	<link
		href="./fonts.googleapis.com/css2fcc1.css?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap"
		rel="stylesheet" />
	<link
		href="./fonts.googleapis.com/css24a49.css?family=Kanit:ital,wght@0,400;1,400&amp;display=swap"
		rel="stylesheet" />
	<link
		href="./fonts.googleapis.com/css21ca1.css?family=Noto+Sans+KR:wght@100..900&amp;display=swap"
		rel="stylesheet">
	<link
		href="./fonts.googleapis.com/css2155e.css?family=Black+Han+Sans&amp;family=Noto+Sans+KR:wght@100..900&amp;display=swap"
		rel="stylesheet">

	<!--  상단 네비게이션 -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm"
		id="mainNav">
		<div class="container px-5">
			<a class="navbar-brand" href="./view/intro.jsp">HIPluncer</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="bi-list"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
					<li class="nav-item"><a class="nav-link me-lg-3"
						href="introduce.html">소개</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3"
						target="_blank" href="https://www.instagram.com/low_o80">인스타그램</a></li>
				</ul>
				<button class="btn btn-light-primary rounded-pill px-3 mb-2 mb-lg-0"
					data-bs-toggle="modal" data-bs-target="#feedbackModal">
					<span class="d-flex align-items-center"> <i
						class="bi-chat-text-fill me-2"></i> <span class="small">Contact
							Us</span>
					</span>
				</button>
			</div>
		</div>
	</nav>






	<div id="page-content" class="container">
		<div class="row justify-content-center">
			<div class="col-xl-6 col-lg-8 col-md-10">
				   
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body">
						<div class="row">
							<div class="alert alert-warning mt-4" role="alert">  이메일 주소
								인증을 하셔야 이용 가능합니다. 인증 메일을 받지 못하셨나요?</div>
							<a href="emailSendAction.jsp" class="btn btn-primary">인증 메일
								다시 받기</a>  
						</div>
					</div>
				</div>
				 
			</div>
			 
		</div>
		 
	</div>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;"> 
		    Copyright ⓒ 2024 HIPluncer All Rights Reserved.    </footer>






	<!-- Feedback Modal -->
	<div class="modal fade" id="feedbackModal" tabindex="-1"
		aria-labelledby="feedbackModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body p-4">
					<div class="d-flex justify-content-end">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<h4 class="text-center p-1 mb-2 mt-3">Contact Us</h4>
					<div class="form-text text-center mb-4">
						안녕하세요. HIPluncer입니다!<br /> 무엇을 도와드릴까요?
					</div>
					<form id="contactForm" action="./reportAction.jsp" method="post">
						<div id="nameInput" class="form-floating mb-2">
							<input id="name" type="text" class="form-control"
								name="reportTitle" /> <label for="name">제목</label>
						</div>
				</div>
				<div id="messageInput" class="form-floating mb-2">
					<textarea id="message" type="text" class="form-control"
						name="reportContent" style="height: 10rem"></textarea>
					<label for="message">문의사항</label>
				</div>


				<div id="registerFeedbackBtnDiv"
					class="d-grid gap-2 col-6 mx-auto mt-4 mb-4">
					<button type="submit" class="btn btn-primary">제출</button>

				</div>
				</form>
			</div>
		</div>
	</div>
	 
</body>
</html>
