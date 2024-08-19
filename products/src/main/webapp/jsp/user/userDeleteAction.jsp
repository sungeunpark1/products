<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserVO" scope="page"/>
<jsp:setProperty name="user" property="userno"/>
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
		
		if(user.getUserno()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('入力されていない情報があります.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();		
			int result = userDAO.Delete(user);
			if(result==-1){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('DB errorです 管理者にお問い合わせください。')");
				script.println("history.back()");
				script.println("</script>");
				
				
			}else if(result==0){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('会員番号を確認ください。')");
				script.println("history.back()");
				script.println("</script>");
				
			}else{
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('脱退完了。')");
				script.println("window.opener.location.reload();");
				script.println("window.close();");
				script.println("</script>");
				
			}
		}

	%>
</body>
</html>