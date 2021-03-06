package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.util.Validaciones;

@WebServlet(name = "SvRegistro", urlPatterns = {"/SvRegistro"})
public class SvRegistro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Controladora control = new Controladora();
        
        String mensaje = "";
        String url = "index.jsp";
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        String nacionalidad = request.getParameter("nacionalidad");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        String cargo = request.getParameter("cargo");
        double sueldo = 0;
        sueldo = Validaciones.stringToDouble(request.getParameter("sueldo"));
        if(sueldo == -1){
            mensaje = "sueldo invalido.";
        }
        
        String fecha_nac = request.getParameter("fechaNacimiento");
        String nombreUsuario  = request.getParameter("nombreUsuario");
        String pass = request.getParameter("pass");
        Date fNac = null;
        boolean alta = false;
        
        
        try {
            fNac = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nac);
        } catch (Exception e) {
        }
        
        
        try {
            alta = control.crearEmpleado(nombre, apellido,direccion,dni,nacionalidad,celular,
                email,cargo,sueldo,nombreUsuario,pass,fNac);
        } catch (Exception e) {
        }
        if(alta){
            mensaje = "Empleado creado con exito!";
        }else{
            mensaje = "Error al crear el empleado. Usuario o dni ya existente o invalidos.";
            url = "registro.jsp";
            if(request.getParameter("altaEmpleado") != null){
                url = "altaEmpleados.jsp";
            }
        }
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
