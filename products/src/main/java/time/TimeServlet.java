package time;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String date =request.getParameter("date");
		response.getWriter().write(getJSON(date));
	}

	public String getJSON(String date) {
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		TimeDAO timeDAO= new TimeDAO();
		ArrayList<TimeVO> listd=timeDAO.getList(date);
		for(int i=0; i<listd.size(); i++) {
			
				result.append("[{\"value\": \"" + listd.get(i).getTname() + "\"},");
				result.append("{\"value\": \"" + listd.get(i).getTmon() + "\"},");
				result.append("{\"value\": \"" + listd.get(i).getTtue() + "\"},");
				result.append("{\"value\": \"" + listd.get(i).getTwed() + "\"},");
				result.append("{\"value\": \"" + listd.get(i).getTthu() + "\"},");
				result.append("{\"value\": \"" + listd.get(i).getTfri() + "\"},");
				result.append("{\"value\": \"" + listd.get(i).getTsat() + "\"},");
				result.append("{\"value\": \"" + listd.get(i).getTsun() + "\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
}
