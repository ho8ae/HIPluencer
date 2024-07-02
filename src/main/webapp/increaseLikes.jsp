<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="community.CommunityDAO"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%
    request.setCharacterEncoding("UTF-8");

    // 세션에서 userId 가져오기
    String userId = (String) session.getAttribute("userID");

    // 로그인되지 않은 경우
    if (userId == null) {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 해주세요.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

    // 요청 파라미터에서 postId 가져오기
    String postIdStr = request.getParameter("postId");
    if (postIdStr == null || postIdStr.isEmpty()) {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('잘못된 요청입니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    }

    int postId = Integer.parseInt(postIdStr);
    CommunityDAO dao = new CommunityDAO();

    // 좋아요 추가 처리
    boolean success = dao.addLike(postId, userId);

    response.setContentType("text/html; charset=UTF-8");
    PrintWriter script = response.getWriter();

    if (success) {
        int likeCount = dao.getLikeCount(postId);
        script.println("<script>");
        script.println("alert('좋아요가 추가되었습니다 ! ');");
        script.println("history.back();");
        script.println("</script>");
    } else {
        int likeCount = dao.getLikeCount(postId);
        script.println("<script>");
        script.println("alert('이미 좋아요를 누르셨습니다. 현재 좋아요 수: " + likeCount + "');");
        script.println("history.back();");
        script.println("</script>");
    }

    script.close();
    
%>
