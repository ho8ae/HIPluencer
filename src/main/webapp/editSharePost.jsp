<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="share.SharePostDAO, share.SharePostDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Post</title>
</head>
<body>

	<%
	String postIdStr = request.getParameter("postId");
	if (postIdStr == null || postIdStr.isEmpty()) {
		out.println("<script>alert('Invalid post ID.'); history.back();</script>");
		return;
	}

	int postId;
	try {
		postId = Integer.parseInt(postIdStr);
	} catch (NumberFormatException e) {
		out.println("<script>alert('Invalid post ID format.'); history.back();</script>");
		return;
	}

	SharePostDTO post = new SharePostDAO().getPost(postId);
	if (post == null) {
		out.println("<h3>Post not found</h3>");
		return;
	}
	%>

	<h1>Edit Post</h1>

	<form action="/updatePost" method="post">
		<input type="hidden" name="postId" value="<%=postId%>"> Title:
		<input type="text" name="title" value="<%=post.getTitle()%>"><br>
		Content:
		<textarea name="content"><%=post.getContent()%></textarea>
		<br> <input type="submit" value="Submit">
	</form>

</body>
</html>

<!-- 수정기능을 구현하려고 했으나 실패했습니다.! -->
