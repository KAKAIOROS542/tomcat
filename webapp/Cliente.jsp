<%@page import="modelo.compraDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.tempcompraDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.productoDAO"%>
<%@page import="modelo.productoDTO"%>
<%@page import="modelo.usuarioDAO"%>
<%@page import="modelo.usuarioDTO"%>
<%@page import="modelo.facturaDAO"%>
<%@page import="modelo.facturaDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% response.setHeader("Cache-Control", "no-store");%>
<%@page session="true" %>
<%@include file="Script.jsp" %>
<%!int total =0;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
        <meta charset="utf-8">
        <link href="css/miestilo.css" rel="stylesheet" type="text/css" />
        <link href="css/style2.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
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
                </div>
                <div id="apDiv1">
                <h3>&quot;Solución a tu medida&quot;</h3>
                </div>
                <nav class="box-shadow">
                <div>
                    <ul class="menu">
                        <li class="home-page current"><a href="#"><span></span></a></li>
                        <li><a href="Cliente.jsp?con=0&estado=productos"  > PRODUCTOS</a></li>
                        <li><a href="Cliente.jsp?con=0&estado=compras" > CARRITO</a></li>
                        <li><a href="Cliente.jsp?estado=verfactura" >FACTURA</a></li>
                        <li><a href="#openModal2<%= Visitante.getNombre()%>" > MIS DATOS</a></li>
                         <li><a href="Cliente.jsp?estado=ayuda">AYUDA</a></li>
                        <li><a href="Controlsalir" > CERRAR</a></li>
                     </ul>
                    <div class="clear"></div>
                </div>
            </nav>
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
<input type="hidden" name="tipo" value="1" /></td>
</tr>
<tr>
<td height="30">Clave</td>
<td><input type="password" name="clave" value="<%=Visitante.getClave()%>" /></td>
</tr>
<tr>
<td align="right"><input type="submit" value="actualizar" name="Botons" /></td>
</tr>
<tr>

</tr> </table></form></center>
</div></div>
                <%! int pos;
                    double r = Math.random()*100000;
                    int x = (int) r,codigo;
                    
                %>
     <% codigo = Visitante.getCedula()/ x + pos;%>
   

                <%  Date dNow = new Date();
                    Date hor = new Date();
                    SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
                    SimpleDateFormat hora = new SimpleDateFormat("HH:mm:ss");
                    String currenDate = ft.format(dNow);
                    String currenthora = hora.format(hor);
                %>   
                <%! int sum=0;%>
                        
<% if (request.getParameter("estado") != null) {
      String Temp = request.getParameter("estado");
   if (Temp.equals("productos")) {%>
                <div id="tabla">
                    <div id="ruta"> 
                 
                    
              
               
                <%out.print("Inicio - Clientes - Productos");%>
               
              
                   
           
                
                
                </div>
                <div class="datagrid"><table>
                <thead>
                <tr><tr><td>Listado Productos</td><td><td><td><td></td>
                <td><form action="" method="post">
                <input type="text" placeholder="Buscar Productos"  name="buscar" value='<%if (request.getParameter("buscar") != null) {out.print(request.getParameter("buscar"));}%>'></td>   
                </td> <td><input type="submit" name='buscar' value="Buscar"></td>
                </form></tr>

                    <th>Codigo Producto</th>
                    <th>Nombre Producto</th>
                    <th>Precio</th>
                    <th>Descripcion</th>
                    <th>Numero de Existencias</th>
                    <th>Añadir</th>
                    <th></th>
                        <%
             int con = Integer.parseInt(request.getParameter("con"));
             int temp = con*5 ;
             int a1 =0;
                            productoDAO buscarPRO = new productoDAO();
                            ArrayList<productoDAO> arreglo = new ArrayList<productoDAO>();
                            if (request.getParameter("buscar") != null) {
                                arreglo = buscarPRO.buscarproducto(request.getParameter("buscar"));
                            } else {
                                arreglo = buscarPRO.listarproducto();
                            }
                            for(a1 =temp ; a1 <= arreglo.size()-1;a1++){
         if (a1 >=temp+5 && a1 <= arreglo.size()-1 ){break;}
                        %>
                    </tr></thead>
                    <tbody> <tr>
                            <td><%= arreglo.get(a1).getCodigo()%></td>
                            <td><%= arreglo.get(a1).getNombre()%></td>
                            <td><%= arreglo.get(a1).getPrecioventa()%></td>
                            <td><%= arreglo.get(a1).getUltprecio()%></td>
                            <td><%= arreglo.get(a1).getDescripcion()%></td>
                            <td><%= arreglo.get(a1).getNumeroexistencias()%></td>
                            <td> <a href='#openModal<%=arreglo.get(a1).getCodigo()%>'><img src="images/buy.png" alt="contact" width="32" height="32" title='Añadir al Carrito:<%=  arreglo.get(a1).getNombre()%>'/></a></td>
                      <%}%>
 <tr class="alt">
<td colspan="6" align ="center"><%if(!(con==0)){%><a href="Cliente.jsp?con=<%=con-1%>&&estado=productos"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="Cliente.jsp?con=<%=con+1%>&&estado=productos"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%>
<td><a href="Reportes/ReporteProdCli.jsp"><img src="images/pdf.png" width="32" height="32" title="Reporte General"></a></td>    
</tr></tbody>
</table>
</div></div> 
        <%for(a1 =temp ; a1 <= arreglo.size()-1;a1++){ %>
               <% productoDAO PRO = new productoDAO();
                PRO = PRO.escoger(arreglo.get(a1).getCodigo());%>
        
        
         <div id="openModal<%= arreglo.get(a1).getCodigo()%>" class="modalDialog">
        <div><a href="#close" title="Cerrar" class="close">X</a>
        <center><h3>Comprar Producto: <%= PRO.getNombre()%> </h3>
        <form action="controltempcompra" method="POST" onsubmit="return validar();" >
        <table border="0"><tr>    
        <td> 
            
        <input type="hidden" name="codigo_compra" value="<%= codigo%>" />
        <input type="hidden" name="producto_codigo" value="<%= arreglo.get(a1).getCodigo()%>" />
        <input type="hidden" name="producto_nombre" value="<%= arreglo.get(a1).getNombre()%>" />
        <input type="hidden" name="precio" value="<%= arreglo.get(a1).getUltprecio()%>" />
        <input type="hidden" name="usuario_cedula" value="<%= Visitante.getCedula()%>" />
        <input type="hidden" name="fecha" value="<%= currenDate%>" /></td>
        <tr><td>Cantidad de existencias</td>
        <td><input type="text" disabled value=" <%= arreglo.get(a1).getNumeroexistencias()%>" />
        <input type="hidden" id="existencias" name="existencias" value="<%= arreglo.get(a1).getNumeroexistencias()%>"/></td>
        </tr>
        <tr><td height="30">Cantidad a Comprar</td>
                <td><%int existcias=arreglo.get(a1).getNumeroexistencias();boolean cantidad=false;%>
                <select name="cantidad">
                <%for (int z = 0; arreglo.get(a1).getNumeroexistencias()>=z; z++) {%>
                <% if (existcias == 0) { cantidad=true;%>
               <option value="<% out.print("Agotado");%>"><% out.print("Agotado");%></option>  
               <% } else if(z !=  0) {cantidad=false;%>
               <option value="<%=z%>"><%=z%></option>
               <%} } %>
               </select></td></tr><tr> 
            <td><input type="submit" <%if(cantidad){%>disabled<%}%> value="Comprar" name="Boton"></td>
        <%if (cantidad){%><td><font color="red" >No Puedes Comprar!</font></td><%}%>
        </tr>
            </table></form></div></div>
        <%}%> 
        <% } %>

        <%if (Temp.equals("compras")){ 
        %>
        <div id="tabla">
            <div id="ruta"> 
  <%out.print("Inicio - Clientes - Carrito");%>
 </div>
        <div class="datagrid"><table>
        <thead><tr>
        <th>codigo Producto</th>
        <th>Nombre</th>
        <th>Precio</th>
        <th>Cantidad</th>
        <th>Eliminar</th>
        <%  int con = Integer.parseInt(request.getParameter("con"));
            int temp = con*5 ;
            int a1 =0;
           tempcompraDAO prod = new tempcompraDAO();
           ArrayList<tempcompraDAO> arreglo = new ArrayList();
           arreglo = prod.listartempXUSER(codigo);
            for(a1 =temp ; a1 <= arreglo.size()-1;a1++){
           if (a1 >=temp+5 && a1 <= arreglo.size()-1 ){break;}%>
             <form>
             </tr></thead>
             <tbody>
             <tr><td><%= arreglo.get(a1).getProducto_codigo()%></td>
                 <td><%= arreglo.get(a1).getProducto_nombre()%></td>
                 <td><%= arreglo.get(a1).getPrecio()%></td>
                 <td><%= arreglo.get(a1).getCantidad()%></td>
                 <td><a href="#openModal<%= arreglo.get(a1).getProducto_nombre()%>"><img src="images/delete.png" width="32" height="32" alt="pdf" title='Eliminar:<%= arreglo.get(a1).getProducto_nombre()%>' /></a></td>
                 </tbody>
        <%sum = arreglo.get(a1).getCantidad() * arreglo.get(a1).getPrecio();
         total=sum+sum;}%>
     
        <td>total compras:</td><td>$ <%= total%></td><td>Fecha:  <%=currenDate%> </td><td>Hora:  <%=currenthora%> </td>
 <tr class="alt">
<td colspan="4" align ="center"><%if(!(con==0)){%><a href="Cliente.jsp?con=<%=con-1%>&&estado=compras"><img src="images/atras.png" title="Anterior"alt="" width="20" height="20" /></a> <%}%>Pagina Actual :<%=1+con%>  Total Paginas  <% if(arreglo.size()%5<=0){out.print(arreglo.size()/5);}else{out.print((arreglo.size()/5)+1);} %>   <%if (a1 <= arreglo.size()-1){%>   <a href="Cliente.jsp?con=<%=con+1%>&&estado=compras"><img </a><img src="images/next2.png" title="siguiente" alt="" width="20" height="20" /> </H6><%}%><td>
    <a href="Cliente.jsp?estado=confirmar#openModal"><img src="images/confir.png" width="50" height="50" alt="pdf" title='Confirmar Compra' /></a>
        </td></table>
   </div></div> 
        
        <%  for(a1 =temp ; a1 <= arreglo.size()-1;a1++) {%>
        <div id="openModal<%= arreglo.get(a1).getProducto_nombre()%>" class="modalDialog">
        <div><a href="Cliente.jsp?con=0&estado=compras" title="Cerrar" class="close">X</a>
        <center><h3>Eliminar Compra: <%= arreglo.get(a1).getProducto_nombre()%> </h3>
        <table border="2"><tr><td><a href="controltempcompra?boton=eliminar&pos=<%= arreglo.get(a1).getProducto_codigo()%> "><img src="images/confirmation.png"  width="32" height="32" title="Confirmar"/></a></td></tr>
        </table></center>
        </div></div>
        <% } %> <% }%>
        
  <%if(Temp.equals("confirmar")){
  pos++;%>
    <div id="openModal" class="modalDialog">
    <div><a href="#close" title="Cerrar" class="close">X</a>
    <center><h3>total Compra <%= total %></h3>
    <form action="controlcompra" method="POST">
    <table border="2">
    <tr>
    <td>
        
    <input type="hidden" name= "codigo_compra" value="<%= codigo%>" />
    <input type="hidden" name= "usuario_cedula" value="<%= Visitante.getCedula()%>" />
    <input type="hidden" name= "fecha" value="<%= currenDate %>" />
    <input type="hidden" name= "total" value="<%= total%>" />
    <input type="hidden" name= "pago" value="pendiente" />
    
    </td>
    </tr>
    <tr>
    <td align="right"><input type="submit" value="Comprar" name="Boton" /></td>
    </tr>
    </table></form></center>
    </div></div>          
    <%}%> 

    <%if(Temp.equals("factura")){
        pos++;
        total=0;sum=0;%>
     <div id="openModal" class="modalDialog">
     <div>
     <center>
     <table border="2">
         <tr><td>Su compra se realizo con exito<%= "<br>"%> Estado de su compra pendiente</td><td rowspan="2"><img src ="images/logo.png " width="70" height="65"></td></tr>   
     <tr><td align ="center"><a href="Cliente.jsp"><img src="images/confirmation.png"  width="32" height="32"  title="Realizar nueva Compra"/></a></td></tr>
     </table></center>
     </div></div>
      <%}%>
      
    <%if(Temp.equals("verfactura")){%>
        
    <div id="tabla">
        <div id="ruta"> 
         <%out.print("Inicio - Clientes- Factura");%>
         </div>
<div class="datagrid"><table>
<thead>
<tr class="alt">
<caption >listado de Compras </caption> 
<tr>
<tr><td colspan="4"></td> 
<tr>
<th align="center">Codigo</th>
<th align="center">CC comprador</th>
<th align="center">Fecha</th>
<th align="center">Valor Total</th>
<th align="center">Estado</th>
<th align="center">Factura</th>

<%   
compraDAO com =new compraDAO();
ArrayList<compraDAO> arreglo = new ArrayList <compraDAO>();
arreglo=com.listarcompracedula(Visitante.getCedula());

for(int a1 =0 ; a1 < arreglo.size();a1++){

%>
</tr></thead>
<tbody>
<tr class="alt">
<td align="center"><%= arreglo.get(a1).getCodigo()  %></td>
<td align="center"><%= arreglo.get(a1).getUsuario_cedula()%></td>
<td align="center"><%= arreglo.get(a1).getFecha() %></td>
<td align="center"><%= arreglo.get(a1).getValortotalbruto()%></td>
<td align="center"><%= arreglo.get(a1).getPago()%></td>
<% boolean todobn= false;
if(arreglo.get(a1).getPago().equals("pendiente")){todobn=false;}else{todobn=true;}
%>
<td align ="center">
  <%if(todobn){
      %>
   <a href="Reportes/ReporteGeneral.jsp?codigo=<%= arreglo.get(a1).getCodigo()%>"><img src="images/pdf.png" width="32" height="32" title="Generar Factura de la fecha <%= arreglo.get(a1).getFecha() %>"></a>
    <%} else {
      %><img width="32" src="images/pendiente.png" title="Falta por despachar" > <%
    } %>  
   
    
</td>
</tr></tbody>
<%}%>
</table>
</div></div>
<%}%>
<%if(Temp.equals("ayuda")){%>
         <div id="tabla">
             <table border="0">
                 <tr>
                 <td><a href="https://drive.google.com/file/d/0B459DMPZaCluMEVSWGJQelpJS0k/edit?usp=sharing">Manual Soporte</a></td>
                 </tr>
             </table>
          <div class="wrap">
          <div class="pad-2 wrap">
          <h3 class="p6">Ayuda</h3>
          <div class="wrap">
          <div class="block-7">
          <div class="wrap">
          <div class="extra-wrap">
         <p><strong>Modulo productos</strong></p>
          <p>En este módulo  el cliente puede observar la lista de productos que existen ademas de poder buscar por el nombre del producto y si desea añadir un producto le da clic a la imagen.</p>
          <img src="images/productos.png" alt="" width="100" height="118" class="img-indent">
          </div></div></div>
          <div class="block-7">
         <div class="wrap">
          <img src="images/factura.png" alt="" width="100" height="90" class="img-indent">
          <div class="extra-wrap">
          <p><strong>Modulo Factura</strong></a></p>
          <ul type="disc">
          <li>En este modulo el usuario puede visualizar las compras que ha realizado y despues de que el estado de la compra ha cambiado ha despachado puede generar su factura</li>
          </ul>
          </div>
          </div>
          </div>
          <div class="block-7 last">
          <div class="wrap">
          <img src="images/carrito.png" alt="" width="78" height="63" class="img-indent">
          <div class="extra-wrap">
          <p><strong>Modulo Carrito</strong></a></p>
          <p>En este modulo el cliente confirma si desea comprar el producto que habia añadido.Despues de confirmar la compra se observa una ventana por si el cliente desea realizar una nueva compra</p>
          </div>
          </div>
          <div class="wrap top-2">
          <img src="images/misdatos.png" alt="" width="50" height="40" class="img-indent">
          <div class="extra-wrap">
          <p><a href="#" class="link"><strong>Mis datos</strong></a></p>
          <p>El cliente cliente al darle clic a la imagen puede modificar sus datos</p>
          </div></div></div></div></div>
              <%} %>
              
 <%if(Temp.equals("notificacion")){
   out.print("<script>alert('Las modificaciones realizadas se observaran cuando vuelva a iniciar sesion')</script>"); 
 }%>       
              
<% }else {response.sendRedirect("Cliente.jsp?con=0&estado=productos");}%>
       
             
        </body>
        </html>