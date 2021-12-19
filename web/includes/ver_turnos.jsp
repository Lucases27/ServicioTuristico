<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- SI NO ESTA LOGEADO REDIRECCIONA A INDEX.JSP. -->
	<c:choose>  
		<c:when test="${!logeado}">  
			<c:redirect url="../index.jsp"/>
		</c:when>
	</c:choose>

<section id="" class="faq section-bg">
	<div class="container">
    	<div class="section-title">
       		<h2>Turnos</h2>
      	</div>
      	<div class="col-12">
				<!-- MENSAJE DE EXITO/ERROR -->
				<div class="col-12 form-group mb-1 mt-2 text-center">
					<h5 class="text-danger">
						<c:out value="${errores}"></c:out>
					</h5>
					<h5 class="text-success">
						<c:out value="${success}"></c:out>
					</h5>
				</div>
	      	<div class="col-12">
		    	<!-- TABLA TURNOS -->
		        <table class="table table-bordered table-sm table-hover mb-0">
		            <thead>
		                <tr style="background:#1977cc;color:white" class="text-center">
		                    <td>Turno Nº</td>
	                    	<c:choose>  
								<c:when test="${isAdmin}">  
									<td>Nombre</td>
		                    		<td>Telefono</td>
								</c:when>
							</c:choose>
		                    <td>Fecha</td>
		                    <td>Horario</td>
		                    <td>Estado</td>
		                    <td></td>
		                    <c:choose>  
								<c:when test="${isAdmin}">  
									<td></td>
								</c:when>
							</c:choose>
		                </tr>
		            </thead>
	           		<tbody>
		                <c:forEach items="${listaTurnos}" var="turno">
		                	<tr class= "text-center">
		                 	<td>${turno.getIdTurno()}</td>
		                 	<c:choose>  
								<c:when test="${isAdmin}">  
									<td>${turno.getNombreApellido()}</td>
		                 			<td>${turno.getTelefono()}</td>
								</c:when>
							</c:choose>
		                 	<td>${turno.getFecha()}</td>
		                 	<td>${turno.getDiaYHora()}</td>
		                 	<c:choose>  
								<c:when test="${turno.getVigente() == true}">
									<td class="text-primary">Vigente</td>
									<td><a class="btn btn-outline-danger btn-sm " href="Turnos?borrarTurno=${turno.getIdTurno()}">Borrar Turno</a></td>
								</c:when>
								<c:otherwise>
						            <td class="text-danger">No vigente</td>
						         </c:otherwise>
							</c:choose>
		                	<c:choose>  
								<c:when test="${isAdmin && turno.getVigente()}">
		                 			<td><a class="btn btn-outline-danger btn-sm " href="Turnos?cancelarTurno=${turno.getIdTurno()}">Cancelar Turno</a></td>
								</c:when>
							</c:choose>
		                	</tr>
		            	</c:forEach>
		            </tbody>
		        </table>
		        <div>
		      		<a href="UserPanel" class="btn btn-primary btn-sm">Volver</a>
		      	</div>
				<!-- FORMULARIO SOLICITAR TURNO  -->
				<c:choose>  
					<c:when test="${!isAdmin}">  
						<form action="Turnos" method="POST">
							<div class="col-12 form-group mt-3 mb-0">
								<button type="submit" class="btn btn-primary mt-2 mb-3 form-control">Solicitar Turno</button>
							</div>
						</form>
					</c:when>
				</c:choose>
			</div>
      	</div>
    </div>
</section>