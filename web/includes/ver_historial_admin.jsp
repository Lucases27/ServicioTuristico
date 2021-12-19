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
	      		<div class="text-center">
		      		<h5 class="">
		      			Historia de: ${nombreMascota}
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
				<c:choose>
					<c:when test="${param.agregar > 0}">
						<!-- FORMULARIO AGREGAR HISTORIA-->
						<c:set var = "idMascota"  value = "${idMascotaHistorial}"/>
						<form action="Historial" method="POST">
							<div class="form-group mt-2">
								<label for="patologia">Patología:</label> 
								<input class="form-control" type="text" name="patologia" placeholder="Patología"/>
							</div>
							<div class="form-group mt-2">
								<label for="vacunas">Vacunas:</label> 
								<input class="form-control" type="text" name="vacunas" placeholder="Vacunas"/>
							</div>
							<div class="form-group">
								<label for="descripcion">Descripción</label>
								<input class="form-control" type="text" name="descripcion" placeholder="Descripción"/>
							</div>
							<input type="hidden" value="${idMascota}" name="agregarHistoria"/>
							<button type="submit" class="btn btn-primary form-control mb-4">Agregar Historia</button>
						</form>
					</c:when>
				</c:choose>
			</div>
			<div class="col-3"></div>
	      	<div class="col-12">
				    <div class="table-responsive">
					    <table class="table table-bordered table-sm table-hover mb-0 text-center">
				            <thead>
				                <tr style="background:#1977cc;color:white" class="text-center">
				                    <td>Fecha</td>
				                    <td>Patología</td>
				                    <td>Vacunas</td>
				                    <td>Descripción</td>
				                    <td></td>
				                </tr>
				            </thead>
			           		<tbody>
				                <c:forEach items="${historial}" var="historia">
				                	<tr>
				                 	<td>${historia.getFecha()}</td>
				                 	<td>${historia.getPatologia()}</td>
				                 	<td>${historia.getVacunas()}</td>
				                 	<td>${historia.getDescripcion()}</td>
				                 	<td><a class="btn btn-outline-primary btn-sm"  href="Historial?eliminar=${historia.getIdHistoria()}">Eliminar</a></td>
				                	</tr>
				            	</c:forEach>
				            </tbody>
				        </table>
				    </div>
		        <div class="text-right mt-4 p-0">
					<a class="btn btn-outline-danger btn-sm" href="Historial?agregar=${idMascotaHistorial}">Nueva Historia</a>
				</div>
		      	<div class="mt-2">
		      		<a href="MascotasAdmin?userId=${idUsuarioHistorial}" class="btn btn-primary btn-sm">Volver</a>
		      	</div>
			</div>
      	</div>
    </div>
</section>