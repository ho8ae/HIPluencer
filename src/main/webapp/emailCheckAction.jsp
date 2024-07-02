<%@page import="java.io.PrintWriter"%>
<%@page import="util.SHA256"%>
<%@page import="user.UserDAO"%>
<%@ page language="java"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String code = request.getParameter("code");
    
    UserDAO userDAO = new UserDAO();
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    if (userID == null) {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 해주세요.');");
        script.println("location.href = 'userLogin.jsp';");
        script.println("</script>");
        script.close();
    } else {
        String userEmail = userDAO.getUserEmail(userID);
        boolean rightCode = new SHA256().getSHA256(userEmail).equals(code);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter script = response.getWriter();
        if (rightCode) {
            userDAO.setUserEmailChecked(userID);
            script.println("<script>");
            script.println("alert('인증에 성공했습니다.');");    
            script.println("location.href = './view/intro.jsp';");
            script.println("</script>");
        } else {
            script.println("<script>");
            script.println("alert('유효하지 않은 코드입니다.');");
            script.println("location.href = './view/intro.jsp';");
            script.println("</script>");
        }
        script.close();
    }
%>
