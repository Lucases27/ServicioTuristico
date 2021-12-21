<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- SI YA ESTA LOGEADO REDIRECCIONA A INDEX.JSP. -->
<c:choose>  
	<c:when test="${!logeado}">  
		<c:redirect url="../index.jsp"/>
	</c:when>
</c:choose>
<section id="Mi cuenta" class="services">
	<div class="container">
		<div class="section-title">
			<h2>Menu</h2>
		</div>
		<div class="row">
			<div class="col-lg-6 col-md-6 d-flex ">
				<div class="icon-box">							
					<h4><a href="panel.jsp?modificarDatos=1">Mis Datos</a></h4>
					<p>Modifica tus datos acá.</p>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 d-flex ">
				<div class="icon-box">							
					<h4><a href="MascotasUsuario">Mis Mascotas</a></h4>
					<p>Acá podes cargar tus mascotas y ver su historia clínica.</p>
				</div>
			</div>
		</div>
	</div> 
</section>