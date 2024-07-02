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
<link href="../css/bootstrap.min.css" rel="stylesheet" />
<link href="../css/bootstrap-icons.css" rel="stylesheet" />
<link href="../css/style.css" rel="stylesheet" />


<!-- include js -->

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<title>HIPluncer</title>
</head>
<body id="page-top">



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
					<li class="nav-item"><a class="nav-link me-lg-3" href="introduce.jsp">소개</a></li>
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

	<!-- Outer Row -->
	<div class="container px-5 py-5 mt-5">
		<div class="border-bottom mt-5">
			
			<p class="introduce-container">
				최근 일상이 지루하지 않으신가요?<br> "HIPluncer"는 힙합을 좋아하는 사람들이 즐거움을 함께 공유하고
				이야기를 나눌 수 있는 공간입니다.
			</p>
		</div>

		<div
			class="row row-cols-1 row-cols-md-2 align-items-md-center g-5 py-5">
			<div class="col d-flex flex-column align-items-start gap-2">
				<h2 class="fw-bold text-body-emphasis mt-1">커뮤니티</h2>
				<p class="text-body-secondary">
					커뮤니티는 HIPluncer 회원이라면 누구나 이야기를 나눌수 있습니다!<br> HIPluncer는 <span
						class="fw-bold text-light-potato">자유게시판, HOTPLACE 공유소, 힙합 영상 시청 , AI 음악 추천</span> 로 구성되어있어요.<br>
				</p>
				<a href="main.jsp"
					class="btn btn-warning btn-lg fs-6 text-light">구경하러가기</a>
			</div>

			<div class="col">
				<div class="row row-cols-1 row-cols-sm-2 g-4">
					<div class="col d-flex flex-column gap-2">
						<div
							class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-warning text-light fs-4 rounded-3">
							<i class="bi bi-shop" width="1em" height="1em"></i>
						</div>
						<h4 class="fw-semibold mb-0 text-body-emphasis mt-1">HOPLACE 공유</h4>
						<p class="text-body-secondary">지도를 통해 위치를 공유해 쉽게 장소를 확인할 수
							있어요! 행사 게시판을 이용해주세요.</p>
					</div>

					<div class="col d-flex flex-column gap-2">
						<div
							class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-warning text-light fs-4 rounded-3">
							<i class="bi bi-pen" width="1em" height="1em"></i>
						</div>
						<h4 class="fw-semibold mb-0 text-body-emphasis mt-1">내가 쓴 글이
							메인에!</h4>
						<p class="text-body-secondary">게시판을 이용해 크루 모집을 할 수 있습니다! 얼른 모집하여 행사를 참여해보세요!</p>
					</div>

					<div class="col d-flex flex-column gap-2">
						<div
							class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-warning text-light fs-4 rounded-3">
							<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
								fill="currentColor" class="bi bi-robot" viewBox="0 0 16 16">
                                    <path
									d="M6 12.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5M3 8.062C3 6.76 4.235 5.765 5.53 5.886a26.6 26.6 0 0 0 4.94 0C11.765 5.765 13 6.76 13 8.062v1.157a.93.93 0 0 1-.765.935c-.845.147-2.34.346-4.235.346s-3.39-.2-4.235-.346A.93.93 0 0 1 3 9.219zm4.542-.827a.25.25 0 0 0-.217.068l-.92.9a25 25 0 0 1-1.871-.183.25.25 0 0 0-.068.495c.55.076 1.232.149 2.02.193a.25.25 0 0 0 .189-.071l.754-.736.847 1.71a.25.25 0 0 0 .404.062l.932-.97a25 25 0 0 0 1.922-.188.25.25 0 0 0-.068-.495c-.538.074-1.207.145-1.98.189a.25.25 0 0 0-.166.076l-.754.785-.842-1.7a.25.25 0 0 0-.182-.135">
                                    </path>
                                    <path
									d="M8.5 1.866a1 1 0 1 0-1 0V3h-2A4.5 4.5 0 0 0 1 7.5V8a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1v1a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-1a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1v-.5A4.5 4.5 0 0 0 10.5 3h-2zM14 7.5V13a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V7.5A3.5 3.5 0 0 1 5.5 4h5A3.5 3.5 0 0 1 14 7.5">
                                    </path>
                                </svg>
						</div>
						<h4 class="fw-semibold mb-0 text-body-emphasis mt-1">AI 정보</h4>
						<p class="text-body-secondary">AI 정보를 통해 국내 힙합 1위가 누구인지 물어봐주세요!
						</p>
					</div>

					<div class="col d-flex flex-column gap-2">
						<div
							class="feature-icon-small d-inline-flex align-items-center justify-content-center text-bg-warning text-light fs-4 rounded-3">
							<i class="bi bi-youtube" width="1em" height="1em"></i>
						</div>
						<h4 class="fw-semibold mb-0 text-body-emphasis mt-1">힙한 트렌드</h4>
						<p class="text-body-secondary">요즘 뜨는 '힙한' 알고싶으신가요? 유튜브 영상으로
							함께 봐요.</p>
					</div>
				</div>
			</div>
		</div>
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