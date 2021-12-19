<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- SI YA ESTA LOGEADO REDIRECCIONA A INDEX.JSP. -->
	<c:choose>  
		<c:when test="${logeado}">  
			<c:redirect url="index.jsp"/>
		</c:when>
	</c:choose>

<section id="faq" class="faq section-bg">
    <div class="container">
      <div class="section-title">
        <h2>Iniciar sesión</h2>
      </div>
      <form class="row g-2 needs-validation" novalidate action="Login" method="POST">
        <div class="col-12">
          <label class="form-label">Usuario</label>
          <input type="text" class="form-control" id="email" name="email" placeholder="Usuario o Email"> 
        </div>
        <div class="col-12">
          <label  class="form-label">Contraseña</label>
          <input type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña"> 
        </div>
        <div class="col-12 text-center">
          <button class="btn btn-primary center-block" type="submit">Enviar</button>
        </div>
      </form>
    </div>
	<div class="font-italic text-center mt-3 mb-3">
		<h6>¿No tenes una cuenta? <a href="Login?menuLogin=2">Registrate.</a></h6>
	</div>
</section>