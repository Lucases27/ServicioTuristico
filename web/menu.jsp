<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- SI YA ESTA LOGEADO REDIRECCIONA A INDEX.JSP. -->

<section id="Mi cuenta" class="services">
    <div class="container">
        <div class="section-title">
            <h2><%=request.getAttribute("tituloSeccion")%></h2>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 d-flex ">
                <div class="icon-box">							
                    <h4><a href="SvMenu?menu=alta&seccion=<%=request.getAttribute("tituloSeccion")%>">Nuevo registro</a></h4>
                    <p>Carga un nuevo registro a la base de datos.</p>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 d-flex ">
                <div class="icon-box">							
                    <h4><a href="SvMenu?menu=ver&seccion=<%=request.getAttribute("tituloSeccion")%>">Ver registros</a></h4>
                    <p>Listar todos los registros disponibles. Tambien puedes eliminar o modificarlos.</p>
                </div>
            </div>

        </div>
    </div> 
</section>