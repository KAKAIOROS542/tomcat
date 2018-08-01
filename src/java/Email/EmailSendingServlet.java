/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.emailDAO;
import modelo.usuarioDTO;
import modelo.usuarioDAO;

/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 *
 * @author www.codejava.net
 *
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
         // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = "127.0.0.1";
         //host = context.getInitParameter("host");
        port = "25";
        // port = context.getInitParameter("port");
        user = "siofccwe@gmail.com";
        //user = context.getInitParameter("user");
        pass = "12345siofz";
        //pass = context.getInitParameter("pass");
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields

         PrintWriter out = response.getWriter();
        emailDAO usu = new emailDAO ();
        usuarioDTO usudto = new usuarioDTO ();
        ArrayList<usuarioDTO> ArregloUsu = new ArrayList<usuarioDTO> ();
        
        
        if (request.getParameter("doc")!= null){
        ArregloUsu = usu.contraseña(Long.parseLong(request.getParameter("doc")));

 out.print("el tamaño es"+ArregloUsu.size()+"   "+ArregloUsu.get(0).getCorreo()+"<br>");
        
      String recipient = ArregloUsu.get(0).getCorreo();

        String subject = "recordar contraseña";
        String content = "su contraseña es "+ArregloUsu.get(0).getClave();


        String resultMessage = "";

        try {

            
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);

            resultMessage = "Su contraseña se ha enviado satisfactoriamente, revise su correo ";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "ops parece que ocurrio un error: " + ex.getMessage();
           // resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/Result.jsp").forward(
                    request, response);
        }
  
            
        }
        //buscar//
        else{if("Buscar".equals(request.getParameter("Buscar"))){
      
                   String pUno = request.getParameter("name"); 
                   
                   
            
            }else{ }}

        // \buscar
        
    }
}
