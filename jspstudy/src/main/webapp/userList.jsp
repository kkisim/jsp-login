<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="util.ConnectionPool" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = ConnectionPool.get();
	String sql = "SELECT id, name , ts FROM user";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	
	String str ="<table border='0' align=\"center\"><caption> 가입자 리스트</caption><tr>";
	while(rs.next()){
		str += "<tr><td colspan=3><hr></td></tr><td>" + rs.getString("id") + "</td><td>" + rs.getString("name") + "</td><td>" + rs.getTimestamp("ts") + "</td></tr><tr>";
	}
	str += "</tr></table>";
	out.print(str);
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>