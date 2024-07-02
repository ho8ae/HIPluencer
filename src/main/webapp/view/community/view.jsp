<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, java.sql.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.jsp.*"%>
<%@ page import="community.CommunityDAO"%>
<%@ page import="community.CommunityDTO"%>
<%@ page import="comment.CommentDTO"%>
<%@ page import="comment.CommentDAO"%>
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
<title>View Post</title>

<!-- CSS Files -->
<link href="../../css/bootstrap-icons.css" rel="stylesheet" />
<link href="../../css/style.css" rel="stylesheet" />
<link href="../../css/main_style.css" rel="stylesheet" />
<link href="../../css/board.css" rel="stylesheet" />

<!-- JavaScript Files -->
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
<!-- <script src="../../js/freeBoardWrite.js"></script> -->


</head>

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

			<!-- 게시물 번호 가지고 오기 -->




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


											<div class="col-md-12"></div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>



			<div id="board" class="container-board">
				<%
				try {
					String postIdStr = request.getParameter("postId");

					if (postIdStr == null) {
						throw new Exception("postId parameter is missing.");
					}

					int postId = Integer.parseInt(postIdStr);
					CommunityDAO communityDAO = new CommunityDAO();
					CommunityDTO post = communityDAO.getPost(postId);

					if (post == null) {
						out.println("<h3>Post not found</h3>");
					} else {
						communityDAO.increaseViews(postId); // Increase view count
				%>
				<div class="card mb-3">
					<div class="card-header">
						<h3 class="introduce-container"><%=post.getTitle()%></h3>
						<small class="text-muted">Posted on <%=post.getCreatedDate()%>
							by <%=post.getUserID()%></small>
					</div>
					<div class="card-body">
						<p><%=post.getContent()%></p>
					</div>
					<div class="d-flex card-footer">
					<form action="../../increaseLikes.jsp" method="post" >
						<input type="hidden" name="postId" value="<%=postId%>" >
						<button type="submit" class="btn btn-light me-3"><i class="bi bi-heart"><%= post.getLikes()%></i></button>
					</form>
						<small class="text-muted mt-2">Views: <%=post.getViews()%> </small>
							
					</div>
				</div>
				
				<div class="d-flex justify-content-end">
					
					
					<%
					if (userID.equals(post.getUserID())) {
					%>
				
					<form action="../../deletePost.jsp" method="post"
						onsubmit="return confirm('정말로 이 글을 삭제하시겠습니까?');">
						<input type="hidden" name="postId" value="<%=postId%>">
						<button type="submit" class="btn btn-danger justify-content-end ms-2">삭제</button>
					</form>
					<%
					}
					%>
				</div>
				
				<div class="container-board"></div>



				<%
				}
				} catch (Exception e) {
				StringWriter sw = new StringWriter();
				e.printStackTrace(new PrintWriter(sw));
				out.println("<pre>" + sw.toString() + "</pre>"); // 예외 스택 트레이스를 출력
				out.println("<h3>Error: " + e.getMessage() + "</h3>");
				}
				%>
				<%
				String postIdStr = request.getParameter("postId");
				if (postIdStr == null || postIdStr.isEmpty()) {
					out.println("<script>alert('Invalid post ID.'); history.back();</script>");
					return;
				}

				int postId;
				try {
					postId = Integer.parseInt(postIdStr);
				} catch (NumberFormatException e) {
					out.println("<script>alert('Invalid post ID format.'); history.back();</script>");
					return;
				}
				%>
				
				<h4 class="mt-4">댓글 작성</h4>
				<form action="../../addComment.jsp" method="post">
					<input type="hidden" name="postId" value="<%=postId%>">
					<div class="mb-3">
						<label for="commentContent" class="form-label">댓글 내용</label>
						<textarea class="form-control" id="commentContent" name="content"
							rows="3" required></textarea>
					</div>
					<div class="d-flex justify-content-end">
					<button type="submit" class="btn btn-primary mb-3 justify-content-end">댓글 작성</button>
					</div>
				</form>

				<h3 class="introduce-container">댓글</h3>
				<div id="comments">
					<%
					List<CommentDTO> comments = new CommentDAO().getComments(postId);
					if (comments != null && !comments.isEmpty()) {
						for (CommentDTO comment : comments) {
					%>
					<div class="card mb-2">
						<div class="card-body">
							<p><%=comment.getContent()%></p>
							<small class="text-muted">작성자: <%=comment.getUserId()%>,
								작성일: <%=comment.getCreatedDate()%></small>
						</div>
					</div>
					<%
					}
					} else {
					%>
					<p>댓글이 없습니다.</p>
					<%
					}
					%>
				</div>
				<button type="button" class="btn btn-primary float-end"
						onclick="goForumList()">목록</button>

				<!-- Comment Form -->






			</div>
</body>

</html>
