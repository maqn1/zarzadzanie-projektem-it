<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>

<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>AddDataPage</title>
		<style>
			body{
				background-image: url(https://wallpaperscraft.com/image/notebook_texture_fields_lines_stripes_75767_2560x1600.jpg);
				-webkit-background: cover;
				-moz-background: cover;
				-o-background: cover;
				background-size: cover;
				background-repeat: no-repeat;
				margin: 0;
			}
			.container{
				width: 600px;
				height: 320px;
				text-align: center;
				background-color: rgba(52, 73, 94, 0.4);
				margin: 0 auto;
				margin-top: 170px;
				border-radius: 10px;
			}
			.container .back{
				padding: 15px 25px;
				color: #fff;
				background-color: #40bf40;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #339933;
				margin-top: 10px;
			}
			.container .confirm{
				padding: 15px 25px;
				color: #fff;
				background-color: #40bf40;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #339933;
				margin-top: 20px;
			}
			input[type="text"],[type="number"]{
				height: 30px;
				width: 280px;
				font-size: 18px;
				margin-top: 10px;
				margin-bottom: 5px;
				background-color: #fff;
				padding-left: 20px;
			}
			footer{
				margin: 0;
			}
			footer p{
				float: right;
				margin-right: 20px;
				margin-top: 210px;
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
			String driverName = "org.h2.Driver";
			String url = "jdbc:h2:~/notes";
			String user = "maciek";
	        String pass = "maciek";
	    %>
		<div class="container">
			<form align="center" action="DodajPlatnosc2.jsp" enctype="multipart/form-data">
				<div>
				<input type="number" name="id_platnosci" placeholder="enter id" required></input>
				<input type="text" name="id_zamowienia" placeholder="enter order id" required></input>
				<input type="text" name="zaplacono" placeholder="how many paid?" required></input><br>
				<input type="submit" class="confirm" value="CONFIRM"/>
				</div>
			</form>	
			<form align="center" action="kierownik4.jsp" method="post">
				<p><input class="back" type="submit" value="BACK"/></p>
			</form>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>	
	</body>
</html>