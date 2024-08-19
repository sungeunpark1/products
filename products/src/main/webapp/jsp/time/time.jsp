<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="time.TimeDAO" %>
<%@ page import="time.TimeVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	body{
		background-color:#BAE6FF;
	}
	.container_time{
		position:relative;
	}
	.left_time{
	 	position:absolute;
	 	height:600px;
	 	width:14%;
	 	
	}
	.right_time{
		position:absolute;
		height:600px;
		width:86%;
		right:0;
		background: #BAE6FF;
		border-radius: 8px 0 0 8px;
	}
	.left_time_wrap{
		
		
		
	}
	
	input[type="month"].time_date_btn {
    	appearance: none; /* 기본 스타일 제거 */
    	padding: 8px; /* 내부 여백 설정 */
    	font-size: 16px; /* 글꼴 크기 설정 */
    	border: 1px solid #ccc; /* 테두리 설정 */
    	border-radius: 4px; /* 모서리 둥글게 설정 */
    	outline: none; /* 포커스 시 테두리 제거 */
    	background-color: #75a8bb; /* 배경색 설정 */
    	margin: 8px auto;
    	width: 120px;
    	display: block;
	}
	.text_pat_time1{
		padding:0px 10px;
		height:40px;
		font-weight:900;
		width: 10%;
		border: 1px solid #52c0ff;
		vertical-align: middle; /* 세로 중앙 정렬 */
		
	}
	.text_pat_time{	
		padding:0px 10px;
		height:40px;
		font-weight:900;
		width: 10%;
		border: 1px solid #52c0ff;
		vertical-align: middle; /* 세로 중앙 정렬 */
		border-top:0px;
		
	}
	.table_wrap{
		width: 100%;
	}
	.left_time_wrap_part1{
		height: 40px;
		font-weight: 900;
		border: 1px solid #52c0ff;
		border-right:0px;
	}
	.left_time_wrap_part{
		height: 40px;
		font-weight: 900;
		border: 1px solid #52c0ff;
		border-top:0px;
		border-right:0px;
	}
	.open0{
		background-color:red;	
	}
	.open1{
		background-color:blue;	
	}
	.open2{
		background-color:pink;	
	}
	.open3{
		background-color:green;	
	}
	.open4{
		background-color:yellow;	
	}
	
	
	
	/* footer */
	.footer{
		position: absolute;
    	bottom: 0;
    	width: 100%;
    	pointer-events: none;
    	opacity: 0;
    	transition: opacity 0.7s;
    	
	}
	.text_pat_timef{
		
		height:40px;
		font-weight:900;
		line-height: 40px; /* 텍스트의 높이와 동일한 값을 설정 */
		border: 1px solid #52c0ff;
		text-align: center;
		border-right: 0px;
		
		
	}
	.footer_body_user1{
		display:flex;
		vertical-align: middle; /* 세로 중앙 정렬 */
	}
	.footer_body_in{
		width:75%;
		
	}
	.footer_body_btn{
		width:50%;
		height: 40px;
    
	}
	.footer_body_user1_wrap{
		display:flex;
		flex-direction: column;
		width: 12.28571%;;
		    
	}
	.text_pat_time_ib{
		display:flex;
	}

	.footer_body_user1_wrapg{
		display:flex;
		flex-direction: column;
		width: 14%;
		    
	}
	.btn_login {
        display: block;        
        padding: 3px 12px;
        border-radius: 8px;
        background-color: #75a8bb;
        box-sizing: content-box;   
        color: #fff; /* 텍스트 색상 */
        font-size: 16px; /* 버튼 텍스트 크기 */
        font-weight:bold;
        letter-spacing: 2px;
        position:absolute;
        top: -43px;
    	right: 10px;
    	height: 25px;
     }
     .btn_login1 {
        display: block;        
        padding: 3px 12px;
        border-radius: 8px;
        background-color: #FFB052;    
        color: #fff; /* 텍스트 색상 */
        font-size: 16px; /* 버튼 텍스트 크기 */
        font-weight:bold;
        letter-spacing: 2px;
        position:absolute;
        top: -43px;
    	right: 110px;
    	width:100px;
    	height: 25px;
    	box-sizing: content-box;
    	text-align: center;
    	cursor: pointer;
     }
     .material-symbols-outlined {
    	display: block;
    	padding: 8px;
    	border-radius: 8px;
    	background-color: #FFB052;
    	box-sizing: border-box;
    	color: #black;
    	font-size: 21px;
    	font-weight: bold;
    	letter-spacing: 2px;
   		position: absolute;
    	top: 8px;
    	right: 10px;
    	cursor: pointer;
	}
	
	.time-in.openc{

		
		opacity: 1;
		pointer-events: auto;
		
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
</head>
<body onload="timeFunction()">
	<input type="month" class="time_date_btn" id="myMonthInput" onchange="timeFunction()" >
	<div >
		<span class="material-symbols-outlined toggle-time" >
        	修正/登録
        </span>
	</div>
	
	
	<div class="container_time">
		<div class="left_time">
			<div class="left_time_wrap">
				<div class="left_time_wrap_part1"></div>
				<div class="left_time_wrap_part">09:00  - 10:00</div>
				<div class="left_time_wrap_part">10:00 - 11:00</div>
				<div class="left_time_wrap_part">11:00 - 12:00</div>
				<div class="left_time_wrap_part">12:00 - 13:00</div>
				<div class="left_time_wrap_part">13:00 - 14:00</div>
				<div class="left_time_wrap_part">14:00 - 15:00</div>
				<div class="left_time_wrap_part">15:00 - 16:00</div>
				<div class="left_time_wrap_part">16:00 - 17:00</div>
				<div class="left_time_wrap_part">17:00 - 18:00</div>
				<div class="left_time_wrap_part">18:00 - 19:00</div>
				<div class="left_time_wrap_part">19:00 - 20:00</div>	
			</div>
			
		</div>
		
		<div class=right_time>
			<div class="table_container">
				<table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time1">月</th>
						<th class="text_pat_time1">火</th>
						<th class="text_pat_time1">水</th>
						<th class="text_pat_time1">木</th>
						<th class="text_pat_time1">金</th>
						<th class="text_pat_time1">土</th>
						<th class="text_pat_time1">日</th>
					</tr>
				</table>
				<table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_1"></th>
						<th class="text_pat_time" id="time_block_2_1"></th>
						<th class="text_pat_time" id="time_block_3_1"></th>
						<th class="text_pat_time" id="time_block_4_1"></th>
						<th class="text_pat_time" id="time_block_5_1"></th>
						<th class="text_pat_time" id="time_block_6_1"></th>
						<th class="text_pat_time" id="time_block_7_1"></th>
					</tr>
				</table>
				<table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_2"></th>
						<th class="text_pat_time" id="time_block_2_2"></th>
						<th class="text_pat_time" id="time_block_3_2"></th>
						<th class="text_pat_time" id="time_block_4_2"></th>
						<th class="text_pat_time" id="time_block_5_2"></th>
						<th class="text_pat_time" id="time_block_6_2"></th>
						<th class="text_pat_time" id="time_block_7_2"></th>
					</tr>
				</table><table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_3"></th>
						<th class="text_pat_time" id="time_block_2_3"></th>
						<th class="text_pat_time" id="time_block_3_3"></th>
						<th class="text_pat_time" id="time_block_4_3"></th>
						<th class="text_pat_time" id="time_block_5_3"></th>
						<th class="text_pat_time" id="time_block_6_3"></th>
						<th class="text_pat_time" id="time_block_7_3"></th>
					</tr>
				</table><table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_4"></th>
						<th class="text_pat_time" id="time_block_2_4"></th>
						<th class="text_pat_time" id="time_block_3_4"></th>
						<th class="text_pat_time" id="time_block_4_4"></th>
						<th class="text_pat_time" id="time_block_5_4"></th>
						<th class="text_pat_time" id="time_block_6_4"></th>
						<th class="text_pat_time" id="time_block_7_4"></th>
					</tr>
				</table><table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_5"></th>
						<th class="text_pat_time" id="time_block_2_5"></th>
						<th class="text_pat_time" id="time_block_3_5"></th>
						<th class="text_pat_time" id="time_block_4_5"></th>
						<th class="text_pat_time" id="time_block_5_5"></th>
						<th class="text_pat_time" id="time_block_6_5"></th>
						<th class="text_pat_time" id="time_block_7_5"></th>
					</tr>
				</table><table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_6"></th>
						<th class="text_pat_time" id="time_block_2_6"></th>
						<th class="text_pat_time" id="time_block_3_6"></th>
						<th class="text_pat_time" id="time_block_4_6"></th>
						<th class="text_pat_time" id="time_block_5_6"></th>
						<th class="text_pat_time" id="time_block_6_6"></th>
						<th class="text_pat_time" id="time_block_7_6"></th>
					</tr>
				</table><table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_7"></th>
						<th class="text_pat_time" id="time_block_2_7"></th>
						<th class="text_pat_time" id="time_block_3_7"></th>
						<th class="text_pat_time" id="time_block_4_7"></th>
						<th class="text_pat_time" id="time_block_5_7"></th>
						<th class="text_pat_time" id="time_block_6_7"></th>
						<th class="text_pat_time" id="time_block_7_7"></th>
					</tr>
				</table><table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_8"></th>
						<th class="text_pat_time" id="time_block_2_8"></th>
						<th class="text_pat_time" id="time_block_3_8"></th>
						<th class="text_pat_time" id="time_block_4_8"></th>
						<th class="text_pat_time" id="time_block_5_8"></th>
						<th class="text_pat_time" id="time_block_6_8"></th>
						<th class="text_pat_time" id="time_block_7_8"></th>
					</tr>
				</table><table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_9"></th>
						<th class="text_pat_time" id="time_block_2_9"></th>
						<th class="text_pat_time" id="time_block_3_9"></th>
						<th class="text_pat_time" id="time_block_4_9"></th>
						<th class="text_pat_time" id="time_block_5_9"></th>
						<th class="text_pat_time" id="time_block_6_9"></th>
						<th class="text_pat_time" id="time_block_7_9"></th>
					</tr>
				</table>
				<table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_10"></th>
						<th class="text_pat_time" id="time_block_2_10"></th>
						<th class="text_pat_time" id="time_block_3_10"></th>
						<th class="text_pat_time" id="time_block_4_10"></th>
						<th class="text_pat_time" id="time_block_5_10"></th>
						<th class="text_pat_time" id="time_block_6_10"></th>
						<th class="text_pat_time" id="time_block_7_10"></th>
					</tr>
				</table>
				<table class="table_wrap">
					<tr class="text_pa1_time">
						<th class="text_pat_time" id="time_block_1_11"></th>
						<th class="text_pat_time" id="time_block_2_11"></th>
						<th class="text_pat_time" id="time_block_3_11"></th>
						<th class="text_pat_time" id="time_block_4_11"></th>
						<th class="text_pat_time" id="time_block_5_11"></th>
						<th class="text_pat_time" id="time_block_6_11"></th>
						<th class="text_pat_time" id="time_block_7_11"></th>
					</tr>
				</table>
				
				
				
				<table class="board_table" id="ajaxTabled">
					<%-- <%

						TimeDAO timeDAO=new TimeDAO();
						ArrayList<TimeVO> listd=timeDAO.getList();
						for(int i=0; i<listd.size(); i++){
					%>
						<tr>
							<td><%= listd.get(i).getTname() %></td>
            				<td><%= listd.get(i).getTmon() %></td>
            				<td><%= listd.get(i).getTtue() %></td>
            				<td><%= listd.get(i).getTwed() %></td>
            				<td><%= listd.get(i).getTthu() %></td>
            				<td><%= listd.get(i).getTfri() %></td>
            				<td><%= listd.get(i).getTsat() %></td>
            				<td><%= listd.get(i).getTsun() %></td>
            				
						</tr>
					<%
						}
					%> --%>
				</table>
			</div>
		</div>
	</div>
	<script>

	
		
		
		var request=new XMLHttpRequest();
		function timeFunction(){
			document.getElementById("footer_body_user1_tdate").value=document.getElementById("myMonthInput").value;
			for(i=0;i<10;i++){
				var elements = document.querySelectorAll('.open'+i);
				var elementi = document.querySelector('.open');
				
				if(elementi !=null){
					elementi.style.backgroundColor = '';
					elementi.classList.remove('open');
					elementi.textContent ="";
				}
				
					
				elements.forEach(function(element) {
			    	element.classList.remove('open'+i);
			    	element.textContent ="";
				});
			}
			request.open("GET","/products/TimeServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
			console.log("date script부분"+document.getElementById("myMonthInput").value);
			request.onreadystatechange=searchProcessd;
			request.send(null);
		}
		
		function searchProcessd(){
			
			console.log("searchProcessd 함수진입!!!!!!!!!!!!!")
			var table=document.getElementById("ajaxTabled");
			table.innerHTML = ""; 							   
			if(request.readyState==4 && request.status==200){
				var object=eval('('+request.responseText+ ')');
				var result= object.result;
				var block="";
				var name="";
				for(var i=0; i<result.length; i++){
					var row=table.insertRow(0);
					console.log("result.length>>"+result.length);
					row.className = "text_pa";
					for(var j=0; j<result[i].length;j++){
						var cell=row.insertCell(j);
						console.log("result[i].length>>"+result[i].length);
						/* cell.innerHTML=result[i][j].value; */
						
						var str=result[i][j].value;
						
						console.log("str>>"+str)
						/* cell.className = "text_pai";  */
						// 예외 처리: str이 null일 경우 빈 문자열로 초기화
                		
                		
						

							if(j==0){
								name=result[i][j].value;
								console.log("name>>"+name);
							}
							else if(j!=0) {

								for(var k=0; k<result[i][j].value.length; k++){
									
									if(str.substring(k, k+1)!=","){

										block+=str.substring(k, k+1);
									}
									
									if(str.substring(k, k+1)==","){
										console.log("blockk>>"+block);										
										const blockEl =document.querySelector('#time_block_'+j+'_'+block);
										blockEl.classList.add('open'+i);
										document.getElementById("time_block_"+j+"_"+block).textContent = name;																					
										block="";
									}else if(k==(result[i][j].value.length-1)){
										
										console.log("blocks>>"+block);
										const blockEl =document.querySelector('#time_block_'+j+'_'+block);
										if(blockEl!==null){
											blockEl.classList.add('open'+i);
											document.getElementById("time_block_"+j+"_"+block).textContent = name;
										}
										else{

										}
										block="";	
									}
								}
								
							}
							
						
						 
						
					}
				}
			 }
			 	
		}	
		document.addEventListener('DOMContentLoaded', function() {
	    	// 현재 날짜 가져오기
	    	var now = new Date();
	    	// 월과 연도를 YYYY-MM 형식으로 변환
	    	var yearMonth = now.getFullYear() + '-' + ('0' + (now.getMonth() + 1)).slice(-2);
	    	// input 요소에 초기 값 설정
	    	document.getElementById('myMonthInput').value = yearMonth;
		});
	</script>
	
	<div class="footer time-in" >
		<div class="footer_head">
			<table class="table_wrap">
				<tr class="text_pa1_time">
					
					
				</tr>
			</table>	
		</div>
		<form method="post" action=timeAction.jsp>
		<div class="footer_body">
		
			<div class="footer_body_user1">
						<input type="hidden" name="tdate" id="footer_body_user1_tdate" >
						<input class="btn_login" type="submit" value="登録">
						<input class="btn_login1" type="text" onclick="timeFunctiond()" value="RESET">
					<div class="footer_body_user1_wrapg">
						<div class="text_pat_timef"></div>
						<div class="text_pat_time_ib">
							<input class="footer_body_in" id="name" name="tname"type="text" placeholder="名前">				
							<input class="footer_body_btn" type="color" name="colorPicker" id="colorPicker">
						</div>
					</div>
				
					<div class="footer_body_user1_wrap">
						<div class="text_pat_timef">月</div>
						<div class="text_pat_time_ib">
							<input class="footer_body_in" name="tmon" id="name0"  type="text"placeholder="ex))1,2" >
							<input class="footer_body_btn"type="button" onclick="timeFunctionf0()">
						</div>
					</div>
				
					<div class="footer_body_user1_wrap">
						<div class="text_pat_timef">火</div>
						<div class="text_pat_time_ib">
							<input class="footer_body_in" name="ttue" id="name1" type="text" placeholder="ex))1,2">
							<input class="footer_body_btn" type="button" onclick="timeFunctionf1()">
						</div>
					</div>
				
					<div class="footer_body_user1_wrap">
						<div class="text_pat_timef">水</div>
						<div class="text_pat_time_ib">
							<input class="footer_body_in" name="twed" id="name2" type="text" placeholder="ex))1,2">
							<input class="footer_body_btn" type="button" onclick="timeFunctionf2()">
						</div>
					</div>
				
					<div class="footer_body_user1_wrap">
						<div class="text_pat_timef">木</div>
						<div class="text_pat_time_ib">
							<input class="footer_body_in" name="tthu" id="name3" type="text" placeholder="ex))1,2">
							<input class="footer_body_btn" type="button" onclick="timeFunctionf3()">
						</div>
					</div>
				
					<div class="footer_body_user1_wrap">
						<div class="text_pat_timef">金</div>
						<div class="text_pat_time_ib">
							<input class="footer_body_in" name="tfri" id="name4" type="text" placeholder="ex))1,2">
							<input class="footer_body_btn" type="button" onclick="timeFunctionf4()">
						</div>
					</div>
				
					<div class="footer_body_user1_wrap">
						<div class="text_pat_timef">土</div>
						<div class="text_pat_time_ib">
							<input class="footer_body_in" name="tsat" id="name5" type="text" placeholder="ex))1,2">
							<input class="footer_body_btn" type="button" onclick="timeFunctionf5()">
						</div>
					</div>
				
					<div class="footer_body_user1_wrap">
						<div class="text_pat_timef">日</div>
						<div class="text_pat_time_ib">
							<input class="footer_body_in" name="tsun" id="name6" type="text" placeholder="ex))1,2">
							<input class="footer_body_btn" type="button" onclick="timeFunctionf6()">
						</div>
					</div>
				
			</div>
			
		</div>
		</form>
	</div>
	<script>
	 function timeFunctionf0(){
	 	var str=document.getElementById("name0").value;
		var name=document.getElementById("name").value;
		var j=1;
		
		for (let i = 1; i < 12; i++) {
		    // 올바른 CSS 선택자를 사용하여 요소 선택
		    let elements = document.querySelector('#time_block_1_' + i);
		    
		    if(elements !=null){
		        // 배경색을 제거하고
		        elements.style.backgroundColor = '';
		        
		        // 'open' 클래스를 제거하고
		        elements.classList.remove('open');
		        
		        // 요소의 텍스트 내용을 비웁니다.
		        elements.textContent = '';
		    };
		}
		timeFunctionfb(str,name,j);
		request.open("GET","/products/TimeServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
		console.log("date script부분"+document.getElementById("myMonthInput").value);
		request.onreadystatechange=searchProcessd;
		request.send(null);
		
	 }
	 function timeFunctionf1(){
	 	var str=document.getElementById("name1").value;
		var name=document.getElementById("name").value;
		var j=2;
		for (let i = 1; i < 12; i++) {
		    // 올바른 CSS 선택자를 사용하여 요소 선택
		    let elements = document.querySelector('#time_block_2_' + i);
		    
		    if(elements !=null){
		        // 배경색을 제거하고
		        elements.style.backgroundColor = '';
		        
		        // 'open' 클래스를 제거하고
		        elements.classList.remove('open');
		        
		        // 요소의 텍스트 내용을 비웁니다.
		        elements.textContent = '';
		    };
		}
		timeFunctionfb(str,name,j);
		request.open("GET","/products/TimeServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
		console.log("date script부분"+document.getElementById("myMonthInput").value);
		request.onreadystatechange=searchProcessd;
		request.send(null);
	 }
	 function timeFunctionf2(){
	 	var str=document.getElementById("name2").value;
		var name=document.getElementById("name").value;
		var j=3;
		for (let i = 1; i < 12; i++) {
		    // 올바른 CSS 선택자를 사용하여 요소 선택
		    let elements = document.querySelector('#time_block_3_' + i);
		    
		    if(elements !=null){
		        // 배경색을 제거하고
		        elements.style.backgroundColor = '';
		        
		        // 'open' 클래스를 제거하고
		        elements.classList.remove('open');
		        
		        // 요소의 텍스트 내용을 비웁니다.
		        elements.textContent = '';
		    };
		}
		timeFunctionfb(str,name,j);
		request.open("GET","/products/TimeServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
		console.log("date script부분"+document.getElementById("myMonthInput").value);
		request.onreadystatechange=searchProcessd;
		request.send(null);
	 }
	 function timeFunctionf3(){
	 	var str=document.getElementById("name3").value;
		var name=document.getElementById("name").value;
		var j=4;
		for (let i = 1; i < 12; i++) {
		    // 올바른 CSS 선택자를 사용하여 요소 선택
		    let elements = document.querySelector('#time_block_4_' + i);
		    
		    if(elements !=null){
		        // 배경색을 제거하고
		        elements.style.backgroundColor = '';
		        
		        // 'open' 클래스를 제거하고
		        elements.classList.remove('open');
		        
		        // 요소의 텍스트 내용을 비웁니다.
		        elements.textContent = '';
		    };
		}
		timeFunctionfb(str,name,j);
		request.open("GET","/products/TimeServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
		console.log("date script부분"+document.getElementById("myMonthInput").value);
		request.onreadystatechange=searchProcessd;
		request.send(null);
	 }
	 function timeFunctionf4(){
	 	var str=document.getElementById("name4").value;
		var name=document.getElementById("name").value;
		var j=5;
		for (let i = 1; i < 12; i++) {
		    // 올바른 CSS 선택자를 사용하여 요소 선택
		    let elements = document.querySelector('#time_block_5_' + i);
		    
		    if(elements !=null){
		        // 배경색을 제거하고
		        elements.style.backgroundColor = '';
		        
		        // 'open' 클래스를 제거하고
		        elements.classList.remove('open');
		        
		        // 요소의 텍스트 내용을 비웁니다.
		        elements.textContent = '';
		    };
		}
		timeFunctionfb(str,name,j);
		request.open("GET","/products/TimeServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
		console.log("date script부분"+document.getElementById("myMonthInput").value);
		request.onreadystatechange=searchProcessd;
		request.send(null);
	 }
	 function timeFunctionf5(){
	 	var str=document.getElementById("name5").value;
		var name=document.getElementById("name").value;
		var j=6;
		for (let i = 1; i < 12; i++) {
		    // 올바른 CSS 선택자를 사용하여 요소 선택
		    let elements = document.querySelector('#time_block_6_' + i);
		    
		    if(elements !=null){
		        // 배경색을 제거하고
		        elements.style.backgroundColor = '';
		        
		        // 'open' 클래스를 제거하고
		        elements.classList.remove('open');
		        
		        // 요소의 텍스트 내용을 비웁니다.
		        elements.textContent = '';
		    };
		}
		timeFunctionfb(str,name,j);
		request.open("GET","/products/TimeServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
		console.log("date script부분"+document.getElementById("myMonthInput").value);
		request.onreadystatechange=searchProcessd;
		request.send(null);
	 }
	 function timeFunctionf6(){
	 	var str=document.getElementById("name6").value;
		var name=document.getElementById("name").value;
		var j=7;
		for (let i = 1; i < 12; i++) {
		    // 올바른 CSS 선택자를 사용하여 요소 선택
		    let elements = document.querySelector('#time_block_7_' + i);
		    
		    if(elements !=null){
		        // 배경색을 제거하고
		        elements.style.backgroundColor = '';
		        
		        // 'open' 클래스를 제거하고
		        elements.classList.remove('open');
		        
		        // 요소의 텍스트 내용을 비웁니다.
		        elements.textContent = '';
		    };
		}
		timeFunctionfb(str,name,j);
		request.open("GET","/products/TimeServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
		console.log("date script부분"+document.getElementById("myMonthInput").value);
		request.onreadystatechange=searchProcessd;
		request.send(null);
	 }
	 
	 	
	 function timeFunctionfb(str ,name,j){	
	 	console.log("----------timeFunctionfb함수 진입------------");
	 	console.log("str>>"+str)
	 	console.log("name>>"+name)
	 	console.log("j>>"+j)
	 	
	 	var block="";
	 	for(var k=0; k<str.length; k++){	
	 		
	 		if(str.substring(k, k+1)!=","){
			block+=str.substring(k, k+1);
			}									
			if(str.substring(k, k+1)==","){
				console.log("blockk>>"+block);										
				const blockEl =document.querySelector('#time_block_'+j+'_'+block);
				console.log("blockEl>>"+blockEl)
				blockEl.classList.add('open');
				
				document.getElementById("time_block_"+j+"_"+block).textContent = name;																					
				block="";
			}else if(k==(str.length-1)){										
				console.log("blocks>>"+block);
				const blockEl =document.querySelector('#time_block_'+j+'_'+block);
				blockEl.classList.add('open');
				
				document.getElementById("time_block_"+j+"_"+block).textContent = name;
				block="";
			}	
		}
	 	const colorDisplay=document.querySelectorAll('.open');
		console.log("colorDisplay>>"+colorDisplay);
		const colorPicker = document.getElementById('colorPicker');
		console.log("colorPicker>>"+colorPicker);
		/* colorDisplay.style.backgroundColor = colorPicker.value; */
		for(i=0; i<colorDisplay.length;i++){
			colorDisplay[i].style.backgroundColor = colorPicker.value;
		}

	 }
	 </script>
	 <script>
		//supply
		//toggle:토글
		// 접었다 폈다 하는 거
		const timeToggleEl= document.querySelector('.toggle-time');
		console.log(timeToggleEl);
		const timeEl =document.querySelector('.time-in');
		let isHideTime=false;
		timeToggleEl.addEventListener('click',function(){
			isHideTime= !isHideTime;
    	
    		//console.log(isHidePromotion);
    		if(isHideTime){
        		//show
        		timeEl.classList.add('openc');
        		timeToggleEl.classList.add('openc');        	
        	
    		}else{
        		//hide
        		timeEl.classList.remove('openc');
        		timeToggleEl.classList.remove('openc');
        		request.open("GET","/products/TimeServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
    			console.log("date script부분"+document.getElementById("myMonthInput").value);
    			request.onreadystatechange=searchProcessd;
    			request.send(null);
    		}
		});

		//delete
		
		var request = new XMLHttpRequest();
		function timeFunctiond(){
			document.getElementById("footer_body_user1_tdate").value=document.getElementById("myMonthInput").value;
			for(i=0;i<10;i++){
				var elements = document.querySelectorAll('.open'+i);
				var elementi = document.querySelector('.open');
				
				if(elementi !=null){
					elementi.style.backgroundColor = '';
					elementi.classList.remove('open');
					elementi.textContent ="";
				}
				
					
				elements.forEach(function(element) {
			    	element.classList.remove('open'+i);
			    	element.textContent ="";
				});
			}
			request.open("GET","/products/TimedServlet?date="+encodeURIComponent(document.getElementById("myMonthInput").value),true);
			console.log("date script부분"+document.getElementById("myMonthInput").value);
			request.onreadystatechange = function() {
			    if (request.readyState === XMLHttpRequest.DONE) { // 요청이 완료되었을 때
			        if (request.status === 200) { // 응답이 성공적일 때
			            console.log("서버 응답:", request.responseText); // 서버 응답을 콘솔에 출력
			            alert("削除されました。");
			        } else {
			            console.error("서버 오류:", request.status, request.statusText); // 서버 오류를 콘솔에 출력
			            alert("管理者にお問い合わせください。");
			        }
			    }
			};
			 request.send();
		}
	</script>
</body>
</html>