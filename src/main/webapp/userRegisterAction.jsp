<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<%
    request.setCharacterEncoding("UTF-8");
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");
    String userEmail = request.getParameter("userEmail");

    PrintWriter script = response.getWriter();

    if (userID == null || userPassword == null || userEmail == null) {
        script.println("<script>");
        script.println("alert('입력이 안 된 사항이 있습니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
        return;
    } 

    UserDAO userDAO = new UserDAO();
    int result = userDAO.join(new UserDTO(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false));

    if (result == -1) {
        script.println("<script>");
        script.println("alert('이미 존재하는 아이디입니다.');");
        script.println("history.back();");
        script.println("</script>");
        script.close();
    } else {
        session.setAttribute("userID", userID);
        script.println("<script>");
        script.println("location.href = 'emailSendAction.jsp';");
        script.println("</script>");
        script.close();
    }
%>
