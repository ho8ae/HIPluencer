<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.jsp.*"%>
<%@ page import="share.SharePostDAO"%>
<%@ page import="share.SharePostDTO"%>

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

    String postIdStr = request.getParameter("postId");
    if (postIdStr == null || postIdStr.isEmpty()) {
        out.println("<script>alert('Invalid post ID.'); history.back();</script>");
        return;
    }

    int postId = Integer.parseInt(postIdStr);
    SharePostDAO sharePostDAO = new SharePostDAO();
    SharePostDTO post = sharePostDAO.getPost(postId);

    if (post == null) {
        out.println("<script>alert('Post not found.'); history.back();</script>");
        return;
    }

    if (!userID.equals(post.getUserID())) {
        out.println("<script>alert('You do not have permission to delete this post.'); history.back();</script>");
        return;
    }

    int result = sharePostDAO.delete(postId);
    if (result > 0) {
        out.println("<script>alert('정상적으로 삭제되었습니다.'); location.href='./view/community/share.jsp';</script>");
    } else {
        out.println("<script>alert('삭제가 실패하였습니다.'); history.back();</script>");
    }
%>
