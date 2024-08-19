package client;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String pageNumber1 =request.getParameter("pageNumberc");
		int pageNumberc=Integer.parseInt(pageNumber1);
		response.getWriter().write(getJSON(pageNumberc));
	}

	public String getJSON(int pageNumberc) {
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		ClientDAO clientDAO= new ClientDAO();
		ArrayList<ClientVO> listc=clientDAO.getList(pageNumberc);
		for(int i=0; i<listc.size(); i++) {
			
				result.append("[{\"value\": \"" + listc.get(i).getCno() + "\"},");
				result.append("{\"value\": \"" + listc.get(i).getCproduct() + "\"},");
				result.append("{\"value\": \"" + listc.get(i).getCname() + "\"},");
				result.append("{\"value\": \"" + listc.get(i).getCphonenumber() + "\"},");
				result.append("{\"value\": \"" + listc.get(i).getCbuydate() + "\"},");
				result.append("{\"value\": \"" + listc.get(i).getCasdate() + "\"},");
				result.append("{\"value\": \"" + listc.get(i).getCnote() + "\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
}
