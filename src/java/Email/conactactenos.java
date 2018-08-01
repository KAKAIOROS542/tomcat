/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Email;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tania ordoñez
 */
@WebServlet(name = "conactactenos", urlPatterns = {"/conactactenos"})
public class conactactenos extends HttpServlet {

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
        user = "daja.proyectosena@gmail.com";
        //user = context.getInitParameter("user");
        pass = "daja2014";
        //pass = context.getInitParameter("pass");
    }

   protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String recipient = "daja.proyectosena@gmail.com";
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
 
        String resultMessage = "";
 
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
                    content);
            resultMessage = "Su mensaje se ha enviado satisfactoriamente";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "Ops parece que ocurrio un error: " + ex.getMessage();
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher("/Result.jsp").forward(
                    request, response);
        }
    }

        
}
