package share;

import java.sql.Timestamp;

public class SharePostDTO {
    private int postId;
    private String userID;
    private String title;
    private String content;
    private String placeName;
    private String address;
    private Timestamp createdDate;
    private Timestamp updatedDate;
    private int views;
    private int likes;
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
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public SharePostDTO(int postId, String userID, String title, String content, String placeName, String address,
			Timestamp createdDate, Timestamp updatedDate, int views, int likes) {
		super();
		this.postId = postId;
		this.userID = userID;
		this.title = title;
		this.content = content;
		this.placeName = placeName;
		this.address = address;
		this.createdDate = createdDate;
		this.updatedDate = updatedDate;
		this.views = views;
		this.likes = likes;
	}
	public SharePostDTO() {
		super();
	}

    
    // 생성자, Getter 및 Setter 메서드
}
