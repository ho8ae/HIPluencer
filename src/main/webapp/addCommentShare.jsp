<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sharecomment.ShareCommentDAO"%>
<%@ page import="sharecomment.ShareCommentDTO"%>
<%@ page import="java.io.*, java.sql.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.jsp.*"%>

<%
request.setCharacterEncoding("UTF-8");

String postIdStr = request.getParameter("postId");
String userId = (String) session.getAttribute("userID");
String content = request.getParameter("content");

if (postIdStr != null && userId != null && content != null) {
    int postId = Integer.parseInt(postIdStr);
    ShareCommentDTO comment = new ShareCommentDTO();
    comment.setPostId(postId);
    comment.setUserId(userId);
    comment.setContent(content);

    try {
        new ShareCommentDAO().addComment(comment);
        response.sendRedirect("./view/community/shareView.jsp?postId=" + postId);
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    }
} else {
    out.println("<h3>Error: Missing parameters.</h3>");
}
%>
