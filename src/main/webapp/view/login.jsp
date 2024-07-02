<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="ko">


<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="HIPluncer Community" />
<meta name="author" content="HIPLOVE" />
<title>HIPluncer</title>
<link rel="icon" type="image/x-icon" href="../assets/potato_icon.png" />

<!-- CSS include-->
<link href="../css/bootstrap-icons.css" rel="stylesheet" />
<link href="../css/login_style.css" rel="stylesheet" />
<link href="../css/sb-admin-2.min.css" rel="stylesheet" />

<!--script include-->
<script src="../js/common/jquery-3.7.1.min.js"></script>
<script src="../js/common/jquery.validate.min.js"></script>
<script src="../js/common/bootstrap.bundle.min.js"></script>
<script src="../js/common/sb-forms-latest.js"></script>
<script src="../js/common/cookieUtils.js"></script>
<script src="../js/feedback.js"></script>


<!-- include js -->

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>



</head>





<body>


	

	<link rel="preconnect" href="../fonts.gstatic.com/index.html" />
	<link
		href="../fonts.googleapis.com/css27803.css?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap"
		rel="stylesheet" />
	<link
		href="../fonts.googleapis.com/css2fcc1.css?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap"
		rel="stylesheet" />
	<link
		href="../fonts.googleapis.com/css24a49.css?family=Kanit:ital,wght@0,400;1,400&amp;display=swap"
		rel="stylesheet" />
	<link
		href="../fonts.googleapis.com/css21ca1.css?family=Noto+Sans+KR:wght@100..900&amp;display=swap"
		rel="stylesheet">
	<link
		href="../fonts.googleapis.com/css2155e.css?family=Black+Han+Sans&amp;family=Noto+Sans+KR:wght@100..900&amp;display=swap"
		rel="stylesheet">


	<!-- Top navigation-->

	<nav class="navbar navbar-expand-lg navbar-light shadow-sm"
		id="mainNav">
		<div class="container px-5">
			<a class="navbar-brand" href="intro.jsp">HIPluncer</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="bi-list"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
					<li class="nav-item"><a class="nav-link me-lg-3"
						href="../view/introduce.html">소개</a></li>
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


	<input type="hidden" id="errorCode" name="errorCode" value="">

	<div id="page-content" class="container">

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
					<form id="contactForm" action="../reportAction.jsp" method="post">
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
		
		

		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-6 col-lg-8 col-md-10">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-3">로그인</h1>
									<p class="text-black-50">힙합을 사랑하는 여러분, 환영합니다.</p>
								</div>

								<form class="user" method="post" action="../userLoginAction.jsp">
									<div class="form-group">
										<input type="text" name="userID"
											class="form-control form-control-user" id="inputEmail"
											aria-describedby="emailHelp" placeholder="이메일 주소">
									</div>
									<div class="form-group">
										<input type="password" name="userPassword"
											class="form-control form-control-user" id="inputPassword"
											placeholder="비밀번호">
									</div>
									<div class="form-group">
										<div class="custom-control custom-checkbox small">
											<input type="checkbox" class="custom-control-input"
												id="rememberMe" name="remember-me"> <label
												class="custom-control-label" for="rememberMe">로그인 상태
												유지</label>
										</div>
									</div>
									<button type="submit"
										class="btn btn-light-potato btn-user btn-block">로그인</button>
									<hr>
								</form>
								<div class="text-center">
									<a class="small" href="login/findPwd.jsp">비밀번호 찾기</a>
								</div>
								<div class="text-center">
									<a class="small" href="login/signup.jsp">회원가입</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>
