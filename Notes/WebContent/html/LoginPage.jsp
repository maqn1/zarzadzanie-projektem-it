<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>LoginPage</title>
		<link rel="stylesheet" type="text/css" href="css/style1.css"></link>
		<link rel="stylesheet" type="text/css" href="css/font-awesome1.css"></link>
		
		<style>
			body{
				background-image: url(http://www.walldevil.com/wallpapers/a70/wallpaper-cartoon-desktop-breakfast-drink-food.jpg);
				-webkit-background: cover;
				-moz-background: cover;
				-o-background: cover;
				background-size: cover;
				background-repeat: no-repeat;
				margin: 0;
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
			input[type="text"], input[type="password"]{
				height: 45px;
				width: 300px;
				font-size: 18px;
				margin-bottom: 20px;
				background-color: #fff;
				padding-left: 20px;
			}
			form-input:before{
				background: url(http://rms.safeguardstorage.com.my/DefaultPage/default/loginlogored.png);
				content: "\f007";
				position: absolute;
				font-family: "FontAwesome";
				font-size: 30px;
				color: #985986;
				padding-top: 5px;
				font-size: 35px;
			}
			.btn-login{
				padding: 15px 25px;
				color: #fff;
				background-color: #b90000;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #990000;
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
		<div class="container">
			<img src="http://rms.safeguardstorage.com.my/DefaultPage/default/loginlogored.png"/>
			<form action="ValidationPage.jsp">
				<div class="form-input">
					<input type="text" name="username" required>
				</div>
				<div class="form-input">
					<input type="password" name="password" required>
				</div>
				<input type="submit" name="submit" value="LOGIN" class="btn-login">
			</form>
		</div>	
		<footer>
			<p class="footer-text">Markiewicz & Tomczak Fruit Company ®</p>
		</footer>
	</body>
</html>