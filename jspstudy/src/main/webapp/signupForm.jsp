<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
    body {
        font-family: 'Noto Sans', Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .signup-container {
        width: 600px;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }
    .signup-container h2 {
        text-align: center;
        color: #000000;
        margin-bottom: 20px;
        font-size: 24px;
        font-weight: bold;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    td {
        padding: 12px;
    }
    input[type="text"], input[type="password"], select {
        width: calc(100% - 20px);
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ddd;
        border-radius: 6px;
        box-sizing: border-box;
        transition: border-color 0.3s;
    }
    input[type="text"]:focus, input[type="password"]:focus, select:focus {
        border-color: #007bff;
        outline: none;
    }
    input[type="submit"], input[type="button"] {
        padding: 12px 20px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    input[type="submit"] {
        background-color: #007bff;
        color: #ffffff;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    input[type="button"] {
        background-color: #dc3545;
        color: #ffffff;
    }
    input[type="button"]:hover {
        background-color: #a71d2a;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #555;
    }
    .form-actions {
        display: flex;
        justify-content: center;
        gap: 15px;
        margin-top: 20px;
    }
   </style>
</head>
<body>
<div class="signup-container">
    <h2>회원가입</h2>
    <form action="signup1.jsp" method="post" onsubmit="return validateForm()">
        <table>
            <tr>
                <td align="right">아이디&nbsp;</td>
                <td><input type="text" name="id" placeholder="아이디 입력 (6-20자)" required></td>
            </tr>
            <tr>
                <td align="right">비밀번호&nbsp;</td>
                <td><input type="password" id="password" name="ps" placeholder="비밀번호 입력 (8-32자)" required></td>
            </tr>
            <tr>
                <td align="right">비밀번호 확인&nbsp;</td>
                <td><input type="password" id="confirmPassword" name="ps2" placeholder="비밀번호 재입력" required></td>
            </tr>
            <tr>
                <td align="right">이름&nbsp;</td>
                <td><input type="text" name="name" placeholder="이름을 입력해 주세요" required></td>
            </tr>
            <tr>
                <td align="right">전화번호&nbsp;</td>
                <td><input type="text" name="phone" placeholder="휴대폰 번호 입력" required></td>
            </tr>
            <tr>
                <td align="right">이메일&nbsp;</td>
                <td>
                    <input type="text" name="emailPrefix" placeholder="이메일 입력" required style="width: 50%; display: inline-block;">
                    @
                    <select name="emailDomain" style="width: 40%; display: inline-block;">
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">생년월일&nbsp;</td>
                <td>
                    <select name="birthYear" style="width: 30%;">
                        <option value="">년도</option>
                        <% for (int i = 1940; i <= 2024; i++) { %>
                            <option value="<%= i %>"><%= i %></option>
                        <% } %>
                    </select>
                    <select name="birthMonth" style="width: 30%;">
                        <option value="">월</option>
                        <% for (int i = 1; i <= 12; i++) { %>
                            <option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
                        <% } %>
                    </select>
                    <select name="birthDay" style="width: 30%;">
                        <option value="">일</option>
                        <% for (int i = 1; i <= 31; i++) { %>
                            <option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
                        <% } %>
                    </select>
                </td>
            </tr>
        </table>

        <div class="form-actions">
            <input type="submit" value="회원가입">
            <input type="button" value="취소" onclick="window.location.href='index.html';">
        </div>
    </form>
</div>

<script>
    function validateForm() {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;

        // 비밀번호 길이 확인
        if (password.length < 8 || password.length > 32) {
            alert("비밀번호는 8자 이상, 32자 이하로 입력해야 합니다.");
            return false;
        }

        // 비밀번호 복잡성 확인 (숫자, 특수 문자 포함 여부)
        const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,20}$/;
        if (!passwordRegex.test(password)) {
            alert("비밀번호는 영문자, 숫자, 특수문자를 포함해야 합니다.");
            return false;
        }

        // 비밀번호 일치 여부 확인
        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        return true; // 폼 제출 허용
    }
</script>

</body>
</html>
