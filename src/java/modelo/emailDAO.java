/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import  java.sql.* ;
import java.util.ArrayList;
/**
 *
 * @author Sena
 */

 

public class emailDAO extends usuarioDTO {
PreparedStatement stmt = null;
ResultSet Rs = null;
usuarioDTO objlogin = new usuarioDTO();
ArrayList<usuarioDTO> ArregloUsuarrios = new ArrayList<usuarioDTO>();

     public ArrayList<usuarioDTO>  contraseña ( long doc) {
            
    Connection cnn = Conectar.getInstace();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM  `usuario`  WHERE cedula = "+doc);
           

            Rs = stmt.executeQuery();


            while (Rs.next()){
            usuarioDTO objl = new usuarioDTO();
            objl.setCedula(Rs.getInt("cedula"));
            objl.setNombre(Rs.getString("nombre"));
            objl.setApellido(Rs.getString("apellido"));
            objl.setDireccion(Rs.getString("direccion"));
            objl.setTelefono(Rs.getInt("telefono"));
            objl.setCorreo(Rs.getString("correo"));
            objl.setTipo(Rs.getInt("tipousuario_idusuario"));
            objl.setNombreusuario(Rs.getString("nombreusuario"));
            objl.setClave(Rs.getString("clave"));
            ArregloUsuarrios.add(objl);


            }


        }
        catch(SQLException ex){
            objlogin.setNombre(ex.getMessage());

        }

    return ArregloUsuarrios;
    }
     
    public ArrayList<usuarioDTO>  Listarusuario ( String Nom){
        
    Connection cnn = Conectar.getInstace();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM usuario  WHERE Nombre LIKE  '"+Nom+"%' ORDER BY 'usuario' , 'Documento' ASC");
            
            Rs = stmt.executeQuery();

            
           while (Rs.next()){
            usuarioDTO objl = new usuarioDTO();
            objl.setCedula(Rs.getInt("cedula"));
            objl.setNombre(Rs.getString("nombre"));
            objl.setApellido(Rs.getString("apellido"));
            objl.setDireccion(Rs.getString("direccion"));
            objl.setTelefono(Rs.getInt("telefono"));
            objl.setCorreo(Rs.getString("correo"));
            objl.setTipo(Rs.getInt("tipousuario_idusuario"));
            objl.setNombreusuario(Rs.getString("nombreusuario"));
            objl.setClave(Rs.getString("clave"));
            ArregloUsuarrios.add(objl);

            }
            
            
        }
        catch(SQLException ex){
            objlogin.setNombre(ex.getMessage());
            
        }
        
    return ArregloUsuarrios;
    }
    
     public ArrayList<usuarioDTO>  ListarTodos (){
        
    Connection cnn = Conectar.getInstace();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM usuario where tipousuario_idusuario =1");
            Rs = stmt.executeQuery();

            
            while (Rs.next()){
            usuarioDTO objl = new usuarioDTO();
            objl.setCedula(Rs.getInt("cedula"));
            objl.setNombre(Rs.getString("nombre"));
            objl.setApellido(Rs.getString("apellido"));
            objl.setDireccion(Rs.getString("direccion"));
            objl.setTelefono(Rs.getInt("telefono"));
            objl.setCorreo(Rs.getString("correo"));
            objl.setTipo(Rs.getInt("tipousuario_idusuario"));
            objl.setNombreusuario(Rs.getString("nombreusuario"));
            objl.setClave(Rs.getString("clave"));
            
            ArregloUsuarrios.add(objl);
           
            
            }
            
            
        }
        catch(SQLException ex){
            objlogin.setNombre(ex.getMessage());
            
        }
        
    return ArregloUsuarrios;
    }

    }
    
    

