<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="community.CommunityDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="community.CommunityDTO"%>

<!DOCTYPE html>
<html lang="en">



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



<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HIPluncer</title>

<!-- include css -->
<link href="../css/bootstrap-icons.css" rel="stylesheet" />
<link href="../css/style.css" rel="stylesheet" />
<link href="../css/main_style.css" rel="stylesheet" />
<link href="../css/error.css" rel="stylesheet" />



<!-- include js -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2268b8632813c7611c2021f61b2e036&amp;libraries=services"></script>
<script charset="UTF-8"
	src="https://t1.daumcdn.net/mapjsapi/js/main/4.4.18/kakao.js"></script>
<script charset="UTF-8"
	src="https://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
<script src="../js/main_notLogin.js"></script>



<script src="../js/common/jquery-3.7.1.min.js"></script>
<script src="../js/common/jquery.validate.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>




<script src="../js/top_navigator.js"></script>
<script src="../js/sidebar.js"></script>
<script src="../js/menu.js"></script>


<script type="text/javascript"
	src="../../dapi.kakao.com/v2/maps/sdkff6d.json?appkey=9ceb3586edd786e4d4ff3425e390624c&amp;libraries=services"></script>



</head>
<script  src="../js/main.js"></script>
<script type = "module" src="../js/gpt.js"></script>
<body id="page-top">


	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href= 'main.jsp'");
		script.println("</script>");
		script.close();
		return;
	}

	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if (emailChecked == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href= '../emailSendConfirm.jsp'");
		script.println("</script>");
		return;
	}
	%>




	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->

		<!-- 로그인 -->
		<div class="border-end text-dark-hipluncer bg-hipluncer"
			id="sidebar-wrapper">
			<div class="sidebar-heading text-center border-bottom">
				<a href="intro.jsp" class="text-dark-hipluncer">HIPluncer</a>
			</div>
			<div class="list-group list-group-flush">
				<a class="p-3" href="#!">
					<form class="d-flex" role="search"
						onsubmit="return validateSearch();" action="./mainMember.jsp"
						method="get">
						<!--  serch form-->
						<input class="form-control me-2" type="text" id="searchInput"
							name="search" aria-label="Search">
						<button class="btn btn-hipluncer" type="submit">
							<i class="bi bi-search"></i>
						</button>
					</form>


				</a> <a class="list-group-item-action p-3" href="mainMember.jsp">
					<button class="btn">메인</button>
				</a> <a class="list-group-item-action p-3" href="#community"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="community">
					<button class="btn">커뮤니티</button>
					<div class="collapse mt-3" id="community">
						<div class="card card-body">
							<button class="btn btn-light mb-1" onclick="fromMaingoForum();"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#community">자유게시판</button>


							<button class="btn btn-light mb-1"
								onclick="fromMaingoShareForum();" type="button"
								data-bs-toggle="collapse" data-bs-target="#community">행사
								공유소</button>
						</div>
					</div>
				</a> <a class="list-group-item-action p-3" href="#good-restaurant"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="good-restaurant">
					<button class="btn">지역별 행사 (준비중!)</button>
					<div class="collapse mt-3" id="good-restaurant">
						<div class="card card-body">
							<h6 class="card-title mb-2 text-body-secondary">지역</h6>
							<button class="btn btn-light mb-1" onclick="goReviewForum();"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#good-restaurant">전체</button>
							<h6 class="card-title mb-2 text-body-secondary">지역별로 오픈
								예정입니다.</h6>
							<button class="btn btn-light disabled mb-1" type="button"
								data-bs-toggle="collapse" data-bs-target="#good-restaurant">
								서울</button>
							<button class="btn btn-light disabled mb-1" type="button"
								data-bs-toggle="collapse" data-bs-target="#good-restaurant">
								춘천</button>
							<button class="btn btn-light disabled mb-1" type="button"
								data-bs-toggle="collapse" data-bs-target="#good-restaurant">
								부산</button>
						</div>
					</div>
				</a>



				<div class="card mt-3 mb-3 ms-3 me-3 text-center"
					style="font-size: .875rem; background-color: rgba(0, 0, 0, .1); color: rgba(255, 255, 255, .8); border-radius: 0.35rem;">
					<div class="card-body">
						<img class="satellites mb-2" src="../images/hiplucner_icon.png"
							alt="..." style="height: 3rem;">
						<p class="card-text">
							<p class="card-text"><b>Hipluncer</b>는 웹서버구축 프로젝트로 만들게되었습니다. 앞으로 더 많은 기능 추가할 예정입니다.</p>
						</p>
						<a href="https://www.instagram.com/low_o80" target="_blank"
							class="btn btn-light">More Information</a>
					</div>
				</div>
				<%
				if (userID == null) {
				%>
				<a href="./login.jsp" class="m-2 btn btn-hipluncer"> <span
					class="text text-white">로그인</span>
				</a>
				<%
				}
				%>
			</div>
		</div>

		<!-- 미로그인 -->


		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav class="navbar navbar-expand-lg navbar-light shadow-sm"
				id="topNavbar">
				<div class="container-fluid">
					<button class="btn btn-hipluncer" id="sidebarToggle">&lt;</button>

					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
						aria-controls="navbarResponsive" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="bi bi-gear-fill"></i>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<div class="ms-auto me-1 my-3 my-lg-0">
							<a href="/alarm"
								class="btn btn-outline-hipluncer position-relative"> <i
								class="bi bi-bell"></i> <span class="badge text-bg-danger">0</span>
							</a>
						</div>
						<div class="topbar-divider d-none d-sm-block"></div>
						<div class="dropdown">
							<a href="#"
								class="d-flex align-items-center text-decoration-none text-dark dropdown-toggle"
								id="dropdownUser1" data-bs-toggle="dropdown"
								aria-expanded="false"> <!--<img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">-->
								<strong><%=session.getAttribute("userID")%></strong>
							</a>
							<ul class="dropdown-menu dropdown-menu-lg-end text-small shadow"
								aria-labelledby="dropdownUser1">
								<li><a class="dropdown-item" href="./myInfo.jsp">내 정보</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="../userLogout.jsp">로그아웃</a></li>
							</ul>
						</div>
					</div>

				</div>
			</nav>



			<!-- Page content-->
			<div class="container-fluid px-4">
				<div class="container my-3">
					<div class="row mt-3 mb-3">

						<!-- 맛집 네비게이션  -->
						<div class="col-lg-8 col-md-6 col-sm-8 col-xs-12 mb-3">
							<div class="card">
								<div class="card-body">
									<div class="font-weight-bold text-dark text-uppercase mb-1">
										HOT PLACE 네비게이션</div>
									<hr>
									<div id="map" style="position: relative; height: 75vh;"></div>
									<a title="HIPluncer 아이콘"
										href="https://www.flaticon.com/kr/free-icons/"
										class="fs-8 text-muted pb-0">HIPluncer 아이콘 제작자: low_o80</a>
								</div>
								<div onclick="goShareForumWrite();"
									class="guide-board card-footer d-flex align-items-center justify-content-between">
									<div class="small text-dark">여러분 HOT PLACE도 소개해주세요!</div>
									<div class="small text-dark">
										<i class="bi bi-chevron-right"></i>
									</div>
								</div>
							</div>
						</div>


						<!-- 오른쪽  -->
						<div class="col-lg-4 col-md-6 col-sm-8 col-xs-12">
							<div class="row">
								<div class="card" style="padding: 0rem;">
									<div class="card-header">HIPluncer HOT</div>


									<ul class="list-group list-group-flush">

										<a href="./community/free.jsp"
											class="list-group-item list-group-item-action">오늘 한림대에서
											공연합니다!~</a>

										<a href="./community/free.jsp"
											class="list-group-item list-group-item-action">이번 달 축제
											모음! </a>

										<a href="./community/free.jsp"
											class="list-group-item list-group-item-action">20학번 빅데이터
											김태호 화이팅!</a>

										<a href="./community/free.jsp"
											class="list-group-item list-group-item-action">이트가 엄청
											이뻐요!</a>

									</ul>
									<div onclick="goHotForum();"
										class="guide-board card-footer d-flex align-items-center justify-content-between">
										<div class="small text-dark">더보기</div>
										<div class="small text-dark">
											<i class="bi bi-chevron-right"></i>
										</div>
									</div>

								</div>
							</div>
							<div class="row mt-3">
								<a href="#"
									class="guide-board card border-left-warning shadow h-100 py-2"
									data-bs-toggle="modal" data-bs-target="#shortsModal">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-warning text-uppercase mb-1">
													요즘 뜨는 신인 아티스트!</div>
												<div class="text-black-50 font-weight-bold small">알고싶으면
													click!</div>
											</div>
											<div class="col-auto">
												<i class="bi bi-hand-index-thumb fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</a>
							</div>


							<div class="row mt-3">
								<a href="./community/write.jsp"
									class="guide-board card border-left-succes shadow h-100 py-2">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="font-weight-bold text-success text-uppercase mb-1">
													크루를 모집하거나 모집해보세요!</div>
												<div class="text-black-50 font-weight-bold small">알고싶으면
													Click!</div>
											</div>
											<div class="col-auto">
												<i class="bi bi-hand-index-thumb fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</a>
							</div>

							<div class="row mt-3">
								<a href="#"
									class="guide-board card border-right-primary shadow h-100 py-2"
									data-bs-toggle="modal" data-bs-target="#aiModal">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="font-weight-bold text-primary text-uppercase mb-1">
													AI가 알려주는 힙합 정보 및 노래 추천 !</div>
												<div class="text-black-50 font-weight-bold small">알고싶으면
													Click!
												</div>
											</div>
											<div class="col-auto">
												<svg xmlns="http://www.w3.org/2000/svg" width="30"
													height="30" fill="currentColor" class="bi bi-robot"
													viewBox="0 0 16 16">
                                                    <path
														d="M6 12.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5M3 8.062C3 6.76 4.235 5.765 5.53 5.886a26.6 26.6 0 0 0 4.94 0C11.765 5.765 13 6.76 13 8.062v1.157a.93.93 0 0 1-.765.935c-.845.147-2.34.346-4.235.346s-3.39-.2-4.235-.346A.93.93 0 0 1 3 9.219zm4.542-.827a.25.25 0 0 0-.217.068l-.92.9a25 25 0 0 1-1.871-.183.25.25 0 0 0-.068.495c.55.076 1.232.149 2.02.193a.25.25 0 0 0 .189-.071l.754-.736.847 1.71a.25.25 0 0 0 .404.062l.932-.97a25 25 0 0 0 1.922-.188.25.25 0 0 0-.068-.495c-.538.074-1.207.145-1.98.189a.25.25 0 0 0-.166.076l-.754.785-.842-1.7a.25.25 0 0 0-.182-.135" />
                                                    <path
														d="M8.5 1.866a1 1 0 1 0-1 0V3h-2A4.5 4.5 0 0 0 1 7.5V8a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1v1a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-1a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1v-.5A4.5 4.5 0 0 0 10.5 3h-2zM14 7.5V13a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V7.5A3.5 3.5 0 0 1 5.5 4h5A3.5 3.5 0 0 1 14 7.5" />
                                                </svg>
											</div>
										</div>
									</div>
								</a>
							</div>

							<div class="row mt-3">


								<div class="guide-board card bg-opacity-75 text-white shadow"
									data-bs-toggle="modal" data-bs-target="#inputMsgModal"
									style="background-color: #003049; border-color: #8e700c;">
									<div class="card-body" id="messageContainer">
										<span>HIPLuncer</span>
										<div class="text-white-50 small" id="messageContainer"></div>
										
									</div>
								</div>

							</div>
						</div>
					</div>
					<div>
						<!-- gpt ai modal -->
						<div class="modal fade" id="aiModal" tabindex="-1"
							aria-labelledby="aiModalLabel" aria-hidden="true"
							style="padding-right: 17px;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<div class="d-flex">
											<img class="logo img-fluid"
												src="https://upload.wikimedia.org/wikipedia/commons/0/04/ChatGPT_logo.svg"
												width="30">
											<h1 class="modal-title fs-5 ms-2" id="aiModalLabel">GPT에게
												물어보기</h1>
										</div>
									</div>
									<div class="modal-body">
										<form>
											<div class="mb-3">
												<label for="message-text" class="col-form-label">GPT
													질문 내역:</label>
													
												<div class="input-group">
													<input id="gptQuery" name="gptQuery" type="text"
														class="form-control" placeholder="현재 힙합 1위는 누구야?"
														aria-describedby="gptAskBtn">
													<button id="gptAskBtn" onclick="askGpt();"
														class="btn btn-outline-success" type="button">질문하기</button>
												</div>
												
											</div>
											
											<div id="gpt-error" class="d-none mb-3"></div>
											
											
											<div id="gpt-answer" class="d-none mb-3">
												
												
												<label for="message-text" class="col-form-label">GPT
													답변 내역:</label>
													
													
													
												<div id="typing-text"></div>
											
											
											</div>
										</form>
										<div class="text-muted fs-7">[안내] 호출 할당량 초과 시 질문이 제한될 수
											있습니다.</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div>
						<!-- 유튭 modal -->
						<div class="modal fade" id="shortsModal" tabindex="-1"
							aria-labelledby="shortsModalLabel" aria-hidden="true"
							style="padding-right: 17px;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<div class="d-flex">
											<h1 class="modal-title fs-5 ms-2" id="shortsModalLabel">
												<i class="bi bi-play-btn-fill text-danger"></i> 주목할만한 노래!
											</h1>
										</div>
									</div>
									<div class="modal-body">
										<div class="shorts-container">
											<iframe class="shorts-iframe" width="560" height="315"
												src="https://youtube.com/embed/eru4FB9AdxY"
												allow="acceleroemter; autoplay; clipboard-media; gyroscope; picture-in-picture; web-share"
												allowfullscreen></iframe>
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div>
						<div class="modal fade" id="inputMsgModal" tabindex="-1"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-body">
										<h1 class="modal-title fs-5 ms-2">HIPluncer에 대한 한 줄 등록하기</h1>
										<div class="text-muted fs-7 ms-2">등록하신 문구들은 
											Pick되어 메인에 뜨게 되어요!</div>
										<div class="card mt-2 mb-2">
											<div class="card-body">
												<div class="d-flex justify-content-between">
													<div class="col-8">
														<label for="msgTitle" class="form-label">제목</label> <input
															type="text" class="form-control" id="msgTitle"
															placeholder="안녕하세요 HIPluncer 입니다!" maxlength="15">
													</div>
													<div class="col-auto">
														<label for="colorInput" class="form-label">색상 정하기</label>
														<input type="color"
															class="form-control form-control-color" id="colorInput"
															value="#003049" title="Choose your color">
													</div>
												</div>
												<div class="row mt-2">
													<div>
														<label for="msgTextarea" class="form-label">내용</label>
														<textarea class="form-control" id="msgTextarea"
															placeholder="운이 좋으면 본인을 PR할 수 있어요 !" maxlength="40"
															rows="2"></textarea>
													</div>
												</div>
											</div>
										</div>
										<div class="text-muted fs-7 ms-2">(비방 및 욕설을 등록하신 회원은 통보
											없이 탈퇴 처리될 수 있습니다.)</div>
									</div>
									<div class="modal-footer">
										<button type="button" onclick="registerMsg()"
											class="btn btn-hipluncer">등록</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<script>
					window.jdenticon_config = {
						replaceMode : "observe"
					};
				</script>
				<script
					src="https://cdn.jsdelivr.net/npm/jdenticon@3.2.0/dist/jdenticon.min.js"
					async
					integrity="sha384-yBhgDqxM50qJV5JPdayci8wCfooqvhFYbIKhv0hTtLvfeeyJMJCscRfFNKIxt43M"
					crossorigin="anonymous">
					
				</script>

			</div>
		</div>
</body>



</html>