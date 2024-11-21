<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.ConnectionPool" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
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
	
	UserDAO dao = new UserDAO();
	
	if(dao.exists(uid) == false){
		out.print("회원 정보를 찾을 수 없습니다.");
		return;
	}
	
	if(dao.delete(uid)){
		out.print("회원 탈퇴가 완료되었습니다.");
		
	}else{
		out.print("회운 탈퇴 중 오류가 발생하였습니다.");
	}
%>