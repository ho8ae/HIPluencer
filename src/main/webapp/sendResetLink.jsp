<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ResetPasswordBean"%>
<%
    String email = request.getParameter("email");

    ResetPasswordBean bean = new ResetPasswordBean();
    String token = bean.generateToken();

    boolean tokenSaved = bean.saveToken(email, token);
    if (tokenSaved) {
        String resetLink = "http://localhost:8080/JSPBook/view/login/resetPassword.jsp?token=" + token;
        boolean emailSent = bean.sendEmail(email, resetLink);
        if (emailSent) {
            
            
            out.println("<script>");
            out.println("alert('비밀번호 재설정 링크가 이메일로 전송되었습니다. 이메일에서 확인 바랍니다.');");
            out.println("history.back();");
            out.println("</script>");
            
        } else {
            
            out.println("<script>alert('이메일 전송에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
        }
    } else {
        
        out.println("<script>alert('토큰 저장에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
    }
%>
