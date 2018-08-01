<%-- 
    Document   : Reporte2
    Created on : 6/02/2014, 08:36:47 AM
    Author     : andres
--%>


<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="modelo.Conectar"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
      <%       
       Connection conn = Conectar.getInstace();
       File ReportFile = new File (application.getRealPath("Reportes/Factura.jasper"));
       Map parameters= new HashMap ();
       parameters.put("codigo",Integer.parseInt(request.getParameter("codigo")));
       byte [] bytes = JasperRunManager.runReportToPdf(ReportFile.getPath(),parameters,conn);
  
   response.setHeader("Content-Disposition", "attachment; filename=\"reporte.pdf\";");
   response.setContentLength(bytes.length);
   
   ServletOutputStream outPutStream = response.getOutputStream();
           outPutStream.write (bytes,0,bytes.length);
           outPutStream.flush();
           outPutStream.close();
           
   
        %>
                
    </body>
</html>

