<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.FileOutputStream" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>ExelExportPage</title>
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
	        
	        Connection connection = DriverManager.getConnection(url, user, pass);
	        Statement statement = connection.createStatement();

			
			XSSFWorkbook wb = new XSSFWorkbook();
	        Sheet sheet = wb.createSheet("Kierowca");
	        Row row = sheet.createRow(0);
	        Cell cell = row.createCell(0);
	        cell.setCellValue("ID_KIEROWCY");
	        cell = row.createCell(1);
	        cell.setCellValue("IMIE");	
	        cell = row.createCell(2);
	        cell.setCellValue("NAZWISKO");
	        cell = row.createCell(3);
	        cell.setCellValue("TELEFON");
	        
			connection = DriverManager.getConnection(url, user, pass);
			statement = connection.createStatement();
			String sql = "SELECT * FROM KIEROWCA";
			
			ResultSet resultSet = statement.executeQuery(sql);
			int rowNum = 1;
			while(resultSet.next()) {
				int idKierowcy = resultSet.getInt("ID_KIEROWCY");
				String imie = resultSet.getString("IMIE");
				String nazwisko = resultSet.getString("NAZWISKO");
				int tel = resultSet.getInt("TELEFON");
				row = sheet.createRow(rowNum);
				int cellNum = 0;
				cell = row.createCell(cellNum++);
		        cell.setCellValue(idKierowcy);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(imie);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(nazwisko);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(tel);
				rowNum++;
			}
			
			sheet = wb.createSheet("Klient");
	        row = sheet.createRow(0);
	        cell = row.createCell(0);
	        cell.setCellValue("ID_KLIENTA");
	        cell = row.createCell(1);
	        cell.setCellValue("IMIE");	
	        cell = row.createCell(2);
	        cell.setCellValue("NAZWISKO");
	        cell = row.createCell(3);
	        cell.setCellValue("TELEFON");
	        cell = row.createCell(4);
	        cell.setCellValue("ULICA");	
	        cell = row.createCell(5);
	        cell.setCellValue("MIASTO");
	        cell = row.createCell(6);
	        cell.setCellValue("LICZBA_KALORII");
	        
			connection = DriverManager.getConnection(url, user, pass);
			statement = connection.createStatement();
			sql = "SELECT * FROM KLIENT";
			
			resultSet = statement.executeQuery(sql);
			rowNum = 1;
			while(resultSet.next()) {
				int idKlienta = resultSet.getInt("ID_KLIENTA");
				String imie = resultSet.getString("IMIE");
				String nazwisko = resultSet.getString("NAZWISKO");
				int tel = resultSet.getInt("TELEFON");
				String ulica = resultSet.getString("ULICA");
				String miasto = resultSet.getString("MIASTO");
				int kal = resultSet.getInt("LICZBA_KALORII");
				row = sheet.createRow(rowNum);
				int cellNum = 0;
				cell = row.createCell(cellNum++);
		        cell.setCellValue(idKlienta);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(imie);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(nazwisko);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(tel);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(ulica);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(miasto);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(kal);
		        
				rowNum++;
			}
			
			sheet = wb.createSheet("Zamowienie");
	        row = sheet.createRow(0);
	        cell = row.createCell(0);
	        cell.setCellValue("ID_ZAMOWIENIA");
	        cell = row.createCell(1);
	        cell.setCellValue("CENA");	
	        cell = row.createCell(2);
	        cell.setCellValue("GODZINA_DOSTAWY");
	        cell = row.createCell(3);
	        cell.setCellValue("ID_KLIENTA");
	        cell = row.createCell(4);
	        cell.setCellValue("ID_KIEROWCY");
	        
			connection = DriverManager.getConnection(url, user, pass);
			statement = connection.createStatement();
			sql = "SELECT * FROM ZAMOWIENIE";
			
			resultSet = statement.executeQuery(sql);
			rowNum = 1;
			while(resultSet.next()) {
				int idZamowienia = resultSet.getInt("ID_ZAMOWIENIA");
				int cena = resultSet.getInt("CENA");
				String godzina = resultSet.getString("GODZINA_DOSTAWY");
				int idKlienta = resultSet.getInt("ID_KLIENTA");
				int idKierowcy = resultSet.getInt("ID_KIEROWCY");
				row = sheet.createRow(rowNum);
				int cellNum = 0;
				cell = row.createCell(cellNum++);
		        cell.setCellValue(idZamowienia);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(cena);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(godzina);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(idKlienta);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(idKierowcy);
		        
				rowNum++;
			}
			
			sheet = wb.createSheet("Platnosc");
	        row = sheet.createRow(0);
	        cell = row.createCell(0);
	        cell.setCellValue("ID_PLATNOSCI");
	        cell = row.createCell(1);
	        cell.setCellValue("ID_ZAMOWIENIA");	
	        cell = row.createCell(2);
	        cell.setCellValue("ZAPLACONO");
	        
			connection = DriverManager.getConnection(url, user, pass);
			statement = connection.createStatement();
			sql = "SELECT * FROM PLATNOSC";
			
			resultSet = statement.executeQuery(sql);
			rowNum = 1;
			while(resultSet.next()) {
				int idPlatnosci = resultSet.getInt("ID_PLATNOSCI");
				int idZamowienia = resultSet.getInt("ID_ZAMOWIENIA");
				int zaplacono = resultSet.getInt("ZAPLACONO");
				row = sheet.createRow(rowNum);
				int cellNum = 0;
				cell = row.createCell(cellNum++);
		        cell.setCellValue(idPlatnosci);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(idZamowienia);
		        cell = row.createCell(cellNum++);
		        cell.setCellValue(zaplacono);
		        cell = row.createCell(cellNum++);
		        
				rowNum++;
			}
	        String path = getServletContext().getRealPath("download/baza.xlsx");
	        FileOutputStream fileOut = new FileOutputStream(path);
	        wb.write(fileOut);
	        fileOut.close();
	        wb.close();
		%>
		<div class="container">
			<a href="kierownik.jsp"><img src="http://muktafabrics.com/web/wp-content/uploads/2016/03/blue-heading-icons_thumbsup.png" /></a>
			<form enctype="multipart/form-data">
				<div class="alert-box success">
					<span>success: </span>File exported!
				</div>
			</form>
			<form action="../download/baza.xlsx" align="center" method="post">
				<input class="back" type="submit" value="DOWNLOAD"/>
			</form>
		</div>
		<footer>
			<p class="footer-text">Fruit Company 2017 All Rights Reserved</p>
		</footer>
	</body>
</html>