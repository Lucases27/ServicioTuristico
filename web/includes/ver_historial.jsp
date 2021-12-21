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
	<div class="container">
    	<div class="section-title">
       		<h2>Mi Cuenta</h2>
      	</div>
      	<div class="text-center mb-2">
      		<h5 class="">
      			Historia de: ${nombreMascota}
      		</h5>
      	</div>
      	<div class="col-12">
		    <div class="table-responsive">
			    <table class="table table-bordered table-sm table-hover mb-0 text-center">
		            <thead>
		                <tr style="background:#1977cc;color:white" class="text-center">
		                    <td>Fecha</td>
		                    <td>Patología</td>
		                    <td>Vacunas</td>
		                    <td>Descripción</td>
		                </tr>
		            </thead>
	           		<tbody>
		                <c:forEach items="${historial}" var="historia">
		                	<tr>
		                 	<td>${historia.getFecha()}</td>
		                 	<td>${historia.getPatologia()}</td>
		                 	<td>${historia.getVacunas()}</td>
		                 	<td>${historia.getDescripcion()}</td>
		                	</tr>
		            	</c:forEach>
		            </tbody>
		        </table>
		    </div>
      	</div>
      	<div class="mt-2">
      		<a href="MascotasUsuario" class="btn btn-primary btn-sm">Volver</a>
      	</div>
    </div>
</section>