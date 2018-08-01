<%@page import="modelo.usuarioDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.File"%>
<%@page session="true" %>
<%@page import="modelo.Conectar"%>
 <% response.setHeader("Cache-Control", "no-store");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession Adsi=request.getSession();
    if(Adsi.getAttribute("UsuarioADSI")!=null){
    usuarioDTO userMostrar=(usuarioDTO)Adsi.getAttribute("UsuarioADSI");    
    Adsi.setMaxInactiveInterval(30000);    
%>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
    <style type="text/css">
    #listaBak {
	position: absolute;
	left: 5%;
	top: 36%;
	width: 70%;
	height: 70%;
	z-index: 1;
}
    </style>
    <link href="../css/otromas.css" rel="stylesheet" type="text/css">
    <link href="../css/sge.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    #generarBackup {
	position: absolute;
	left: 5%;
	top: 5%;
	width: 20%;
	height: 30%;
	z-index: 2;
}
    </style>
</head>
    
    <body>        
        <%        
        //String sDirectorio ="D:\\Mike\\Dropbox\\NetBeansProjects\\sge\\web\\SGE\\Backup's";
        //String sDirectorio ="C:\\Users\\Cat Savage\\Dropbox\\NetBeansProjects\\sge\\web\\SGE\\Backup's";
        String sDirectorio ="C:\\xampp\\mysql\\bin\\backup";
        File f = new File (sDirectorio);
        if(f.exists()){
         File[] ficheros = f.listFiles();      
        %>
        <div id="generarBackup">
          
            
       	  
          <form  method="post" action="controlbackup" >
            <p>Si desea generar el backup porfavor presione el boton Backup, luego presione en actualizar pagina</p>
            <p>
              <input type="submit" value="Backup" name="btnBackup" />
            </p>
            <p>&nbsp; </p>          
          </form>
          <%        
        if(request.getParameter("msj") !=null){
            if(request.getParameter("msj").equals("Backup creado satisfactoriamente")){
                out.print("<p><span class=\"textoGood\">"+request.getParameter("msj") +"</span>");
            }else{
                out.print("<p><span class=\"textoError\">"+request.getParameter("msj") +"</span>");
            }
            
        }
     %>               
     
        </div>
        
        <div id="listaBak">
          <table width="60%%" border="1">
          <thead>
            <tr>
              <th scope="col">Nombre</th>
              <th scope="col">Fecha</th>
            </tr>
           </thead>
           <% for (int x=0;x<ficheros.length;x++){%>
           <tbody>               
            <tr>                
              <td><% out.print(ficheros[x].getName());%></td>
              
              <td><% out.print(/*cast de last.modified() */new SimpleDateFormat("dd-MM-yyyy HH-mm-ss").format(new Date(ficheros[x].lastModified())));%></td>
            </tr>
               <%}%>       
            </tbody>
          </table>
    </div>
   <%}else{
            out.print("<span class=\"textoError\">porfavor revise que la ruta donde estan almacenados el backup sea la correcta recuerde q debe ser C:\\xampp\\mysql\\bin\\backup</span>");
             }    //cierre if%>     
    <%}else{
        out.print("<span>porfavor vuelva a iniciar sesion su tiempo de sesion a caducado</span>");
        }%>    
        
    </body>
</html>
