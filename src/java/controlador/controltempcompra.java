/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.productoDAO;
import modelo.tempcompraDAO;
import modelo.tempcompraDTO;

/**
 *
 * @author andres
 */
@WebServlet(name = "controltempcompra", urlPatterns = {"/controltempcompra"})
public class controltempcompra extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
      tempcompraDTO comDTO = new tempcompraDTO(); 
      tempcompraDAO comDAO = new tempcompraDAO(); 
          
       if( "Comprar".equals(request.getParameter("Boton"))){
          
          comDTO.setCodigo_compra(Integer.parseInt (request.getParameter("codigo_compra")));
          comDTO.setProducto_codigo(Integer.parseInt (request.getParameter("producto_codigo")));
          comDTO.setProducto_nombre(request.getParameter("producto_nombre"));
          comDTO.setPrecio(Integer.parseInt (request.getParameter("precio")));
          comDTO.setUsuario_cedula(Integer.parseInt (request.getParameter("usuario_cedula")));
          comDTO.setFecha(request.getParameter("fecha"));
          comDTO.setCantidad(Integer.parseInt (request.getParameter("cantidad")));
          
          String Temp = comDAO.Ingresartempcompra(comDTO);
          
          productoDAO PRODUCTO = new productoDAO();
          
          String res = PRODUCTO.descontar(comDTO.getProducto_codigo(),comDTO.getCantidad());
        
          
       if("Insersion Exitosa".equals(Temp)){
           response.sendRedirect("Cliente.jsp?con=0&estado=compras&info=compro "+comDTO.getCantidad()+" unidades de "+comDTO.getProducto_nombre()+"-"+res);   
       }else{
           response.sendRedirect("Cliente.jsp"+Temp); }}
         
      
      
      
      
      
      
              
        if("eliminar".equals(request.getParameter("boton"))){
        
                
                String Temp = comDAO.eliminar(request.getParameter("pos"));
                
                
          if("Eliminacion exitosa".equals(Temp)){
                 response.sendRedirect("Cliente.jsp?con=0&estado=compras");   
                 } else{
          response.sendRedirect("Cliente.jsp"); 
                
                }
        
        } 
      
        } finally {
            out.close();
        }
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
        processRequest(request, response);
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