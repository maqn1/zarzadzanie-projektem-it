<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>ExelImportPage</title>
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
				margin-bottom: 10px;
			}
			.container .back{
				padding: 15px 25px;
				color: #fff;
				background-color: #ff794d;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #ff6633;
				margin-top: 40px;
			}



			.alert-box {
    			color:#fff;
    			border-radius:10px;
    			font-family:Tahoma,Geneva,Arial,sans-serif;font-size:15px;
			    padding:30px 30px 30px 26px;
			    margin:50px;
			}
			.alert-box span {
			    font-weight:bold;
			    text-transform:uppercase;
			}
			.info {
    			background:#ff8c66;
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
			String id = request.getParameter("userId");
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
		%>
		<div class="container">
			<a href="#" enctype="multipart/form-data"><img src="https://www.chronosly.com/wp-content/uploads/2014/11/excel-logo.png" /></a>
				<form enctype="multipart/form-data">
					<div class="alert-box info">
						<span>info: </span>Choose file!
					</div>
				</form>
					
			<form action="import2.jsp" method="post" enctype="multipart/form-data">
				<input type="file" name="plik_do_importu"></input>
				<input type="submit" value="Import"/>
			</form>
					
					
			<form align="center" action="kierownik.jsp" method="post">
				<input class="back" type="submit" value="BACK"/>
			</form>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>
	</body>
</html>