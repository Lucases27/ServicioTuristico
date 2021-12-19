<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
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
        <link href="https://scontent.feze11-1.fna.fbcdn.net/v/t1.6435-9/233834089_6163962316979417_1023006618699093216_n.jpg?_nc_cat=103&ccb=1-4&_nc_sid=730e14&_nc_ohc=b3eJxR3yJocAX9QIsg-&_nc_ht=scontent.feze11-1.fna&oh=75715a25a99f358a565b6c0598e14e34&oe=6133A1D5" rel="icon" data-head-react="true">
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
	<%@include file="header.jsp" %>
        
    <section id="secreg" class="mt-5">
      <div class="container">
        <div class="section-title">
          <h2 id="h2">Registro</h2>
        </div>
                <!-- MENSAJES Y CHEQUEO DE SESSION -->
               <%
                session = request.getSession();
                String user = (String) session.getAttribute("user");
                if(user == null){ 
                    if(request.getAttribute("mensaje") != null){
                     %><%=request.getAttribute("mensaje")%>
                    <%}
                }else{
                    response.sendRedirect("index.jsp");
                }
                %>
    <form method="POST" id="Registro" class="row g-5 d-flex" action="SvRegistro">
    	<div class="col-4"></div>
    	<div class = "form-group col-4 align-items-center justify-content-center">
    		<div class="col-md-12">
		        <label class="form-label">Nombre</label>
		        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
	      	</div>
                <div class="col-md-12">
		        <label class="form-label">Apellido</label>
		        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
	      	</div>                
                <div class="col-md-12">
		        <label class="form-label">Direccion</label>
		        <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Direccion">
	      	</div>
                <div class="col-md-12">
		        <label class="form-label">Dni</label>
		        <input type="text" class="form-control" id="dni" name="dni" placeholder="Dni">
	      	</div>
                <div class="col-md-12">
		        <label class="form-label">Nacionalidad</label>
		        <input type="text" class="form-control" id="nacinalidad" name="nacionalidad" placeholder="Nacionalidad">
	      	</div>
                <div class="col-md-12">
                    <label  class="form-label">Celular</label>
                    <input type="text" class="form-control" id="celular" name="celular" placeholder="1111111111"> 
                </div>
	      	<div class="col-md-12">
		        <label class="form-label">Email</label>
		    	<input type="text" class="form-control" id="email" name="email" placeholder="TuEmail@ejemplo.com">
	      	</div>
                <div class="col-md-12">
		        <label  class="form-label">Cargo</label>
		        <input type="text" class="form-control" id="cargo" name="cargo" placeholder="Cargo">
                </div>
                <div class="col-md-12">
		        <label  class="form-label">Sueldo</label>
		        <input type="text" class="form-control" id="sueldo" name="sueldo" placeholder="Sueldo">
                </div>
                <div class="col-md-12">
		        <label  class="form-label">Fecha de Nacimiento</label>
		        <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" value="2018-07-22"
                                min="1970-01-01" max="2021-12-31">
                </div>
                <div class="col-md-12">
		        <label  class="form-label">Nombre de Usuario</label>
		        <input type="text" class="form-control" id="nombreUsuario" name="nombreUsuario" placeholder="Nombre de usuario">
                </div>
                <div class="col-md-12">
		        <label  class="form-label">Contraseña</label>
		        <input type="password" class="form-control" id="pass" name="pass" placeholder="Contraseña">
		        <input type="button" class="btn btn-outline-dark btn-sm" id="verPasswordBtn" value ="Ver contraseña">
                </div>
                
                
                <div class="col-12 text-center mb-n5 mt-3">
                    <button class="btn btn-primary center-block" type="submit" name="register">Enviar</button>
                </div>
    	</div>    	
        <div class="font-italic col-12 text-center">
                <h6>¿Ya tenes cuenta? <a href="login.jsp">Inicia sesión.</a></h6>
        </div>
    	<div class="col-4"></div>
    </form>
  </div>
</section>
	</main><!-- End #main -->
	<!-- ======= Footer ======= -->
	<footer id="footer">
	</footer><!-- End Footer -->
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