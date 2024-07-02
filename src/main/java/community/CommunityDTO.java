package community;

import java.sql.Timestamp;

public class CommunityDTO {
    private int postId;
    private String userID;
    private String title;
    private String content;
    private Timestamp createdDate;
    private Timestamp updatedDate;
    private int views;
    private int likes;
    
    
    
    // 기본 생성자
    public CommunityDTO() {
    }

    // 모든 필드를 초기화하는 생성자
    public CommunityDTO(int postId, String userID, String title, String content, Timestamp createdDate, Timestamp updatedDate, int views, int likes) {
        this.postId = postId;
        this.userID = userID;
        this.title = title;
        this.content = content;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
        this.views = views;
        this.likes = likes;
    }
    
    
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public Timestamp getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Timestamp updatedDate) {
		this.updatedDate = updatedDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
    // Getters and Setters
}
