<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- SI YA ESTA LOGEADO REDIRECCIONA A INDEX.JSP. -->

<section id="Mi cuenta" class="services">
    <div class="container">
        <div class="section-title">
            <h2><%=request.getAttribute("tituloSeccion")%></h2>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6 d-flex ">
                <div class="icon-box">							
                    <h4><a href="SvMenu?alta=<%=request.getAttribute("tituloSeccion")%>">Nuevo registro</a></h4>
                    <p>Carga un nuevo registro a la base de datos.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 d-flex ">
                <div class="icon-box">							
                    <h4><a href="SvMenu?ver=<%=request.getAttribute("tituloSeccion")%>">Ver registros</a></h4>
                    <p>Listar todos los registros disponibles.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 d-flex ">
                <div class="icon-box">							
                    <h4><a href="SvMenu?editar=<%=request.getAttribute("tituloSeccion")%>">Modificar o eliminar</a></h4>
                    <p>Editar o eliminar registros.</p>
                </div>
            </div>
        </div>
    </div> 
</section>