<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원탈퇴</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff; 
            color: #ffffff; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .withdraw-container {
            width: 400px;
            padding: 20px;
            background-color: #222222; /* 컨테이너 배경 어두운 회색 */
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.8); /* 그림자 */
            text-align: center;
        }
        .withdraw-container h2 {
            margin-bottom: 20px;
            color: #ffffff;
            font-size: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group input[type="text"]:focus {
            border-color: #007bff;
            outline: none;
        }
        .submit-button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #ff4d4d; /* 탈퇴 버튼 빨간색 */
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        .submit-button:hover {
            background-color: #cc0000; /* 버튼 호버 시 더 어두운 빨간색 */
        }
    </style>
</head>
<body>
    <div class="withdraw-container">
        <h2>회원탈퇴</h2>
        <form action="withdraw1.jsp" method="post">
            <div class="form-group">
                <label for="id">아이디를 한번 더 입력해주세요 </label>
                <input type="text" name="id" id="id" placeholder="아이디 입력" required>
            </div>
            <input type="submit" value="회원탈퇴하기" class="submit-button">
        </form>
    </div>
</body>
</html>
