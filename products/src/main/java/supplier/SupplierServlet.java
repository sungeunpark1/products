package supplier;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String pageNumber1 =request.getParameter("pageNumbers");
		int pageNumbers=Integer.parseInt(pageNumber1);
		response.getWriter().write(getJSON(pageNumbers));
	}

	public String getJSON(int pageNumbers) {
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		SupplierDAO supplierDAO= new SupplierDAO();
		ArrayList<SupplierVO> lists=supplierDAO.getList(pageNumbers);
		for(int i=0; i<lists.size(); i++) {
			
				result.append("[{\"value\": \"" + lists.get(i).getSno() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getSclient() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getSphonenumber() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getSaddress() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getSnote() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getSinsertdate() + "\"},");
				result.append("{\"value\": \"" + lists.get(i).getSupdatedate() + "\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
}
