<%-- 
    Document   : Reporte
    Created on : 4/02/2014, 09:54:57 AM
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
        
       File ReportFile = new File (application.getRealPath("/deployments/ROOT/Reportes/reportclie.jasper"));
       Map parameters= new HashMap ();
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
