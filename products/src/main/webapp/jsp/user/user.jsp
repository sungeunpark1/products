<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<style>
	.title_board{
		font-size: 30px;
    	font-weight: 900;
    	margin-bottom: 10px;
    	padding-top: 14px;
    	text-align: center;
    	margin-top: 20px;
	}
	.table_container{
		display: flex;
    	flex-direction: column; /* 세로로 쌓이도록 설정 */
    	align-items: center; /* 가운데 정렬을 위해 필요한 부분 */
    	background: #BAE6FF;
	}
	.board_table{
		width:100%;
		flex: 1;
	}
	.text_pa1{
		border:2px solid black;
		border-width:2px 0 2px;
	}
	.text_pat{	
		padding:10px 0 10px 10px;
		font-weight:900;
		width: 25%;
	}
	 .text_pai{
		padding:10px 0 10px 10px;
		text-align:center;
		width: 25%;
		
	}.text_pa{
		
		border-collapse: collapse;
		border-bottom: 1px solid black;
	}
	.text_number_btn{
		text-decoration: none;
   		padding: 6px;
    	color: #222;
    	border: 1px solid #c2c2c2;
    	display: block;
    	width: 30px;
    	height: 30px;
    	margin: 0 10px;
    	text-align: center;
    	box-sizing: border-box;  	
	}
	.text_num{
		position: absolute;
    	bottom:0;
    	margin-bottom: 100px;
    	width: 100%;
	}
	.text_number{
		display: flex;
    	justify-content: center; /* 가로 방향 가운데 정렬 */
    	align-items: center; /* 세로 방향 가운데 정렬 */
    	
    	
	}
	
	.header_inner_time2 {
    	width: 110px;
    	height: 45px;
    	font-size: 30px;
    	cursor: pointer;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	font-family: 'Material Symbols Outlined';
    	font-weight: bold;
    	font-style: normal;
    	font-size: 20px;
    	line-height: 1;
    	letter-spacing: normal;
    	text-transform: none;
    	white-space: nowrap;
    	word-wrap: normal;
    	direction: ltr;
    	-webkit-font-feature-settings: 'liga';
    	-webkit-font-smoothing: antialiased;
    	/* position: absolute; */
    	right: 30%;
    	bottom: 0;
    	background: #ffb052;
    	border-radius: 8px;
    	margin: 10px;
    	text-decoration: none;
    	color: black;
	}
	body{
		background-color:#52C0FF
	}
	.customer_head_wrap{
		display:flex;
		margin: 15px 0 30px 450px;
	}
	
</style>
</head>
<body onload="userFunctionc(1)">
	<div class=customer>
		<div >
		
			<div class="title_board">
				会員情報
			</div>
			<div class="customer_head_wrap">
				<div>
					<a class="header_inner_time2" href="../login/join.jsp">会員登録</a>
				</div>
				<div>
					<span class="header_inner_time2" onclick="userDeleteFunction()">
                    	会員脱退
                    </span>
				</div>
				<script>
					function userDeleteFunction(){
						let url="./userDelete.jsp"// 맵핑주소로 가서 jsp를 보여줄꺼라서 경로는 이렇게
						let popupName = 'userDelete'; // 고정된 이름
						window.open(url ,popupName,'width=500, height=400');// 일단 경로 ,팝업창이름설정역할, 크기	
					}
	
				</script>
			</div>
		</div>
	<div class="table_container">
		<table class="board_table">
			<tr class="text_pa1">
				<th class="text_pat">会員番号</th>
				<th class="text_pat">会員名前</th>
				<th class="text_pat">グレード</th>
				<th class="text_pat">携帯電話</th>
				<!-- <th class="text_pat">備考</th> -->
			</tr>
		</table>
		<table class="board_table" id="ajaxTableus">
			<%
				int pageNumberus=1;
				if(request.getParameter("pageNumberus")!=null){
					pageNumberus= Integer.parseInt(request.getParameter("pageNumberus"));
				}
				UserDAO userDAO=new UserDAO();
				ArrayList<UserVO> listus=userDAO.getList(pageNumberus);
				for(int i=0; i<listus.size(); i++){
			%>
						
			<%
				}
			%>
		</table>
	</div>
	<!-- <a class="text_wri_btn" href="../client/clientForm.jsp">顧客登録</a> -->
	<div class="text_num">
		<div class="text_number">
			<%
				
				int pagemaxus=userDAO.pageMax()/10;
				for(int i=1; i<=pagemaxus+1; i++){
			%>
			<button class="text_number_btn page" id="page<%=i %>" onclick="userFunctionc(<%=i %>)" value="<%=i %>"><%=i %></button>		
			<%
				}
			%>
		</div>
	</div>
	<script>
		var request=new XMLHttpRequest();
		function userFunctionc(pagec){
			request.open("GET","/products/UserServlet?pageNumberus="+encodeURIComponent(pagec),true);
			console.log("user script부분"+pagec);
			request.onreadystatechange=userProcessc;
			request.send(null);
		}
		function userProcessc(){
			console.log("userProcessc 함수진입!!!!!!!!!!!!!")
			var table=document.getElementById("ajaxTableus");
			table.innerHTML = ""; 							   
			if(request.readyState==4 && request.status==200){
				var object=eval('('+request.responseText+ ')');
				var result= object.result;
				for(var i=result.length-1;i>=0;i--){
					var row=table.insertRow(0);
					row.className = "text_pa";
					for(var j=0; j<result[i].length;j++){
						var cell=row.insertCell(j);
						cell.innerHTML=result[i][j].value;
						cell.className = "text_pai";
					}
				}
			}
		}
	</script>
</div>
</body>
</html>