
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contactos</title>
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
          <h3>&quot;Solución a tu medida&quot;</h3>
        </div>  
         <div id="ruta">Inicio - Contactenos</div>
        <div class="clear"></div>    
        <nav class="box-shadow">
            <div>
                <ul class="menu">
                    <li class="home-page"><a href="index.jsp"><span></span></a></li>
                    <li><a href="about.jsp">Nosotros</a></li>
                    <li><a href="services.jsp">Productos</a></li>
                    <li class="current"><a href="contacts.jsp">Contáctenos</a></li>
                </ul>
                <div class="social-icons">
                    <span>Encuéntranos en:</span>
                    <a href="https://www.facebook.com/SOFTWARDAJA?ref=hl" class="icon-2"></a>
                    <a href="https://plus.google.com/u/0/getstarted?fww=1" class="icon-3"></a>
                </div>
                <div class="clear"></div>
            </div>
        </nav>
    </header>   
  
    <section id="content"><div class="ic"></div>
        <div class="container_12">	
          <div class="grid_12">
            <div class="wrap pad-3">
                <div class="block-5">
                    <h3 class="p5">Encuéntranos</h3>
                    <div class="map img-border">
                      <iframe width="425" height="240" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.es/maps?f=q&amp;source=embed&amp;hl=es&amp;geocode=&amp;q=Carrera+13+No.65-10+bogota&amp;aq=&amp;sll=4.716063,-74.103578&amp;sspn=0.416066,0.676346&amp;ie=UTF8&amp;hq=&amp;hnear=Carrera+13+%23+65-10,+Bogot%C3%A1,+Cundinamarca,+Colombia&amp;t=h&amp;layer=c&amp;cbll=4.65178,-74.063159&amp;panoid=qPxfYCGfsVKjYMo2o0CngA&amp;cbp=11,74.04,,0,-20.08&amp;ll=4.640077,-74.063172&amp;spn=0.020532,0.036478&amp;z=14&amp;output=svembed"></iframe><br />
                    </div>
                    <dl>
                        <dt>Sena Centro de Servicios Financieros </dt>
                        <dd>Carrera 13 No.65-10</dd>
                    </dl>
                    <p>&nbsp;</p>
                    <dl>
                      <dd>&nbsp;</dd>
                      <dd><span>Teléfono: </span>+1 7521577</dd>
                      <dd>&nbsp;</dd>
                      <dd><span>E-mail: </span><a href="#" class="link">daja.proyectosena@gmail.com</a></dd>
                    </dl> 
                </div>
                <div class="block-6">
                    <h3>Póngase en contacto</h3>
                    <form id="form" method="post" action="conactactenos">
                      <fieldset>
                        <label><input type="text" name="nom" value="" placeholder="Nombre*" onkeypress="return sololetras(event)" maxlength="11" required />
                        </label>
                        <label><input type="email" name="subject" value="Email" onBlur="if(this.value=='') this.value='Email'" onFocus="if(this.value =='Email' ) this.value=''"></label>
                        <label><textarea name="content" onBlur="if(this.value==''){this.value='Mensaje'}" onFocus="if(this.value=='Mensaje'){this.value=''}">Mensaje</textarea></label>
                        <input name="Boton" type="submit" value="Enviar" />
                      </fieldset>  
                    </form> 
                </div>
            </div>
          </div>
          <div class="clear"></div>
        </div>
    </section> 
  </div>    

</body>
</html>
