<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%

	//String sql = "DELETE FROM user WHERE id = ?";
	
	//Class.forName("com.mysql.jdbc.Driver");
	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns1","root","1234");
	//Connection conn = ConnectionPool.get();
	//PreparedStatement stmt = conn.prepareStatement(sql);
	//stmt.setString(1, uid);	
	//int count = stmt.executeUpdate();
	//if(count == 1){
	//	out.print("회원 탈퇴가 완료되었습니다.");
	//}
	//stmt.close();
	//conn.close();


	request.setCharacterEncoding("utf-8");
	String loginId = (String) session.getAttribute("id");
	
	String uid = request.getParameter("id");
	
	    // 로그인 상태 확인
    if (loginId == null) {
        out.println("<script>");
        out.println("alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');");
        out.println("location.href='loginForm.jsp';");
        out.println("</script>");
        return;
    }
    // 현재 로그인된 사용자와 삭제 대상 ID가 다른 경우
    if (!loginId.equals(uid)) {
        out.println("<script>");
        out.println("alert('잘못된 요청입니다. 본인 계정만 탈퇴할 수 있습니다.');");
        out.println("location.href='index.html';");
        out.println("</script>");
        return;
    }
	
	
	UserDAO dao = new UserDAO();
	
	 // 삭제 대상 ID가 데이터베이스에 없는 경우
    if (!dao.exists(uid)) {
        out.println("<script>");
        out.println("alert('회원 정보를 찾을 수 없습니다.');");
        out.println("location.href='index.html';");
        out.println("</script>");
        return;
    }

    // 회원 탈퇴 처리
    if (dao.delete(uid)) {
        out.println("<script>");
        out.println("alert('회원 탈퇴가 완료되었습니다.');");
        out.println("location.href='index.html';");
        out.println("</script>");
        session.invalidate(); // 탈퇴 성공 시 세션 종료
    } else {
        out.println("<script>");
        out.println("alert('회원 탈퇴 중 오류가 발생하였습니다.');");
        out.println("location.href='index.html';");
        out.println("</script>");
    }
%>
