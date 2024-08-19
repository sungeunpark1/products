<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="products.ProductDAO" %>
<%@ page import="products.ProductVO" %>
<%@ page import="supplier.SupplierDAO" %>
<%@ page import="supplier.SupplierVO" %>
<%@ page import="client.ClientDAO" %>
<%@ page import="client.ClientVO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<style>
	body{
		background-color:#52C0FF
	}
	.material-symbols-outlined.toggle-Customer.open{
		background-color:#FFB052;
		transition: 1s;
		border-radius: 8px;
	}
	.material-symbols-outlined.toggle-Stock.open{
		background-color:#FFB052;
		transition: 1s;
		border-radius: 8px;
	}
	.material-symbols-outlined.toggle-Supply.open{
		background-color:#FFB052;
		transition: 1s;
		border-radius: 8px;
	}
	.wrap {
    	position: relative;
    	height: 100%;
    	letter-spacing: -.5px;
	}
	.header {
    	height: 80px;
    	box-sizing: border-box;
    	background-color: #52c0ff;
	}
	.header_inner {
    	position: relative;
    	margin: 0 auto;
    	text-align: center;
    	box-sizing: border-box;
    	height:100%;
    	background-color: #52c0ff;
	}
	.material-symbols-outlined{
		width: 120px;
    	height: 62px;
    	font-size: 30px;
    	cursor: pointer;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	font-family: 'Material Symbols Outlined';
    	font-weight: normal;
    	font-style: normal;
    	font-size: 24px;
    	line-height: 1;
    	letter-spacing: normal;
    	text-transform: none;
    	white-space: nowrap;
    	word-wrap: normal;
    	direction: ltr;
    	-webkit-font-feature-settings: 'liga';
    	-webkit-font-smoothing: antialiased;
    	margin:0 auto;
    	transition:0.5s;
	}
	.material-symbols-outlined:hover{
		color:white;
		border-bottom: 1px solid white;
	}
	
	.customer{
		height: 0;
    	overflow: hidden;
    	background: #BAE6FF;
    	position:absolute;
    	width:100%;
		right:0;
		border-radius: 8px 0 0 8px;
    	transition: height 0.7s;
	}
	.customer.open{
		position:absolute;
		height:100%;
		width:100%;
		right:0;
		border-radius: 8px 0 0 8px;
		
	}
	.stock{
		height: 0;
    	overflow: hidden;
    	background: #BAE6FF;
    	position:absolute;
    	width:100%;
		right:0;
		border-radius: 8px 0 0 8px;
    	transition: height 0.7s;
	}
	.stock.open{

		position:absolute;
		height:100%;
		width:100%;
		right:0;
		border-radius: 8px 0 0 8px;
		
	}
	.supply{
		height: 0;
    	overflow: hidden;
    	background: #BAE6FF;
    	position:absolute;
    	width:100%;
		right:0;
		border-radius: 8px 0 0 8px;
    	transition: height 0.7s;
	}
	.supply.open{

		position:absolute;
		height:100%;
		width:100%;
		right:0;
		border-radius: 8px 0 0 8px;
		
	}
	.container{
		position:relative;
	}
	.left{
	 	position:absolute;
	 	height:600px;
	 	width:14%;
	}
	.right{
		position:absolute;
		height:600px;
		width:86%;
		right:0;
		background: #BAE6FF;
		border-radius: 8px 0 0 8px;
	}
	
	/* 태이블 CSS영역 */
	.text_wri_btn{
		width: 100px;
    	height: 30px;
    	line-height: normal; /* 기본 라인 높이 초기화 */
   		background: #52c0ff;
    	border-radius: 3px;
    	font-size: 20px;
    	font-weight: bold;
    	color: black;
    	text-align: center;
    	display: block;
    	position: absolute;
    	right: 180px;
    	bottom: 75px;
    	
    	text-decoration: none;
	}
	.text_wri_btn2{
		width: 100px;
    	height: 30px;
    	line-height: normal; /* 기본 라인 높이 초기화 */
   		background: #52c0ff;
    	border-radius: 3px;
    	font-size: 20px;
    	font-weight: bold;
    	color: black;
    	text-align: center;
    	display: block;
    	position: absolute;
    	right: 180px;
    	bottom: 75px;
    	
    	text-decoration: none;
	}
	.text_wri_btns{
		width: 150px;
    	height: 30px;
    	line-height: normal; /* 기본 라인 높이 초기화 */
   		background: #52c0ff;
    	border-radius: 3px;
    	font-size: 20px;
    	font-weight: bold;
    	color: black;
    	text-align: center;
    	display: block;
    	position: absolute;
    	right: 180px;
    	bottom: 75px;
    	
    	text-decoration: none;
	}
	.title_board{
		font-size: 30px;
    	font-weight: 900;
    	margin-bottom: 10px;
    	padding-top: 14px;
    	text-align: center;
	}
	.board_table{
		width:100%;
		flex: 1;
		
		
	}
	.table_container{
		display: flex;
    	flex-direction: column; /* 세로로 쌓이도록 설정 */
    	align-items: center; /* 가운데 정렬을 위해 필요한 부분 */
	}
	.text_pa1{
		border:2px solid black;
		border-width:2px 0 2px;
	}
	.text_pa{
		
		border-collapse: collapse;
		border-bottom: 1px solid black;
	}
	
	
	tr td.text_pai:nth-child(1){
		width: 10%;
	}
	tr td.text_pai:nth-child(2){
		width: 10%;
	}
	tr td.text_pai:nth-child(3){
		width: 10%;
	}
	tr td.text_pai:nth-child(4){
		width: 15%;
	}
	tr td.text_pai:nth-child(5){
		width: 10%;
	}
	tr td.text_pai:nth-child(6){
		width: 10%;
	}
	
	
	
	tr td.text_pais:nth-child(5){
		width: 30%;
	}
	.text_pats{
		padding:10px 0 10px 10px;
		text-align:center;
		font-weight:900;
		width: 30%;
	}
	.text_pais{
		padding:10px 0 10px 10px;
		text-align:center;
		width: 10%;
	}
	.text_pat2{
		padding:10px 0 10px 10px;
		text-align:center;
		font-weight:900;
		width: 10%;
	}
	.text_paij{
		padding:10px 0 10px 10px;
		text-align:center;
		width: 10%;
	}
	.text_pai{
		padding:10px 0 10px 10px;
		text-align:center;
		
	}
	.text_pais{
		padding:10px 0 10px 10px;
		text-align:center;	
	}
	.text_pat{	
		padding:10px 0 10px 10px;
		font-weight:900;
		width: 10%;
	}
	.text_pat4{	
		padding:10px 0 10px 10px;
		font-weight:900;
		width: 15%;
	}
	.text_pat7{	
		padding:10px 0 10px 10px;
		font-weight:900;
		    
	}
	
	.text_num{
		position: absolute;
    	bottom:0;
    	margin-bottom: 30px;
    	width: 100%;
	}
	.text_number{
		display: flex;
    	justify-content: center; /* 가로 방향 가운데 정렬 */
    	align-items: center; /* 세로 방향 가운데 정렬 */
    	
    	
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
	.logout{
		width: 100px;
    	height: 30px;
    	line-height: normal; /* 기본 라인 높이 초기화 */
   		background: #FFB052;
    	border-radius: 3px;
    	font-size: 20px;
    	font-weight: bold;
    	color: black;
    	text-align: center;
    	display: block;
    	margin:0 auto;
    	margin-top:350px;
	}
	.logout_wrap{
		width:100%
	}
	
	/*시간표 모달  */
	
	
	.header_inner_time{
		width: 120px;
    	height: 62px;
    	font-size: 30px;
    	cursor: pointer;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	font-family: 'Material Symbols Outlined';
    	font-weight: normal;
    	font-style: normal;
    	font-size: 24px;
    	line-height: 1;
    	letter-spacing: normal;
    	text-transform: none;
    	white-space: nowrap;
    	word-wrap: normal;
    	direction: ltr;
    	-webkit-font-feature-settings: 'liga';
    	-webkit-font-smoothing: antialiased;
    	position:absolute;
    	right:10%;
    	bottom:0;
    	background: #BAE6FF;
    	border-radius: 8px 8px 0 0 ;
    	
	}
	.header_inner_time1{
		width: 120px;
    	height: 62px;
    	font-size: 30px;
    	cursor: pointer;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	font-family: 'Material Symbols Outlined';
    	font-weight: normal;
    	font-style: normal;
    	font-size: 24px;
    	line-height: 1;
    	letter-spacing: normal;
    	text-transform: none;
    	white-space: nowrap;
    	word-wrap: normal;
    	direction: ltr;
    	-webkit-font-feature-settings: 'liga';
    	-webkit-font-smoothing: antialiased;
    	position:absolute;
    	right:20%;
    	bottom:0;
    	background: #BAE6FF;
    	border-radius: 8px 8px 0 0 ;
    	
	}
	.header_inner_time2{
		width: 120px;
    	height: 62px;
    	font-size: 30px;
    	cursor: pointer;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	font-family: 'Material Symbols Outlined';
    	font-weight: normal;
    	font-style: normal;
    	font-size: 24px;
    	line-height: 1;
    	letter-spacing: normal;
    	text-transform: none;
    	white-space: nowrap;
    	word-wrap: normal;
    	direction: ltr;
    	-webkit-font-feature-settings: 'liga';
    	-webkit-font-smoothing: antialiased;
    	position:absolute;
    	right:30%;
    	bottom:0;
    	background: #BAE6FF;
    	border-radius: 8px 8px 0 0 ;
	}
	

</style>
</head>
<body>
	<div class=wrap>
		<div class=header>
			<div class=header_inner>
				<div>
					<span class="header_inner_time" onclick="timeFunction()">
                                時間割
                    </span>
				</div>
				<script>
					function timeFunction(){
						let url="../time/time.jsp"// 맵핑주소로 가서 jsp를 보여줄꺼라서 경로는 이렇게
						let popupName = 'timePopup'; // 고정된 이름
						window.open(url ,popupName,'width=710, height=800');// 일단 경로 ,팝업창이름설정역할, 크기	
					}
					
				</script>
				<div>
					<span class="header_inner_time1" onclick="stockFunctionde()">
                                在庫詳細
                    </span>
				</div>
				<script>
					function stockFunctionde(){
						let url="../stock/stockDetail.jsp"// 맵핑주소로 가서 jsp를 보여줄꺼라서 경로는 이렇게
						let popupName = 'stockPopup'; // 고정된 이름
						window.open(url ,popupName,'width=710, height=800');// 일단 경로 ,팝업창이름설정역할, 크기	
					}
					
				</script>
				<div>
					<span class="header_inner_time2" onclick="userFunction()">
                                会員管理
                    </span>
				</div>
				<script>
					function userFunction(){
						let url="../user/user.jsp"// 맵핑주소로 가서 jsp를 보여줄꺼라서 경로는 이렇게
						let popupName = 'userPopup'; // 고정된 이름
						window.open(url ,popupName,'width=710, height=800');// 일단 경로 ,팝업창이름설정역할, 크기	
					}
					
				</script>
			</div>
		</div>
		<div class=container>
			<div class=left>
				
				<div>
					<span class="material-symbols-outlined toggle-Customer">
                                顧客
                    </span>
				</div>
				<div>
					<span class="material-symbols-outlined toggle-Stock">
                                在庫
                    </span>
				</div>
				<div>
					<span class="material-symbols-outlined toggle-Supply">
                                供給業者
                    </span>
				</div>
				<div class="logout_wrap">
					<a class="logout"href="../login/logoutAction.jsp">Logout</a>
				</div>
			</div>
			<div class=right>
				<div class=customer>
					
					<div>
						<div class="title_board">
							顧客情報
						</div>
					</div>
					<div class="table_container">
						<table class="board_table">
							<tr class="text_pa1">
								<th class="text_pat">顧客番号</th>
								<th class="text_pat">購入製品</th>
								<th class="text_pat">顧客名</th>
								<th class="text_pat4">お客様の電話番号</th>
								<th class="text_pat">購入日</th>
								<th class="text_pat">AS期間</th>
								<th class="text_pat7">備考</th>
							</tr>
						</table>
						<table class="board_table" id="ajaxTablec">
							<%
								int pageNumberc=1;
								if(request.getParameter("pageNumberc")!=null){
									pageNumberc= Integer.parseInt(request.getParameter("pageNumberc"));
								}
								ClientDAO clientDAO=new ClientDAO();
								ArrayList<ClientVO> listc=clientDAO.getList(pageNumberc);
								for(int i=0; i<listc.size(); i++){
							%>
						
							<%
								}
							%>
						</table>
					</div>
					<a class="text_wri_btn" href="../client/clientForm.jsp">顧客登録</a>
					<div class="text_num">
						<div class="text_number">
							<%
								int pagemaxc=clientDAO.pageMax()/10;
								for(int i=1; i<=pagemaxc+1; i++){
							%>
							<button class="text_number_btn page" id="page<%=i %>" onclick="preFunctionc(<%=i %>)" value="<%=i %>"><%=i %></button>		
							<%
								}
							%>
						</div>
					</div>
					<script>
			 			var request=new XMLHttpRequest();
						function preFunctionc(pagec){
							request.open("GET","/products/ClientServlet?pageNumberc="+encodeURIComponent(pagec),true);
							console.log("client script부분"+pagec);
							request.onreadystatechange=searchProcessc;
							request.send(null);
						}
						function searchProcessc(){
							console.log("searchProcessc 함수진입!!!!!!!!!!!!!")
							var table=document.getElementById("ajaxTablec");
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
				<div class=stock>
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
						<div class="title_board">
							在庫状況
						</div>
					</div>
					<div class="table_container">
						<table class="board_table">
							<tr class="text_pa1">
								<th class="text_pat2">製品番号</th>
								<th class="text_pat2">商品名</th>
								<th class="text_pat2">規格</th>
								<th class="text_pat2">単価</th>
								<th class="text_pat2">数量</th>
								<th class="text_pat2">供給価格</th>
								<th class="text_pat2">付加税</th>
								<th class="text_pat2">合計</th>
								<th class="text_pat2">date</th>
							</tr>					
						</table>
						<table class="board_table" id="ajaxTable">
							<%
								ProductDAO productDAO=new ProductDAO();
								ArrayList<ProductVO> list=productDAO.getList(pageNumber);
								for(int i=0; i<list.size(); i++){
							%>
							<%
								}
							%>						
						</table>
					</div>
						<a class="text_wri_btn2" href="../stock/stockForm.jsp">在庫登録</a>
					<div class="text_num">
						<div class="text_number">
							<%
								int pagemax=productDAO.pageMax()/10;
								for(int i=1; i<=pagemax+1; i++){
							%>
							<button class="text_number_btn page" id="page<%=i %>" onclick="preFunction(<%=i %>)" value="<%=i %>"><%=i %></button>		
							<%
								}
							%>
						</div>
					</div>
			
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
							table.innerHTML = ""; // 테이블의 내용을 빈 문자열로 설정하여 지움
							 
							if(request.readyState==4 && request.status==200){
								var object=eval('('+request.responseText+ ')');
								var result= object.result;
								for(var i=result.length-1;i>=0;i--){
									var row=table.insertRow(0);
									row.className = "text_pa";
									for(var j=0; j<result[i].length;j++){
										var cell=row.insertCell(j);
										cell.innerHTML=result[i][j].value;
										cell.className = "text_paij";
									}
								}
							}
						}
					</script>			
				</div>
				<div class=supply>

					<div>
						<div class="title_board">
							供給業者
						</div>
					</div>
					<div class="table_container">
						<table class="board_table">
							<tr class="text_pa1">
								<th class="text_pat">供給先番号</th>
								<th class="text_pat">担当者名</th>
								<th class="text_pat">電話番号</th>
								<th class="text_pat">住所</th>
								<th class="text_pats">備考</th>
								<th class="text_pat">入力日</th>
								<th class="text_pat">修正日</th>
							</tr>
						</table>
						<table class="board_table" id="ajaxTables">
							<%
								int pageNumbers=1;
								if(request.getParameter("pageNumbers")!=null){
									pageNumbers= Integer.parseInt(request.getParameter("pageNumbers"));
								}
								SupplierDAO supplierDAO=new SupplierDAO();
								ArrayList<SupplierVO> lists=supplierDAO.getList(pageNumbers);
								for(int i=0; i<lists.size(); i++){
							%>
							<%
								}
							%>
						</table>
					</div>
						<a class="text_wri_btns" href="../supplier/supplierForm.jsp">供給業者登録</a>
					<div class="text_num">
						<div class="text_number">
							<%
								int pagemaxs=supplierDAO.pageMax()/10;
								for(int i=1; i<=pagemaxs+1; i++){
							%>
							<button class="text_number_btn page" id="page<%=i %>" onclick="preFunctions(<%=i %>)" value="<%=i %>"><%=i %></button>		
							<%
								}
							%>
						</div>
					</div>
					<script>
			 			var request=new XMLHttpRequest();
						function preFunctions(pages){
							request.open("GET","/products/SupplierServlet?pageNumbers="+encodeURIComponent(pages),true);
							console.log("supplier script부분"+pages);
							request.onreadystatechange=searchProcesss;
							request.send(null);
						}
						function searchProcesss(){
							console.log("searchProcess1 함수진입!!!!!!!!!!!!!")
							var table=document.getElementById("ajaxTables");
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
										cell.className = "text_pais";
									}
								}
							}
						}
					</script>
				</div>
			</div>
			
			
		</div>
		<div class=footer></div>
	</div>
	<script>
		//customer
		//toggle:토글
		// 접었다 폈다 하는 거
		const CustomerToggleEl= document.querySelector('.toggle-Customer');
		console.log(CustomerToggleEl);
		const CustomerEl =document.querySelector('.customer');
		let isHideCustomer=false;
		CustomerToggleEl.addEventListener('click',function(){
	    	isHideCustomer= !isHideCustomer;
	    	//console.log(isHidePromotion);
	    	
	    	if(isHideCustomer){
	        	//show
	        	StockEl.classList.remove('open');
	        	StockToggleEl.classList.remove('open');
	        	SupplyEl.classList.remove('open');
	        	SupplyToggleEl.classList.remove('open');
	        	CustomerEl.classList.add('open');
	        	CustomerToggleEl.classList.add('open');
	        	isHideStock=false;
	        	isHideSupply=false;
	        	preFunctionc(1);

	        	
	    	}else{
	        	//hide
	        	CustomerEl.classList.remove('open');
	        	CustomerToggleEl.classList.remove('open');
	    	}
		});
		//stock
		//toggle:토글
		// 접었다 폈다 하는 거
		const StockToggleEl= document.querySelector('.toggle-Stock');
		console.log(StockToggleEl);
		const StockEl =document.querySelector('.stock');
		let isHideStock=false;
		StockToggleEl.addEventListener('click',function(){
	    	isHideStock= !isHideStock;
	    	//console.log(isHidePromotion);
	    	
	    	if(isHideStock){
	        	//show
	        	CustomerEl.classList.remove('open');
	        	CustomerToggleEl.classList.remove('open');
	        	SupplyEl.classList.remove('open');
	        	SupplyToggleEl.classList.remove('open');
	        	StockEl.classList.add('open');
	        	StockToggleEl.classList.add('open');
	        	isHideCustomer=false;
	        	isHideSupply=false;
	        	preFunction(1);
	        	
	    	}else{
	        	//hide
	        	StockEl.classList.remove('open');
	        	StockToggleEl.classList.remove('open');
	    	}
		});
		//supply
		//toggle:토글
		// 접었다 폈다 하는 거
		const SupplyToggleEl= document.querySelector('.toggle-Supply');
		console.log(SupplyToggleEl);
		const SupplyEl =document.querySelector('.supply');
		let isHideSupply=false;
		SupplyToggleEl.addEventListener('click',function(){
	    	isHideSupply= !isHideSupply;
	    	
	    	//console.log(isHidePromotion);
	    	if(isHideSupply){
	        	//show
	        	CustomerEl.classList.remove('open');
	        	CustomerToggleEl.classList.remove('open');
	        	StockEl.classList.remove('open');
	        	StockToggleEl.classList.remove('open');
	        	SupplyEl.classList.add('open');
	        	SupplyToggleEl.classList.add('open');
	        	isHideCustomer=false;
	        	isHideStock=false;	        	
	        	preFunctions(1);
	        	
	    	}else{
	        	//hide
	        	SupplyEl.classList.remove('open');
	        	SupplyToggleEl.classList.remove('open');
	    	}
		});


	</script>
</body>
</html>