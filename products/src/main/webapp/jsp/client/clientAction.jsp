<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="client.ClientDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="client" class="client.ClientVO" scope="page"/>
<jsp:setProperty name="client" property="cproduct"/>
<jsp:setProperty name="client" property="cname"/>
<jsp:setProperty name="client" property="cphonenumber"/> 
<jsp:setProperty name="client" property="casdate"/>
<jsp:setProperty name="client" property="cnote"/>
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
		else if(client.getCproduct()==null || client.getCname()==null || client.getCphonenumber()==null || client.getCasdate()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('入力されていない情報があります.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			ClientDAO clientDAO = new ClientDAO();		
			int result = clientDAO.join(client);
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