<%-- 
    Document   : index
    Created on : 9/12/2013, 11:21:17 PM
    Author     : Tania ordoñez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Inicio</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" media="screen" href="css/reset.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/grid_12.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/miestilo.css">
        <link href='http://fonts.googleapis.com/css?family=Condiment' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
        <script src="js/jquery-1.7.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/tms-0.4.x.js"></script>

        <script>
            $(document).ready(function() {
                $('.slider')._TMS({
                    show: 0,
                    pauseOnHover: true,
                    prevBu: false,
                    nextBu: false,
                    playBu: false,
                    duration: 1000,
                    preset: 'fade',
                    pagination: true,
                    pagNums: false,
                    slideshow: 7000,
                    numStatus: true,
                    banners: 'fromRight',
                    waitBannerAnimation: false,
                    progressBar: false
                })
            });
        </script>




    </head>


</head>
<body>
      <%if (request.getParameter("estado") != null) {
         out.print("<script> alert('" + request.getParameter("estado") + "') </script> ");
                                }%>  
                                
         <div id="apDiv1">
        <h3>&quot;Solución a tu medida&quot;</h3>
    </div><a href="#openModal"><img id="login" src="images/ingresar.png" width="150" height="40" alt="login"></a>

    <div id="openModal" class="modalDialog">
        <div>
            <a href="#close" title="Cerrar" class="close">X</a>
            <div id="container">
             <div id="service">
              <div id="vector">
               <center>
             <form action="controlusuarios" method="post">
             <table width="200" border="0">
                                    <tr>
                                        <td  rowspan="5"><img src="images/user.png" width="90" height="100"></td>
                                        <td height="30"><input name="nombreusuario" type="text" class="Texto1" placeholder="Ingrese nombre usuario" required /></td>

                                    </tr>
                                    <tr>
                                        <td height="30"><input name="clave" type="password" class="Texto1" placeholder="Ingrese Clave." required /></td>

                                    </tr>
                                    <tr>
                                    <td ><input name="Boton" type="submit" class="button" placeholder="Entrar." value="Inicio" /></td>
                                    </tr>
                                    <tr>
                                        <td><p><a href="EmailForm.jsp" class="readmore">Olvido Su clave.</a></p></td>
                                    </tr>
                                    <tr>
                                        <td><p><a href="regusuario.jsp" class="readmore">Registrarse.</a></p></td>
                                    </tr>
                                </table>
                            </form>
                        </center>	

                        
                    </div>



                </div>
            </div> 
        </div>
    </div>
    <div class="main">

        <header>
            <h1><a href="#"><img src="images/logo.png" width="150" height="70" alt="logo"></a></h1>

            <nav class="box-shadow">
                <div>
                    <ul class="menu">
                        <li class="home-page current"><a href="#"><span></span></a></li>
                        <li><a href="about.jsp"> Nosotros</a></li>
                        <li><a href="services.jsp">Productos</a></li>
                        <li><a href="contacts.jsp">Contáctenos</a></li>
                
                    </ul>
                    <div class="social-icons">
                        <span>Encuéntranos en:</span>
                        
                        <a href="https://www.facebook.com/profile.php?id=100023908057238" class="icon-2"></a>
                        
                        
                    </div>
                    <div class="clear"></div>
                </div>
            </nav>
        </header>   

        <section id="content"><div class="ic"></div>
            <div id="slide" class="box-shadow">		
                <div class="slider">
                    <ul class="items">
                        <li><img src="images/slider-1.jpg" alt="" /><div class="banner">Un paso tecnológico para las Pymes&nbsp;</div></li>
                        <li><img src="images/slider-2.jpg" alt="" /><div class="banner">Una forma diferente de solucionar el manejo de facturación&nbsp;</div></li>
                        <li><img src="images/slider-3.JPG" alt="" /><div class="banner">ventas de ropa&nbsp;</div></li>
                    </ul>
                </div>
            </div>
            <p>&nbsp;</p>
            
        
    </div>
 <div class="datagrid"><table>
<thead>
<tr class="alt">
<caption >@Copyright Rocio Zarate Tec-innova quilmes argentina </caption> 
<tr>
<tr><td colspan="4"></td> <td> 

    

</td>
</tr>
</form>
<tr>




 
</tr></thead>
<tbody>
<tr class="alt">
<tr></tr>

<td></td>
<tr></tr>

<tr></tr>

<td></td>
<td></td>


              

<tr class="alt">

   
</tr></tbody>
</table>
      
      <div class="datagrid">
                <div align="left">
                    
                </div>
            </div>
            <p>&nbsp;</p>
            <div id="login2"><a href="https://drive.google.com/file/d/0B459DMPZaCluMDFsV2tTdEZQeUk/edit?usp=sharing"><img src="images/formato.jpg" width="145" height="35" alt="login"></a></div>
            <p>&nbsp;</p>
            <div class="aside"></div>  
        
  </div>
</div>

<!--==============================footer=================================-->C
</body>
</html>
</body>
</html>
