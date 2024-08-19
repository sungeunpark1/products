<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="time.TimeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="time" class="time.TimeVO" scope="page"/>
<jsp:setProperty name="time" property="tname"/>
<jsp:setProperty name="time" property="tdate"/>
<jsp:setProperty name="time" property="tmon"/>
<jsp:setProperty name="time" property="ttue"/>
<jsp:setProperty name="time" property="twed"/>
<jsp:setProperty name="time" property="tthu"/>
<jsp:setProperty name="time" property="tfri"/>
<jsp:setProperty name="time" property="tsat"/>
<jsp:setProperty name="time" property="tsun"/>
 
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
		if(time.getTname()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('名前を入力してください。')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			TimeDAO timeDAO = new TimeDAO();		
			int result = timeDAO.join(time);
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
				script.println("location.href='./time.jsp'");
				script.println("</script>");
				
			}
		}

	%>
</body>
</html>