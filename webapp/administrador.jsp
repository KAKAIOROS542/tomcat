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
 <title>Administrador</title>
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
        <div class="dock-container"> <a class="dock-item" href="administrador.jsp?con=0&estado=usuarios"><img src="images/page3-img1.png" alt="home" /><span>Ver Clientes</span></a>
            <a class="dock-item" href="administrador.jsp?con=0&estado=empleados"><img src="images/empleados.png" alt="contact" /><span>Ver Empleados</span></a>
                <a class="dock-item" href="administrador.jsp?con=0&estado=productos"><img src="images/produ.png" alt="contact" /><span>Producto</span></a> 
                <a class="dock-item" href="administrador.jsp?estado=nuevop"><img src="images/ingre.png" alt="contact" /><span>Ingresar Producto</span></a> 
                <a class="dock-item" href="administrador.jsp?con=0&estado=compras"><img src="images/change.png" alt="contact" /><span>Ver Compras</span></a>  
                <a class="dock-item" href="#openModal2<%= Visitante.getNombre()%>"><img src="images/misdatos.png" alt="home" /><span>Mis Datos</span></a> 
                <a class="dock-item" href="Controlsalir"><img src="images/exit.png" alt="contact" /><span>Salir</span></a>
                <a class="dock-item" href="controlbackup?btnBackup=Backup"><img src="images/config.png" alt="home" /><span>Backup</span></a>
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
<td height="30">Tipo</td>
<td height="30"><input type="text" name="tipo" value="<%=Visitante.getTipo()%>" /></td>
</tr>
<tr>
<td height="30">Nombre de usuario</td>
<td><input type="text" name="usuario" value="<%=Visitante.getNombreusuario()%>" /></td>
</tr>
<tr>
<td height="30">Clave</td>
<td><input type="password" name="clave" value="<%=Visitante.getClave()%>" /></td>
</tr>
<tr>
<td align="right"><input type="submit" value="actualizar" name="Boton" /></td>
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
<%out.print("Inicio - Administrador - Clientes");%>
</div>
<div class="datagrid"><table>
<thead>
<tr class="alt">
<caption >listado de Clientes </caption> 
<tr>
<tr><td colspan="9"></td> <td> 
<form name="frm" action= "administrador.jsp?con=0&estado=usuarios" method="post">
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
<th>Eliminar</th>
<th>Actualizar</th>
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
<td><a href="#openModal<%= arreglo.get(a1).getCedula()%>"><img src="images/delete.png" width="32" height="32" alt="pdf" title='Eliminar:<%=  arreglo.get(a1).getCedula()%>' /></a></td>
<td><a href="#openModal2<%= arreglo.get(a1).getCedula()%>"><img src="images/act.png" width="32" height="32" alt="pdf" title='Modificar:<%= arreglo.get(a1).getCedula()  %>'/></a></td>
<% }%>
<tr class="alt">
<td colspan="10" align ="center"><%if(!(con==0)){%><a href="administrador.jsp?con=<%=con-1%>&&estado=usuarios"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="administrador.jsp?con=<%=con+1%>&&estado=usuarios"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%>
<td><a href="Reportes/Reporte.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte General"></a></td>    
</tr></tbody>
</table>
</div></div>
<%for(a1 =0 ; a1 < arreglo.size()-1;a1++){ %>
 <div id="openModal<%= arreglo.get(a1).getCedula()  %>" class="modalDialog"><div>
 <a href="#close" title="Cerrar" class="close">X</a>
 <center><h3>Eliminar Cliente:  <%= arreglo.get(a1).getNombre()%> </h3>
<table border="2"><tr><td><a href="controlusuarios?boton=eliminar&pos=<%= arreglo.get(a1).getCedula()  %> "><img src="images/confirmation.png"  width="32" height="32" title="Confirmar"/></a></td></tr>
 </table></center></div></div>
 <%
}  
 %> 
<% for(a1 =0 ; a1 < arreglo.size()-1;a1++){ %>
<div id="openModal2<%= arreglo.get(a1).getCedula()  %>" class="modalDialog">
<div><a href="#close" title="Cerrar" class="close">X</a>
<center><h3>Modificar </h3>
<form action="controlusuarios" method="POST">
 <table border="2">
<tr>
<td height="30">Documento</td>
<td height="30">
<input type="text" disabled value="<%= arreglo.get(a1).getCedula()%>" />
<input type="hidden" name="cedula" value="<%= arreglo.get(a1).getCedula()%>" />
</td>
 </tr>
<tr>
 <td height="30">Nombre</td>
<td height="30"><input type="text" name="nombre" value="<%=arreglo.get(a1).getNombre()%>" /></td>
</tr>
<tr>
<td height="30">Apellido</td>
<td height="30"><input type="text" name="apellido" value="<%=arreglo.get(a1).getApellido()%>" /></td>
</tr>
<tr>
<td height="30">Direccion</td>
<td height="30"><input type="text" name="direccion" value="<%=arreglo.get(a1).getDireccion()%>" /></td>
</tr>
<tr>
<td height="30">Telefono</td>
<td height="30"><input type="text" name="telefono" value="<%=arreglo.get(a1).getTelefono()%>" /></td>
</tr>
<tr>
<td height="30">Correo</td>
<td height="30"><input type="text" name="correo" value="<%=arreglo.get(a1).getCorreo()%>" /></td>
</tr>
<tr>
<td height="30">Tipo</td>
<td height="30"><input type="text" name="tipo" value="<%=arreglo.get(a1).getTipo()%>" /></td>
</tr>
<tr>
<td height="30">Nombre de usuario</td>
<td><input type="text" name="usuario" value="<%=arreglo.get(a1).getNombreusuario()%>" /></td>
</tr>
<tr>
<td height="30">Clave</td>
<td><input type="password" name="clave" value="<%=arreglo.get(a1).getClave()%>" /></td>
</tr>
<tr>
<td align="right"><input type="submit" value="actualizar" name="Boton" /></td>
</tr>
<tr>
<td align="right"><a href="administrador.jsp">Volver</a></td>
</tr> </table></form></center>
</div></div>
<%}%>      
<%}else if(Temp.equals("empleados")){%>
     
<div id="tabla">
    <div id="ruta"> 
<%out.print("Inicio - Administrador - Empleados");%>
</div>
<div class="datagrid"><table>
<thead>
<tr class="alt">
<caption >listado de Clientes </caption> 
<tr>
<tr><td colspan="9"></td> <td> 
<form name="frm" action= "administrador.jsp?con=0&estado=usuarios" method="post">
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
<th>Eliminar</th>
<th>Actualizar</th>
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
<td><a href="#openModal<%= arreglo.get(a1).getCedula()%>"><img src="images/delete.png" width="32" height="32" alt="pdf" title='Eliminar:<%=  arreglo.get(a1).getCedula()%>' /></a></td>
<td><a href="#openModal2<%= arreglo.get(a1).getCedula()%>"><img src="images/act.png" width="32" height="32" alt="pdf" title='Modificar:<%= arreglo.get(a1).getCedula()  %>'/></a></td>
<% }%>
<tr class="alt">
<td colspan="10" align ="center"><%if(!(con==0)){%><a href="administrador.jsp?con=<%=con-1%>&&estado=usuarios"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="administrador.jsp?con=<%=con+1%>&&estado=usuarios"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%>
<td><a href="Reportes/Reporte1.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte General"></a></td>    
</tr></tbody>
</table>
</div></div>
<%for(a1 =0 ; a1 < arreglo.size()-1;a1++){ %>
 <div id="openModal<%= arreglo.get(a1).getCedula()  %>" class="modalDialog"><div>
 <a href="#close" title="Cerrar" class="close">X</a>
 <center><h3>Eliminar Empleado:  <%= arreglo.get(a1).getNombre()%> </h3>
<table border="2"><tr><td><a href="controlusuarios?boton=eliminar&pos=<%= arreglo.get(a1).getCedula()  %> "><img src="images/confirmation.png"  width="32" height="32" title="Confirmar"/></a></td></tr>
 </table></center></div></div>
 <%
}  
 %> 
<% for(a1 =0 ; a1 < arreglo.size()-1;a1++){ %>
<div id="openModal2<%= arreglo.get(a1).getCedula()  %>" class="modalDialog">
<div><a href="#close" title="Cerrar" class="close">X</a>
<center><h3>Modificar Empleado</h3>
<form action="controlusuarios" method="POST">
 <table border="2">
<tr>
<td height="30">Documento</td>
<td height="30">
<input type="text" disabled value="<%= arreglo.get(a1).getCedula()%>" />
<input type="hidden" name="cedula" value="<%= arreglo.get(a1).getCedula()%>" />
</td>
 </tr>
<tr>
 <td height="30">Nombre</td>
<td height="30"><input type="text" name="nombre" value="<%=arreglo.get(a1).getNombre()%>" /></td>
</tr>
<tr>
<td height="30">Apellido</td>
<td height="30"><input type="text" name="apellido" value="<%=arreglo.get(a1).getApellido()%>" /></td>
</tr>
<tr>
<td height="30">Direccion</td>
<td height="30"><input type="text" name="direccion" value="<%=arreglo.get(a1).getDireccion()%>" /></td>
</tr>
<tr>
<td height="30">Telefono</td>
<td height="30"><input type="text" name="telefono" value="<%=arreglo.get(a1).getTelefono()%>" /></td>
</tr>
<tr>
<td height="30">Correo</td>
<td height="30"><input type="text" name="correo" value="<%=arreglo.get(a1).getCorreo()%>" /></td>
</tr>
<tr>
<td height="30">Tipo</td>
<td height="30"><input type="text" name="tipo" value="<%=arreglo.get(a1).getTipo()%>" /></td>
</tr>
<tr>
<td height="30">Nombre de usuario</td>
<td><input type="text" name="usuario" value="<%=arreglo.get(a1).getNombreusuario()%>" /></td>
</tr>
<tr>
<td height="30">Clave</td>
<td><input type="password" name="clave" value="<%=arreglo.get(a1).getClave()%>" /></td>
</tr>
<tr>
<td align="right"><input type="submit" value="Actualizar" name="Boton" /></td>
</tr>
<tr>
</tr> </table></form></center>
</div></div>
<%}%> 

 <%}else if(Temp.equals("compras")){%>
<div id="tabla">
    <div id="ruta"> 
<%out.print("Inicio - Administrador - Compras");%>
</div>
<div class="datagrid"><table>
<thead>
<tr class="alt">
<caption >listado de Compras </caption> 
<tr>
<tr><td colspan="4"></td> <td align="center"> 
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
<th align="center">Modificar</th>

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
<td align="center"><a href="#openModal22<%= arreglo.get(a1).getCodigo()%>"><img src="images/act.png" width="32" height="32" alt="pdf" title='Cambiar Estado:<%= arreglo.get(a1).getCodigo()%>'/></a></td>
</tr></tbody>
<%}%>
<tr class="alt">
<td colspan="5" align ="center"><%if(!(con==0)){%><a href="administrador.jsp?con=<%=con-1%>&&estado=compras"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="administrador.jsp?con=<%=con+1%>&&estado=compras"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%>
<td align="center"><a href="Reportes/Reportecompras.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte General de compras"></a></td>    
</tr></tbody>
</table>
</div></div>
<% for(a1 =0 ; a1 < arreglo.size();a1++){ %>
<div id="openModal22<%= arreglo.get(a1).getCodigo()%>" class="modalDialog">
<div><a href="#close" title="Cerrar" class="close">X</a>
<center><h3>Modificar Compra</h3>
            <form  action="controlcompra" method="POST">
            <table border="2">
            <tr><td>Codigo</td>
              <td>
              <input type="text" disabled value="<%= arreglo.get(a1).getCodigo()%>">
              <input type="hidden" name="codigocompra" value="<%= arreglo.get(a1).getCodigo()%>">
              </td></tr>
            <tr><td>CC usuario</td>
              <td>
              <input type="text" disabled value="<%= arreglo.get(a1).getUsuario_cedula()%>">
              <input type="hidden" name="usuario_cedula" value="<%= arreglo.get(a1).getUsuario_cedula()%>">
              </td></tr>
            <tr><td>Fecha</td>
              <td>
              <input type="text" disabled value="<%= arreglo.get(a1).getFecha()%>">
              <input type="hidden" name="fecha" value="<%= arreglo.get(a1).getFecha()%>">
              </td></tr>
             <tr><td>Valor total</td>
              <td>
              <input type="text" disabled value="<%= arreglo.get(a1).getValortotalbruto()%>">    
              <input type="hidden" name="valor" value="<%= arreglo.get(a1).getValortotalbruto()%>">
              </td></tr>
              <tr><td>Estado</td>
             <td> <%String estado = arreglo.get(a1).getPago();%>
             <%if(estado.equals("pendiente")){%>
             <select name="estado" id ="estado">
             <option value="Despachar">Despachar</option>
             <option  disabled value="Pendiente">Pendiente</option>
             <%}else{%>
             <option  disabled value="Despachar">Despachar</option>
             <option  value="Pendiente">Pendiente</option>
             <%}%>
             </select>
            </td></tr> 
            <tr><td><input type="submit" name="Boton" value="Actualizar"><td>
            </table></form></center>
            </div></div>
<%}%>        


<%}else if (Temp.equals("productos")){%>
<div id="tabla">
    <div id="ruta"> 
<%out.print("Inicio - Administrador - Productos");%>
</div>
<div class="datagrid">
<table>
<thead><tr>
<caption>Listado Productos</caption>
    <tr class="alt">
    <td colspan="6"></td>
    <td><form action="" method="post">
    <input type="text" placeholder="Buscar Productos" name="buscar" value='<%if (request.getParameter("buscar")!=null){out.print(request.getParameter("buscar"));}%>'></td>   
    </td><td><input type="submit" name='buscar' value="Buscar"></td></form></tr>
<th>Codigo Producto</th>
<th>Nombre Producto</th>
<th>Precio Venta</th>
<th>Ultimo Precio</th>
<th>Descripcion</th>
<th>Numero de Existencias</th>
<th>Eliminar</th>
<th>Actualizar</th>

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
<td><a href='#openModal<%= arreglo.get(a1).getCodigo()%>'><img src="images/delete.png" alt="contact" width="32" height="32" title='Eliminar: <%=  arreglo.get(a1).getCodigo()%>'/></a></td>
<td> <a href='#openModal2<%= arreglo.get(a1).getCodigo()  %>'><img src="images/act.png" alt="contact" width="32" height="32" title='Actualizar: <%=  arreglo.get(a1).getCodigo()%>'/></a></td>
</tr></tbody>
<%}%>
<tr class="alt">
<td colspan="6" align ="center"><%if(!(con==0)){%><a href="administrador.jsp?con=<%=con-1%>&&estado=productos"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="administrador.jsp?con=<%=con+1%>&&estado=productos"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%>
<td align = "right"><a href="Reportes/Reporte2.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte Existencias"></a></td>
<td> <a href="Reportes/ReporteAgotado.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte agotado"></a></td>
</tr></tbody>
</table>
</div></div>                     
<%
for(a1 =0 ; a1 < arreglo.size()-1;a1++){
%>
  
<div id="openModal<%= arreglo.get(a1).getCodigo()%>" class="modalDialog">
<div>
<a href="#close" title="Cerrar" class="close">X</a>
<center><h3>Eliminar Producto:  <%= arreglo.get(a1).getNombre()%> </h3>
<table border="2"><tr><td><a href="controlproducto?boton=eliminar&pos=<%= arreglo.get(a1).getCodigo()%> "><img src="images/confirmation.png"  width="32" height="32" title="Confirmar"/></a></td></tr>
</table></center>
</div>
</div>
<%}%>   
<% for(a1 =0 ; a1 < arreglo.size();a1++){ %>
<div id="openModal2<%= arreglo.get(a1).getCodigo()%>" class="modalDialog">
<div>
<a href="#close" title="Cerrar" class="close">X</a>
<center><h3>Modificar Producto:  <%= arreglo.get(a1).getNombre()%> </h3>
<form action="controlproducto" method="POST">
<table border="2">
<tr>
<tr><td height="30">Codigo </td><td height="30">
<input type="text" disabled value="<%= arreglo.get(a1).getCodigo()%>" />
<input type="hidden" name="codigo" value="<%= arreglo.get(a1).getCodigo()%>" maxlength="6" />
</td></tr>
<tr><td height="30">Nombre</td>
    <td height="30"><input type="text" name="nombre" value="<%= arreglo.get(a1).getNombre()%>" maxlength="20"/></td></tr>
<tr><td height="30">Precio venta</td><td height="30"><input type="text" name="precioventa" value="<%= arreglo.get(a1).getPrecioventa()%>" maxlength="6" /></td>
</tr>
<tr><td height="30">Ultimo precio </td><td height="30"><input type="text" name="ultprecio" value="<%= arreglo.get(a1).getUltprecio()%>" maxlength="6"/></td>
</tr>
<td height="30">Descripcion </td> 
<td height="30"><input type="text" name="descripcion" value="<%= arreglo.get(a1).getDescripcion()%>" maxlength="20" /></td>
</tr>
<td height="30">Numero Existencias </td> 
<td height="30"><input type="text" name="nexistencias" value="<%= arreglo.get(a1).getNumeroexistencias()%>" maxlength="4"/></td>
</tr>
<td align="right"><input type="submit" value="actualizar" name="Boton" /></td>
</tr>
</table>
</form></center></div></div>
 <%}%>   
<%}else if (Temp.equals("nuevop")){%>
<div id="tabla">
 <%out.print("Inicio - Administrador - Ingresar Producto");%>
 <div class="container_12">	
          <div class="">
            <div class="wrap pad-3">
              <div class="block-6">
                <h3>Ingresar Producto</h3>
                <br>
                <form action="controlproducto" method="POST" onsubmit="return verificarc()" >
                  <p><label>
                       <input name="codigo" type="text" placeholder="Código Producto*" onkeypress="return solonumeros(event)" maxlength="6" required/></label>
                        <label>
                        <input name="nombre" type="text"  placeholder="Nombre Producto*" onkeypress="return sololetras(event)" maxlenght="10" required/>
                        <br><br></label>
                        <label>
                          <input name="precioventa" type="text"  placeholder="Precio venta*" onkeypress="return solonumeros(event)" maxlength="6" required/>
                        </label>
                          <label>
                        <input name="ultprecio" type="text"  placeholder="Precio Unidad*" onkeypress="return solonumeros(event)" maxlength="6" required/>               
                         <br> <br>
                          </label>
                          <label>
                        <input name="descripcion" type="text"  placeholder="Descripcion*" onkeypress="return sololetras(event)" maxlenght="10" required/></label>
                          <label>
                          <input name="numeroexistencias" type="text"  placeholder="Numero Existencias*" onkeypress="return solonumeros(event)" maxlength="4" required/></label>
                          </p>
                         <p>&nbsp;</p>
                         <p>
                           <label><input type="submit" value="registrar" name="Boton" />
                           </label>
                           </form>
                        
                     
              </div>
                <img src="images/produ.png" width="251" height="218" alt="usua">            </div>
          </div>
          <div class="clear"></div>
        </div>
    </section> 
  </div>    

<%}else if (Temp.equals("backup")){
        String sDirectorio ="C:\\xampp\\mysql\\bin\\backup";
        File f = new File (sDirectorio);
        if(f.exists()){
        File[] ficheros = f.listFiles(); %>
 </div>
<div id="tabla">
    <div id="ruta"> 
<%out.print("Inicio - Administrador - Backup");%>
</div>
<div class="datagrid">
<table>
<thead><tr>    
<th scope="col">Nombre</th>
<th scope="col">Fecha</th></tr>
</thead>
<% for (int x=0;x<ficheros.length;x++){%>
<tbody>               
 <tr><td><% out.print(ficheros[x].getName());%></td>
<td><% out.print(/*cast de last.modified() */new SimpleDateFormat("dd-MM-yyyy HH-mm-ss").format(new Date(ficheros[x].lastModified())));%></td>
</tr><%}%>       
</tbody></table>
<form  method="post" action="controlbackup" >
<input type="submit" value="Backup" name="btnBackup"  title="Generar Backup"/>
</form>
</div> 
<%}%>
<%}else if(Temp.equals("notificacion")){
   out.print("<script>alert('Las modificaciones realizadas se observaran cuando vuelva a iniciar sesion')</script>"); 
 }%>
<%}else { 
response.sendRedirect("administrador.jsp?con=0&estado=usuarios");
}%>
</body>
</html>
