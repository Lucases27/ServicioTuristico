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
import logica.Controladora;
import logica.Servicio;
import logica.util.Validaciones;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author Nadia
 */
@WebServlet(name = "SvServicios", urlPatterns = {"/SvServicios"})
public class SvServicios extends HttpServlet {

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
        int idServicio = 0;
        String url = "index.jsp";
        String mensaje = "";
        
        if(request.getAttribute("menu") != null){
            menu = (String)request.getAttribute("menu");
            if(menu.equals("ver")){
                url = "verServicios.jsp";
            }
            if(menu.equals("alta")){
                url = "altaServicios.jsp";
            }
        }
        
        if(request.getParameter("eliminar") != null){
            idServicio = Integer.parseInt(request.getParameter("eliminar"));
            try {
                control.borrarServicio(idServicio);
                mensaje = "Servicio borrado exitosamente!";
            } catch (NonexistentEntityException ex) {
                mensaje = "No se pudo borrar el servicio.";
            }
            url = "verServicios.jsp";
        }
       
        
        List<Servicio> servicios = control.getServicios();
        request.setAttribute("servicios", servicios);
        request.setAttribute("tituloSeccion", "Servicios");
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
        String descripcion = request.getParameter("descripcion");
        String destino = request.getParameter("destino");
        double costo = Validaciones.stringToDouble(request.getParameter("costo"));
        String fechaServicio = request.getParameter("fecha");
        Date fecha = null;
        boolean alta = false;
        
        try {
            fecha = new SimpleDateFormat("yyyy-MM-dd").parse(fechaServicio);
        } catch (Exception e) {
        }
        
        alta = control.crearServicio(nombre,descripcion,destino,fecha,costo);
        if(alta){
            mensaje = "Servicio creado con exito!";
            url = "altaServicios.jsp";
        }else{
            mensaje = "Error al crear el Servicio.";
            url = "altaServicios.jsp";
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
