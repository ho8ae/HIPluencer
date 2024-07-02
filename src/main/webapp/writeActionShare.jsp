<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="share.SharePostDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String content = request.getParameter("content");
String placeName =  request.getParameter("placeName");
String address =  request.getParameter("roadAddressName");
// 이미 선언된 session 변수 사용
session = request.getSession();
String userID = (String) session.getAttribute("userID");


if (userID == null) {
%>
    <script>
        alert("로그인이 필요합니다.");
        location.href = "login.jsp"; // 로그인 페이지로 리다이렉트
    </script>
<%
} else {
	SharePostDAO dao = new SharePostDAO();
    
    int result = dao.write(title, content, userID, placeName, address);

    if (result == -1) {
%>
    <script>
        alert("글 작성에 실패했습니다.");
        history.back();
    </script>
<%
    } else {
        // 글 작성에 성공한 경우, 작성된 글의 ID를 가져와서 view.jsp로 이동
        int postId = result; // 새로 삽입된 게시물의 ID

%>
    <script>
        alert("글 작성이 완료되었습니다.");
        location.href = "view/community/shareView.jsp?postId=<%= postId %>"; // 작성된 글의 ID를 파라미터로 전달하여 view.jsp로 이동
    </script>
<%
    }
}
%>
</body>
</html>
