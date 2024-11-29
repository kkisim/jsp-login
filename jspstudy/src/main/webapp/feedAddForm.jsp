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

/* 버튼 컨테이너 */
.form-actions {
    display: flex;
    justify-content: space-between; /* 버튼 간격 조정 */
    gap: 10px; /* 버튼 간격 */
    margin-top: 20px;
}

/* 제출 버튼 스타일 */
input[type="submit"] {
    background-color: #007bff; /* 파란색 */
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    width: 48%; /* 버튼 크기 동일 */
    text-align: center;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #0056b3; /* 어두운 파란색 */
}

/* 취소 버튼 스타일 */
input[type="button"] {
    background-color: #dc3545; /* 기본 빨간색 */
    color: #ffffff; 
    padding: 12px 20px; 
    border: none; 
    border-radius: 4px;
    cursor: pointer; 
    font-size: 16px; 
    width: 48%; /* 버튼 크기 동일 */
    text-align: center;
    transition: background-color 0.3s ease; 
}

input[type="button"]:hover {
    background-color: #a71d2a; /* 더 어두운 빨간색 */
}

		        
    </style>
</head>
<body>
    <div class="form-container">
        <h2>글 작성</h2>
 		<form action="feedAdd2.jsp" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" placeholder="제목 입력" required>
        </div>
        <div class="form-group">
            <label for="content">작성글</label>
            <textarea id="content" name="content" rows="5" placeholder="내용을 입력하세요" required></textarea>
        </div>
        <div class="form-group">
            <label for="image">이미지</label>
            <input type="file" id="image" name="image">
        </div>
         <div class="form-actions">
            <input type="submit" value="업로드하기">
            <input type="button" value="취소" onclick="window.location.href='main.jsp';">
        </div>
        </form>
    </div>
</body>
</html>
