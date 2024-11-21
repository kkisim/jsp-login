<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*, dao.*" %>
<%
    // 세션에서 사용자 ID 확인
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("loginForm.jsp");
        return;
    }

    // 세션 갱신
    session.setAttribute("id", uid);

    // 피드 리스트 가져오기
    ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>작성글 리스트</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
     
            padding: 10px;
            text-align: left;
        }
        th {
        	text-align: center; /* 중앙 정렬 */
        	font-size: 18px;
            background-color: #007bff;
            color: #ffffff;
        }
        tr:nth-child(even) {
            background-color: #ffffff;
        }
        hr {
            border: none;
            height: 1px;
            background-color: #cccccc;
            margin: 10px 0;
        }
        .buttons {
            text-align: right;
            margin: 10px;
        }
        .buttons button {
            margin-left: 5px;
            padding: 5px 10px;
            font-size: 14px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .buttons button:hover {
            background-color: #0056b3;
        }
        img {
            max-width: 240px;
            height: auto;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th colspan="2">
                    작성글 리스트
                    <div class="buttons">
                        <a href="feedAddForm.jsp"><button>글쓰기</button></a>
                        <a href="logout.jsp"><button>로그아웃</button></a>
                    </div>
                </th>
            </tr>
        </thead>
        <tbody>
            <%
                for (FeedObj feed : feeds) {
                    String img = feed.getImages();
            %>
            <tr>
                <td colspan="2"><hr></td>
            </tr>
            <tr>
                <td><small><%= feed.getId() %></small></td>
                <td align="right"><small>(<%= feed.getTs() %>)</small></td>
            </tr>
            <% if (img != null) { %>
            <tr>
                <td colspan="2">
                    <img src="images/<%= img %>" alt="피드 이미지">
                </td>
            </tr>
            <% } %>
            <tr>
                <td colspan="2"><%= feed.getContent() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
