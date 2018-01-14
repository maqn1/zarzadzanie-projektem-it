<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>TimeEditPage</title>
		<style>
			body{
				background-image: url(http://1.bp.blogspot.com/_pHOy8pxsb9Y/SwkaEEx9CkI/AAAAAAAACMM/kmnYOUF67MQ/s1600/Gr%C3%A1fico6.jpg);
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
			.container .form-input .time{
				padding: 15px 25px;
				color: #000000;
				background-color: #f2f2f2;
				border: none;
				border-radius: 4px;
				margin-top: 140px;
			}
			.container .form-input .time_but{
				padding: 15px 25px;
				color: #fff;
				background-color: #9698ed;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #7a78d3;
			}
			.container .back{
				padding: 15px 25px;
				color: #fff;
				background-color: #9698ed;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #7a78d3;
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
			String id = request.getParameter("idZamowienia");
			String driverName = "org.h2.Driver";
			String url = "jdbc:h2:~/notes";
			String user = "maciek";
	        String pass = "maciek";
	    %>
		<div class="container">
			<form action="GodzinaDostawyEdycja2.jsp" enctype="multipart/form-data">
				<div class="form-input">
					<input class="time" type="time" name="godzina_dostawy">
					<input type="hidden" name="idZamowienia" value="<%=id%>"/>
					<input class="time_but" type="submit" value="EDIT TIME"/>
				</div>
			</form><br>
			<form align="center" action="kierowca.jsp" method="post">
				<input class="back" type="submit" value="BACK"/>
			</form>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>	
	</body>
</html>