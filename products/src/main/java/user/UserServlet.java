package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String pageNumberus1 =request.getParameter("pageNumberus");
		int pageNumberus=Integer.parseInt(pageNumberus1);
		response.getWriter().write(getJSON(pageNumberus));
		System.out.println("두두두둥드앚ㅇ장");
	}

	public String getJSON(int pageNumberus) {
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		UserDAO userDAO= new UserDAO();
		ArrayList<UserVO> listus=userDAO.getList(pageNumberus);
		for(int i=0; i<listus.size(); i++) {
			
				result.append("[{\"value\": \"" + listus.get(i).getUserno() + "\"},");
				result.append("{\"value\": \"" + listus.get(i).getUsername() + "\"},");
				result.append("{\"value\": \"" + listus.get(i).getUsergrade() + "\"},");
				result.append("{\"value\": \"" + listus.get(i).getUserphonenumber() + "\"}],");				
		}
		result.append("]}");
		return result.toString();
	}
	
}
