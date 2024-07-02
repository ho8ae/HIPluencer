create database Hipluncer;

use Hipluncer;

create table user(
	userID char(20),
    userPassword varchar(64),
    userEmail varchar(50),
    userEmailHash varchar(64),
    userEmailChecked boolean
    );
    
alter table user add primary key(userID);

desc user;



select * from user;




CREATE TABLE Posts (
    postId INT AUTO_INCREMENT PRIMARY KEY,
    userID CHAR(20) NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    FOREIGN KEY (userID) REFERENCES user(userID)
);


DELETE FROM Posts;

select * from Posts;

DELETE FROM Posts WHERE postId > 0;


ALTER TABLE Posts AUTO_INCREMENT = 1;


CREATE TABLE Comments (
    commentId INT AUTO_INCREMENT PRIMARY KEY,
    postId INT NOT NULL,
    userId CHAR(20) NOT NULL,
    content TEXT NOT NULL,
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    likes INT DEFAULT 0,
    FOREIGN KEY (postId) REFERENCES Posts(postId),
    FOREIGN KEY (userId) REFERENCES user(userID)
);



ALTER TABLE comments ADD CONSTRAINT unique_postId UNIQUE (postId);
ALTER TABLE comments DROP INDEX unique_postId;

CREATE TABLE SharePosts (
    postId INT AUTO_INCREMENT PRIMARY KEY,
    userID CHAR(20) NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    placeName VARCHAR(100),   -- 장소 이름을 저장하는 열
    address VARCHAR(255),     -- 주소를 저장하는 열
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    FOREIGN KEY (userID) REFERENCES user(userID) -- 수정된 부분
);

select * from sharePosts;



CREATE TABLE ShareLikes (
    likeId INT AUTO_INCREMENT PRIMARY KEY,
    postId INT,
    userId VARCHAR(50),
    likeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_like (postId, userId),
    FOREIGN KEY (postId) REFERENCES SharePosts(postId),
    FOREIGN KEY (userId) REFERENCES user(userID)
);

-- 외래 키 제약 조건 삭제
ALTER TABLE ShareLikes
DROP FOREIGN KEY sharelikes_ibfk_2;
CREATE TABLE Likes (
    likeId INT AUTO_INCREMENT PRIMARY KEY,
    postId INT,
    userId VARCHAR(50),
    likeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_like (postId, userId),
    FOREIGN KEY (postId) REFERENCES SharePosts(postId),
    FOREIGN KEY (userId) REFERENCES user(userID)
);

-- 외래 키 제약 조건 삭제
ALTER TABLE Likes
DROP FOREIGN KEY likes_ibfk_2;

select * from ShareLikes;


-- 공유 댓글! 
CREATE TABLE ShareComments (
    commentId INT AUTO_INCREMENT PRIMARY KEY,
    postId INT NOT NULL,
    userId CHAR(20) NOT NULL,
    content TEXT NOT NULL,
    createdDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    likes INT DEFAULT 0,
    FOREIGN KEY (postId) REFERENCES SharePosts(postId) ON DELETE CASCADE,
    FOREIGN KEY (userId) REFERENCES user(userID)
);
-- 공유 댓글 의 삭제,추가  
-- 외래 키 제약 조건 삭제
ALTER TABLE ShareComments
DROP FOREIGN KEY sharecomments_ibfk_1;

-- 연쇄 삭제 설정 추가
ALTER TABLE ShareComments
ADD CONSTRAINT sharecomments_ibfk_1
FOREIGN KEY (postId) REFERENCES SharePosts(postId)
ON DELETE CASCADE;




desc SharePosts;

select * from SharePosts;

-- 연쇄 삭제 스키마 수정  
ALTER TABLE Comments
DROP FOREIGN KEY comments_ibfk_1;

ALTER TABLE Comments
ADD CONSTRAINT comments_ibfk_1
FOREIGN KEY (postId) REFERENCES Posts(postId)
ON DELETE CASCADE;
-- 여기까지 !

select * from Comments;
