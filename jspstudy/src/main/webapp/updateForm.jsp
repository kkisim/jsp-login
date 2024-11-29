<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>

<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("loginForm.jsp");
        return;
    }
    session.setAttribute("id", uid);

    UserDAO dao = new UserDAO();
    UserBean user = dao.getUser(uid);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
    .update-container {
        width: 600px;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }
    .update-container h2 {
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
    input[type="text"], input[type="password"] {
        width: calc(100% - 20px);
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ddd;
        border-radius: 6px;
        box-sizing: border-box;
        transition: border-color 0.3s;
    }
    input[type="text"]:focus, input[type="password"]:focus {
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
    .form-actions {
        display: flex;
        justify-content: center;
        gap: 15px;
        margin-top: 20px;
    }
</style>
</head>
<body>
<div class="update-container">
    <h2>회원정보 수정</h2>
    <form action="update.jsp" method="post">
        <table>
            <tr>
                <td align="right">아이디&nbsp;</td>
                <td><input type="text" name="id" value="<%= user.getId() %>" readonly></td>
            </tr>
            <tr>
                <td align="right">패스워드&nbsp;</td>
                <td><input type="password" name="ps" value="<%= user.getPs() %>" required></td>
            </tr>
            <tr>
                <td align="right">패스워드 확인&nbsp;</td>
                <td><input type="password" name="ps2" placeholder="비밀번호 확인" required></td>
            </tr>
            <tr>
                <td align="right">이름&nbsp;</td>
                <td><input type="text" name="name" value="<%= user.getName() %>" required></td>
            </tr>
            <tr>
                <td align="right">전화번호&nbsp;</td>
                <td><input type="text" name="phone" value="<%= user.getPhone() %>" required></td>
            </tr>
            <tr>
                <td align="right">이메일&nbsp;</td>
                <td><input type="text" name="email" value="<%= user.getEmail() %>" required></td>
            </tr>
            <tr>
                <td align="right">생년월일&nbsp;</td>
                <td><input type="text" name="birthDate" value="<%= user.getBirthDate() %>" required></td>
            </tr>
        </table>
        <div class="form-actions">
            <input type="submit" value="회원정보 수정하기">
            <input type="button" value="취소" onclick="location.href='index.html';">
        </div>
    </form>
</div>
</body>
</html>
