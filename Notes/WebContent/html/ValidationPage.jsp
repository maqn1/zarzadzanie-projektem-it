<%@ page import ="java.sql.*" %>

<%
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        Class.forName("org.h2.Driver");  // MySQL database connection
        String url = "jdbc:h2:~/notes";
        String user = "maciek";
        String pass = "maciek";
        Connection conn = DriverManager.getConnection(url, user, pass);
        PreparedStatement pst = conn.prepareStatement("SELECT * FROM LOGIN WHERE USERNAME=? AND PASSWORD=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()) {
        	String userType = rs.getString("TYPE");	
        	response.sendRedirect(userType + ".jsp"); 
        } else {
        	response.sendRedirect("LoginPage.jsp");   
        }
%>