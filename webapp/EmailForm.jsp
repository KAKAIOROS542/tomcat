<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="modelo.usuarioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.emailDAO"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contraseña</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" media="screen" href="css/reset.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/grid_12.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/miestilo.css">
    <link href='http://fonts.googleapis.com/css?family=Condiment' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    <script src="js/jquery-1.7.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
	
</head>
<body>
  <div class="main">
 
    <header>
        <h1><a href="index.jsp"><img src="images/logo.png" alt="" width="226" height="131"></a></h1>
        <div id="apDiv1">
          <h3>solución a tu medida</h3>
        </div>  
          <div id="ruta">Inicio - Olvido de contraseña</div>
        <div class="clear"></div>    
        <nav class="box-shadow">
            <div>
                <ul class="menu">
                    <li class="home-page"><a href="index.jsp"><span></span></a></li>
                    <li><a href="about.jsp">Nosotros</a></li>
                    <li><a href="services.jsp">Productos</a></li>
                    <li class="current"><a href="contacts.jsp">Contátenos</a></li>
                </ul>
                <div class="social-icons">
                    <span>Encuéntranos en:</span>
                    <a href="#" class="icon-3"></a>
                    <a href="#" class="icon-2"></a>
                    <a href="#" class="icon-1"></a>
                </div>
                <div class="clear"></div>
            </div>
        </nav>
    </header>   
      
          <center>
          <form action="EmailSendingServlet" method="POST">
          <table border="1">
          <tbody>
          <tr>
            <td height="38"><table border="1" align="center">
                    <p>&nbsp;</p>
              <h2>Recordar contraseña</h2>
              <p>&nbsp;</p>
            
              <tbody>
                <tr>
                  <td><input type="text" name="doc" value="Documento" onBlur="if(this.value=='') this.value='Documento'" onFocus="if(this.value =='Documento' ) this.value=''"  /></td>
                  <td><input type="submit" value="Recordar" name="Boton" /></td>
                </tr>
              </tbody>
            </table></td>
          </tr>
          </tbody>
          </table>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          
        </form>
          </center>
    
   
  </div>    

</body>
</html>