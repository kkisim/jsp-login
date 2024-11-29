<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .login-container {
            width: 400px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333333;
        }
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group input[type="text"]:focus,
        .form-group input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
        }
        .submit-buttons {
            display: flex;
            justify-content: center;
        }
        .submit-buttons input[type="submit"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            color: #ffffff;
            background-color: #007bff;
            cursor: pointer;
        }
        .submit-buttons input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .signup-link {
            margin-top: 20px;
            text-align: center;
        }
        .signup-link a {
            text-decoration: none;
            color: #007bff;
            font-size: 14px;
        }
        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="login.jsp" method="post">
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" name="id" id="id" placeholder="아이디 입력" required>
            </div>
            <div class="form-group">
                <label for="ps">패스워드</label>
                <input type="password" name="ps" id="ps" placeholder="비밀번호 입력" required>
            </div>
            <div class="submit-buttons">
                <input type="submit" value="로그인하기">
            </div>
        </form>
        <div class="signup-link">
            <p>아직 회원이 아니신가요? <a href="signupForm.jsp">회원가입</a></p>
        </div>
    </div>
</body>
</html>
