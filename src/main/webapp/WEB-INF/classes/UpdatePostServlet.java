

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import share.SharePostDAO;


@WebServlet("/updatePost")
public class UpdatePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String placeName = request.getParameter("placeName");
        String address = request.getParameter("address");

        SharePostDAO postDAO = new SharePostDAO();
        boolean success = postDAO.updatePost(postId, title, content,placeName,address);

        if (success) {
            response.sendRedirect("viewPost.jsp?postId=" + postId); // 수정된 게시물을 표시하는 페이지로 리디렉션
        } else {
        	
        	 response.getWriter().println("게시물 수정에 실패했습니다. 다시 시도해주세요.");
        
            // 수정 실패 처리
        }
    }
}


//서블릿을 이용해서 수정기능을 구현하러 했으나 실패했습니다.