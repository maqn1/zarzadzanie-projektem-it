<%@ page language="java" contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<style>
			
			navMenu{
				margin: 0;
				padding: 0;
			}
			navMenu ul{
				margin: 0;
				padding: 0;
				line-height: 30px;
			}
			navMenu li{
				margin: 0;
				padding: 0;
				list-style: none;
				float: left;
				position: relative;
			}
			navMenu .ul .li a{
				text-align: center;
				font-family: "Comic Sans MS", cursive;
				text-decoration: none;
				height: 30px;
				width: 150px;
				display: block;
				color: #000;
			}
			navMenu .ul li{
				position: absolute;
				visibility: hidden;
				top: 30px;
			}
			navMenu .ul .li:hover ul{
				visibility: visible;
			}
			
		</style>
	</head>
	<body>

		
		
		
			<div class="navMenu">
				<div class="wrapper">
					<ul>
						<li><a href="#">VIEW</a>
							<ul>
								<li><a href="#">DRIVERS</a></li>
								<li><a href="#">ORDER</a></li>
								<li><a href="#">PAYMENT</a></li>
							</ul>
						</li>
					</ul>
					<ul>
						<li><a href="#">EXEL</a>
							<ul>
								<li><a href="#">IMPORT</a></li>
								<li><a href="#">EXPORT</a></li>
							</ul>
						</li>
					</ul>
					<ul>
						<li><a href="#">ADD CUSTOMER</a>
						</li>
					</ul>
				</div>
			</div>
		

	</body>
</html>