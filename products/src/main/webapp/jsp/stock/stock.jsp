<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="products.ProductDAO" %>
<%@ page import="products.ProductVO" %>
<%@ page import="java.util.ArrayList" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
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
		int pageNumber=1;
		if(request.getParameter("pageNumber")!=null){
			pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div>
		<div>
			在庫状況
		</div>
	</div>
	
		<table id="ajaxTable">
			<tr class="text_pa1">
				<th class="text_pat">製品番号</th>
				<th class="text_pat">商品名</th>
				<th class="text_pat">規格</th>
				<th class="text_pat">単価</th>
				<th class="text_pat">数量</th>
				<th class="text_pat">供給価格</th>
				<th class="text_pat">付加税</th>
				<th class="text_pat">合計</th>
				<th class="text_pat">date</th>

			</tr>
	
			<%
				ProductDAO productDAO=new ProductDAO();
				ArrayList<ProductVO> list=productDAO.getList(pageNumber);
				for(int i=0; i<list.size(); i++){
			%>
			<tr id="ajaxTable">
				<td><%= list.get(i).getPno() %></td>
				<td><%= list.get(i).getPproduct() %></td>
				<td><%= list.get(i).getPsize() %></td>
				<td><%= list.get(i).getPunit() %></td>
				<td><%= list.get(i).getPquantity() %></td>
				<td><%= list.get(i).getPsupply() %></td>
				<td><%= list.get(i).getPtax() %></td>
				<td><%= list.get(i).getPsum() %></td>
				<td><%= list.get(i).getPdate() %></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			int pagemax=productDAO.pageMax()/10;
			for(int i=1; i<=pagemax; i++){

		%>
			<button id="page<%=i %>" onclick="preFunction(<%=i %>)" value="<%=i %>"><%=i %></button>
			
		<%
			}
		%>
			
			<script>
			 	var request=new XMLHttpRequest();
				function preFunction(page){
					request.open("GET","/products/ProductServlet?pageNumber="+encodeURIComponent(page),true);
					console.log("script부분"+page);
					request.onreadystatechange=searchProcess;
					request.send(null);
				}
				function searchProcess(){
					console.log("searchProcess 함수진입!!!!!!!!!!!!!")
					var table=document.getElementById("ajaxTable");
					table.innerHTML="";
					if(request.readyState==4 && request.status==200){
						var object=eval('('+request.responseText+ ')');
						var result= object.result;
						for(var i=result.length-1;i>=0;i--){
							var row=table.insertRow(0);
							for(var j=0; j<result[i].length;j++){
								var cell=row.insertCell(j);
								cell.innerHTML=result[i][j].value;
							}
						}
					}
				}
				

			</script>
			
		
		

</body>
</html>