<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="products.StockDetailDAO" %>
<%@ page import="products.StockDetailVO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<style>
	/* background-color:#FFB052;
	   background-color:#52C0FF;
	   background-color: #75a8bb; */ 
	
	.stockDetail_wrap_head{
		height:100%;
		width:100%;
		background-color:#52C0FF;
	}
	.stockDetail_wrap_head_wrap{
		height:80px;
		display:flex;
		justify-content: space-between;
    	align-items: center;
	}
	
	.stockDetail_wrap_head_btn_select {
    padding: 5px 10px;
    border: 4px solid #52C0FF;
    border-radius: 10px;
    background-color:#FFB052;
    color: #333;
    font-size: 16px;
    cursor: pointer;
    outline: none;
    transition: all 0.3s ease;
    margin-right: 300px;
	}

	/* select 요소의 hover 상태 스타일 */
	.stockDetail_wrap_head_btn_select:hover {
    	border-color: #75a8bb;
	}

	/* select 요소의 focus 상태 스타일 */
	.stockDetail_wrap_head_btn_select:focus {
    	border-color: #75a8bb;
    	box-shadow: 0 0 5px rgba(0, 128, 0, 0.2);
	}

	/* 옵션 스타일 (선택된 옵션은 기본 스타일 유지) */
	.stockDetail_wrap_head_btn_select option {
    	padding: 10px;
	}
	
	.header_inner_time {
    width: 120px;
    height: 62px;
    font-size: 30px;
    cursor: pointer;
    font-family: 'Material Symbols Outlined';
    font-weight: bold;
    font-style: normal;
    font-size: 24px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    margin: 0 auto;
    transition: 0.5s;
	}
	.header_inner_time:hover{
		color:white;
		border-bottom: 1px solid white;
	}
	
	.stockDetail_wrap_head_btn2{
		margin-right:40px;
	}
	.stockDetail_wrap_head_btn_title{
		font-weight: bold;
    	font-style: normal;
    	font-size: 17px;
    	line-height: 1;
    	margin-left:40px;
	}
	/*body*/
	.stockDetail_wrap_body{
		/* background-color:red; */
		height:300px;
		
	}
	.stockDetail_wrap_body_photo{
		height:351px;
    	text-align: center;
		background-color: #BAE6FF;
		width:50%;
	}
	.stockDetail_wrap_body{
		display:flex;
	}
	.stockDetail_wrap_body_description{
		height:351px;
    	text-align: center;
		background-color: #BAE6FF;
		width:50%;
	}
	.stockDetail_wrap_body_description_text{
		display: block;
		font-size: 17px;
		margin-top: 20px;
	
	}
	.stockDetail_wrap_body_description_title{
		font-weight: bold;
    	font-size: 20px;
    	margin-top: 37px;
    	
    	display: inline-block;
	}
	
	
	/*footer*/
	.stockDetail_wrap_footer{
		background-color: #BAE6FF;
		padding-top: 68px;
		
		
	}
	
	.stockDetail_wrap_footer_Graph{
		height: 245px;
	}
	input[type="number"].stockDetail_date_btn {
    	appearance: none;
    	padding: 8px;
    	font-size: 14px;
    	border: 1px solid #ccc;
    	font-weight: bold;
    	border-radius: 4px;
    	outline: none;
    	background-color: #ffb052;
    	margin: 8px auto;
    	width: 120px;
    	
    	
	}
	.stockDetail_wrap_footer_title{
		padding-left: 28px;
	}
	
	
	

</style>
</head>
<body>
	 <script>
	 	window.onload = setDefaultYear;
	 	
        // 페이지 로드 시 기본 값을 현재 연도로 설정하는 함수
        function setDefaultYear() {
            const input = document.getElementById('stockDetailInput');
            const currentYear = new Date().getFullYear();
            input.value = currentYear;
            console.log(currentYear);
            stockDetailFunction2();
        }
     </script>
	<div class="stockDetail_wrap">
		<div class="stockDetail_wrap_head">
			<div class="stockDetail_wrap_head_wrap">
				<div class="stockDetail_wrap_head_btn_title">
					商品名:
				</div>
				
				<div class="stockDetail_wrap_head_btn">
					
					
					
					<%
					String selectedIndex = request.getParameter("selectedIndex");
					StockDetailDAO stockDetailDAO=new StockDetailDAO();
					ArrayList<StockDetailVO> list=stockDetailDAO.sdnamebtn();
					
					%>
					
    				<form id="stockForm" method="get" action="stockDetail.jsp">
    					<select id="stockSelect" name="selectedIndex" class="stockDetail_wrap_head_btn_select" onchange="document.getElementById('stockForm').submit();">
        					<option value="選択なし" <%= "選択なし".equals(selectedIndex) ? "selected" : "" %>>選択なし</option>
        					<% 
           						 // `selectedIndex`는 서버 측에서 설정된 현재 선택된 값입니다.
            					
            					for (int i = 0; i < list.size(); i++) { 
                					String sdname = list.get(i).getSdname();
                					// 현재 `sdname`이 `selectedIndex`와 일치하는지 여부를 확인합니다.
                					boolean isSelected = sdname.equals(selectedIndex);
        					%>
        					<option value="<%= sdname %>" <%= isSelected ? "selected" : "" %> id="photo<%= i %>"><%= sdname %></option>
        					<% } %>
    					</select>
					</form>
    				
				</div>
				<div class="stockDetail_wrap_head_btn2">
					<div>
						<span class="header_inner_time" onclick="stockdetailFunction()">
                                在庫登録
                    	</span>
					</div>
					<script>
						function stockdetailFunction(){
							let url="./stockDetailForm.jsp"// 맵핑주소로 가서 jsp를 보여줄꺼라서 경로는 이렇게
							window.open(url ,'在庫登録','width=710px height=800px');// 일단 경로 ,팝업창이름설정역할, 크기	
						}
					
					</script>
				</div>
			</div>
		</div>
		<div class="stockDetail_wrap_body">
			
			<div class="stockDetail_wrap_body_photo">
				
						
						<%
							
							
							String real = "C:\\pleiades\\2024-03\\pro\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\products\\upload";
							File viewFile = new File(real+"\\"+selectedIndex+"사진.png");
							System.out.println(real+"\\"+selectedIndex+"사진.png");
							if(viewFile.exists()){ 
						%>
						<tr>
				           <td colspan="6"><br><br>
				               <img src="/products/upload/<%= selectedIndex %>사진.png" border="300px" width="300px" height="300px">
				               <br><br>
				           </td>
				        </tr>
						<%
    						} else {
						%>
        					<tr>
            					<td colspan="6"><br><br>
                					<p>해당 이미지 파일이 존재하지 않습니다.</p>
            					</td>
        					</tr>
						<%
    						}
						%>
					
				
			</div>
			<div class="stockDetail_wrap_body_description">
				<%
					System.out.println("selectedIndex>>"+selectedIndex);
					String sdd=stockDetailDAO.sdDescription(selectedIndex);
					System.out.println("sdd>>"+sdd);
				%>
				<span class="stockDetail_wrap_body_description_title" >
                       詳細説明
                </span>
				<span class="stockDetail_wrap_body_description_text" >
                       <%=sdd %>
                </span>
			</div>
		</div>
		
		
		
		<div class="stockDetail_wrap_footer">
			<div class="stockDetail_wrap_footer_title">
				<input type="number" placeholder="YYYY"class="stockDetail_date_btn" id="stockDetailInput" oninput="stockDetailFunction2()" >
				
				<span>
				</span>
			</div>
			<div class="stockDetail_wrap_footer_Graph">
				<canvas id="myBarChart" width="400" height="140"></canvas>
    			
			</div>
		</div>
	</div>
	<script>
	 var myBarChart; // 전역에서 차트 변수 선언
	function stockDetailFunction2(){
		var request=new XMLHttpRequest();
		var stockDetailValue = encodeURIComponent(document.getElementById("stockDetailInput").value);
		var categoryValue = encodeURIComponent(document.getElementById("stockSelect").value);
		console.log("categoryValue>>>>"+document.getElementById("stockSelect").value);
		
		request.open("GET","/products/StockDetailServlet?date="+stockDetailValue+"&category="+categoryValue,true);
		console.log("date script부분"+document.getElementById("stockDetailInput").value);
		request.onreadystatechange = function() {
            if (request.readyState == 4 && request.status == 200) {
                stockProcess(request.responseText); // 응답 텍스트를 stockProcess로 전달
            }
        };
		
		request.send(null);
	}
	
	function stockProcess(responseText){
		
		console.log("stockProcess 함수진입!!!!!!!!!!!!!")
		
		
			var object = eval('(' + responseText + ')');
			var result= object.result;
			var block="";
			var name="";
			var sdda1=0;
			var sdda2=0;
			var sdda3=0;
			var sdda4=0;
			var sdda5=0;
			var sdda6=0;
			var sdda7=0;
			var sdda8=0;
			var sdda9=0;
			var sdda10=0;
			var sdda11=0;
			var sdda12=0;
			
			for(var i=0; i<result.length; i++){					
				for(var j=0; j<result[i].length;j++){
					console.log("result[i][j]>>"+result[i][j].value);					
					if(result[i][j].value=="01"){
						sdda1+=1
					}else if(result[i][j].value=="02"){
						sdda2+=1
					}else if(result[i][j].value=="03"){
						sdda3+=1
					}else if(result[i][j].value=="04"){
						sdda4+=1
					}else if(result[i][j].value=="05"){
						sdda5+=1
					}else if(result[i][j].value=="06"){
						sdda6+=1
					}else if(result[i][j].value=="07"){
						sdda7+=1
					}else if(result[i][j].value=="08"){
						sdda8+=1
					}else if(result[i][j].value=="09"){
						sdda9+=1
					}else if(result[i][j].value=="10"){
						sdda10+=1
					}else if(result[i][j].value=="11"){
						sdda11+=1
					}else if(result[i][j].value=="12"){
						sdda12+=1
					}
					
				}
			}
			var data = [sdda1, sdda2, sdda3, sdda4, sdda5, sdda6, sdda7, sdda8, sdda9, sdda10, sdda11, sdda12];
			var ctx = document.getElementById('myBarChart').getContext('2d');
			if (typeof myBarChart!== 'undefined') {
				myBarChart.destroy();
            }
			myBarChart = new Chart(ctx, {
    			type: 'bar', // 막대 그래프 타입
    			data: {
        			labels: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'], // X축 레이블
        			datasets: [{
            			label: '販売量',
            			data: data, // 데이터 값
            			backgroundColor: 'rgba(75, 192, 192, 0.2)', // 막대 색상
            			borderColor: 'rgba(75, 192, 192, 1)', // 막대 테두리 색상
            			borderWidth: 1
        			}]
    			},
    			options: {
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top',
                            labels: {
                                color: 'rgb(75, 192, 192)',
                                font: {
                                    size: 14,
                                    weight: 'bold'
                                }
                            }
                        }
                    },
                    scales: {
                        x: {
                            ticks: {
                                color: 'rgb(75, 192, 192)',
                                font: {
                                    size: 12,
                                    weight: 'normal'
                                }
                            }
                        },
                        y: {
                            ticks: {
                                color: 'rgb(75, 192, 192)',
                                font: {
                                    size: 12,
                                    weight: 'normal'
                                }
                            },
                            beginAtZero: true // Y축이 0부터 시작하도록 설정
                        }
                    }
                }
			});
		 
		 	
	}
	</script>
	<script>
		
	</script>


	
	
</body>
</html>