<%@ page import="java.io.*, java.sql.*, java.util.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.jsp.*"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="comment.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("UTF-8");


String postIdStr = request.getParameter("postId");
String userId = (String) session.getAttribute("userID");
String content = request.getParameter("content");

if (postIdStr != null && userId != null && content != null) {
    int postId = Integer.parseInt(postIdStr);
    CommentDTO comment = new CommentDTO();
    comment.setPostId(postId);
    comment.setUserId(userId);
    comment.setContent(content);

    try {
        new CommentDAO().addComment(comment);
        response.sendRedirect("./view/community/view.jsp?postId=" + postId);
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    }
} else {
    out.println("<h3>Error: Missing parameters.</h3>");
}
%>
