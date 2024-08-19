<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="supplier.SupplierDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="supplier" class="supplier.SupplierVO" scope="page"/>
<jsp:setProperty name="supplier" property="sclient"/>
<jsp:setProperty name="supplier" property="sphonenumber"/>
<jsp:setProperty name="supplier" property="saddress"/> 
<jsp:setProperty name="supplier" property="snote"/>
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
		if(supplier.getSclient()==null || supplier.getSphonenumber()==null || supplier.getSaddress()==null || supplier.getSnote()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('入力されていない情報があります.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			SupplierDAO supplierDAO = new SupplierDAO();		
			int result = supplierDAO.join(supplier);
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