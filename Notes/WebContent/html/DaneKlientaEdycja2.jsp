<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>EditData</title>
		<style>
			body{
				background-image: url(https://wallpaperscraft.com/image/notebook_texture_fields_lines_stripes_75767_2560x1600.jpg);
				-webkit-background-size: cover;
  				-moz-background-size: cover;
  				-o-background-size: cover;
  				background-size: cover;
				background-repeat: no-repeat;
				margin: 0;
				min-height: 580px;
			}
			.container{
				width: 500px;
				height: 400px;
				text-align: center;
				background-color: rgba(52, 73, 94, 0.4);
				margin: 0 auto;
				margin-top: 150px;
				border-radius: 10px;
			}
			.container img{
				width: 120px;
				height: 120px;
				margin-top: -60px;
				margin-bottom: 30px;
			}
			.alert-box {
    			color:#555;
    			border-radius:10px;
    			font-family:Tahoma,Geneva,Arial,sans-serif;font-size:15px;
			    padding:30px 30px 30px 26px;
			    margin:50px;
			}
			.alert-box span {
			    font-weight:bold;
			    text-transform:uppercase;
			}
			.success {
    			background:#e6ffff;
    			border:1px solid #a6ca8a;
			}
			footer{
				margin: 0;
			}
			footer p{
				float: right;
				margin-right: 20px;
				margin-top: 150px;
				color: white;
				font-family: sans-serif;
			}
			footer-text{
				color: white;
			}
		</style>
	</head>
	<body>
		<%
			Integer id = Integer.parseInt(request.getParameter("idKlienta"));
			String imie = request.getParameter("imie");
			String nazwisko = request.getParameter("nazwisko");
			Integer telefon = Integer.parseInt(request.getParameter("telefon"));
			String ulica = request.getParameter("ulica");
			String miasto = request.getParameter("miasto");
			Integer liczba_kalorii = Integer.parseInt(request.getParameter("liczba_kalorii"));
			String driverName = "org.h2.Driver";
			String url = "jdbc:h2:~/notes";
			String user = "maciek";
		    String pass = "maciek";
		    
		    	
				
				try{
			    	Class.forName(driverName);
			    }catch(ClassNotFoundException e){
			    	e.printStackTrace();
			    }
			    
			    Connection connection = null;
			    Statement statement = null;
			    ResultSet resultSet = null;
		
					
				connection = DriverManager.getConnection(url, user, pass);
				statement = connection.createStatement();
				String sql = "UPDATE KLIENT SET IMIE = '"+imie+"', NAZWISKO ='"+nazwisko+"', TELEFON = '"+telefon+"', ULICA ='"+ulica+"', MIASTO = '"+miasto+"', LICZBA_KALORII = '"+liczba_kalorii+"' WHERE ID_KLIENTA = "+id;
				statement.executeUpdate(sql);
		%>
		<div class="container">
			<a href="kierownik.jsp"><img src="http://muktafabrics.com/web/wp-content/uploads/2016/03/blue-heading-icons_thumbsup.png" /></a>
			<form enctype="multipart/form-data">
				<div class="alert-box success">
					<span>success: </span>Data changed correctly!
				</div>
			</form>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>
	</body>
</html>