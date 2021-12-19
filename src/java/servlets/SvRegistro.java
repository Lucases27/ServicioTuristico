package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

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
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        String nacionalidad = request.getParameter("nacionalidad");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        String cargo = request.getParameter("cargo");
        double sueldo = Double.parseDouble(request.getParameter("sueldo"));
        String fecha_nac = request.getParameter("fechaNacimiento");
        String nombreUsuario  = request.getParameter("nombreUsuario");
        String pass = request.getParameter("pass");
        Date fNac = null;
        boolean alta = false;
        String mensaje = "";
        
        try {
            fNac = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nac);
        } catch (Exception e) {
            System.out.println("no se pudo");
        }
        
        try {
            alta = control.crearEmpleado(nombre, apellido,direccion,dni,nacionalidad,celular,
                email,cargo,sueldo,nombreUsuario,pass,fNac);
        } catch (Exception e) {
        }
        if(alta){
            mensaje = "Empleado creado con exito!";
        }else{
            mensaje = "Error al crear el empleado. USUARIO O DNI YA EXISTENTES.";
        }
        
        System.out.println("mensaje: "+mensaje);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
