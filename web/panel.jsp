<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<title>Simple vet</title>
		<meta content="" name="description">
		<meta content="" name="keywords">
		<!-- Favicons -->
		<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
		<!-- Vendor CSS Files -->
		<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
		<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
		<link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
		<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
		<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
		<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
		<!-- Template Main CSS File -->
		<link href="assets/css/style.css" rel="stylesheet">
		<!-- =======================================================
		* Template Name: Medilab - v4.1.0
		* Template URL: https://bootstrapmade.com/medilab-free-medical-bootstrap-theme/
		* Author: BootstrapMade.com
		* License: https://bootstrapmade.com/license/
		======================================================== -->
	</head>
	<body>
		<!-- HEADER -->
		<jsp:include page="includes/header.jsp"></jsp:include>
		<!-- ACA METER TODOS LOS INCLUDES DE USUARIO. TURNOS, MASCOTAS, ETC.. -->
		<c:choose>
			<c:when test="${param.userPanel == 1}">
				<jsp:include page="includes/user_panel.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.modificarDatos == 1}">
				<jsp:include page="includes/modificar_datos.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.verMascotas == 1}">
				<jsp:include page="includes/ver_mascotas.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.adminPanel == 1}">
				<jsp:include page="includes/admin_panel.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.verUsuariosAdmin == 1}">
				<jsp:include page="includes/ver_usuarios_admin.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.tiendaAdmin == 1}">
				<jsp:include page="includes/tienda_admin.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.verMascotasAdmin == 1}">
				<jsp:include page="includes/ver_mascotas_admin.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.verHistorialAdmin == 1}">
				<jsp:include page="includes/ver_historial_admin.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.verHistorial == 1}">
				<jsp:include page="includes/ver_historial.jsp"></jsp:include>
			</c:when>
			<c:when test="${param.verTurnos == 1}">
				<jsp:include page="includes/ver_turnos.jsp"></jsp:include>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	
		<footer id="footer">
		</footer>
		<div id="preloader"></div>
		<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
		<!-- Vendor JS Files -->
		<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
		<script src="assets/vendor/php-email-form/validate.js"></script>
		<script src="assets/vendor/purecounter/purecounter.js"></script>
		<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
		<script src="js/Clase.js"></script>
		<!-- Template Main JS File -->
		<script src="assets/js/main.js"></script>
	</body>
</html>