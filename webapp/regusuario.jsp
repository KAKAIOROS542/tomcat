<%-- 
    Document   : regusuario
    Created on : 27/11/2013, 10:55:22 AM
    Author     : Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
<head><link href="css/miestilo.css" rel="stylesheet" type="miestilo/css" />
    <script>
    function solonumeros(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " 1234567890";
       especiales = [8,37,39,46];
       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }
        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }
</script>
        
<script>
    function soloLetras(e){
 key = e.keyCode || e.which;
 tecla = String.fromCharCode(key).toLowerCase();
 letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
 especiales = [8,37,39,46];

 tecla_especial = false;
 for(var i in especiales){
     if(key === especiales[i]){
  tecla_especial = true;
  break;
            } 
 }
 
        if(letras.indexOf(tecla)===-1 && !tecla_especial)
     return false;
     }
</script>
<script>
      function verificarc(){
          var cedula=document.getElementById("cedula").value;
        
        var todo =true;
     
        if(document.getElementById("clave").value !== document.getElementById("rclave").value ){
            alert('las Contraseñas no coinciden ');
            todo=false;
            }
        if(document.getElementById("cedula").value.length < 8 ) {
            alert('Error cedula');
            todo=false;
        }
        if(  2000000000 < document.getElementById("cedula").value){
            alert('tipo de cedula incorrecta ');
            todo=true;
        }else{
            todo=false;
        }
        return todo;
               
    }
 
     function longitud(elemento,minimo){
         if(elemento!==""){
           var dato =elemento.value;  
          if(dato.length<minimo){
            alert('minimo caracteres de la cedula 11');  
          }   
         }
     }
       
    
 function revisar(elemento){
     var dato=elemento.value;
     if(dato<=500000){
         alert('No coinciden como una cedula');     
        }   
        }   
     

     
</script>
    <title>Registro</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" media="screen" href="css/reset.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/grid_12.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/miestilo.css">
    <link href='http://fonts.googleapis.com/css?family=Condiment' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    <script src="js/jquery-1.7.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript">
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
</script>
	
</head>
<%if(request.getParameter("estado")!=null){
out.print("<script>alert('"+request.getParameter("estado")+"')</script>");
}%>
<body>
  <div class="main">

    <header>
        <h1><a href="index.jsp"><img src="images/logo.png" alt="" width="226" height="131"></a></h1>
        <div id="apDiv1">
          <h3>&quot;Solución a tu medida&quot;</h3>
        </div>
        
        <div id="ruta">Inicio - Registro</div>
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
                    <a href="#" class="icon-3"></a>
                    <a href="#" class="icon-2"></a>
                    
                </div>
                <div class="clear"></div>
            </div>
        </nav>
    </header>   

    <section id="content"><div class="ic"></div>
        <div class="container_12">	
          <div class="grid_12">
            <div class="wrap pad-3">
              <div class="block-6">
                <h3>Registrarse</h3>
                <form action="controlusuarios" method="POST" onsubmit="return verificarc()" >
                      <fieldset>
                        
                         <p>
                           <label>
                               <input name="cedula" id="cedula" type="text" class="Texto1" placeholder="Cedula*" onkeypress="return solonumeros(event)" maxlength="10" onblur="return revisar(this)" required />&nbsp &nbsp &nbsp;
                           </label>
                           <label>
                             <input name="nombre" type="text" class="Texto1" placeholder="Nombre*" onkeypress=" return soloLetras(event)" maxlength="12" required />
                             <br>
                          <br>
                           </label>
                          <label>
                          <input name="apellido" type="text" class="Texto1" placeholder="Apellido*"  onkeypress="return soloLetras(event)" maxlength="12" required />&nbsp &nbsp &nbsp;
                          </label>
                          <label>
                          <input name="nombreusuario" type="text" class="Texto1" placeholder="Nombre Usuario*"  onkeypress="return soloLetras(event)" maxlength="12" required />
                          <br>
                          <br>
                          </label>
                          <label>
                          <input name="clave" id="clave" type="password" class="Texto1" placeholder="Clave*" maxlength="12" required />&nbsp &nbsp &nbsp;
                          </label>
                          <label>
                          <input name="rclave" id="rclave" type="password" class="Texto1" placeholder="Repita clave*" maxlength="12" required />&nbsp &nbsp &nbsp;
                          </label>
                          </p>
                         <p>&nbsp;</p>
                         <p>
                           <label>
                             <input name="correo" type="email" class="Texto1" placeholder="Email*" maxlength="30" required />&nbsp &nbsp &nbsp;
                           </label>
                           <label>
                             <input name="direccion" type="text" class="Texto1" placeholder="Dirección*" maxlength="25" required/>&nbsp &nbsp &nbsp;
                           </label></p>
                           <p>&nbsp;</p><p>
                           <label>
                             <input name="telefono" type="text" class="Texto1" required placeholder="Telefono*" onkeypress="return solonumeros(event)" maxlength="8"/>
                           </label>
                           <label>
                             <input type="hidden" name="tipo" value="1" />
                           </label>&nbsp &nbsp &nbsp;
                                <label>
                             <input name="Boton" type="submit"  value="registrarse" /></label>
                         </p>
                         <p>&nbsp;</p>
                        
                      </fieldset>
                         
                    </form>
                        
                     
              </div>
            <img src="images/adduser.png" width="251" height="218" alt="usua">            </div>
          </div>
          <div class="clear"></div>
        </div>
    </section> 
  </div>    
    <%
          if( request.getParameter("estado")!=null){
              
           
             
             out.print("<script> alert('"+request.getParameter("estado")+"') </script> ");     
    
              
          
          }else{
          
          
          }

         %>

</body>
</html>