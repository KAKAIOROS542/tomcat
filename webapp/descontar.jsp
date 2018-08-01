<%
    double r = Math.random()*100000;
    int x = (int) r;
%>


<%= ("numero aleatori es")+ x%>

 <form  action="controlcompra" method="POST">
            <table border="2">
            <tr><td>Codigo</td>
              <td>
             
              <input type="text" name="codigocompra" value="">
              </td></tr>
            <tr><td>CC usuario</td>
              <td>
              
              <input type="text" name="usuario_cedula" value="">
              </td></tr>
            <tr><td>Fecha</td>
              <td>
              
              <input type="text" name="fecha" value="">
              </td></tr>
             <tr><td>Valor total</td>
              <td>
                
              <input type="text" name="valor" value="">
              </td></tr>
              <tr><td>Estado</td>
             <td> 
            
             <select name="estado" id ="estado">
             <option value="Despachar">Despachar</option>
             <option value="Pendiente">Pendiente</option>
            
                    
             </select>
            </td></tr> 
            <tr><td><input type="submit" name="Boton" value="Actualizar"><td>
            </tr>
            </form>
</table></center>


 