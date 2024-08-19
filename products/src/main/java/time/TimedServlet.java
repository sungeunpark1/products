package time;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TimedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8"); // JSON 응답 설정
		String datec =request.getParameter("date");
		TimeDAO timeDAO= new TimeDAO();
		int result=timeDAO.delete(datec);
		
		// JSON 형식으로 응답 반환
        response.getWriter().write("{\"result\": " + result + "}");
		
	}

	
}
