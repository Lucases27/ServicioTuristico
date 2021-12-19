<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="topbar" class="d-flex align-items-center fixed-top">
	<div class="container d-flex justify-content-between">
		<div class="contact-info d-flex align-items-center">
			<i class="bi bi-envelope"></i> <a href="mailto:Simplevet.arg@gmail.com">Simplevet.arg@gmail.com</a>
			<i class="bi bi-phone"></i> 
		</div>
		<div class="d-none d-lg-flex social-links align-items-center">
			<!-- <a href="#" class="twitter"><i class="bi bi-twitter"></i></a> -->
			<!-- <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a> -->
		</div>
	</div>
</div>
<header id="header" class="fixed-top">
	<div class="container d-flex align-items-center">
		<h1 class="logo me-auto"><a href="index.jsp">Simple Vet</a></h1>
		<!-- Uncomment below if you prefer to use an image logo -->
		<!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
		<nav id="navbar" class="navbar order-last order-lg-0">
			<ul>
				<li><a class="nav-link scrollto " href="index.jsp#hero">Home</a></li>
				<li><a class="nav-link scrollto" href="index.jsp#about">Sobre app</a></li>
				<li><a class="nav-link scrollto" href="index.jsp#services">Servicios</a></li>
				<li><a class="nav-link scrollto" href="index.jsp#tienda">Tienda</a></li>
				<!-- SOLO SE MUESTRAN SI EL USUARIO ESTA LOGEADO. -->
				<c:choose>  
					<c:when test="${logeado and !isAdmin}">
						<li><a class="nav-link scrollto" href="Turnos">Turnos</a></li>
						<li><a class="nav-link scrollto" href="UserPanel">Mi Cuenta</a></li>
						<li><a class="nav-link scrollto" href="Logout">Salir</a></li>
					</c:when>
					<c:when test="${isAdmin}">
						<li><a class="nav-link scrollto" href="Turnos">Ver Turnos</a></li>
						<li><a class="nav-link scrollto" href="AdminPanel">Admin Panel</a></li>
						<li><a class="nav-link scrollto" href="Logout">Salir</a></li>
					</c:when>
					<c:otherwise>  
						<li><a class="nav-link scrollto" href="Login?menuLogin=1">Ingresar</a></li>
						<li><a class="nav-link scrollto" href="Login?menuLogin=2">Registrarme</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
 			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav><!-- .navbar -->
   		<a href="https://api.whatsapp.com/send?phone=+5491122534578" target="_blank" class="appointment-btn scrollto"><span class="d-none d-md-inline">Consulta vía </span>WhatsApp</a>
	</div>
</header>
