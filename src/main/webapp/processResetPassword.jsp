<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ResetPasswordBean"%>
<%
    String token = request.getParameter("token");
    String newPassword = request.getParameter("password");

    ResetPasswordBean bean = new ResetPasswordBean();

    boolean isPasswordUpdated = bean.updatePassword(token, newPassword);

    if (isPasswordUpdated) {
        out.println("<script>");
        out.println("alert('비밀번호가 성공적으로 재설정되었습니다.');");
        out.println("location.href= './view/login.jsp'");
        out.println("</script>");
    } else {
        out.println("<script>alert('비밀번호를 재설정하는데 실패했습니다.'); history.back();</script>");
    }
%>
