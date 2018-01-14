<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>SmsPage</title>
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
			String id = request.getParameter("idZamowienia");
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
			String sql = "SELECT kl.IMIE AS IMIE_KL, kr.IMIE AS IMIE_KR, kl.NAZWISKO AS NAZWISKO_KL, kr.NAZWISKO AS NAZWISKO_KR, z.GODZINA_DOSTAWY AS GODZINA_DOSTAWY_Z, kl.TELEFON AS TELEFON_KL, kr.TELEFON AS TELEFON_KR FROM ZAMOWIENIE z LEFT JOIN KIEROWCA kr ON kr.ID_KIEROWCY = z.ID_KIEROWCY LEFT JOIN KLIENT kl ON kl.ID_KLIENTA = z.ID_KLIENTA WHERE ID_ZAMOWIENIA = "+id;
			resultSet = statement.executeQuery(sql);
			resultSet.next();
			String imieKlienta = resultSet.getString("IMIE_KL");
			String imieKierowcy = resultSet.getString("IMIE_KR");
			String nazwiskoKlienta = resultSet.getString("NAZWISKO_KL");
			String nazwiskoKierowcy = resultSet.getString("NAZWISKO_KR");
			String godzinaDostawy = resultSet.getString("GODZINA_DOSTAWY_Z");
			String telefonKlienta = resultSet.getString("TELEFON_KL");
			String telefonKierowcy = resultSet.getString("TELEFON_KR");
			
			System.out.print(imieKlienta);
			System.out.print(imieKierowcy);
			System.out.print(nazwiskoKlienta);
			System.out.print(nazwiskoKierowcy);
			System.out.print(godzinaDostawy);
			System.out.print(telefonKlienta);
			System.out.print(telefonKierowcy);
			
			//Wysyłanie SMS
			
			StringBuilder result = new StringBuilder();
			String tresc = "Witaj, "+imieKlienta+" "+nazwiskoKlienta+". Twoja dostawe dostarczy: "+imieKierowcy+" "+nazwiskoKierowcy+". Numer telefonu do dostawcy: "+telefonKierowcy+". Szacowana godzina dostawy: "+godzinaDostawy;	
			tresc = tresc.replace(" ", "%20");
			String numer = telefonKlienta;
			String urlToRead = "https://api.smsapi.pl/sms.do?username=maqn@wp.pl&password=e810d6c4159aa3f5dd19a2f7228a85bd&to="+numer+"&message="+tresc+"&format=json";
			URL smsUrl = new URL(urlToRead);
			HttpURLConnection conn = (HttpURLConnection) smsUrl.openConnection();
			conn.setRequestMethod("GET");
			BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line;
			while ((line = rd.readLine()) != null) {
			   result.append(line);
			}
			rd.close();
		%>			
		<div class="container">
			<a href="kierowca.jsp"><img src="http://muktafabrics.com/web/wp-content/uploads/2016/03/blue-heading-icons_thumbsup.png" /></a>
			<form action="kierowca.jsp" enctype="multipart/form-data">
				<div class="alert-box success">
					<span>success: </span>SMS sent!
				</div>
			</form>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>
	</body>
</html>