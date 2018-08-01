/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.productoDAO;
import modelo.productoDTO;

/**
 *
 * @author andres
 */
@WebServlet(name = "controlproducto", urlPatterns = {"/controlproducto"})
public class controlproducto extends HttpServlet {

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
            
             
       
            productoDTO proDTO = new productoDTO(); 
            productoDAO proDAO = new productoDAO(); 
            
                 
            
        if("eliminar".equals(request.getParameter("boton"))){
        
                
                String Temp = proDAO.eliminar(request.getParameter("pos"));
                
                
          if("elimacion exitosa".equals(Temp)){
                 response.sendRedirect("administrador.jsp?con=0&estado=productos");   
                 } else{
          response.sendRedirect("ingproducto.jsp?estado="+Temp); 
                
                }
        
        }
            
           if( "registrar".equals(request.getParameter("Boton"))){
               
                
                proDTO.setCodigo(Integer.parseInt (request.getParameter("codigo")));
                proDTO.setNombre(request.getParameter("nombre"));
                proDTO.setPrecioventa(Integer.parseInt (request.getParameter("precioventa")));
                proDTO.setUltprecio(Integer.parseInt (request.getParameter("ultprecio")));
                proDTO.setDescripcion(request.getParameter("descripcion")); 
                proDTO.setNumeroexistencias(Integer.parseInt (request.getParameter("numeroexistencias")));
               String Temp = proDAO.ingresarproducto(proDTO);
             
            if("Insersion Exitosa".equals(Temp)){
                
                 response.sendRedirect("administrador.jsp?con=0&estado=productos");   
                    
                }else{
                    
                 response.sendRedirect("ingproducto.jsp?estado="+Temp); 
                
                }
          
      
                
            }
             
            
            
            
            
            
             /////////////////////////////  uptade      ////////////////////////////////////////////////////////////////////
        
      
                
            if("actualizar".equals(request.getParameter("Boton"))){
                proDAO.setCodigo(Integer.parseInt (request.getParameter("codigo")));
                proDAO.setNombre(request.getParameter("nombre"));
                proDAO.setPrecioventa(Integer.parseInt(request.getParameter("precioventa")));
                proDAO.setUltprecio(Integer.parseInt(request.getParameter("ultprecio")));
                proDAO.setDescripcion(request.getParameter("descripcion"));
                proDAO.setNumeroexistencias(Integer.parseInt(request.getParameter("nexistencias")));
                
                
                String emp = proDAO.modproducto(proDAO); 
                
                
                 if("Update".equals(emp)){
                 response.sendRedirect("administrador.jsp?con=0&estado=productos");   
                 } else{
          response.sendRedirect("index.jsp?estado="+ emp); 
                
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
