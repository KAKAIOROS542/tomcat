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
import modelo.facturaDAO;
import modelo.facturaDTO;

/**
 *
 * @author andres
 */
@WebServlet(name = "controlfactura", urlPatterns = {"/controlfactura"})
public class controlfactura extends HttpServlet {

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
             
        
            
            facturaDTO factDTO = new facturaDTO(); 
            facturaDAO factDAO = new facturaDAO();
            
         if("eliminar".equals(request.getParameter("boton"))){
             
          out.print("<script> alert('"+request.getParameter("estado")+"') </script> ");     
    
              
        
        
                
                String Temp = factDAO.eliminarfactura(request.getParameter("pos"));
                
                
          if("Eliminacion exitosa".equals(Temp)){
                 response.sendRedirect("administrador.jsp?estado=factura");   
                 } else{
          
                out.print("no fue eliminada");
                }
        
        }
            
             if( "registrar".equals(request.getParameter("Boton"))){
               
                
                factDAO.setCodigo(Integer.parseInt (request.getParameter("codigo")));
                factDAO.setUsuario_cedula(Integer.parseInt(request.getParameter("usuariocedula")));
                factDAO.setProductos_codigo(Integer.parseInt (request.getParameter("productoscodigo")));
                factDAO.setFecha(request.getParameter("fecha"));
                factDAO.setCantidad(Integer.parseInt (request.getParameter("cantidad")));
                factDAO.setValorunit(Integer.parseInt (request.getParameter("valorunitario")));
                factDAO.setIva(Integer.parseInt (request.getParameter("iva")));
                factDAO.setValortotalbruto(Integer.parseInt (request.getParameter("valortotalbruto")));
                factDAO.setDescuento(Integer.parseInt (request.getParameter("descuento")));
                factDAO.setValorneto(Integer.parseInt (request.getParameter("valorneto")));
                       
               String Temp = factDAO.ingresarfactura(factDAO);
               
               
             
            if("Insersion Exitosa".equals(Temp)){
                
              response.sendRedirect("administrador.jsp?estado=factura");   
                    
                }else{
                    
                 response.sendRedirect("ingproducto.jsp?estado="+Temp); 
                
           }
        
        }
             
             
             
             ///// uptade ///////
             
                
            if("actualizar".equals(request.getParameter("Boton"))){
                factDAO.setCodigo(Integer.parseInt (request.getParameter("codigo")));
                factDAO.setUsuario_cedula(Integer.parseInt(request.getParameter("usuariocedula")));
                factDAO.setProductos_codigo(Integer.parseInt (request.getParameter("productoscodigo")));
                factDAO.setFecha(request.getParameter("fecha"));
                factDAO.setCantidad(Integer.parseInt (request.getParameter("cantidad")));
                factDAO.setValorunit(Integer.parseInt (request.getParameter("valorunitario")));
                factDAO.setIva(Integer.parseInt (request.getParameter("iva")));
                factDAO.setValortotalbruto(Integer.parseInt (request.getParameter("valortotalbruto")));
                factDAO.setDescuento(Integer.parseInt (request.getParameter("descuento")));
                factDAO.setValorneto(Integer.parseInt (request.getParameter("valorneto")));
               
                 String emp = factDAO.modfactura(factDAO); 
                
                
                 if("Update".equals(emp)){
                 response.sendRedirect("administrador.jsp?estado=factura");   
                 } else{
          out.print("no pudo ser actualizada");
                
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
