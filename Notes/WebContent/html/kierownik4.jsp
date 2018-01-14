<%@ page language="java" contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>ManagerPage</title>
		<style>
			body{
				background-image: url(https://wallpaperscraft.com/image/notebook_texture_fields_lines_stripes_75767_2560x1600.jpg);
				-webkit-background-size: cover;
  				-moz-background-size: cover;
  				-o-background-size: cover;
  				background-size: cover;
				background-repeat: no-repeat;
				margin: 0;
				min-height: 590px;
			}
			.tg  {
				border-collapse:collapse;
				border-spacing:0;
			}
			.tg td{
				font-family:Arial, sans-serif;
				font-size:14px;
				padding:10px 5px;
				border-style:solid;
				border-width:1px;
				overflow:hidden;
				word-break:normal;
			}
			.tg th{
				font-family:Arial, sans-serif;
				font-size:14px;
				font-weight:normal;
				padding:10px 5px;
				border-style:solid;
				border-width:1px;
				overflow:hidden;
				word-break:normal;
			}
			.tg .tg-jb24{
				font-size:16px;
				font-family:Tahoma, Geneva, sans-serif !important;
				background-color:#40bf40;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.tg .tg-baqh{
				font-size:16px;
				font-family:Tahoma, Geneva, sans-serif !important;
				background-color:#66cc66;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.tg .tg-i81m{
				font-size:16px;
				font-family:Tahoma, Geneva, sans-serif !important;
				background-color:#40bf40;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.tg .tg-r31x{
				font-size:16px;
				font-family:Tahoma, Geneva, sans-serif !important;
				background-color:#66cc66;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.tg .tg-cqdd{
				font-size:16px;
				font-family:Tahoma, Geneva, sans-serif !important;
				background-color:#339933;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.container{
				width: 1000px;
				height: 550px;
				text-align: center;
				background-color: rgba(52, 73, 94, 0.4);
				margin: 0 auto;
				margin-top: 80px;
				border-radius: 10px;
			}
			.container .tg .tg-r31x .btn-remove{
				color: #fff;
				background: #40bf40;
				padding: 2px 5px;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #339933;
			}
			.container .tg .tg-r31x .btn-edit{
				color: #fff;
				background: #40bf40;
				padding: 2px 5px;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #339933;
			}
			.container .btn-logout{
				color: #fff;
				background: #9698ed;
				padding: 15px 25px;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #00b33c;
			}
			.container img{
				width: 120px;
				height: 120px;
				margin-top: -60px;
				margin-bottom: 30px;
			}
			footer{
				margin: 0;
			}
			footer p{
				float: right;
				margin-right: 20px;
				margin-top: 70px;
				color: white;
				font-family: sans-serif;
			}
			footer-text{
				color: white;
			}
			ul{
				margin: 0;
				padding: 0;
				line-height: 30px;

			}
			li{
				margin: o;
				padding: 0;
				list-style: none;
				float: left;
				position: relative;
				background: #999;
			}
			ul li a{
				text-align: center;
				font-family: Arial, sans-serif;
				text-decoration: none;
				height: 30px;
				width: 150px;
				display: block;
				color: #FFF;
				border: 1px solid #FFF;
				text-shadow: 1px 1px 1px #000;
			}
			ul ul{
				position: absolute;
				visibility: hidden;
				top: 32px;
			}
			ul li:hover ul{
				visibility: visible;
			}
			li:hover{
				background: #6699ff;
			}
			ul li:hover ul li a:hover{
				background: #CCC;
				color: #000;
			}
			a:hover{
				color: #000;
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
		<div>
			<div class="container">
				<a href="LoginPage.jsp"><img src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-9/512/Login-icon.png" /></a>
				<div>
					<div style="width:460px; margin:0 auto;">
						<ul>
							<li><a href="#">VIEW</a>
								<ul>
									<li><a href="kierownik.jsp">CUSTOMERS</a></li>
									<li><a href="kierownik2.jsp">DRIVERS</a></li>
									<li><a href="kierownik3.jsp">ORDERS</a></li>
								</ul>
							</li>
						</ul>
						<ul>
							<li><a href="#">EXEL</a>
								<ul>
									<li><a href="import.jsp">IMPORT</a></li>
									<li><a href="export.jsp">EXPORT</a></li>
								</ul>
							</li>
						</ul>
						<ul>
							<li><a href="DodajPlatnosc.jsp">ADD PAYMENT</a>
							</li>
						</ul><br><br><br>
					</div>
				</div>
				<table align="center" class="tg">
					<tr>
	    				<th class="tg-cqdd" colspan="10"><b>MANAGER PANEL - PAYMENT</b></th>
	 				</tr>
					<tr>
						<th class="tg-jb24">ID</th>
						<th class="tg-jb24">Order ID</th>
						<th class="tg-jb24">Paid</th>
						<th class="tg-jb24">Edit data</th>
						<th class="tg-jb24">Remove order</th>
				 	</tr>
					<%
						try{
							connection = DriverManager.getConnection(url, user, pass);
							statement = connection.createStatement();
							String sql = "SELECT * FROM PLATNOSC ORDER BY ID_PLATNOSCI;";
						
							resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
					%>
					<tr>
						<td class="tg-i81m"><%=resultSet.getString("ID_PLATNOSCI") %></td>
						<td class="tg-baqh"><%=resultSet.getString("ID_ZAMOWIENIA") %></td>
						<td class="tg-baqh"><%=resultSet.getString("ZAPLACONO") %></td>
						<td class="tg-r31x">
							<form action="DanePlatnoscEdycja.jsp">
								<input type="hidden" name="idPlatnosci" value="<%=resultSet.getString("ID_PLATNOSCI") %>"/>
								<input type="submit" value="Edit" class="btn-edit"/>
							</form>
						</td>
						<td class="tg-r31x">
							<form action="UsunPlatnosc.jsp">
								<input type="hidden" name="idPlatnosci" value="<%=resultSet.getString("ID_PLATNOSCI") %>"/>
								<input type="submit" value="REMOVE" class="btn-remove"/>
							</form>
						</td>
				  	</tr>
				  	<%	
							}
						}catch(Exception e){
							e.printStackTrace();	
						}
					%>
				</table>
			</div>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>
	</body>
</html>