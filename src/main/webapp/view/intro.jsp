<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="HIPluncer Community" />
<meta name="author" content="HIPLOVE" />





<!-- include css -->

<link href="../css/style.css" rel="stylesheet" />

<link href="../css/bootstrap-icons.css" rel="stylesheet" />



<!-- include js -->


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<title>HIPluncer</title>
</head>
<body id="page-top">


<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}%>


	<!-- 이거 폰트 파일 경로 조 -->
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



	<!--  상단 네비게이션 -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm"
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
						href="introduce.jsp">소개</a></li>
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


	<!--메인 페이지 글?의 중앙?  -->

	<div>
		<header class="masthead">
			<div class="container px-5">
				<div class="row gx-5 align-items-center">
					<div class="col-lg-6">
						<div class="mb-5 mb-lg-0 text-center text-lg-start">
							<h1 class="display-1 lh-1 mb-3">
								HIP+Inpluncer <br />=HIPluncer
							</h1>
							<p class="lead fw-normal text-muted mb-5">
								한국의 곳곳 HIPlace 정보 커뮤니티 서비스.<br>지금 즐겨보세요!
							</p>
							<div class="d-flex flex-column flex-lg-row align-items-center">
<%
								if (userID == null) {
								%>
								<a href="main.jsp" class="btn btn-yellow btn-xl text-uppercase">메인
									페이지로 가기</a>
								<%
								}else{
									%>
								<a href="mainMember.jsp" class="btn btn-yellow btn-xl text-uppercase">메인
									페이지로 가기</a>
									<%
								}
									%>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="masthead-device-mockup">
							<div class="device-wrapper">
								<canvas id="canvas" width="400" height="500"
									data-bs-toggle="tooltip" data-bs-placement="top"
									data-bs-title="click!"></canvas>
								<script type="importmap">
                                {
                                    "imports": {
                                        "three": "https://unpkg.com/three@0.141.0/build/three.module.js",
                                        "GLTFLoader" : "https://unpkg.com/three@0.141.0/examples/jsm/loaders/GLTFLoader.js",
                                        "OrbitControls" : "https://unpkg.com/three@0.141.0/examples/jsm/controls/OrbitControls.js"
                                    }
                                }
                            </script>
								<script type="module" src="../js/novita_3d.js"></script>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container px-5">
				<div id="resetBtnDiv" class="d-none d-flex justify-content-end">
					<button id="resetBtn" type="button" class="btn btn-sm btn-danger">
						◀◀되돌리기</button>
				</div>
			</div>
		</header>
		<aside class="text-center bg-gradient-primary-to-secondary">
			<div class="container px-5">
				<div class="row gx-5 justify-content-center">
					<div class="col-xl-8">
						<div class="h2 fs-1 text-white mb-4">"오늘 당신이 있는 그 곳 힙한 곳 일
							수도?"</div>
						
					</div>
				</div>
			</div>
		</aside>
	</div>




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
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>