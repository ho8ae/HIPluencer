<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@page import="util.SHA256"%>
<%@page import="util.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDAO userDAO = new UserDAO();
String userID = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
if (userID == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요.');");
	script.println("location.href = 'userLogin.jsp'");
	script.println("</script>");
	script.close();
	return;
}
boolean emailChecked = userDAO.getUserEmailChecked(userID);
if (emailChecked == true) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 인증 된 회원입니다.');");
	script.println("location.href = 'intro.jsp'");
	script.println("</script>");
	script.close();
	return;
} // 사용자에게 보낼 메시지를 기입합니다.	
String host = "http://localhost:8080/JSPBook/";
String from = "h20205151@glab.hallym.ac.kr";
String to = userDAO.getUserEmail(userID);
String subject = "메인페이지를 가기 위한 이메일 확인 메일입니다.";
String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." + "<a href='" + host + "emailCheckAction.jsp?code="
		+ new SHA256().getSHA256(to) + "'>이메일 인증하기</a>"; // SMTP에 접속하기 위한 정보를 기입합니다.	
Properties p = new Properties();
p.put("mail.smtp.user", from);
p.put("mail.smtp.host", "smtp.googlemail.com");
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.ssl.protocols", "TLSv1.2");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");

try {
	Authenticator auth = new Gmail();
	Session ses = Session.getInstance(p, auth);
	ses.setDebug(true);
	MimeMessage msg = new MimeMessage(ses);
	msg.setSubject(subject);
	Address fromAddr = new InternetAddress(from);
	msg.setFrom(fromAddr);
	Address toAddr = new InternetAddress(to);
	msg.addRecipient(Message.RecipientType.TO, toAddr);
	msg.setContent(content, "text/html;charset=UTF-8");
	Transport.send(msg);
} catch (Exception e) {
	e.printStackTrace();
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('오류가 발생했습니다..');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}
%>
<!DOCTYPE html>
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
						href="./view/introduce.jsp">소개</a></li>
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
							<div class="p-5">
								<div class="alert alert-success mt-4" role="alert">  이메일
									주소 인증 메일이 전송되었습니다. 이메일에 들어가셔서 인증해주세요.</div>
							</div>
							 
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
