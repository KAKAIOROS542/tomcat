<%@page import="modelo.compraDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.productoDAO"%>
<%@page import="modelo.productoDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.File"%>
<%@page import="modelo.usuarioDAO"%>
<%@page import="modelo.usuarioDTO"%>
<%@page import="modelo.facturaDAO"%>
<%@page import="modelo.facturaDTO"%>
<%@page import="modelo.Conectar"%>
<%@page import="modelo.emailDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
 <% response.setHeader("Cache-Control", "no-store");%>
<%@page session="true" %>
<%@include file="Script.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Empleado</title>
 <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" media="screen" href="css/reset.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/grid_12.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/miestilo.css">
    <link href='http://fonts.googleapis.com/css?family=Condiment' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
    <script src="js/jquery-1.7.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <link href="css/style2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/interface.js"></script>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
    <link href="../css/otromas.css" rel="stylesheet" type="text/css">
    <link href="../css/sge.css" rel="stylesheet" type="text/css">
</head>
<body>
 <div class="main">
 <header>
      <h1>&nbsp;</h1>
      <h1><a href="index.jsp"><img src="images/logo.png" alt="" width="226" height="131"></a></h1>
      
   <div class="form-search">
   <form id="form-search" method="post">
       <table border="2">
        <tr><td>Usuario : </td><td> <%= Visitante.getNombre() %></td></tr>
       </table>   
   </form>
   </div>
       
    <div id="apDiv1">
        <h3>&quot;Solución a tu medida&quot;</h3>
    </div>
      <div class="dock" id="dock">
        <div class="dock-container"> <a class="dock-item" href="empleado.jsp?con=0&estado=usuarios"><img src="images/page3-img1.png" alt="home" /><span>Ver Clientes</span></a>
            <a class="dock-item" href="empleado.jsp?con=0&estado=empleados"><img src="images/empleados.png" alt="contact" /><span>Ver Empleados</span></a>
                <a class="dock-item" href="empleado.jsp?con=0&estado=productos"><img src="images/produ.png" alt="contact" /><span>Producto</span></a> 
                 <a class="dock-item" href="empleado.jsp?con=0&estado=compras"><img src="images/change.png" alt="contact" /><span>Ver Compras</span></a>  
                <a class="dock-item" href="#openModal2<%= Visitante.getNombre()%>"><img src="images/misdatos.png" alt="home" /><span>Mis Datos</span></a> 
                 <a class="dock-item" href="empleado.jsp?con=0&estado=ayuda"><img src="images/soporte.png" alt="home" /><span>Ayuda</span></a>
                <a class="dock-item" href="index.jsp?estado=salir"><img src="images/exit.png" alt="contact" /><span>Salir</span></a>
                
          <script type="text/javascript">
	
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
					halign : 'center'
				}
			)
		}
	);

            </script>
        </div>
      </div>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    
        <div class="clear"></div> 
<div id="openModal2<%= Visitante.getNombre()%>" class="modalDialog">
<div><a href="#close" title="Cerrar" class="close">X</a>
<center><h3>Modificar </h3>
<form action="controlusuarios" method="POST">
 <table border="2">
<tr>
<td height="30">Documento</td>
<td height="30">
<input type="text" disabled value="<%= Visitante.getCedula()%>" />
<input type="hidden" name="cedula" value="<%= Visitante.getCedula()%>" />
</td>
 </tr>
<tr>
 <td height="30">Nombre</td>
<td height="30"><input type="text" name="nombre" value="<%= Visitante.getNombre()%>" /></td>
</tr>
<tr>
<td height="30">Apellido</td>
<td height="30"><input type="text" name="apellido" value="<%=Visitante.getApellido()%>" /></td>
</tr>
<tr>
<td height="30">Direccion</td>
<td height="30"><input type="text" name="direccion" value="<%=Visitante.getDireccion()%>" /></td>
</tr>
<tr>
<td height="30">Telefono</td>
<td height="30"><input type="text" name="telefono" value="<%=Visitante.getTelefono()%>" /></td>
</tr>
<tr>
<td height="30">Correo</td>
<td height="30"><input type="text" name="correo" value="<%=Visitante.getCorreo()%>" /></td>
</tr>

<tr>
<td height="30">Nombre de usuario</td>
<td><input type="text" name="usuario" value="<%=Visitante.getNombreusuario()%>" />
<input type="hidden" name="tipo" value="2" /></td></td>
</tr>
<tr>
<td height="30">Clave</td>
<td><input type="password" name="clave" value="<%=Visitante.getClave()%>" /></td>
</tr>
<tr>
<td align="right"><input type="submit" value="ACTUALIZAR" name="caja" /></td>
</tr>
<tr>
</tr> </table></form></center>
</div></div>
<%
   if(request.getParameter("estado")!=null){
   String Temp = request.getParameter("estado");
   if(Temp.equals("usuarios")){
%>        
    
<div id="tabla">
<div id="ruta"> 
<%out.print("Inicio - Empleado - Clientes");%>
</div>
<div class="datagrid"><table>
<thead>
<tr class="alt">
<caption >listado de Clientes </caption> 
<tr>
<tr><td colspan="7"></td> <td> 
<form name="frm" action= "empleado.jsp?con=0&estado=usuarios" method="post">
    
<input type="text" name ="name" placeholder="Buscar Cliente" value="<%if(request.getParameter("name")!=null){out.print(request.getParameter("name"));}%>"/>
<th><input type ='submit' name ='Buscar' value='Buscar'>
</td>
</tr>
</form>
<tr>
<th>Documento</th>
<th>Nombres</th>
<th>Apellido</th>
<th>Direccion</th>
<th>Telefono</th>
<th>Correo</th>
<th>Tipo</th>
<th>Nombre Usuario</th>
<th>Clave</th>

<% 
    int con= Integer.parseInt(request.getParameter("con"));
    int temp=con*5;
    int a1=0;
    emailDAO tempDAO=new emailDAO();
    ArrayList <usuarioDTO> arreglo = new ArrayList<usuarioDTO>();  
    if(request.getParameter("name")!=null){
    arreglo=tempDAO.Listarusuario(request.getParameter("name"));
    }else{
    arreglo=tempDAO.ListarTodos();
    }
    for(a1 =temp ; a1 < arreglo.size();a1++){
        if(a1>=temp+5 && a1<= arreglo.size()-1){break;}
 %>
 
</tr></thead>
<tbody>
<tr class="alt">
<td><%= arreglo.get(a1).getCedula()  %></td>
<td><%= arreglo.get(a1).getNombre()  %></td>
<td><%= arreglo.get(a1).getApellido()  %></td>
<td><%= arreglo.get(a1).getDireccion() %></td>
<td><%= arreglo.get(a1).getTelefono() %></td>
<td><%= arreglo.get(a1).getCorreo()%></td>
<td><%= arreglo.get(a1).getTipo()%></td>
<td><%= arreglo.get(a1).getNombreusuario()%></td>
<td><%= arreglo.get(a1).getClave()%></td>
<td></td>
<td></td>
<% }%>
 

              

<tr class="alt">
<td colspan="8" align ="center"><%if(!(con==0)){%><a href="empleado.jsp?con=<%=con-1%>&&estado=usuarios"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="empleado.jsp?con=<%=con+1%>&&estado=usuarios"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%>
<td><a href="Reportes/Reporte.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte General"></a></td>    
</tr></tbody>
</table>
</div></div>
<%for(a1 =0 ; a1 < arreglo.size()-1;a1++){ %>

 <%
}  
 %> 
<% for(a1 =0 ; a1 < arreglo.size()-1;a1++){ %>

<%}%>      
<%}else if(Temp.equals("empleados")){%>
     
<div id="tabla">
 <div id="ruta"> 
<%out.print("Inicio - Empleados - Empleados");%>
  </div>
<div class="datagrid"><table>
<thead>
<tr class="alt">
<caption >listado de Clientes </caption> 
<tr>
<tr><td colspan="7"></td> <td> 
<form name="frm" action= "empleado.jsp?con=0&estado=usuarios" method="post">
<input type="text" name ="name" placeholder="Buscar Empleado" value="<%if(request.getParameter("name")!=null){out.print(request.getParameter("name"));}%>"/>
<th><input type ='submit' name ='Buscar' value='Buscar'>
</td>
</tr>
</form>
<tr>
<th>Documento</th>
<th>Nombres</th>
<th>Apellido</th>
<th>Direccion</th>
<th>Telefono</th>
<th>Correo</th>
<th>Tipo</th>
<th>Nombre Usuario</th>
<th>Clave</th>

<% 
    int con= Integer.parseInt(request.getParameter("con"));
    int temp=con*5;
    int a1=0;
    usuarioDAO empl =new usuarioDAO();
    ArrayList <usuarioDAO> arreglo = new ArrayList<usuarioDAO>();  
    if(request.getParameter("name")!=null){
    arreglo= empl.buscarempleado(request.getParameter("name"));
    }else{
    arreglo=empl.Listarempleados();
    }
    for(a1 =temp ; a1 < arreglo.size();a1++){
        if(a1>=temp+5 && a1<= arreglo.size()-1){break;}
 %>
 
</tr></thead>
<tbody>
<tr class="alt">
<td><%= arreglo.get(a1).getCedula()  %></td>
<td><%= arreglo.get(a1).getNombre()  %></td>
<td><%= arreglo.get(a1).getApellido()  %></td>
<td><%= arreglo.get(a1).getDireccion() %></td>
<td><%= arreglo.get(a1).getTelefono() %></td>
<td><%= arreglo.get(a1).getCorreo()%></td>
<td><%= arreglo.get(a1).getTipo()%></td>
<td><%= arreglo.get(a1).getNombreusuario()%></td>
<td><%= arreglo.get(a1).getClave()%></td>

<% }%>
<%if(Temp.equals("ayuda")){%>
         <div id="tabla">
           
            <div class="wrap">
                        	 <div class="pad-2 wrap">
                        <h3 class="p6">Ayuda</h3>
                        <div class="wrap">
                        	<div class="block-7">
                            	<div class="wrap">
                                   
                                    <div class="extra-wrap">
                                      <p><strong>Modulo productos</strong></p>
                                        <p>En este módulo  el empleado puede observar la lista de productos que existen ademas de poder buscar por el nombre del producto.</p>
                                         <img src="images/productos.png" alt="" width="100" height="118" class="img-indent">
                                    </div>
                                </div>
                                
                            </div>
                            <div class="block-7">
                            	<div class="wrap">
                                    <img src="images/change.png" alt="" width="100" height="90" class="img-indent">
                                    <div class="extra-wrap">
                                        <p><strong>Modulo Compras</strong></a></p>
                                        <ul type="disc">
                                          <li>En este modulo el empleado puede visualizar las compras que se han realizado ademas de poder buscarlas por un parametro en este caso el documento</li>
                                              
                                        </ul>
                                       
                                    </div>
                                </div>
                                
                            </div>
                            <div class="block-7 last">
                            	<div class="wrap">
                                    <img src="images/page3-img1.png" alt="" width="78" height="63" class="img-indent">
                                    
                                    <div class="extra-wrap">
                                        <p><strong>Modulo Usuarios</strong></a></p>
                                        <p>En este modulo el empleado puede visualizar los clientes que ahi en el sistema ademas de poder buscarlos por un parametro que es el nombre.</p>
                                       
                                    </div>
                                </div>
                                <div class="wrap top-2">
                                    <img src="images/misdatos.png" alt="" width="50" height="40" class="img-indent">
                                    <div class="extra-wrap">
                                        <p><a href="#" class="link"><strong>Mis datos</strong></a></p>
                                        <p>El empleado  al darle clic a la imagen puede modificar sus datos</p>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
              <%} %>
<tr class="alt">
<td colspan="8" align ="center"><%if(!(con==0)){%><a href="empleado.jsp?con=<%=con-1%>&&estado=usuarios"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="empleado.jsp?con=<%=con+1%>&&estado=usuarios"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%>
<td><a href="Reportes/Reporte1.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte General"></a></td>    
</tr></tbody>
</table>
</div></div>
<%for(a1 =0 ; a1 < arreglo.size()-1;a1++){ %>
 
 <%
}  
 %> 
<% for(a1 =0 ; a1 < arreglo.size()-1;a1++){ %>

<%}%> 

 <%}else if(Temp.equals("compras")){%>
<div id="tabla">
    <div id="ruta"> 
 <%out.print("Inicio -Empleados - Compras");%>
 </div>
<div class="datagrid"><table>
<thead>
<tr class="alt">
<caption >listado de Compras </caption> 
<tr>
<tr><td colspan="3"></td> <td align="center"> 

    <form action="" method="post">
    <input type ="text" name ="buscar" placeholder="Buscar Compra"
    value="<%if (request.getParameter("buscar")!=null){out.print(request.getParameter("buscar"));}%>"></td>
    <td> <input type="submit"  value="Buscar"></td>
<tr>
<th align="center">Codigo</th>
<th align="center">CC comprador</th>
<th align="center">Fecha</th>
<th align="center">Valor Total</th>
<th align="center">Estado</th>
<%
 int con= Integer.parseInt(request.getParameter("con"));
 int temp=con*5;
 int a1=0;     
     
compraDAO com =new compraDAO();
ArrayList<compraDAO> arreglo= new ArrayList <compraDAO>();
if(request.getParameter("buscar")!=null){
arreglo=com.buscarcompra(request.getParameter("buscar"));
}else{
arreglo=com.listarcompra();}

for(a1 =temp ; a1 < arreglo.size();a1++){
if(a1>=temp+5 && a1<= arreglo.size()-1){break;}

%>
</tr></thead>
<tbody>
<tr class="alt">
<td align="center"><%= arreglo.get(a1).getCodigo()  %></td>
<td align="center"><%= arreglo.get(a1).getUsuario_cedula()%></td>
<td align="center"><%= arreglo.get(a1).getFecha() %></td>
<td align="center"><%= arreglo.get(a1).getValortotalbruto()%></td>
<td align="center"><%= arreglo.get(a1).getPago()%>
</tr></tbody>
<%}%>
<tr class="alt">
<td colspan="4" align ="center"><%if(!(con==0)){%><a href="empleado.jsp?con=<%=con-1%>&&estado=compras"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="empleado.jsp?con=<%=con+1%>&&estado=compras"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%>
<td align="center"><a href="Reportes/Reportecompras.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte General de compras"></a></td>    
</tr></tbody>
</table>
</div></div>
<% for(a1 =0 ; a1 < arreglo.size()-1;a1++){%>
        

<%}%>

<%}else if (Temp.equals("productos")){%>
<div id="tabla">
    <div id="ruta"> 
<%out.print("Inicio - Empleados - Productos");%>
 </div>
<div class="datagrid">
<table>
<thead><tr>
<caption>Listado Productos</caption>
    <tr class="alt">
    <td colspan="4"></td>
    <td><form action="" method="post">
    <input type="text" placeholder="Buscar Productos" name="buscar" value='<%if (request.getParameter("buscar")!=null){out.print(request.getParameter("buscar"));}%>'></td>   
    </td><td><input type="submit" name='buscar' value="Buscar"></td></form></tr>
<th>Codigo Producto</th>
<th>Nombre Producto</th>
<th>Precio Venta</th>
<th>Ultimo Precio</th>
<th>Descripcion</th>
<th>Numero de Existencias</th>


<%
 int con= Integer.parseInt(request.getParameter("con"));
 int temp=con*5;
 int a1=0;
productoDAO buscarPRO =new productoDAO();
ArrayList <productoDAO> arreglo = new ArrayList<productoDAO>(); 
if (request.getParameter("buscar")!=null){
arreglo = buscarPRO.buscarproducto(request.getParameter("buscar"));
}else{
arreglo = buscarPRO.listarproducto();    
}
for(a1 =temp ; a1 < arreglo.size();a1++){
if(a1>=temp+5 && a1<= arreglo.size()-1){break;}%>
</tr></thead>
<tbody>
<tr>   
<td><%= arreglo.get(a1).getCodigo()%></td>
<td><%= arreglo.get(a1).getNombre()  %></td>
<td><%= arreglo.get(a1).getPrecioventa()%></td>
<td><%= arreglo.get(a1).getUltprecio()%></td>
<td><%= arreglo.get(a1).getDescripcion()%></td>
<td><%= arreglo.get(a1).getNumeroexistencias()%></td>

</tr></tbody>
<%}%>
<tr class="alt">
<td colspan="4" align ="center"><%if(!(con==0)){%><a href="empleado.jsp?con=<%=con-1%>&&estado=productos"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="empleado.jsp?con=<%=con+1%>&&estado=productos"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%>
<td align = "right"><a href="Reportes/Reporte2.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte Existencias"></a></td>
<td> <a href="Reportes/ReporteAgotado.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte agotado"></a></td>
</tr></tbody>
</table>
</div></div>                     
<%
for(a1 =0 ; a1 < arreglo.size()-1;a1++){
%>
  

<%}%>   
<% for(a1 =0 ; a1 < arreglo.size();a1++){ %>

 <%}%>   

<%}else if(Temp.equals("notificacion")){
   out.print("<script>alert('Las modificaciones realizadas se observaran cuando vuelva a iniciar sesion')</script>"); 
 }%>
<%}else { response.sendRedirect("empleado.jsp?con=0&estado=usuarios");
} %>
</body>
</html>
