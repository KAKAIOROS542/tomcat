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
import modelo.compraDAO;
import modelo.compraDTO;

/**
 *
 * @author andres
 */
@WebServlet(name = "controlcompra", urlPatterns = {"/controlcompra"})
public class controlcompra extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            out.print("entro");
            compraDAO comDTO= new compraDAO();
            compraDTO com= new compraDTO();
          if( "Comprar".equals(request.getParameter("Boton"))){
                out.print("boton");
                
                com.setCodigo(Integer.parseInt (request.getParameter("codigo_compra")));
                com.setUsuario_cedula(Integer.parseInt (request.getParameter("usuario_cedula")));
                com.setFecha(request.getParameter("fecha"));
                com.setValortotalbruto(Integer.parseInt (request.getParameter("total")));
                com.setPago(request.getParameter("pago"));
               String Temp = comDTO.ingresarcompra(com);
             
          if("Insersion Exitosa".equals(Temp)){
                
                 response.sendRedirect("Cliente.jsp?estado=factura#openModal");   
                    
                }else{
                    
                 response.sendRedirect("ingproducto.jsp?estado="+Temp); 
                
                }
          
      
                
            }
            
            
            
/////////////////////////////  Modificar compra    ////////////////////////////////////////////////////////////////////
        
      
                
          else  if("Actualizar".equals(request.getParameter("Boton"))){
               out.print("actuali");
                int idcompra= (Integer.parseInt (request.getParameter("codigocompra")));
                String estado=request.getParameter("estado");
                String Temp = comDTO.estado(idcompra,estado) ; 
                if("Update".equals(Temp)){
                 response.sendRedirect("administrador.jsp?con=0&estado=compras");   
                 } else{
               response.sendRedirect("index.jsp?estado="+ Temp); 
                
                }
        
        }  
            
            
           
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
