/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import  java.sql.* ;
import java.util.ArrayList;
import static modelo.Conectar.cnn;
/**
 *
 * @author Sena
 */

 

public class usuarioDAO extends usuarioDTO {
PreparedStatement stmt = null;
ResultSet Rs = null;
usuarioDTO objlogin = new usuarioDTO();
ArrayList<usuarioDAO>usuarioDAO = new ArrayList();

ArrayList<usuarioDAO> ArregloUsuarrios = new ArrayList<usuarioDAO>();

    public String IngresarUsuario( usuarioDTO Usu ){
    String Respuesta ="";
    Connection cnn = Conectar.getInstace();
        
    
    try {
            stmt=cnn.prepareStatement("INSERT INTO usuario values (?,?,?,?,?,?,?,?,?)");
            stmt.setInt(1, Usu.getCedula());
            stmt.setString(2, Usu.getNombre());
            stmt.setString(3, Usu.getApellido());
            stmt.setString(4, Usu.getDireccion());
            stmt.setInt(5, Usu.getTelefono());
            stmt.setString(6, Usu.getCorreo());
            stmt.setInt(7, Usu.getTipo());
            stmt.setString(8, Usu.getNombreusuario());
            stmt.setString(9, Usu.getClave());
        
            
            int result=stmt.executeUpdate();
            
            if(result!=0){
               Respuesta="Insersion Exitosa";
            }
            else {
               Respuesta="Falló";
            }
            
        }
        catch(SQLException ex){
         ex.printStackTrace();
        }
        
        
    return Respuesta;
    
    }
    
    public usuarioDTO login ( String nombreusuario, String clave){
    Connection cnn = Conectar.getInstace();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM usuario WHERE nombreusuario = ? AND clave =?");
            stmt.setString(1, nombreusuario);
            stmt.setString(2, clave);
          
            
            Rs = stmt.executeQuery();
            
            if(Rs.next()){
            objlogin.setCedula(Rs.getInt("cedula"));
            objlogin.setNombre(Rs.getString("nombre"));
            objlogin.setApellido(Rs.getString("apellido"));
            objlogin.setDireccion(Rs.getString("direccion"));
            objlogin.setTelefono(Rs.getInt("telefono"));
            objlogin.setCorreo(Rs.getString("Correo"));
            objlogin.setTipo(Rs.getInt("tipousuario_idusuario"));
            objlogin.setNombreusuario(Rs.getString("nombreusuario"));
            objlogin.setClave(Rs.getString("clave"));
            
            }
            else {
              objlogin.setNombre("Nulo");
            }
            
        }
        catch(SQLException ex){
            objlogin.setNombre(ex.getMessage());
            
        }
        
    return objlogin;
    }  
    
    
   public ArrayList<usuarioDAO>  ListarTodos (){
        
    Connection cnn = Conectar.getInstace();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM usuario where tipousuario_idusuario = 1");
            Rs = stmt.executeQuery();

            
            while (Rs.next()){
            usuarioDAO objl = new usuarioDAO();
            objl.setCedula(Rs.getInt("cedula"));
            objl.setNombre(Rs.getString("nombre"));
            objl.setApellido(Rs.getString("apellido"));
            objl.setDireccion(Rs.getString("direccion"));
            objl.setTelefono(Rs.getInt("telefono"));
            objl.setCorreo(Rs.getString("correo"));
            objl.setTipo(Rs.getInt("tipousuario_idusuario"));
            objl.setNombreusuario(Rs.getString("nombreusuario"));
            objl.setClave(Rs.getString("clave"));
            
            usuarioDAO.add(objl);
           
            
            }
            
            
        }
        catch(SQLException ex){
            objlogin.setNombre(ex.getMessage());
            
        }
        
    return usuarioDAO;
    }
/////////////////////////listar empleados //////////////////////////////////7
   
   
   
    public ArrayList<usuarioDAO>  Listarempleados (){
        
    Connection cnn = Conectar.getInstace();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM usuario where tipousuario_idusuario = 2");
            Rs = stmt.executeQuery();
            while (Rs.next()){
            usuarioDAO objl = new usuarioDAO();
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

       
     //////     eliminar     ///////
   
   
   
   public String eliminar( String Usu ){
    String Respuesta ="";
    Connection cnn = Conectar.getInstace();
        
    
    try {
        
   stmt=cnn.prepareStatement("delete from usuario where cedula =?");
   stmt.setString(1, Usu);
                       
   int result=stmt.executeUpdate();
            
            if(result!=0){
                Respuesta="Eliminacion exitosa";
            }
            else {
               Respuesta="Falló";
            }
            
        } 
        catch(SQLException ex){
            Respuesta=ex.getMessage();
            Respuesta="-------";
        }
        
    return Respuesta;
    
    }
   
   
   
   /////////// CONSULTAR  /////
   
    public usuarioDTO ConsultarUno (String actualizar){
           usuarioDTO TempDto = new usuarioDTO();   
       try {
            stmt=cnn.prepareStatement("SELECT * FROM `usuario` WHERE `cedula`=?");
            stmt.setInt(1, Integer.parseInt(actualizar));
            Rs =stmt.executeQuery();
            while(Rs.next()){
             
             TempDto.setCedula(Rs.getInt(1));
             TempDto.setNombre(Rs.getString(2));
             TempDto.setApellido(Rs.getString(3));
             TempDto.setDireccion(Rs.getString(4));
             TempDto.setTelefono(Rs.getInt(5));
             TempDto.setCorreo(Rs.getString(6));
             TempDto.setTipo(Rs.getInt(7));
             TempDto.setNombreusuario(Rs.getString(8));
             TempDto.setClave(Rs.getString(9));
            }
            }
        catch(SQLException ex){
            String rta=ex.getMessage();
        }
        return TempDto ;
        }
   
   
   
   
   ////// actualizar 2 ///////////////////////////////////////////////////////////////////////////// 
    
    
   public String modcliente (usuarioDTO usu){
        String rta;
        try {
            stmt=cnn.prepareStatement("UPDATE usuario SET   "+ "nombre = ?, apellido =  ?, direccion =  ?,telefono=? , "
                    + "correo=?, tipousuario_idusuario =?,nombreusuario=?,clave=? where cedula = ?");
            stmt.setString(1,usu.getNombre());
            stmt.setString(2, usu.getApellido());
            stmt.setString(3, usu.getDireccion());
            stmt.setInt(4,usu.getTelefono()); 
            stmt.setString(5, usu.getCorreo());
            stmt.setInt(6, usu.getTipo());
            stmt.setString(7, usu.getNombreusuario());
            stmt.setString(8, usu.getClave());
            stmt.setInt(9,usu.getCedula());
            int result=stmt.executeUpdate();
            
            if(result!=0){
                rta="Update";
            }
            else {
                rta="Update FALLO";
            }
            
        }
        catch(SQLException ex){
            rta=ex.getMessage();
            
        } return rta;
    
    }
     
  ////////////////// MODIFICAR EMPLEADO//////////////
    public String modempleado (usuarioDTO usu){
        String rta;
        try {
            stmt=cnn.prepareStatement("UPDATE usuario SET   "+ "nombre = ?, apellido =  ?, direccion =  ?,telefono=? , "
                    + "correo=?, tipousuario_idusuario =?,nombreusuario=?,clave=? where cedula = ?");
            
            
            stmt.setString(1,usu.getNombre());
            stmt.setString(2, usu.getApellido());
            stmt.setString(3, usu.getDireccion());
            stmt.setInt(4,usu.getTelefono()); 
            stmt.setString(5, usu.getCorreo());
            stmt.setInt(6, usu.getTipo());
            stmt.setString(7, usu.getNombreusuario());
            stmt.setString(8, usu.getClave());
            stmt.setInt(9,usu.getCedula());
            int result=stmt.executeUpdate();
            
            if(result!=0){
                rta="Update";
            }
            else {
                rta="Update FALLO";
            }
            
        }
        catch(SQLException ex){
            rta=ex.getMessage();
            
        } return rta;
    
    }
   ///////////////////////MOD MIS DATOS/////////////////////////
    
     public String modmisdatos (usuarioDTO usu){
        String rta;
        try {
            stmt=cnn.prepareStatement("UPDATE usuario SET nombre = ?, apellido =  ?, direccion =  ?,telefono=? , "
                    + "correo=?, tipousuario_idusuario =?,nombreusuario=?,clave=? where cedula = ?");
            stmt.setString(1,usu.getNombre());
            stmt.setString(2, usu.getApellido());
            stmt.setString(3, usu.getDireccion());
            stmt.setInt(4,usu.getTelefono()); 
            stmt.setString(5, usu.getCorreo());
            stmt.setInt(6, usu.getTipo());
            stmt.setString(7, usu.getNombreusuario());
            stmt.setString(8, usu.getClave());
            stmt.setInt(9,usu.getCedula());
            int result=stmt.executeUpdate();
            
            if(result!=0){
                rta="Update";
            }
            else {
                rta="Update FALLO";
            }
            
        }
        catch(SQLException ex){
            rta=ex.getMessage();
            
        } return rta;
    
    }
    
    
    
    
    
    public ArrayList<usuarioDAO>  buscarempleado ( String Nom){
        
    Connection cnn = Conectar.getInstace();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM usuario  WHERE Nombre LIKE  '"+Nom+"%' ORDER BY 'usuario' , 'Documento' ASC");
            
            Rs = stmt.executeQuery();

            
           while (Rs.next()){
            usuarioDAO objl = new usuarioDAO();
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
   
   /////////////////////////listar empleados //////////////////////////////////7
   
   
   
    public boolean  Existeuser (String user){
        usuarioDAO objl = new usuarioDAO();
        boolean existe=false;
    Connection cnn = Conectar.getInstace();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM usuario where nombreusuario = ?");
            stmt.setString(1, user);
            Rs = stmt.executeQuery();
            if(Rs.next()){
            objl.setCedula(Rs.getInt("cedula"));
            }else{objl.setCedula(0);}
             if(objl.getCedula()==0){existe=false;}else{existe=true;}
            }
            catch(SQLException ex){
            objl.setCedula(0);
             }
            return existe;
            }


   
   
   
    }
 
    
    
    


    
    

