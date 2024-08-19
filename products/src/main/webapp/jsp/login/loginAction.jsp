<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserVO" scope="page"/>
<jsp:setProperty name="user" property="username"/>
<jsp:setProperty name="user" property="userpassword"/> 
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
		if(username != null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('既にloginできています.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();		
		int result = userDAO.login(user.getUsername(),user.getUserpassword());
		if(result==1){
			session.setAttribute("username",user.getUsername());
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("location.href='../main/main.jsp'");
			script.println("</script>");
			
			
		}else if(result==0){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
			
		}else if(result==-1){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지않은 아이디.')");
			script.println("history.back()");
			script.println("</script>");
			
		}else if(result==-2){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류 발생.')");
			script.println("history.back()");
			script.println("</script>");
			
		}
	%>
</body>
</html>