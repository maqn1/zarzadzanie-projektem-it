<%@ page language="java" contentType="text/html; charset=ISO-8859-2" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>DriverPage</title>	
		<style>
			body{
				background-image: url(http://1.bp.blogspot.com/_pHOy8pxsb9Y/SwkaEEx9CkI/AAAAAAAACMM/kmnYOUF67MQ/s1600/Gr%C3%A1fico6.jpg);
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
				background-color:#9698ed;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.tg .tg-baqh{
				font-size:16px;
				font-family:Tahoma, Geneva, sans-serif !important;
				background-color:#d7d7ff;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.tg .tg-i81m{
				font-size:16px;
				font-family:Tahoma, Geneva, sans-serif !important;
				background-color:#9698ed;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.tg .tg-r31x{
				font-size:16px;
				font-family:Tahoma, Geneva, sans-serif !important;
				background-color:#d7d7ff;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.tg .tg-cqdd{
				font-size:16px;
				font-family:Tahoma, Geneva, sans-serif !important;
				background-color:#6665cd;
				color:#ffffff;
				text-align:center;
				vertical-align:top
			}
			.container{
				width: 1000px;
				height: 500px;
				text-align: center;
				background-color: rgba(52, 73, 94, 0.4);
				margin: 0 auto;
				margin-top: 130px;
				border-radius: 10px;
			}
			.container .tg .tg-r31x .btn-sms{
				color: #fff;
				background: #9698ed;
				padding: 2px 5px;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #7a78d3;
			}
			.container .tg .tg-r31x .btn-edit{
				color: #fff;
				background: #9698ed;
				padding: 2px 5px;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #7a78d3;
			}
			.container .btn-logout{
				color: #fff;
				background: #9698ed;
				padding: 15px 25px;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #7a78d3;
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
				<table align="center" class="tg">
					<tr>
	    				<th class="tg-cqdd" colspan="10"><b>DRIVER PANEL</b></th>
	 				</tr>
					<tr>
						<th class="tg-jb24">ID</th>
						<th class="tg-jb24">Price</th>
						<th class="tg-jb24">Customer name</th>
						<th class="tg-jb24">Customer surname</th>
						<th class="tg-jb24">City</th>
						<th class="tg-jb24">Street</th>
						<th class="tg-jb24">Delivery time</th>
						<th class="tg-jb24">Time edit</th>
						<th class="tg-jb24">Driver surname</th>
						<th class="tg-jb24">SMS</th>
				 	</tr>
					<%
						try{
							connection = DriverManager.getConnection(url, user, pass);
							statement = connection.createStatement();
							String sql = "SELECT ZAMOWIENIE.ID_ZAMOWIENIA, ZAMOWIENIE.CENA, KLIENT.IMIE, KLIENT.NAZWISKO, KLIENT.MIASTO, KLIENT.ULICA, ZAMOWIENIE.GODZINA_DOSTAWY, KIEROWCA.NAZWISKO FROM ZAMOWIENIE INNER JOIN KLIENT ON KLIENT.ID_KLIENTA = ZAMOWIENIE.ID_KLIENTA INNER JOIN KIEROWCA ON KIEROWCA.ID_KIEROWCY = ZAMOWIENIE.ID_KIEROWCY ORDER BY ZAMOWIENIE.ID_ZAMOWIENIA;";
							
							resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
					%>
					<tr>
						<td class="tg-i81m"><%=resultSet.getString("ID_ZAMOWIENIA") %></td>
						<td class="tg-baqh"><%=resultSet.getString("CENA") %></td>
						<td class="tg-baqh"><%=resultSet.getString("KLIENT.IMIE") %></td>
						<td class="tg-baqh"><%=resultSet.getString("KLIENT.NAZWISKO") %></td>
						<td class="tg-baqh"><%=resultSet.getString("KLIENT.MIASTO") %></td>
						<td class="tg-baqh"><%=resultSet.getString("KLIENT.ULICA") %></td>
						<td class="tg-baqh"><%=resultSet.getString("GODZINA_DOSTAWY") %></td>
						<td class="tg-r31x">
							<form action="GodzinaDostawyEdycja.jsp">
								<input type="hidden" name="idZamowienia" value="<%=resultSet.getString("ID_ZAMOWIENIA") %>"/>
								<input type="submit" value="Edit" class="btn-edit"/>
							</form>
						</td>
						<td class="tg-baqh"><%=resultSet.getString("KIEROWCA.NAZWISKO") %></td>
						<td class="tg-r31x">
							<form action="sms.jsp">
								<input type="hidden" name="idZamowienia" value="<%=resultSet.getString("ID_ZAMOWIENIA") %>"/>
								<input type="submit" value="SEND" class="btn-sms"/>
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