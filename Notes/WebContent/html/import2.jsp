<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>

<%@ page import="java.sql.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="java.util.Iterator" %>

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
			.container .back{
				padding: 15px 25px;
				color: #fff;
				background-color: #40bf40;
				border: none;
				border-radius: 4px;
				border-bottom: 4px solid #339933;
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
	        
		// usuwanie istniejÄcej bazy danych
	        Connection connection = DriverManager.getConnection(url, user, pass);
	        Statement statement = connection.createStatement();
			statement.executeUpdate("DELETE FROM PLATNOSC");
			statement.executeUpdate("DELETE FROM ZAMOWIENIE");
			statement.executeUpdate("DELETE FROM KLIENT");
			statement.executeUpdate("DELETE FROM KIEROWCA");
		// koniec usuwania istniejÄcej bazy danych
		
		// import bazy danych z pliku excela
	        Part filePart = request.getPart("plik_do_importu");
	        
	        XSSFWorkbook excel = new XSSFWorkbook(filePart.getInputStream());
	        XSSFSheet arkusz = excel.getSheetAt(0);
	        Iterator<Row> rowIterator = arkusz.iterator();
	        Row wiersz = rowIterator.next();	//2 razy bo w pierwszym wierszu jest id, adres, telefon
	        
	        while (rowIterator.hasNext()) {
	        	wiersz = rowIterator.next();
	            Iterator<Cell> cellIterator = wiersz.cellIterator();
	            
	            int idKierowcy = (int)cellIterator.next().getNumericCellValue();
	            String imie = cellIterator.next().getStringCellValue();
	            String nazwisko = cellIterator.next().getStringCellValue();
	            int tel = (int)cellIterator.next().getNumericCellValue();
	            
	            System.out.println(idKierowcy);
	           	System.out.println(imie);
	           	System.out.println(nazwisko);
	           	System.out.println(tel);
	           	statement.executeUpdate("INSERT INTO KIEROWCA (ID_KIEROWCY, IMIE, NAZWISKO, TELEFON) VALUES ("+idKierowcy+",'"+imie+"','"+nazwisko+"',"+tel+")");
	        }
	        
	        arkusz = excel.getSheetAt(1);
	        rowIterator = arkusz.iterator();
	        wiersz = rowIterator.next();	//2 razy bo w pierwszym wierszu jest id, adres, telefon
	        
	        while (rowIterator.hasNext()) {
	        	wiersz = rowIterator.next();
	            Iterator<Cell> cellIterator = wiersz.cellIterator();
	            
	            int idKlienta = (int)cellIterator.next().getNumericCellValue();
	            String imieKlienta = cellIterator.next().getStringCellValue();
	            String nazwiskoKlienta = cellIterator.next().getStringCellValue();
	            int tel = (int)cellIterator.next().getNumericCellValue();
	            String ulica = cellIterator.next().getStringCellValue();
	            String miasto = cellIterator.next().getStringCellValue();
	            int kal = (int)cellIterator.next().getNumericCellValue();
	          
	           	statement.executeUpdate("INSERT INTO KLIENT (ID_KLIENTA, IMIE, NAZWISKO, TELEFON, ULICA, MIASTO, LICZBA_KALORII) VALUES ("+idKlienta+",'"+imieKlienta+"','"+nazwiskoKlienta+"',"+tel+",'"+ulica+"','"+miasto+"',"+kal+")");
	        }
	        arkusz = excel.getSheetAt(2);
	        rowIterator = arkusz.iterator();
	        wiersz = rowIterator.next();	//2 razy bo w pierwszym wierszu jest id, adres, telefon
	        
	        while (rowIterator.hasNext()) {
	        	wiersz = rowIterator.next();
	            Iterator<Cell> cellIterator = wiersz.cellIterator();
	            
	            int idZamowienia = (int)cellIterator.next().getNumericCellValue();
	            int cena = (int)cellIterator.next().getNumericCellValue();
	            String godzina = cellIterator.next().getStringCellValue();
	            int idKlienta = (int)cellIterator.next().getNumericCellValue();
	            int idKierowcy = (int)cellIterator.next().getNumericCellValue();
	          
	           	statement.executeUpdate("INSERT INTO ZAMOWIENIE (ID_ZAMOWIENIA, CENA, GODZINA_DOSTAWY, ID_KLIENTA, ID_KIEROWCY) VALUES ("+idZamowienia+","+cena+",'"+godzina+"',"+idKlienta+","+idKierowcy+")");
	        }
	        arkusz = excel.getSheetAt(3);
	        rowIterator = arkusz.iterator();
	        wiersz = rowIterator.next();	//2 razy bo w pierwszym wierszu jest id, adres, telefon
	        
	        while (rowIterator.hasNext()) {
	        	wiersz = rowIterator.next();
	            Iterator<Cell> cellIterator = wiersz.cellIterator();
	            
	            int idPlatnosci = (int)cellIterator.next().getNumericCellValue();
	            int idZamowienia = (int)cellIterator.next().getNumericCellValue();
	            int zaplacono = (int)cellIterator.next().getNumericCellValue();
	          
	           	statement.executeUpdate("INSERT INTO PLATNOSC (ID_PLATNOSCI, ID_ZAMOWIENIA, ZAPLACONO) VALUES ("+idPlatnosci+","+idZamowienia+","+zaplacono+")");
	        }
	        excel.close();
	        
		//koniec importu z pliku excela
		%>
		<div class="container">
			<a href="kierownik.jsp"><img src="http://muktafabrics.com/web/wp-content/uploads/2016/03/blue-heading-icons_thumbsup.png" /></a>
			<form enctype="multipart/form-data">
				<div class="alert-box success">
					<span>success: </span>File imported!
				</div>
			</form>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>
	</body>
</html>