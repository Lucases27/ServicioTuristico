<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!-- HEADER -->
<div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex justify-content-between">
            <div class="contact-info d-flex align-items-center">
                    <i class="bi bi-envelope"></i> <a href="mailto:Simplevet.arg@gmail.com">Turismo.arg@gmail.com</a>
                    <i class="bi bi-phone"></i> 
            </div>
            <div class="d-none d-lg-flex social-links align-items-center">
            </div>
    </div>
</div>
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">
            <h1 class="logo me-auto"><a href="index.jsp">Turismo</a></h1>
            <nav id="navbar" class="navbar order-last order-lg-0">
                <ul>
                    <li><a class="nav-link scrollto " href="index.jsp#hero">Home</a></li>
                    <% 
                        session = request.getSession();
                        String userHeader = (String) session.getAttribute("user");
                        if(userHeader == null){ 
                          %><li><a class="nav-link scrollto" href="login.jsp">Ingresar</a></li>
                            <li><a class="nav-link scrollto" href="registro.jsp">Registrarme</a></li>
                      <%}else{
                          %>
                            <li><a class="nav-link scrollto" href="SvServicios">Servicios</a></li>
                            <li><a class="nav-link scrollto" href="SvPaquetes">Paquetes</a></li>
                            <li><a class="nav-link scrollto" href="SvClientes">Clientes</a></li>
                            <li><a class="nav-link scrollto" href="SvVentas">Ventas</a></li>
                            <li><a class="nav-link scrollto" href="SvLogout">Salir</a></li>
                      <%}
                        %>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->
            <a href="https://api.whatsapp.com/send?phone=+5491155555555" target="_blank" class="appointment-btn scrollto"><span class="d-none d-md-inline">Consulta vía </span>WhatsApp</a>
    </div>
</header>
<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">
        <div class="container">
                <h1>Bienvenido a Servicio Turistico</h1>
                <h2>Tu destino es aqui.</h2>
        </div>
</section>
<!-- End Hero -->
