<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="products.ProductDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="product" class="products.ProductVO" scope="page"/>
<jsp:setProperty name="product" property="pproduct"/>
<jsp:setProperty name="product" property="psize"/>
<jsp:setProperty name="product" property="punit"/> 
<jsp:setProperty name="product" property="pquantity"/>
<jsp:setProperty name="product" property="psupply"/>
<jsp:setProperty name="product" property="ptax"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		String username =null;
		if(session.getAttribute("username")!=null){
			username= (String)session.getAttribute("username");
		}
		if(username == null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('loginしてください。')");
			script.println("location.href='../login/login.jsp'");
			script.println("</script>");
		}
		else if(product.getPproduct()==null || product.getPsize()==null || product.getPunit()==null || product.getPquantity()==null || product.getPsupply()==null || product.getPtax()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('入力されていない情報があります.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			ProductDAO productDAO = new ProductDAO();		
			int result = productDAO.join(product);
			if(result==-1){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('DB errorです 管理者にお問い合わせください。')");
				script.println("history.back()");
				script.println("</script>");
				
				
			}else{
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('登録されました。.')");
				script.println("location.href= '../main/main.jsp'");
				script.println("</script>");
				
			}
		}

	%>
</body>
</html>