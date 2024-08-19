package products;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String pageNumber1 =request.getParameter("pageNumber");
		int pageNumber=Integer.parseInt(pageNumber1);
		response.getWriter().write(getJSON(pageNumber));
	}

	public String getJSON(int pageNumber) {
		StringBuffer result=new StringBuffer("");
		result.append("{\"result\":[");
		ProductDAO productDAO= new ProductDAO();
		ArrayList<ProductVO> list=productDAO.getList(pageNumber);
		for(int i=0; i<list.size(); i++) {
			
				result.append("[{\"value\": \"" + list.get(i).getPno() + "\"},");
				result.append("{\"value\": \"" + list.get(i).getPproduct() + "\"},");
				result.append("{\"value\": \"" + list.get(i).getPsize() + "\"},");
				result.append("{\"value\": \"" + list.get(i).getPunit() + "\"},");
				result.append("{\"value\": \"" + list.get(i).getPquantity() + "\"},");
				result.append("{\"value\": \"" + list.get(i).getPsupply() + "\"},");
				result.append("{\"value\": \"" + list.get(i).getPtax() + "\"},");
				result.append("{\"value\": \"" + list.get(i).getPsum() + "\"},");
				result.append("{\"value\": \"" + list.get(i).getPdate() + "\"}],");
		}
		result.append("]}");
		return result.toString();
	}
	
}
