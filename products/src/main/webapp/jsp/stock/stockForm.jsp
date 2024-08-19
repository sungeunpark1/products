<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="products.StockDetailDAO" %>
<%@ page import="products.StockDetailVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>join</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    <style>
        body {
            width: 100%;
            height: 100vh; /* 뷰포트 전체 높이 사용 */
            background-image: url("../../img/background.jpg");
            background-size: cover;
            margin: 0;
            display: flex;
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 */
        }

        .content {
            width: 100%;
            max-width: 460px; /* 최대 너비 설정 */

            box-sizing: border-box;
        }

        .login_wrap {
            border: 1px solid #e1e3e5;
            border-radius: 12px;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .login_form {
            padding: 24px;
        }

        .input_name, .input_password {
            position: relative;
            padding: 15px;
            border: 1px solid #c5ccd2;
            
            box-sizing: border-box;
            margin:6px;
            
        }



        .input {
            position: relative;
            display: block;
            width: 100%;
            height: 22px;
            font-size: 16px;
            color: #1e1e23;
            z-index: 5;
            border: none;
            background: transparent;
            outline: none;
            cursor: pointer;
        }

        .input_btn_login {
            margin-top: 20px;
        }

        .btn_login {
            display: block;
            width: 100%;
            padding: 10px 20px;
            border-radius: 8px;
            background-color: #75a8bb;
            box-sizing: border-box;
            border: none;
            color: #fff; /* 텍스트 색상 */
            font-size: 20px; /* 버튼 텍스트 크기 */
            font-weight:bold;
            letter-spacing: 2px;
        }
		label.grade{
			display: block;
			padding: 15px;
			justify-content:center;
			align-items:center;
			border: 1px solid #ddd;
		}
		.grade_title{
			display: flex;
			padding: 10px;
			justify-content:center;
			align-items:center;
			font-weight:bold;
			background-color: #75a8bb;
			margin:20px 0 0 0;
			
		}
		div.grade{
			display: flex;
			padding: 10px;
			width: 100%;
			justify-content:center;
			align-items:center;
			border: 1px solid #ddd;
			font-weight:bold;
			
			
			
		}
		.grade_wrap{
			
			display:flex;
			width:100%;
			
        	box-sizing: border-box;
		}


		div.find_mem_ttl{
			font-size: 25px;
			font-weight: bold;
   			margin-bottom: 20px;
    		text-align: center;
    		letter-spacing: 2px
		}
		

        
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	</div>
		<div class=container>
			<div class=content>
				<div class=login_wrap>
					<div class=login_form>
						<div class=login_box>
							<div class="find_mem_ttl">在庫登録</div>
							<form method="post" action=stockAction.jsp>
								
								<div class=input_password>
									<%
										String selectedIndex = request.getParameter("selectedIndex");
										StockDetailDAO stockDetailDAO=new StockDetailDAO();
										ArrayList<StockDetailVO> list=stockDetailDAO.sdnamebtn();
					
									%>
					
    								
    									<select id="pproduct" name="pproduct" class="stockDetail_wrap_head_btn_select input" >
        									<option  value="商品選択" <%= "選択なし".equals(selectedIndex) ? "selected" : "" %>>選択なし</option>
        									<% 
           						 				// `selectedIndex`는 서버 측에서 설정된 현재 선택된 값입니다.
            					
            									for (int i = 0; i < list.size(); i++) { 
                								String sdname = list.get(i).getSdname();
                								// 현재 `sdname`이 `selectedIndex`와 일치하는지 여부를 확인합니다.
                								boolean isSelected = sdname.equals(selectedIndex);
        									%>
        									<option  id="pproduct" value="<%= sdname %>" <%= isSelected ? "selected" : "" %> id="photo<%= i %>"><%= sdname %></option>
        									<% } %>
    									</select>
									</div>
								
								<div class=input_password>
									<input class=input autocomplete="off" type="text" name=psize id="psize" placeholder="規格">
								</div>
								<div class=input_password>
									<input class=input autocomplete="off" type="number" name=punit id="punit" placeholder="単価">
								</div>
								<div class=input_password>
									<input class=input autocomplete="off" type="number" name=pquantity id="pquantity" placeholder="数量">
								</div>
								<div class=input_password>
									<input class=input autocomplete="off" type="number" name=psupply id="psupply" placeholder="供給価格">
								</div>
								<div class=input_password>
									<input class=input autocomplete="off" type="number" name=ptax id="ptax" placeholder="付加税">
								</div>
								
								<div class=input_btn_login>
									<input class= btn_login type="submit" value="登録">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		
</body>
</html>