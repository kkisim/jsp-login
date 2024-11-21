<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*"  %>

<%@ page import="util.ConnectionPool" %>
<% 
	request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="user" class="dao.UserBean" >
		<jsp:setProperty name = "user" property="*" />
</jsp:useBean>	
<% 
//	String sql = "INSERT INTO user(id, password, name) VALUES(?, ?, ?)";
	
//	Connection conn = ConnectionPool.get();
//	PreparedStatement stmt = conn.prepareStatement(sql);
	
//	stmt.setString(1,user.getId());
//	stmt.setString(2,user.getPs());
//	stmt.setString(3,user.getName());
	
	
//	int count = stmt.executeUpdate();
//
//	if (count == 1){
//		out.print("회원 가입 완료");
//	}else{
//		out.print("오류발생");
//	}
//	stmt.close();
//	conn.close();
 UserDAO dao = new UserDAO();
 
 if(dao.exists(user.getId())){
	 out.print("이미 가입한 회원입니다");
 }
 if(dao.insert(user)){
	 out.print("회원가입 완료");
 }else{
	 out.print("회원 가입 처리중 오류가 발생하였습니다.");
 }
%>