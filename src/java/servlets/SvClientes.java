/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Cliente;
import logica.Controladora;
import logica.util.Validaciones;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author Nadia
 */
@WebServlet(name = "SvClientes", urlPatterns = {"/SvClientes"})
public class SvClientes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Controladora control = new Controladora();
        String menu = "";
        int idCliente = 0;
        String url = "index.jsp";
        String mensaje = "";
        
        if(request.getAttribute("menu") != null){
            menu = (String)request.getAttribute("menu");
            if(menu.equals("ver")){
                url = "verClientes.jsp";
            }
            if(menu.equals("alta")){
                url = "altaClientes.jsp";
            }
       }
       if(request.getParameter("eliminar") != null){
            idCliente = Integer.parseInt(request.getParameter("eliminar"));
            try {
                control.borrarCliente(idCliente);
                mensaje = "Cliente borrado exitosamente!";
            } catch (NonexistentEntityException ex) {
                mensaje = "No se pudo borrar el cliente.";
            }
            url = "verClientes.jsp";
        }
       
        
        List<Cliente> clientes = control.getClientes();
        request.setAttribute("clientes", clientes);
        request.setAttribute("tituloSeccion", "Clientes");
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String fecha_nac = request.getParameter("fechaNacimiento");
        Date fNac = null;
        boolean alta = false;
        
        try {
            fNac = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nac);
        } catch (Exception e) {
        }
        
        alta = control.crearCliente(nombre, apellido,direccion,dni,nacionalidad,
                             celular,email,fNac);
        if(alta){
            mensaje = "Cliente creado con exito!";
            url = "altaClientes.jsp";
        }else{
            mensaje = "Error al crear el Cliente. Dni repetido o invalido.";
            url = "altaClientes.jsp";
        }
        request.setAttribute("mensaje", mensaje);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
