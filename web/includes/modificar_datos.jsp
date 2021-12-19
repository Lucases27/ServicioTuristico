<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- SI YA ESTA LOGEADO REDIRECCIONA A INDEX.JSP. -->
	<c:choose>  
		<c:when test="${!logeado}">  
			<c:redirect url="../index.jsp"/>
		</c:when>
	</c:choose>

<section id="faq" class="faq section-bg">
    	<div class="section-title">
       		<h2>Mi Cuenta</h2>
      	</div>
	<div class="container d-flex">
		<div class="col-4">
		</div>
		<div class="col-4">
			<div class="row d-flex justify-content align-items-center">
				<div class="col-12 form-group mb-1 mt-2 text-center">
					<h5 class="">
						Modificar datos
					</h5>
				</div>
				<!-- MENSAJE DE EXITO/ERROR AL MODIFICAR -->
				<div class="col-12 form-group mb-1 mt-2 text-center">
					<h5 class="text-danger">
						<c:out value="${errores}"></c:out>
					</h5>
					<h5 class="text-success">
						<c:out value="${success}"></c:out>
					</h5>
				</div>
				<div class="col-12 form-group mb-1 mt-2 justify-content-center align-items-center">
				<!-- FORMULARIO DE MODIFICACIÓN DE DATOS DE USUARIO -->
					<form action="ModificarDatos" method="POST">
						<div class="col-12 form-group mt-3 mb-0">
							<label for ="nombreApellido">Nombres:</label>
							<input readonly class="form-control" type="text" name="nombreApellido" 
								id="nombreApellido" value="<%out.print(session.getAttribute("nombreApellido"));%>"/>
						</div>
						<div class="col-12 form-group mb-0">
							<label for="email">Email:</label>
							<input class="form-control" type="email" name="email" id="email" placeholder="Email" min="8" max="60"
								value="<%out.print(session.getAttribute("email"));%>"/>
						</div>
						<div class="col-12 form-group mb-0">
							<label for="telefono">Telefono:</label>
							<input class="form-control" type="text" name="telefono" id="telefono" placeholder="1111111111" min="8" max="20"
								value="<%out.print(session.getAttribute("telefono"));%>"/>
						</div>
						<div class="col-12 form-group  mb-0">
							<label for="pass">Contraseña Actual:</label>
							<input class="form-control" type="password" name="pass" id="pass" placeholder="Contraseña Actual" 
								required min="4" max="30" value="<%out.print(session.getAttribute("pass"));%>"/>
							<input type="button" class="btn btn-outline-dark btn-sm" id="verPasswordBtn" value ="Ver contraseña">
						</div>
						<div class="col-12 form-group mb-0">
							<label for="pass1">Nueva Contraseña:</label>
							<input class="form-control " type="password" name="pass1" id="pass1" placeholder="Nueva Contraseña" required min="4" max="30"/>
						</div>
						<div class="col-12 form-group mb-0">
							<label for="pass2">Repetir Contraseña:</label>
							<input class="form-control " type="password" name="pass2" id="pass2" placeholder="Repetir Contraseña" required min="4" max="30"/>
						</div>
						<button type="submit" class="btn btn-primary mt-2 mb-3 form-control">Modificar!</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-4">
		</div>
    </div>
    <div class="text-center">
		<a class="btn btn-primary btn-sm " href="UserPanel">Volver</a>    
    </div>
</section>