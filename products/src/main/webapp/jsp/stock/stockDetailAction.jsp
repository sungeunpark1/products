
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="products.StockDetailDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>


<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="stockDetail" class="products.StockDetailVO" scope="page"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		
		String saveFolder = "/upload";  // 웹 애플리케이션의 상대 경로
    	String encType = "utf-8";      // 문자 인코딩
    	int maxSize = 5 * 1024 * 1024; // 파일 최대 크기

    	ServletContext context = this.getServletContext();
    	String realFolder = context.getRealPath(saveFolder); // 실제 서버 파일 시스템의 절대 경로
			
		MultipartRequest multi = null;

		//파일업로드를 직접적으로 담당		
		multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());

		//form으로 전달받은 3가지를 가져온다
		String sdphoto = multi.getFilesystemName("sdphoto");
		String sdname = multi.getParameter("sdname");
		String sddescription = multi.getParameter("sddescription");
		
		System.out.print("sdphoto>>"+sdphoto);
		System.out.print("sdname>>"+sdname);
		System.out.println("sddescription>>"+sddescription);
		System.out.println("Real Folder Path: " + realFolder);
		
		stockDetail.setSdname(sdname);
		stockDetail.setSddescription(sddescription);
		
		if(sdphoto != null){
			File oldFile = new File(realFolder+"\\"+sdphoto);
			File newFile = new File(realFolder+"\\"+sdname+"사진.png");
			oldFile.renameTo(newFile);
		}
		
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
		else if(sdname==null ){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('入力されていない情報があります.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			StockDetailDAO stockDetailDAO = new StockDetailDAO();
			int result = stockDetailDAO.join(stockDetail);
			if(result==-1){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('DB errorです 管理者にお問い合わせください。')");
				script.println("history.back()");
				script.println("</script>");
				
				
			}else{
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('登録されました。')");
				script.println("window.opener.location.reload();");
				script.println("window.close();");
				script.println("</script>");
				
			}
		}

	%>
</body>
</html>