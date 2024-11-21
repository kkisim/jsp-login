<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글 작성</title>
    <style>
        /* 전체 페이지 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9; /* 배경 밝은 회색 */
            color: #333333; /* 기본 글자 진한 회색 */
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* 폼 컨테이너 스타일 */
        .form-container {
            background-color: #ffffff; /* 컨테이너 배경 흰색 */
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
            padding: 30px;
            width: 400px;
            text-align: center;
        }

        /* 폼 제목 스타일 */
        .form-container h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333333; /* 제목 색상 진한 회색 */
        }

        /* 입력 필드 스타일 */
        input[type="text"], textarea, input[type="file"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #cccccc; /* 입력 필드 테두리 밝은 회색 */
            border-radius: 4px;
            background-color: #ffffff; /* 입력 필드 배경 흰색 */
            color: #333333; /* 입력 필드 글자 진한 회색 */
            font-size: 14px;
        }

        input::placeholder, textarea::placeholder {
            color: #999999; /* placeholder 색상 연한 회색 */
        }

        input[type="file"] {
            padding: 5px;
        }

        textarea {
            resize: none;
        }

        /* 버튼 스타일 */
        input[type="submit"] {
            background-color: #007bff; /* 버튼 파란색 */
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3; /* 버튼 호버 시 어두운 파란색 */
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>글 작성</h2>
        <form action="feedAdd2.jsp" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" placeholder="아이디 입력" required>
            </div>
            <div class="form-group">
                <label for="content">작성글</label>
                <textarea id="content" name="content" rows="5" placeholder="내용을 입력하세요" required></textarea>
            </div>
            <div class="form-group">
                <label for="image">이미지</label>
                <input type="file" id="image" name="image">
            </div>
            <input type="submit" value="업로드하기">
        </form>
    </div>
</body>
</html>
