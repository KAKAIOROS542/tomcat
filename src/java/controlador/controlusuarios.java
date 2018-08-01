/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.usuarioDAO;
import modelo.usuarioDTO;

/**
 *
 * @author Sena
 */
public class controlusuarios extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            /* TODO output your page here. You may use following sample code. */
           
            usuarioDTO objDto = new usuarioDTO(); 
            usuarioDAO objDao = new usuarioDAO(); 
            
            
        if("eliminar".equals(request.getParameter("boton"))){
        
                
                String Temp = objDao.eliminar(request.getParameter("pos"));
                
                
          if("Eliminacion exitosa".equals(Temp)){
                 response.sendRedirect("administrador.jsp");   
                 } else{
          response.sendRedirect("administrador.jsp?estado="+Temp); 
                
                }
        
        }
        
           
         /////////////////////////////  uptade EMPLEADO  ////////////////////////////////////////////////////////////////////
    
    if("actualizar".equals(request.getParameter("Botons"))){
                objDao.setCedula(Integer.parseInt (request.getParameter("cedula")));
                objDao.setNombre(request.getParameter("nombre"));
                objDao.setApellido(request.getParameter("apellido"));
                objDao.setDireccion(request.getParameter("direccion"));
                objDao.setTelefono(Integer.parseInt (request.getParameter("telefono")));
                objDao.setCorreo(request.getParameter("correo"));
                objDao.setTipo(Integer.parseInt (request.getParameter("tipo").substring(0,1)));
                objDao.setNombreusuario(request.getParameter("usuario"));
                objDao.setClave(request.getParameter("clave"));
                
                String Temp = objDao.modempleado(objDao);    
                 if("Update".equals(Temp)){
                 response.sendRedirect("Cliente.jsp?estado=notificacion");   
                 } else{
          response.sendRedirect("index.jsp?estado="+Temp); 
                
                }
        
        } 
        
    /////////////////////////////  uptade admisnistrador   ////////////////////////////////////////////////////////////////////
        
    if("actualizar".equals(request.getParameter("Boton"))){
                objDao.setCedula(Integer.parseInt (request.getParameter("cedula")));
                objDao.setNombre(request.getParameter("nombre"));
                objDao.setApellido(request.getParameter("apellido"));
                objDao.setDireccion(request.getParameter("direccion"));
                objDao.setTelefono(Integer.parseInt (request.getParameter("telefono")));
                objDao.setCorreo(request.getParameter("correo"));
                objDao.setTipo(Integer.parseInt (request.getParameter("tipo").substring(0,1)));
                objDao.setNombreusuario(request.getParameter("usuario"));
                objDao.setClave(request.getParameter("clave"));
                String Temp = objDao.modcliente(objDao);    
                 if("Update".equals(Temp)){
                 response.sendRedirect("administrador.jsp?estado=notificacion");   
                 } else{
          response.sendRedirect("index.jsp?estado="+Temp); 
                }}
    /////////////////////////////  uptade EMPLEADO  ////////////////////////////////////////////////////////////////////
    
    if("Actualizar".equals(request.getParameter("Boton"))){
                objDao.setCedula(Integer.parseInt (request.getParameter("cedula")));
                objDao.setNombre(request.getParameter("nombre"));
                objDao.setApellido(request.getParameter("apellido"));
                objDao.setDireccion(request.getParameter("direccion"));
                objDao.setTelefono(Integer.parseInt (request.getParameter("telefono")));
                objDao.setCorreo(request.getParameter("correo"));
                objDao.setTipo(Integer.parseInt (request.getParameter("tipo").substring(0,1)));
                objDao.setNombreusuario(request.getParameter("usuario"));
                objDao.setClave(request.getParameter("clave"));
                
                String Temp = objDao.modempleado(objDao);    
                 if("Update".equals(Temp)){
                 response.sendRedirect("administrador.jsp?con=0&estado=empleados");   
                 } else{
          response.sendRedirect("index.jsp?estado="+Temp); 
                
                }
        
        } 
    
   
      /////////////////////////////  uptade MIS DATOS  empleado  ////////////////////////////////////////////////////////////////////
   
      
    if("ACTUALIZAR".equals(request.getParameter("caja"))){
                objDao.setCedula(Integer.parseInt (request.getParameter("cedula")));
                objDao.setNombre(request.getParameter("nombre"));
                objDao.setApellido(request.getParameter("apellido"));
                objDao.setDireccion(request.getParameter("direccion"));
                objDao.setTelefono(Integer.parseInt (request.getParameter("telefono")));
                objDao.setCorreo(request.getParameter("correo"));
                objDao.setTipo(Integer.parseInt (request.getParameter("tipo").substring(0,1)));
                objDao.setNombreusuario(request.getParameter("usuario"));
                objDao.setClave(request.getParameter("clave"));
                
                String Temp = objDao.modmisdatos(objDao);    
                 if("Update".equals(Temp)){
                 response.sendRedirect("empleado.jsp?estado=notificacion");   
                 } else{
          response.sendRedirect("index.jsp?estado="+Temp); 
                
                }
        
        } 
    
   ////////////////////////////// REGISTRARSE///////////////////////////////
   if( "registrarse".equals(request.getParameter("Boton"))){
               
                objDto.setCedula(Integer.parseInt (request.getParameter("cedula")));
                objDto.setNombre(request.getParameter("nombre"));
                objDto.setApellido(request.getParameter("apellido"));
                objDto.setDireccion(request.getParameter("direccion"));
                objDto.setTelefono(Integer.parseInt (request.getParameter("telefono")));
                objDto.setCorreo(request.getParameter("correo"));
                objDto.setTipo(Integer.parseInt (request.getParameter("tipo").substring(0,1)));
                objDto.setNombreusuario(request.getParameter("nombreusuario"));
                objDto.setClave(request.getParameter("clave"));
                
                 
                boolean exist= objDao.Existeuser(objDto.getNombreusuario());
                String Temp = objDao.IngresarUsuario(objDto);
                
                
             
         if("Insersion Exitosa".equals(Temp)){
               
                 response.sendRedirect("index.jsp?estado="+Temp);   
                    
                }else{
                    
                 response.sendRedirect("regusuario.jsp?estado="+Temp); 
                
                }
                
      
                
            }
   
 if( "Inicio".equals(request.getParameter("Boton"))){
            String pUno = request.getParameter("nombreusuario");  
            String pDos = request.getParameter("clave");  
            objDto= objDao.login(pUno,pDos);
            out.print(objDto.getNombre());
            out.print(objDto.getTipo());
            
            if("Nulo".equals(objDto.getNombre())){
               response.sendRedirect("index.jsp?estado=Usuario y clave incorrectos"); 
            }
            else{
            
               HttpSession Adsi = request.getSession();
               Adsi.setAttribute("UsuarioADSI", objDto);
               Adsi.setAttribute("valida", "ok");
               
               if(1==objDto.getTipo()){
               response.sendRedirect("Cliente.jsp");
                   
               }else if(2==objDto.getTipo()){
               response.sendRedirect("empleado.jsp");
                   
               }else if(3==objDto.getTipo()){
               response.sendRedirect("administrador.jsp");
                   
               } else{out.print("error de tipo");}
                
            }                
            }
            
            
                      
   else if("Salir".equals(request.getParameter("Boton"))){
             HttpSession Adsi = request.getSession();
             Adsi.invalidate();
             response.sendRedirect("index.jsp");
            
            }else{
            
            
            
            }
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
