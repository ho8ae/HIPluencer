package share;

import util.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import share.SharePostDTO;

public class SharePostDAO {
	private Connection conn;

	public SharePostDAO() {
		conn = DatabaseUtil.getConnection();
	}

	public void close() {
		DatabaseUtil.close(conn, null, null);
	}

	public void addSharePost(SharePostDTO post) {
		String query = "INSERT INTO SharePosts (userID, title, content, placeName, address) VALUES (?, ?, ?, ?, ?)";
		try (PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setString(1, post.getUserID());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getContent());
			pstmt.setString(4, post.getPlaceName());
			pstmt.setString(5, post.getAddress());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<SharePostDTO> getAllSharePosts() {
		List<SharePostDTO> posts = new ArrayList<>();
		String query = "SELECT * FROM SharePosts";
		try (PreparedStatement pstmt = conn.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				SharePostDTO post = new SharePostDTO();
				post.setPostId(rs.getInt("postId"));
				post.setUserID(rs.getString("userID"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setPlaceName(rs.getString("placeName"));
				post.setAddress(rs.getString("address"));
				post.setCreatedDate(rs.getTimestamp("createdDate"));
				post.setUpdatedDate(rs.getTimestamp("updatedDate"));
				post.setViews(rs.getInt("views"));
				post.setLikes(rs.getInt("likes"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return posts;
	}

	public List<SharePostDTO> getPostsByUserId(String userId) {
		List<SharePostDTO> userPosts = new ArrayList<>();
		String query = "SELECT * FROM SharePosts WHERE userID = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setString(1, userId);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					SharePostDTO post = new SharePostDTO();
					post.setPostId(rs.getInt("postId"));
					post.setUserID(rs.getString("userID"));
					post.setTitle(rs.getString("title"));
					post.setContent(rs.getString("content"));
					post.setPlaceName(rs.getString("placeName"));
					post.setAddress(rs.getString("address"));
					post.setCreatedDate(rs.getTimestamp("createdDate"));
					post.setUpdatedDate(rs.getTimestamp("updatedDate"));
					post.setViews(rs.getInt("views"));
					post.setLikes(rs.getInt("likes"));
					userPosts.add(post);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userPosts;
	}

	public int getCommentCount(int postId) {
		int commentCount = 0;
		String sql = "SELECT COUNT(*) AS count FROM ShareComments WHERE postId = ?";

		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, postId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					commentCount = rs.getInt("count");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return commentCount;
	}

	// write
	public int write(String title, String content, String userID, String placeName, String address) {
		String sql = "INSERT INTO SharePosts (title, content, userID, placeName, address) VALUES (?, ?, ?, ?, ?)";
		int result = -1;

		try (Connection conn = DatabaseUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, userID);
			pstmt.setString(4, placeName);
			pstmt.setString(5, address);
			pstmt.executeUpdate();

			try (ResultSet rs = pstmt.getGeneratedKeys()) {
				if (rs.next()) {
					result = rs.getInt(1); // 생성된 게시물의 ID 반환
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// getPost 메서드 추가
	public SharePostDTO getPost(int postId) {
		SharePostDTO post = null;
		String query = "SELECT * FROM SharePosts WHERE postId = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setInt(1, postId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					post = new SharePostDTO();
					post.setPostId(rs.getInt("postId"));
					post.setUserID(rs.getString("userID"));
					post.setTitle(rs.getString("title"));
					post.setContent(rs.getString("content"));
					post.setPlaceName(rs.getString("placeName"));
					post.setAddress(rs.getString("address"));
					post.setCreatedDate(rs.getTimestamp("createdDate"));
					post.setUpdatedDate(rs.getTimestamp("updatedDate"));
					post.setViews(rs.getInt("views"));
					post.setLikes(rs.getInt("likes"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return post;
	}

	public int increaseViews(int postId) {
		String query = "UPDATE SharePosts SET views = views + 1 WHERE postId = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setInt(1, postId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int delete(int postId) {
		String query = "DELETE FROM SharePosts WHERE postId = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setInt(1, postId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 게시물 수정 메서드
	public boolean updatePost(int postId, String title, String content, String placeName, String address) {
		String query = "UPDATE SharePosts SET title = ?, content = ?, placeName = ?, address = ? WHERE postId = ?";
		try (PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, placeName);
			pstmt.setString(4, address);
			pstmt.setInt(5, postId);
			int rowCount = pstmt.executeUpdate();
			return rowCount > 0; // 수정된 행이 있는지 여부를 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<SharePostDTO> getAllPosts() {
		List<SharePostDTO> posts = new ArrayList<>();
		String query = "SELECT * FROM SharePosts ORDER BY postId DESC";
		try (PreparedStatement pstmt = conn.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				SharePostDTO post = new SharePostDTO();
				post.setPostId(rs.getInt("postId"));
				post.setUserID(rs.getString("userID"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setPlaceName(rs.getString("placeName"));
				post.setAddress(rs.getString("address"));
				post.setCreatedDate(rs.getTimestamp("createdDate"));
				post.setUpdatedDate(rs.getTimestamp("updatedDate"));
				post.setViews(rs.getInt("views"));
				post.setLikes(rs.getInt("likes"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return posts;
	}

	// 제목 또는 내용에서 검색한 공유 게시물 조회
	public List<SharePostDTO> searchPosts(String searchType, String searchText) {
		String SQL = "SELECT * FROM SharePosts";
		List<SharePostDTO> searchResults = new ArrayList<>();
		List<Object> params = new ArrayList<>();

		// searchType이 null이면 기본값 "all"로 설정
		if (searchType == null) {
			searchType = "all";
		}

		// SQL 쿼리와 매개변수 설정
		switch (searchType) {
		case "all":
			SQL += " WHERE title LIKE ? OR content LIKE ?";
			params.add("%" + searchText + "%");
			params.add("%" + searchText + "%");
			break;
		case "title":
			SQL += " WHERE title LIKE ?";
			params.add("%" + searchText + "%");
			break;
		case "content":
			SQL += " WHERE content LIKE ?";
			params.add("%" + searchText + "%");
			break;
		default:
			return searchResults; // 유효하지 않은 검색 타입 처리
		}

		try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {

			// 파라미터 설정
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(i + 1, params.get(i));
			}

			// 쿼리 실행 및 결과 처리
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					SharePostDTO dto = new SharePostDTO(rs.getInt("postId"), rs.getString("userID"),
							rs.getString("title"), rs.getString("content"), rs.getString("placeName"),
							rs.getString("address"), rs.getTimestamp("createdDate"), rs.getTimestamp("updatedDate"),
							rs.getInt("views"), rs.getInt("likes"));
					searchResults.add(dto);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchResults;
	}

	public boolean addLike(int postId, String userId) {
		boolean success = false;
		String checkQuery = "SELECT * FROM ShareLikes WHERE postId = ? AND userId = ?";
		String insertQuery = "INSERT INTO ShareLikes (postId, userId) VALUES (?, ?)";
		String updateQuery = "UPDATE SharePosts SET likes = likes + 1 WHERE postId = ?";

		try (PreparedStatement pstmtCheck = conn.prepareStatement(checkQuery)) {
			pstmtCheck.setInt(1, postId);
			pstmtCheck.setString(2, userId);
			try (ResultSet rs = pstmtCheck.executeQuery()) {
				if (!rs.next()) {
					try (PreparedStatement pstmtInsert = conn.prepareStatement(insertQuery)) {
						pstmtInsert.setInt(1, postId);
						pstmtInsert.setString(2, userId);
						pstmtInsert.executeUpdate();
					}
					try (PreparedStatement pstmtUpdate = conn.prepareStatement(updateQuery)) {
						pstmtUpdate.setInt(1, postId);
						pstmtUpdate.executeUpdate();
					}
					success = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return success;
	}

	public int getLikeCount(int postId) {
		int likeCount = 0;
		String sql = "SELECT likes FROM SharePosts WHERE postId = ?";

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, postId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					likeCount = rs.getInt("likes");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return likeCount;
	}
	
	public List<SharePostDTO> getMyPosts(String userID) {
	    List<SharePostDTO> posts = new ArrayList<>();
	    String sql = "SELECT * FROM SharePosts WHERE userID = ? ORDER BY createdDate DESC";

	    try (Connection conn = DatabaseUtil.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {

	        pstmt.setString(1, userID);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	                SharePostDTO post = new SharePostDTO();
	                post.setPostId(rs.getInt("postId"));
	                post.setUserID(rs.getString("userID"));
	                post.setTitle(rs.getString("title"));
	                post.setContent(rs.getString("content"));
	                post.setPlaceName(rs.getString("placeName"));
	                post.setAddress(rs.getString("address"));
	                post.setCreatedDate(rs.getTimestamp("createdDate"));
	                post.setUpdatedDate(rs.getTimestamp("updatedDate"));
	                post.setViews(rs.getInt("views"));
	                post.setLikes(rs.getInt("likes"));
	                posts.add(post);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return posts;
	}


}

// 기타 CRUD 메서드 구현
