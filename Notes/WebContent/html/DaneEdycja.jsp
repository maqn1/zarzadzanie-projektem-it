<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>EditData</title>
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
				height: 470px;
				text-align: center;
				background-color: rgba(52, 73, 94, 0.4);
				margin: 0 auto;
				margin-top: 100px;
				border-radius: 10px;
			}
			.container .back{
				padding: 15px 25px;
				color: #fff;
				background-color: #40bf40;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #339933;
				margin-top: 20px;
			}
			input[type="text"]{
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
				margin-top: 130px;
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
			int id = Integer.parseInt(request.getParameter("idDanych"));
			String driverName = "org.h2.Driver";
			String url = "jdbc:h2:~/notes";
			String user = "maciek";
	        String pass = "maciek";
    	%>
    	<div class="container">
	    	<form align="center" action="DaneEdycja2.jsp" enctype="multipart/form-data">
				<input type="text" name="imie" placeholder="Imie" required></input>
				<input type="text" name="nazwisko" placeholder="Nazwisko" required></input>
				<input type="text" name="masa_ciala" placeholder="Masa ciala" required></input>
				<input type="text" name="wzrost" placeholder="Wzrost" required></input>
				<input type="text" name="wiek" placeholder="Wiek" required></input>
				<input type="text" name="aktywnosc" placeholder="Aktywnosc (1-mala, 2-srednia, 3 duza)" required></input>
				<input type="text" name="plec" placeholder="Plec (1-kobieta, 2-mezczyzna)" required></input>
				<input type="hidden" name="idDanych" value="<%=id%>"/><br>
				<input type="submit" class="back" value="CONFIRM"/>
			</form>
			<form align="center" action="dietetyk.jsp" method="post">
				<input class="back" type="submit" value="BACK"/>
			</form>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>
	</body>
</html>