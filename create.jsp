<%@ page import="java.sql.*" %>
<%@ page contentType="application/json" %>
<%
    String url = "jdbc:mysql://localhost:3306/first_db";
    String username = "root";
    String password = "ram123";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    response.setContentType("application/json");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);
        stmt = conn.createStatement();
        String sql = "SELECT * FROM myemp";
        rs = stmt.executeQuery(sql);
        StringBuilder json = new StringBuilder();
        json.append("[");
        while (rs.next()) {
            json.append("{");
            json.append("\"eno\":").append(rs.getInt("eno")).append(",");
            json.append("\"ename\":\"").append(rs.getString("ename")).append("\",");
            json.append("\"esal\":").append(rs.getFloat("esal")).append(",");
            json.append("\"egrade\":\"").append(rs.getString("egrade")).append("\"");
            json.append("},");
        }
        itfinally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
