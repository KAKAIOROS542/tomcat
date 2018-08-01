<%-- 
    Document   : Script
    Created on : 28/02/2014, 02:11:27 PM
    Author     : andres
--%>

<%@page import="modelo.usuarioDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
         <script language="javascript" type="text/javascript">
            function validar()
            {
                 var estaok = true;
                 
                
                if (0 === document.getElementById("existencias").value ) {
                    estaok = false;
                }
                return estaok;
            }

            function estado(){
                var con = true;
                var estado=document.getElementById("estado").value;
                if (estado === 1){
                    alert('No sealizo ningun cambio')
                    con=false;
                }
                
                return con;
              
            }
        </script>


        <script>
            function solonumeros(e) {
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = " 1234567890";
                especiales = [8, 37, 39, 46];
                tecla_especial = false
                for (var i in especiales) {
                    if (key == especiales[i]) {
                        tecla_especial = true;
                        break;
                    }
                }
                if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                    return false;
                }
            }
        </script>
        <script>
            function sololetras(e) {
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = " abcdefghijklmnñopqrstuvwxyz";
                especiales = [8, 37, 39, 46];
                tecla_especial = false
                for (var i in especiales) {
                    if (key == especiales[i]) {
                        tecla_especial = true;
                        break;
                    }
                }
                if (letras.indexOf(tecla) == -1 && !tecla_especial) {
                    return false;
                }
            }
                 $(document).ready(
                    function()
                    {
                        $('#dock').Fisheye(
                                {
                                    maxWidth: 50,
                                    items: 'a',
                                    itemsText: 'span',
                                    container: '.dock-container',
                                    itemWidth: 40,
                                    proximity: 90,
                                    halign: 'center'
                                }
                        )
                    }
            );
    
            function entroenfoco(elemento){
                  elemento.className='enfoco';  
                    
                }
            function salioenfoco(elemento){
                elemento.className='';
                
                
            }    
        </script>
        
        
        
        
        <script>
		$(document).ready(function(){				   	
			$('.slider')._TMS({
				show:0,
				pauseOnHover:true,
				prevBu:false,
				nextBu:false,
				playBu:false,
				duration:1000,
				preset:'fade',
				pagination:true,
				pagNums:false,
				slideshow:7000,
				numStatus:true,
				banners:'fromRight',
				waitBannerAnimation:false,
				progressBar:false
			})		
		});
                
                
                
	</script>
            
        
        
        
<%
    HttpSession Adsi = request.getSession();
    usuarioDTO Visitante = new usuarioDTO();

    if (Adsi.getAttribute("UsuarioADSI") != null) {
        Visitante = (usuarioDTO) Adsi.getAttribute("UsuarioADSI");

    } else {
        response.sendRedirect("index.jsp");
    }

%>
        
        
        
        
        
        
    </head>
    
</html>
