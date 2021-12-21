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
      	<div class="row">
	   		<div class="col-3"></div>
      		<div class="row d-flex justify-content-center col-6">
				<!-- MENSAJE DE EXITO/ERROR AL MODIFICAR -->
				<div class="col-12 form-group mb-1 mt-2 text-center">
					<h5 class="text-danger">
						<c:out value="${errores}"></c:out>
					</h5>
					<h5 class="text-success">
						<c:out value="${success}"></c:out>
					</h5>
				</div>
				<div class="col-12">
					<c:choose>
						<c:when test="${param.modificar >0}">
							<!-- FORMULARIO EDITAR PRODUCTO -->
							<form action="TiendaAdmin" method="POST" enctype="multipart/form-data">
								<div class="form-group mt-2">
									<label for="producto">Id Producto:</label>
									<input class="form-control" readonly type="text" name="idProducto" 
											placeholder="${modificarProducto.getIdProducto()}"/>
								</div>
								<div class="form-group">
									<label for="nombre">Nombre:</label> 
									<input class="form-control" type="text" name="nombre" placeholder="Nombre" 
											value="${modificarProducto.getNombre()}"/>
								</div>
								<div class="form-group">
									<label for="descripcion">Descripción:</label> <input class="form-control" type="text" name="descripcion" placeholder="Nombre" 
											value="${modificarProducto.getDescripcion()}"/>
								</div>
								<div class="form-group">
									<label for="precio">Precio</label>
									<input class="form-control" type="text" name="precio" placeholder="Precio" 
											value="${modificarProducto.getPrecio()}"/>
								</div>
								<div class="form-group">
									<label for="cantidad">Cantidad:</label>
									<input class="form-control" type="text" name="cantidad" placeholder="Cantidad" 
											value="${modificarProducto.getCantidad()}"/>
								</div>
								<div class="form-group mb-2">
									<label for="img">Seleccionar Imagen (Opcional):</label>
									<input type="file" id="img" name="img" accept="image/*">
								</div>
								<input type="hidden" value="${modificarProducto.getIdProducto()}" name="modificarProducto">
								<button type="submit" class="btn btn-primary form-control mb-4">Modificar</button>
							</form>
						</c:when>
						<c:when test="${param.agregar == 1}">
							<!-- FORMULARIO AGREGAR PRODUCTO-->
							<form action="TiendaAdmin" method="POST" enctype="multipart/form-data">
								<div class="form-group mt-2">
									<label for="nombre">Nombre:</label> 
									<input class="form-control" type="text" name="nombre" placeholder="Nombre del producto"/>
								</div>
								<div class="form-group mt-2">
									<label for="descripcion">Descripción:</label> 
									<input class="form-control" type="text" name="descripcion" placeholder="Descripción del producto"/>
								</div>
								<div class="form-group">
									<label for="precio">Precio</label>
									<input class="form-control" type="text" name="precio" placeholder="Precio del producto"/>
								</div>
								<div class="form-group">
									<label for="cantidad">Cantidad:</label>
									<input class="form-control" type="text" name="cantidad" placeholder="Cantidad disponible"/>
								</div>
								<div class="form-group mb-2">
									<label for="img">Seleccionar Imagen (Opcional):</label>
									<input type="file" id="img" name="img" accept="image/*">
								</div>
								<input type="hidden" value="1" name="agregarProducto">
								<button type="submit" class="btn btn-primary form-control mb-4">Agregar Producto</button>
							</form>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
      	<div class="col-12">
			    <div class="table-responsive">
				    <table class="table table-bordered table-sm table-hover mb-0 text-center">
			            <thead>
			                <tr style="background:#1977cc;color:white" class="text-center">
			                    <td>Id</td>
			                    <td>Nombre</td>
			                    <td>Descripción</td>
			                    <td>Precio</td>
			                    <td>Cantidad</td>
			                    <td></td>
			                </tr>
			            </thead>
		           		<tbody>
			                <c:forEach items="${listaProductos}" var="prod">
			                	<tr>
			                 	<td>${prod.getIdProducto()}</td>
			                 	<td>${prod.getNombre()}</td>
			                 	<td>${prod.getDescripcion()}</td>
			                 	<td>${prod.getPrecio()}</td>
			                 	<td>${prod.getCantidad()}</td>
			                 	<c:set var="id" value="${prod.getIdProducto()}"/>
			                 	<c:set var="nombre" value="${prod.getNombre()}"/>
			                 	<c:set var="descripcion" value="${prod.getDescripcion()}"/>
			                 	<c:set var="precio" value="${prod.getPrecio()}"/>
			                 	<c:set var="cantidad" value="${prod.getCantidad()}"/>
								<td class="text-center">
									<a class="btn btn-outline-primary btn-sm" href="TiendaAdmin?modificar=${id}">Modificar</a>
									<a class="btn btn-outline-primary btn-sm" href="TiendaAdmin?eliminar=${id}">Eliminar</a>
								</td>
			                	</tr>
			            	</c:forEach>
			            </tbody>
			        </table>
			    </div>
		    <div class="text-right mt-4 p-0">
				<a class="btn btn-outline-danger btn-sm" href="TiendaAdmin?agregar=1">Agregar Producto</a>
			</div>
			<div class="mt-1">
	      		<a href="AdminPanel" class="btn btn-primary btn-sm">Volver</a>
	      	</div>
		</div>
    </div>
</section>