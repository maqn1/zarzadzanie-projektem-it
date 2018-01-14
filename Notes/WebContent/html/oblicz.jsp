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
			String id = request.getParameter("idDanych");
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
			String sql = "SELECT IMIE, NAZWISKO, MASA_CIALA, WZROST, WIEK, AKTYWNOSC, PLEC FROM DANE WHERE ID_DANYCH = "+id;
			resultSet = statement.executeQuery(sql);
			resultSet.next();
			String imie = resultSet.getString("IMIE");
			String nazwisko = resultSet.getString("NAZWISKO");
			Integer masa_ciala = resultSet.getInt("MASA_CIALA");
			Integer wzrost = resultSet.getInt("WZROST");
			Integer wiek = resultSet.getInt("WIEK");
			Integer aktywnosc = resultSet.getInt("AKTYWNOSC");
			Integer plec = resultSet.getInt("PLEC"); 
			double ppm=0, cpm=0, nmc=0, wn=0, de=0, zs=0, zdk=0, pb=0, pt=0, pw=0, wzrostkw, bmi;
			String bmi1 = null;
			if (plec==1){
				ppm = (655.1+(9.563*masa_ciala)+(1.85*wzrost)-(4.676*wiek));
				nmc = ((wzrost-100-(wzrost-150)/2));
			}
			else if (plec==2){
				ppm = (66.5+(13.75*masa_ciala)+(5.003*wzrost)-(6.775*wiek));
				nmc = ((wzrost-100-(wzrost-150)/4));
			}
			if (aktywnosc==1){
				cpm=ppm*1.4;
				zs=nmc*30;
			}
			if (aktywnosc==2){
				cpm=ppm*1.6;
				zs=nmc*35;
			}
			if (aktywnosc==3){
				cpm=ppm*1.8;
				zs=nmc*40;
			}
			wzrostkw=(wzrost*wzrost);
			bmi=(masa_ciala/wzrostkw*10000);
			if (bmi<16){
				bmi1="wyglodzenie";
			}
			if (bmi<17 && bmi>=16){
				bmi1="wychudzenie";
			}
			if (bmi<18.5 && bmi>=17){
				bmi1=("niedowaga");
			}
			if (bmi<25 && bmi>=18.5){
				bmi1="wartosc prawidlowa";
			}
			if (bmi<30 && bmi>=25){
				bmi1="nadwaga";
			}
			if (bmi<35 && bmi>=30){
				bmi1="I stopien otylosci";
			}
			if (bmi<40 && bmi>=35){
				bmi1="II stopien otylosci (otylosc kliniczna)";
			}
			if (bmi>40){
				bmi1="III stopien otylosci (otylosc skrajna)";
			}
			wn=masa_ciala-nmc;
			de=zs-cpm;
			zdk=cpm+(de);
			pb=((0.2*zdk)/4);
			pt=((0.25*zdk)/9);
			pw=((0.55*zdk)/4);
			%>
		<div>
			<div class="container">
				<a href="LoginPage.jsp"><img src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-9/512/Login-icon.png" /></a>
				<div>
					<div style="width:460px; margin:0 auto;">
						<ul>
							<li><a href="DodajDane.jsp">Dodaj dane</a>
							</li>
						</ul>
						<ul>
							<li><a href="dietetyk.jsp">Cofnij</a>
							</li>
						</ul><br><br><br>
					</div>
				</div>
				<table align="center" class="tg">
					<tr>
	    				<th class="tg-cqdd" colspan="10"><b>Panel dietetyka</b></th>
	 				</tr>
					<tr>
						<th class="tg-jb24">ID</th>
						<th class="tg-jb24">Imie</th>
						<th class="tg-jb24">Nazwisko</th>
						<th class="tg-jb24">Masa ciala</th>
						<th class="tg-jb24">Wzrost</th>
						<th class="tg-jb24">Wiek</th>
						<th class="tg-jb24">Aktywnosc</th>
						<th class="tg-jb24">Plec</th>
				 	</tr>
					<tr>
						<td class="tg-i81m"><%out.println(id);%></td>
						<td class="tg-baqh"><%out.println(imie);%></td>
						<td class="tg-baqh"><%out.println(nazwisko);%></td>
						<td class="tg-baqh"><%out.println(masa_ciala);%></td>
						<td class="tg-baqh"><%out.println(wzrost);%></td>
						<td class="tg-baqh"><%out.println(wiek);%></td>
						<td class="tg-baqh"><%
							if(aktywnosc==1)out.println("Mala");
							if(aktywnosc==2)out.println("Srednia");
							if(aktywnosc==3)out.println("Duza");
							%></td>
						<td class="tg-baqh"><%
							if(plec==1)out.println("Kobieta");
							if(plec==2)out.println("Mezczyzna");
							%></td>
					
				  	</tr>
				  
				</table>
				<br><br>
				
				<table align="center" class="tg">
					<tr>
						<th class="tg-jb24">BMI - wskaznik masy ciala</th>
						<th class="tg-baqh"><%out.println(bmi);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">BMI - opis</th>
						<th class="tg-baqh"><%out.println(bmi1);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Podstawowa przemiana materii</th>
						<th class="tg-baqh"><%out.println(ppm);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Calkowita przemiana materii</th>
						<th class="tg-baqh"><%out.println(cpm);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Nalezna masa ciala (ile powinnismy wazyc)</th>
						<th class="tg-baqh"><%out.println(nmc);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Wielkosc nadwagi</th>
						<th class="tg-baqh"><%out.println(wn);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Deficyt energii (potrzebny do chudniecia)</th>
						<th class="tg-baqh"><%out.println(de);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Wymagane dzienne spozycie kalorii</th>
						<th class="tg-baqh"><%out.println(zs);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Zalecana dzienna kalorycznosc diety</th>
						<th class="tg-baqh"><%out.println(zdk);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Podaz bialka (g/dzien)</th>
						<th class="tg-baqh"><%out.println(pb);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Podaz tluszczy (g/dzien)</th>
						<th class="tg-baqh"><%out.println(pt);%></th>
					</tr>
					<tr>
						<th class="tg-jb24">Podaz weglowodanow (g/dzien)</th>
						<th class="tg-baqh"><%out.println(pw);%></th>
					</tr>
				</table>
			</div>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>
	</body>
</html>