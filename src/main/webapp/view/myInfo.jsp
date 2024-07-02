<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="community.CommunityDAO"%>
<%@ page import="community.CommunityDTO"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="comment.CommentDTO"%>
<%@ page import="share.SharePostDAO"%>
<%@ page import="share.SharePostDTO"%>
<%@ page import="sharecomment.ShareCommentDAO"%>
<%@ page import="sharecomment.ShareCommentDTO"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>




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
<script src="../js/main.js"></script>
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



	<%
	request.setCharacterEncoding("UTF-8");

	if (userID == null) {
		// 로그인되지 않은 경우 처리 (예를 들어, 로그인 페이지로 리다이렉트)
		response.sendRedirect("login.jsp");
		return;
	}

	CommunityDAO communityDAO = new CommunityDAO();
	CommentDAO commentDAO = new CommentDAO();
	SharePostDAO sharePostDAO = new SharePostDAO();
	ShareCommentDAO ShareCommentDAO = new ShareCommentDAO();

	// 사용자가 작성한 글 가져오기
	List<CommunityDTO> myPosts = communityDAO.getMyPosts(userID);
	List<CommentDTO> myComments = commentDAO.getMyComments(userID);
	List<SharePostDTO> mySharePosts = sharePostDAO.getMyPosts(userID);
	List<ShareCommentDTO> myShareComments = ShareCommentDAO.getMyComments(userID);
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
								
								
							<button class="btn btn-light mb-1" onclick="fromMaingoShareForum();"
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
								onclick="goReviewForum();" type="button"
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
								부산</button>
						</div>
					</div>
				</a>
				
				
	
				<div class="card mt-3 mb-3 ms-3 me-3 text-center"
					style="font-size: .875rem; background-color: rgba(0, 0, 0, .1); color: rgba(255, 255, 255, .8); border-radius: 0.35rem;">
					<div class="card-body">
						<img class="satellites mb-2" src="../images/hiplucner_icon.png" alt="..." style="height:3rem;">
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




			<div class="container-fluid">
				<div class="container my-3">
					<div class="row">
						<div class="col-lg-3">
							<!-- 상위 라디오 버튼 -->
							
							<div class="option-container">
								<input class="form-check-input" type="radio" name="toggleRadio"
									id="myInfoRadio" checked
									onclick="toggleSection('myInfoSection')"> <label
									class="form-check-label" for="myInfoRadio"> 내 정보</label>
							</div>
							<div class="option-container">
								<input class="form-check-input" type="radio" name="toggleRadio"
									id="myPostsRadio" onclick="toggleSection('myPostsSection')">
								<label class="form-check-label" for="myPostsRadio"> 자유게시판 </label>
							</div>
							<div class="option-container">
								<input class="form-check-input" type="radio" name="toggleRadio"
									id="myCommentsRadio"
									onclick="toggleSection('myCommentsSection')"> <label
									class="form-check-label" for="myCommentsRadio"> 자유게시판 댓글 </label>
							</div>
							<div class="option-container">
								<input class="form-check-input" type="radio" name="toggleRadio"
									id="mySharedPostsRadio"
									onclick="toggleSection('mySharedPostsSection')"> <label
									class="form-check-label" for="mySharedPostsRadio"> 행사 공유소 </label>
							</div>
							<div class="option-container">
								<input class="form-check-input" type="radio" name="toggleRadio"
									id="mySharedCommentsRadio"
									onclick="toggleSection('mySharedCommentsSection')"> <label
									class="form-check-label" for="mySharedCommentsRadio">
									행사 공유소 댓글 </label>
							</div>
						</div>

						<!-- 내용 컨테이너 -->
						<div class="col-lg-9">
							<!-- My Information 섹션 -->
							<div id="myInfoSection">
								<h1 class="introduce-container">내 정보</h1>
								<!-- 내 정보에 관련된 컨텐츠 추가 -->
								<p>닉네임: <%=session.getAttribute("userID")%></p>
							</div>

							<!-- My Posts 섹션 -->
							<div id="myPostsSection" style="display: none;">
								<h2 class="introduce-container" >My Posts</h2>
								<%
								if (myPosts.isEmpty()) {
								%>
								<p>No posts found.</p>
								<%
								} else {
								%>
								<ul class="list-group">
									<%
									for (CommunityDTO post : myPosts) {
									%>
									<li class="list-group-item">
										<p class="mb-1 fs-4">
											<strong>Title:</strong>
											<%=post.getTitle()%></h5>
										<p class="mb-1">
											<strong>Content:</strong>
											<%=post.getContent()%></p> <small><strong>Created
												Date:</strong> <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(post.getCreatedDate())%></small>
										<!-- Add other necessary post details if needed -->
									</li>
									<%
									}
									%>
								</ul>
								<%
								}
								%>
							</div>

							<!-- My Comments 섹션 -->
							<div id="myCommentsSection" style="display: none;">
								<h2 class="introduce-container">My Comments</h2>
								<%
								if (myComments.isEmpty()) {
								%>
								<p>No comments found.</p>
								<%
								} else {
								%>
								<ul class="list-group">
									<%
									for (CommentDTO comment : myComments) {
									%>
									<li class="list-group-item">
										<p class="mb-1">
											<strong>Content:</strong>
											<%=comment.getContent()%></p> <small><strong>Created
												Date:</strong> <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(comment.getCreatedDate())%></small>
										<!-- Add other necessary comment details if needed -->
									</li>
									<%
									}
									%>
								</ul>
								<%
								}
								%>
							</div>

							<!-- My Shared Posts 섹션 -->
							<div id="mySharedPostsSection" style="display: none;">
								<h2 class="introduce-container">My Shared Posts</h2>
								<%
								if (mySharePosts.isEmpty()) {
								%>
								<p>No shared posts found.</p>
								<%
								} else {
								%>
								<ul class="list-group">
									<%
									for (SharePostDTO sharePost : mySharePosts) {
									%>
									<li class="list-group-item">
										<p class="mb-1 fs-4">
											<strong>Title:</strong>
											<%=sharePost.getTitle()%></p>
										<p class="mb-1">
											<strong>Content:</strong>
											<%=sharePost.getContent()%></p> <small><strong>Created
												Date:</strong> <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(sharePost.getCreatedDate())%></small>
										<!-- Add other necessary shared post details if needed -->
									</li>
									<%
									}
									%>
								</ul>
								<%
								}
								%>
							</div>

							<!-- My Shared Posts Comments 섹션 -->
							<div id="mySharedCommentsSection" style="display: none;">
								<h2 class="introduce-container">My Shared Posts Comments</h2>
								<%
								if (myShareComments.isEmpty()) {
								%>
								<p>No shared posts found.</p>
								<%
								} else {
								%>
								<ul class="list-group">
									<%
									for (ShareCommentDTO shareComment : myShareComments) {
									%>
									<li class="list-group-item">
										<p class="mb-1">
											<strong>Content:</strong>
											<%=shareComment.getContent()%></p> <small><strong>Created
												Date:</strong> <%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(shareComment.getCreatedDate())%></small>
										<!-- Add other necessary shared comment details if needed -->
									</li>
									<%
									}
									%>
								</ul>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
				function toggleSection(sectionId) {
					var allSections = document
							.querySelectorAll('.col-lg-9 > div');
					for (var i = 0; i < allSections.length; i++) {
						if (allSections[i].id === sectionId) {
							allSections[i].style.display = 'block';
						} else {
							allSections[i].style.display = 'none';
						}
					}
				}
			</script>

		</div>


		<!-- 추가적으로 필요한 내용이 있다면 여기에 추가하세요 -->
</body>
</html>
