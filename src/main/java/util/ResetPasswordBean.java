package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ResetPasswordBean {
    public String generateToken() {
        return UUID.randomUUID().toString();
    }

    public boolean sendEmail(String email, String resetLink) {
        try {
            Session session = MailUtil.getSession();
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("h20205151@glab.hallym.ac.kr"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("비밀번호 재설정 요청");
            message.setText("비밀번호 재설정을 위한 링크: " + resetLink);

            Transport.send(message);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean saveToken(String email, String token) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement("UPDATE user SET userEmailHash=? WHERE userEmail=?");
            pstmt.setString(1, token);
            pstmt.setString(2, email);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(conn, pstmt, null);
        }
        return false;
    }

    public boolean updatePassword(String token, String newPassword) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement("UPDATE user SET userPassword=? WHERE userEmailHash=?");
            pstmt.setString(1, newPassword);
            pstmt.setString(2, token);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(conn, pstmt, null);
        }
        return false;
    }
}
