<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- SI YA ESTA LOGEADO REDIRECCIONA A INDEX.JSP. -->
	<c:choose>  
		<c:when test="${!isAdmin}">  
			<c:redirect url="../index.jsp"/>
		</c:when>
	</c:choose>

<section id="faq" class="faq section-bg">
	<div class="container">
    	<div class="section-title">
       		<h2>Mi Cuenta</h2>
      	</div>
      	<div class="row">
	   		<div class="col-3"></div>
	   		<div class="row d-flex justify-content-center col-6">
				<!-- MENSAJE DE EXITO/ERROR AL MODIFICAR -->
				<div class="col-12 form-group mb-1 mt-2 text-center">
					<h5 class="text-danger">
						<c:out value="${errores}"></c:out>
					</h5>
					<h5 class="text-success">
						<c:out value="${success}"></c:out>
					</h5>
				</div>
				<div class="col-12">
					<c:choose>
						<c:when test="${param.modificar >0}">
							<!-- FORMULARIO DE MODIFICAR DE MASCOTAS  -->
							<c:set var = "mascotaModificar"  value = "${mascotaModificar}"/>
							<form action="MascotasAdmin" method="POST">
								<div class="col-12 form-group mt-3 mb-0">
									<label for="name">Nombre:</label>
										<input class="form-control" type="text" name="nombre" value="${mascotaModificar.getNombre()}" id="nombre"/>
								</div>
								<div class="col-12 form-group mb-0">
									<label for="tipo">Tipo:</label>
									<input class="form-control" type="text" name="tipo" id="tipo" value="${mascotaModificar.getTipo()}"
										placeholder="Ej:Chihuahua" min="2" max="20"/>
								</div>
								<div class="col-12 form-group mb-0">
									<label for="edad">Edad en años:</label>
									<input class="form-control" type="text" name="edad" id="edad" value="${mascotaModificar.getEdad()}" placeholder="Ej:2"/>
								</div>
								<div class="col-12 form-group  mb-0">
									<label for="peso">Peso aproximado en Kg:</label>
									<input class="form-control" type="text" name="peso" id="peso" value="${mascotaModificar.getPeso()}" placeholder="EJ:4"/>
								</div>
								<button type="submit" name="modificarMascota" value="${mascotaModificar.getIdMascota()}" class="btn btn-primary mt-2 mb-3 form-control">Modificar!</button>
							</form>
						</c:when>
						<c:when test="${param.agregar > 0}">
							<!-- FORMULARIO AGREGAR MASCOTAS-->
							<c:set var = "id"  value = "${userID}"/>
							<form action="MascotasAdmin" method="POST">
								<div class="form-group mt-2">
									<label for="nombre">Nombre:</label>
									<input class="form-control" type="text" name="nombre" placeholder="Nombre"/>
								</div>
								<div class="form-group mt-2">
									<label for="tipo">Tipo:</label>
									<input class="form-control" type="text" name="tipo" placeholder="Tipo"/>
								</div>
								<div class="form-group">
									<label for="edad">Edad</label>
									<input class="form-control" type="text" name="edad" placeholder="Edad"/>
								</div>
								<div class="form-group">
									<label for="peso">Peso:</label>
									<input class="form-control" type="text" name="peso" placeholder="Peso"/>
								</div>
								<input type="hidden" value="${id}" name="agregarMascota"/>
								<button type="submit" class="btn btn-primary form-control mb-4">Agregar Mascota</button>
							</form>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
		<!-- TABLA MASCOTAS -->
      	<div class="col-12">
		    <div class="table-responsive">
			    <table class="table table-bordered table-sm table-hover mb-0 text-center">
		            <thead>
		                <tr style="background:#1977cc;color:white" class="text-center">
		                    <td>ID Mascota</td>
		                    <td>Nombre</td>
		                    <td>Tipo</td>
		                    <td>Edad</td>
		                    <td>Peso</td>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                </tr>
		            </thead>
	           		<tbody>
		                <c:forEach items="${listaMascotas}" var="mascota">
		                	<tr>
		                 	<td>${mascota.getIdMascota()}</td>
		                 	<td>${mascota.getNombre()}</td>
		                 	<td>${mascota.getTipo()}</td>
		                 	<td>${mascota.getEdad()}</td>
		                 	<td>${mascota.getPeso()}</td>
		                 	<c:set var = "idUsuarioMascota"  value = "${mascota.getIdUsuario()}"/>
		                 	<td><a class="btn btn-outline-primary btn-sm"  href="MascotasAdmin?historial=${mascota.getIdMascota()}&idUser=${idUsuarioMascota}">Historial</a></td>
		                 	<td><a class="btn btn-outline-primary btn-sm"  href="MascotasAdmin?modificar=${mascota.getIdMascota()}">Modificar</a></td>
		                 	<td><a class="btn btn-outline-primary btn-sm"  href="MascotasAdmin?eliminar=${mascota.getIdMascota()}">Eliminar</a></td>
		                	</tr>
		            	</c:forEach>
		            </tbody>
		        </table>
		    </div>
	        <div class="text-right mt-4 p-0">
				<a class="btn btn-outline-danger btn-sm" href="MascotasAdmin?agregar=${idUsuarioMascota}">Agregar Mascota</a>
			</div>
			<div class="mt-2">
	      		<a href="UsuariosAdmin" class="btn btn-primary btn-sm">Volver</a>
	      	</div>
		</div>
    </div>
</section>