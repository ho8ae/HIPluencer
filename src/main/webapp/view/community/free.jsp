<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="community.CommunityDAO"%>
<%@ page import="community.CommunityDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>

<!DOCTYPE html>
<html lang="en">



<link rel="preconnect" href="../fonts.gstatic.com/index.html" />
<link
	href="../../fonts.googleapis.com/css27803.css?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap"
	rel="stylesheet" />
<link
	href="../../fonts.googleapis.com/css2fcc1.css?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap"
	rel="stylesheet" />
<link
	href="../../fonts.googleapis.com/css24a49.css?family=Kanit:ital,wght@0,400;1,400&amp;display=swap"
	rel="stylesheet" />
<link
	href="../../fonts.googleapis.com/css21ca1.css?family=Noto+Sans+KR:wght@100..900&amp;display=swap"
	rel="stylesheet">
<link
	href="../../fonts.googleapis.com/css2155e.css?family=Black+Han+Sans&amp;family=Noto+Sans+KR:wght@100..900&amp;display=swap"
	rel="stylesheet">



<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HIPluncer</title>

<!-- include css -->
<link href="../../css/bootstrap-icons.css" rel="stylesheet" />
<link href="../../css/style.css" rel="stylesheet" />
<link href="../../css/main_style.css" rel="stylesheet" />
<link href="../../css/error.css" rel="stylesheet" />
<link href="../../css/board.css" rel="stylesheet" />




<!-- include js -->


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




<script src="../../js/top_navigator.js"></script>
<script src="../../js/sidebar.js"></script>
<script src="../../js/menu.js"></script>

<!--  사용이 안되는 것 들 ! -->
<!-- <script src="../../js/search.js"></script> -->

<!-- <script src="../../js/freeBoardWrite.js"></script> -->


<script type="text/javascript"
	src="../../dapi.kakao.com/v2/maps/sdkff6d.json?appkey=9ceb3586edd786e4d4ff3425e390624c&amp;libraries=services"></script>


</head>
<script src="../js/mainPage_notLogin.js"></script>
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
		script.println("location.href= '../main.jsp'");
		script.println("</script>");
		script.close();
		return;
	}

	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if (emailChecked == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href= '../../emailSendConfirm.jsp'");
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
				<a href="../intro.jsp" class="text-dark-hipluncer">HIPluncer</a>
			</div>
			<div class="list-group list-group-flush">
				<a class="p-3" href="#!">
					<form class="d-flex" role="search"
						onsubmit="return validateSearch();" action="../mainMember.jsp"
						method="get">
						<input class="form-control me-2" type="search" id="searchInput"
							name="keyword" aria-label="Search">
						<button class="btn btn-hipluncer" type="submit">
							<i class="bi bi-search"></i>
						</button>
					</form>
				</a> <a class="list-group-item-action p-3" href="../mainMember.jsp">
					<button class="btn">메인</button>
				</a> <a class="list-group-item-action p-3" href="#community"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="community">
					<button class="btn">커뮤니티</button>
					<div class="collapse mt-3" id="community">
						<div class="card card-body">
							<button class="btn btn-light mb-1" onclick="goForum();"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#community">자유게시판</button>
							<button class="btn btn-light mb-1" onclick="goShareForum();"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#community">행사 공유소</button>
						</div>
					</div>
				</a>
				
				
				 <a class="list-group-item-action p-3" href="#good-restaurant"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="good-restaurant">
					<button class="btn">지역별 행사 (준비중!)</button>
					<div class="collapse mt-3" id="good-restaurant">
						<div class="card card-body">
							<h6 class="card-title mb-2 text-body-secondary">지역</h6>
							<button class="btn btn-light mb-1"
								onclick="goReviewForum('all');" type="button"
								data-bs-toggle="collapse" data-bs-target="#good-restaurant">
								전체</button>
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
								강릉</button>
						</div>
					</div>
				</a> 
				
				
				
				<div class="card mt-3 mb-3 ms-3 me-3 text-center"
					style="font-size: .875rem; background-color: rgba(0, 0, 0, .1); color: rgba(255, 255, 255, .8); border-radius: 0.35rem;">
					<div class="card-body">
						<img class="satellites mb-2" src="../../images/hiplucner_icon.png"
							alt="..." style="height: 3rem;">
						<p class="card-text">
							<p class="card-text"><b>Hipluncer</b>는 웹서버구축 프로젝트로 만들게되었습니다. 앞으로 더 많은 기능 추가할 예정입니다.</p>
						</p>
						<a href="https://www.instagram.com/hipluncer_zoayo" target="_blank"
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
		<!-- title -->
		<div id="page-content-wrapper">
			<!-- top navigation -->
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
							<a href="/alarm" class="btn btn-outline-hipluncer position-relative">
								<i class="bi bi-bell"></i> <span class="badge text-bg-danger">0</span>
							</a>
						</div>
						<div class="topbar-divider d-none d-sm-block"></div>
						<div class="dropdown">
							<a href="#"
								class="d-flex align-items-center text-decoration-none text-dark dropdown-toggle"
								id="dropdownUser1" data-bs-toggle="dropdown"
								aria-expanded="false">

								 <!--<img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">-->
								<strong><%=session.getAttribute("userID")%></strong>
							</a>
							<ul class="dropdown-menu dropdown-menu-lg-end text-small shadow"
								aria-labelledby="dropdownUser1">
								<li><a class="dropdown-item" href="../myInfo.jsp">내 정보</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="../../userLogout.jsp">로그아웃</a></li>
							</ul>
						</div>
					</div>

				</div>
			</nav>


			<!-- 자유게시판 글쓰기  -->
			<header id="content-bg"
				class="page-header page-header-dark bg-hipluncer pb-10">
				<div class="container-board">
					<div class="row my-3 mt-3">
						<div class="card bg-transparent border-0">
							<div class="card-body">
								<div class="row mb-2">
									<div class="col-md-8 d-flex align-items-center">
										<h1 class="h3 mb-2 fw-bold text-hipluncer">자유게시판</h1>
									</div>
									<div class="col-md-4">
										<div class="row">

											<div class="col-md-12 mb-3">
												<div class="d-grid gap-2 d-md-flex justify-content-md-end">
													<button type="button" onclick="goForumWrite();"
														class="btn btn-dark-hipluncer position-relative">
														<span>글쓰기</span> <i class="bi bi-pencil-square"></i>
													</button>
												</div>
											</div>


											<div class="col-md-12">
											   <form id="searchForm" method="GET" action="./search.jsp">
												<div
													class="input-group input-group-joined input-group-solid">
													<select class="form-select" id="searchSelect" name="searchType">
														<option value="all" selected="selected">제목+내용</option>
														<option value="title">제목</option>
														<option value="content">내용</option>
													</select> <input type="text" id="searchText" name="searchText" class=form-control
														value="">
													<button type="submit" 
														class="btn btn-dark-hipluncer input-group-text">
														<i class="bi bi-search"></i>
													</button>
												</div>
											</form>
											</div>
											
											
				
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>


			<%
			// 세션에서 현재 사용자의 userID 가져오기
			session = request.getSession();
			userID = (String) session.getAttribute("userID");

			// userID가 null이면 로그인 페이지로 리다이렉트
			if (userID == null) {
			%>
			<script>
				alert("로그인이 필요합니다.");
				location.href = "login.jsp"; // 로그인 페이지로 이동
			</script>
			<%
			} else {
			CommunityDAO dao = new CommunityDAO();
			// 현재 사용자가 작성한 게시물 목록 가져오기

			List<CommunityDTO> postList = dao.getAllPosts();

			// 가져온 게시물 목록이 비어있는지 확인
			if (postList.isEmpty()) {
			%>
			<p>작성한 게시물이 없습니다.</p>
			<%
			} else {
			// 게시물 목록을 테이블로 출력
			%>
			<div id="board" class="container-board">
				<div class="row mt-3 my-3">
					<div class="list-group">
						<%
						for (CommunityDTO post : postList) {
						%>




						<a href="view.jsp?postId=<%=post.getPostId()%>"
							class="list-group-item list-group-item-action"
							aria-current="true">
							<div class="d-flex w-100 justify-content-between">
								<p class="mb-1">
									<span><%=post.getTitle()%> </span> 
									<% int commentCount = new CommunityDAO().getCommentCount(post.getPostId()); %>
									<span class="badge rounded-pill text-bg-beige">댓글 <%= commentCount%></span>

								</p>
								<small><%=post.getUserID()%> </small>
							</div>
							<div class="d-flex w-100 justify-content-between">
								<small id="time_28" class="text-xss text-muted"><%=post.getCreatedDate()%></small>
								<span class="text-xss"> <i class="bi bi-eye"></i> <span><%=post.getViews()%>
								</span> <i class="bi bi-heart-fill text-warning"></i> <span><%=post.getLikes()%></span>
								</span>
							</div>
						</a>







						<%
						}
						%>






						<%
						}
						}
						%>
					</div>
				</div>
			</div>
			
	
			
			
			
		</div>
		
</body>
</html>
