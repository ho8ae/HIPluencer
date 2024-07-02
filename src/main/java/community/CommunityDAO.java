package community;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import util.DatabaseUtil;

public class CommunityDAO {

	// 글 작성
	// 글 작성
	public int write(String title, String content, String userID) {
		String SQL = "INSERT INTO Posts (userID, title, content) VALUES (?, ?, ?)";
		try (Connection conn = DatabaseUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {
			pstmt.setString(1, userID);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				return rs.getInt(1); // 생성된 게시물의 ID 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // 실패 시 -1 반환
	}

	// 글 목록 가져오기
	public List<CommunityDTO> getList() {
		String SQL = "SELECT * FROM Posts";
		List<CommunityDTO> list = new ArrayList<>();
		try (Connection conn = DatabaseUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery()) {
			while (rs.next()) {
				CommunityDTO dto = new CommunityDTO(rs.getInt("postId"), rs.getString("userID"), rs.getString("title"),
						rs.getString("content"), rs.getTimestamp("createdDate"), rs.getTimestamp("updatedDate"),
						rs.getInt("views"), rs.getInt("likes"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 글 상세 보기
	public CommunityDTO getPost(int postId) {
		String SQL = "SELECT * FROM Posts WHERE postId = ?";
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL)) {
			pstmt.setInt(1, postId);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return new CommunityDTO(rs.getInt("postId"), rs.getString("userID"), rs.getString("title"),
							rs.getString("content"), rs.getTimestamp("createdDate"), rs.getTimestamp("updatedDate"),
							rs.getInt("views"), rs.getInt("likes"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 글 수정
	public int update(int postId, String title, String content) {
		String SQL = "UPDATE Posts SET title = ?, content = ?, updatedDate = CURRENT_TIMESTAMP WHERE postId = ?";
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL)) {
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, postId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 글 삭제
	public int delete(int postId) {
		String SQL = "DELETE FROM Posts WHERE postId = ?";
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL)) {
			pstmt.setInt(1, postId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 조회수 증가
	public int increaseViews(int postId) {
		String SQL = "UPDATE Posts SET views = views + 1 WHERE postId = ?";
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL)) {
			pstmt.setInt(1, postId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 추천수 증가
	public int increaseLikes(int postId) {
		String SQL = "UPDATE Posts SET likes = likes + 1 WHERE postId = ?";
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL)) {
			pstmt.setInt(1, postId);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 마지막으로 삽입된 게시물의 ID 가져오기
	public int getLastInsertedPostId() {
		String SQL = "SELECT LAST_INSERT_ID() AS lastId";
		try (Connection conn = DatabaseUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt("lastId");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // 실패 시 -1 반환
	}

	// 사용자가 작성한 게시물 목록 가져오기
	public List<CommunityDTO> getPostsByUserID(String userID) {
		String SQL = "SELECT * FROM Posts WHERE userID = ?";
		List<CommunityDTO> list = new ArrayList<>();
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL)) {
			pstmt.setString(1, userID);
			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) {
					CommunityDTO dto = new CommunityDTO(rs.getInt("postId"), rs.getString("userID"),
							rs.getString("title"), rs.getString("content"), rs.getTimestamp("createdDate"),
							rs.getTimestamp("updatedDate"), rs.getInt("views"), rs.getInt("likes"));
					list.add(dto);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 검색 기능 추가
	// 검색 기능 추가
//	public List<CommunityDTO> searchPosts(String searchQuery) {
//	    String SQL = "SELECT * FROM Posts WHERE title LIKE ?";
//	    List<CommunityDTO> searchResults = new ArrayList<>();
//	    try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(SQL)) {
//	        pstmt.setString(1, "%" + searchQuery + "%");
//	        try (ResultSet rs = pstmt.executeQuery()) {
//	            while (rs.next()) {
//	                CommunityDTO dto = new CommunityDTO(rs.getInt("postId"), rs.getString("userID"),
//	                        rs.getString("title"), rs.getString("content"), rs.getTimestamp("createdDate"),
//	                        rs.getTimestamp("updatedDate"), rs.getInt("views"), rs.getInt("likes"));
//	                searchResults.add(dto);
//	            }
//	        }
//	    } catch (SQLException e) {
//	        e.printStackTrace();
//	    }
//	    return searchResults;
//	}

	public int getCommentCount(int postId) {
        int commentCount = 0;
        String sql = "SELECT COUNT(*) AS count FROM Comments WHERE postId = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
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
	
	 
	// 글 목록 가져오기
    public List<CommunityDTO> getAllPosts() {
        List<CommunityDTO> list = new ArrayList<>();
        String SQL = "SELECT * FROM Posts ORDER BY postId DESC"; // postId를 기준으로 내림차순 정렬하여 모든 게시물을 가져오는 SQL 쿼리
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                CommunityDTO dto = new CommunityDTO();
                dto.setPostId(rs.getInt("postId"));
                dto.setUserID(rs.getString("userID"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setCreatedDate(rs.getTimestamp("createdDate"));
                dto.setUpdatedDate(rs.getTimestamp("updatedDate"));
                dto.setViews(rs.getInt("views"));
                dto.setLikes(rs.getInt("likes"));
                list.add(dto);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
 // 검색 기능 추가
    public List<CommunityDTO> searchPosts(String searchType, String searchText) {
        String SQL = "SELECT * FROM Posts";
        List<CommunityDTO> searchResults = new ArrayList<>();
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

        try (Connection conn = DatabaseUtil.getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            // 파라미터 설정
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }

            // 쿼리 실행 및 결과 처리
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    CommunityDTO dto = new CommunityDTO(
                        rs.getInt("postId"), 
                        rs.getString("userID"), 
                        rs.getString("title"), 
                        rs.getString("content"), 
                        rs.getTimestamp("createdDate"), 
                        rs.getTimestamp("updatedDate"), 
                        rs.getInt("views"), 
                        rs.getInt("likes")
                    );
                    searchResults.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchResults;
    }
    
 // 게시물에 좋아요 추가 및 좋아요 수 업데이트
    public boolean addLike(int postId, String userId) {
        boolean success = false;
        String checkQuery = "SELECT * FROM Likes WHERE postId = ? AND userId = ?";
        String insertQuery = "INSERT INTO Likes (postId, userId) VALUES (?, ?)";
        String updateQuery = "UPDATE Posts SET likes = likes + 1 WHERE postId = ?";
        Connection conn = null; // Connection 변수를 선언

        try {
            conn = DatabaseUtil.getConnection();
            conn.setAutoCommit(false); // 트랜잭션 시작

            try (PreparedStatement pstmtCheck = conn.prepareStatement(checkQuery);
                 PreparedStatement pstmtInsert = conn.prepareStatement(insertQuery);
                 PreparedStatement pstmtUpdate = conn.prepareStatement(updateQuery)) {

                // 이미 좋아요가 있는지 확인
                pstmtCheck.setInt(1, postId);
                pstmtCheck.setString(2, userId);
                try (ResultSet rs = pstmtCheck.executeQuery()) {
                    if (!rs.next()) { // 이미 좋아요가 없다면
                        pstmtInsert.setInt(1, postId);
                        pstmtInsert.setString(2, userId);
                        pstmtInsert.executeUpdate();

                        pstmtUpdate.setInt(1, postId);
                        pstmtUpdate.executeUpdate();

                        success = true;
                    }
                }

                conn.commit(); // 트랜잭션 커밋

            } catch (SQLException e) {
                e.printStackTrace();
                conn.rollback(); // 에러 발생 시 롤백
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.setAutoCommit(true); // 자동 커밋 모드로 되돌리기
                }
            } catch (SQLException resetEx) {
                resetEx.printStackTrace();
            }
        }

        return success;
    }
    
 // 게시물의 좋아요 수 조회
    public int getLikeCount(int postId) {
        int likeCount = 0;
        String sql = "SELECT likes FROM Posts WHERE postId = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
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
    
 // 사용자가 작성한 모든 글 가져오기
    public List<CommunityDTO> getMyPosts(String userID) {
        String SQL = "SELECT * FROM Posts WHERE userID = ?";
        List<CommunityDTO> list = new ArrayList<>();
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, userID);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    CommunityDTO dto = new CommunityDTO(rs.getInt("postId"), rs.getString("userID"),
                            rs.getString("title"), rs.getString("content"), rs.getTimestamp("createdDate"),
                            rs.getTimestamp("updatedDate"), rs.getInt("views"), rs.getInt("likes"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
 
    
    
}
