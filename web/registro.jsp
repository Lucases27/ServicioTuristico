<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!-- SI YA ESTA LOGEADO REDIRECCIONA A INDEX.JSP. -->

<section id="secreg" class="mt-5">
  <div class="container">
    <div class="section-title">
      <h2 id="h2">Registro</h2>
    </div>
    
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
                <h6>¿Ya tenes cuenta? <a href="Login?menuLogin=1">Inicia sesión.</a></h6>
        </div>
    	<div class="col-4"></div>
    </form>
  </div>
	
</section>