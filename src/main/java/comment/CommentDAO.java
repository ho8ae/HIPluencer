package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import community.CommunityDTO;
import util.DatabaseUtil;

public class CommentDAO {

    public void addComment(CommentDTO comment) throws SQLException {
        String sql = "INSERT INTO Comments (postId, userId, content, createdDate) VALUES (?, ?, ?, NOW())";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, comment.getPostId());
            pstmt.setString(2, comment.getUserId());
            pstmt.setString(3, comment.getContent());

            pstmt.executeUpdate();
        }
    }

    public List<CommentDTO> getComments(int postId) throws SQLException {
        List<CommentDTO> comments = new ArrayList<>();
        String sql = "SELECT * FROM Comments WHERE postId = ? ORDER BY createdDate DESC";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, postId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    CommentDTO comment = new CommentDTO();
                    comment.setCommentId(rs.getInt("commentId"));
                    comment.setPostId(rs.getInt("postId"));
                    comment.setUserId(rs.getString("userId"));
                    comment.setContent(rs.getString("content"));
                    comment.setCreatedDate(rs.getTimestamp("createdDate"));
                    comment.setUpdatedDate(rs.getTimestamp("updatedDate"));
                    comment.setLikes(rs.getInt("likes"));
                    comments.add(comment);
                }
            }
        }
        return comments;
    }
    
 // 사용자가 작성한 모든 댓글 가져오기
    public List<CommentDTO> getMyComments(String userID) {
        List<CommentDTO> comments = new ArrayList<>();
        String sql = "SELECT * FROM Comments WHERE userId = ? ORDER BY createdDate DESC";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userID);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    CommentDTO comment = new CommentDTO();
                    comment.setCommentId(rs.getInt("commentId"));
                    comment.setPostId(rs.getInt("postId"));
                    comment.setUserId(rs.getString("userId"));
                    comment.setContent(rs.getString("content"));
                    comment.setCreatedDate(rs.getTimestamp("createdDate"));
                    comment.setUpdatedDate(rs.getTimestamp("updatedDate"));
                    comment.setLikes(rs.getInt("likes"));
                    comments.add(comment);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }

}
