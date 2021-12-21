<%@page import="logica.Servicio"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Turismo</title>
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
    <!--HEADER Y MAIN SECTION -->
    <%@include file="header.jsp" %>
    <section id="faq" class="faq section-bg">
            <div class="container">
            <div class="section-title">
                            <h2>Lista de Servicios</h2>
                    </div>
                    <div class="row d-flex justify-content-center">

                            <div class="col-3"></div>
                            <div class="col-6">
                                <!-- MENSAJES -->
                                <%
                                 if(request.getAttribute("mensaje") != null){
                                 %><%=request.getAttribute("mensaje")%>
                                <%}
                                %>
                            </div>
                            <div class="col-3"></div>
                    </div>
            <div class="col-12">
                    <div class="table-responsive">
                            <table class="table table-bordered table-sm table-hover mb-0">
                                <thead>
                                    <tr style="background:#1977cc;color:white" class="text-center">
                                        <td>Id</td>
                                        <td>Nombre</td>
                                        <td>Descripcion</td>
                                        <td>Destino</td>
                                        <td>Costo</td>
                                        <td>Fecha</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                     List<Servicio> lista = (List<Servicio>)request.getAttribute("servicios");
                                     for (Servicio serv : lista) {
                                        String fecha = new SimpleDateFormat("yyyy/MM/dd").format(serv.getFecha_servicio());
                                       %><tr>
                                        <td><%=serv.getCodigo_servicio()%></td>
                                        <td><%=serv.getNombre()%></td>
                                        <td><%=serv.getDescripcion_breve()%></td>
                                        <td><%=serv.getDestino_servicio()%></td>
                                        <td><%=serv.getCosto_servicio()%></td>
                                        <td><%=fecha%></td>
                                        <td><a class="btn btn-outline-primary btn-sm"  href="SvServicios?modificar=<%=serv.getCodigo_servicio()%>">Modificar</a></td>
		                 	<td><a class="btn btn-outline-primary btn-sm"  href="SvServicios?eliminar=<%=serv.getCodigo_servicio()%>">Eliminar</a></td>
                                        <%
                                         }
                                    %>
                                </tbody>
                            </table>
                        </div>
                            <div class="mt-3">
                                    <a class="btn btn-primary btn-sm " href="SvServicios">Volver</a>
                            </div>
                    </div>
            </div>
    </section>
    <!-- End #main -<!-- ======= Footer ======= -->
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