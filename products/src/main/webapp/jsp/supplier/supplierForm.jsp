<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<div class="find_mem_ttl">供給先登録</div>
							<form method="post" action=supplierAction.jsp>
								
								<div class=input_password>
									<input class=input autocomplete="off" type="text" name=sclient id="sclient" placeholder="担当者名">
								</div>
								<div class=input_password>
									<input class=input autocomplete="off" type="text" name=sphonenumber id="sphonenumber" placeholder="電話番号">
								</div>
								<div class=input_password>
									<input class=input autocomplete="off" type="number" name=saddress id="saddress" placeholder="住所">
								</div>
								<div class=input_password>
									<input class=input autocomplete="off" type="number" name=snote id="snote" placeholder="備考">
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