package products;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.ClientVO;


public class StockDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String date =request.getParameter("date");
		String category = request.getParameter("category");
		System.out.println("서블렛 들어옴 >> ㅇ닒");
		response.getWriter().write(getJSON(date,category));
	}

	public String getJSON(String date ,String category) {
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		StockDetailDAO stockDetailDAO= new StockDetailDAO();
		ArrayList<ClientVO> listsd=stockDetailDAO.sdDate(date,category);
		for(int i=0; i<listsd.size(); i++) {
			
				result.append("[{\"value\": \"" + listsd.get(i).getCbuydate2() + "\"}],");
				
		}
		result.append("]}");
		return result.toString();
	}
	
}
