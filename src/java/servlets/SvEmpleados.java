/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Empleado;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author Nadia
 */
@WebServlet(name = "SvEmpleados", urlPatterns = {"/SvEmpleados"})
public class SvEmpleados extends HttpServlet {
    
    Controladora control = new Controladora();

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
        String menu = "";
        int idEmpleado = 0;
        String url = "index.jsp";
        String mensaje = "";
        
        if(request.getAttribute("menu") != null){
            menu = (String)request.getAttribute("menu");
            if(menu.equals("ver")){
                url = "verEmpleados.jsp";
            }
            if(menu.equals("alta")){
                url = "altaEmpleados.jsp";
            }
        }
        
        if(request.getParameter("eliminar") != null){
            idEmpleado = Integer.parseInt(request.getParameter("eliminar"));
            try {
                control.borrarEmpleado(idEmpleado);
                mensaje = "Empleado borrado exitosamente!";
            } catch (NonexistentEntityException ex) {
                mensaje = "No se pudo borrar el empleado.";
            }
            url = "verEmpleados.jsp";
        }
        
        
        
        List<Empleado> empleados = control.getEmpleados();
        request.setAttribute("empleados", empleados);
        request.setAttribute("mensaje", mensaje);
        request.setAttribute("tituloSeccion", "Empleados");
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
        processRequest(request, response);
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
