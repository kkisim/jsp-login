package dao;

import java.sql.*;
import javax.naming.NamingException;
import util.*; //ConnectionPool

public class UserDAO {

    public boolean insert(UserBean user) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try { // 예외처리
            String sql = "INSERT INTO user(id, password, name,phone,email,birth) VALUES(?, ?, ?, ?, ?, ?)";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getId());
            stmt.setString(2, user.getPs());
            stmt.setString(3, user.getName());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getEmail());
            stmt.setString(6, user.getBirthDate());
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false; //반환값 
            
        } finally { // 반드시 실행
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    
    public boolean exists(String uid) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id FROM user WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            return rs.next();
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public boolean delete(String uid) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM user WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }

    public int login(String uid, String upass) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id, password FROM user WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            if (!rs.next()) return 1; //아이디가 없는 경우
            if (!upass.equals(rs.getString("password"))) return 2; //비밀번호가 일치하지 않는 경우

            return 0;
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
    }
    public boolean update(UserBean user) throws NamingException, SQLException { 
    	Connection conn = null;
        PreparedStatement stmt = null;
        try {
        	String sql = "UPDATE user set  password = ? , name = ? phone = ? ,email= ? ,birth = ? where id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getPs());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getPhone());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getBirthDate());
            stmt.setString(6, user.getId());
            
            int rs  = stmt.executeUpdate();
            
            return (rs == 1); //boolean으로 리턴
            	
		} finally  {
			if(stmt != null) stmt.close();
			if(conn != null) stmt.close();
			// TODO: handle exception
		}
    }
    public UserBean getUser(String id) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // 데이터베이스에서 사용자 정보를 가져오는 쿼리
            String sql = "SELECT id, password, name, phone, email, birth FROM user WHERE id = ?";
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);

            rs = stmt.executeQuery();

            if (rs.next()) {
                UserBean user = new UserBean();
                user.setId(rs.getString("id"));
                user.setPs(rs.getString("password"));
                user.setName(rs.getString("name"));
                user.setPhone(rs.getString("phone"));

                // 이메일 분리
                String email = rs.getString("email");
                if (email != null && email.contains("@")) {
                    String[] emailParts = email.split("@");
                    if (emailParts.length == 2) {
                        user.setEmailPrefix(emailParts[0]);
                        user.setEmailDomain(emailParts[1]);
                    }
                }

                // 생년월일 분리
                String birthDate = rs.getString("birth");
                if (birthDate != null && birthDate.matches("\\d{4}-\\d{2}-\\d{2}")) {
                    String[] birthParts = birthDate.split("-");
                    if (birthParts.length == 3) {
                        user.setBirthYear(birthParts[0]);
                        user.setBirthMonth(birthParts[1]);
                        user.setBirthDay(birthParts[2]);
                    }
                }

                return user;
            }
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }

        return null; // 사용자를 찾지 못한 경우
    }


}

 
