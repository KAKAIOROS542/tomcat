/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static modelo.Conectar.cnn;

/**
 *
 * @author andres
 */
public class tempcompraDAO extends tempcompraDTO{
    
PreparedStatement stmt = null;


ResultSet Rs = null;

usuarioDTO objlogin = new usuarioDTO();
tempcompraDTO tempcom = new tempcompraDTO();
ArrayList<tempcompraDAO>tempcompraDAO = new ArrayList();

    public String Ingresartempcompra( tempcompraDTO Usu ){
    String Respuesta ="";
    Connection cnn = Conectar.getInstace();
        
    
    try {
        
        
            stmt=cnn.prepareStatement("INSERT INTO tempcompra values (?,?,?,?,?,?,?,?)");
            stmt.setInt(1, Usu.getCodigo());
            stmt.setInt(2, Usu.getCodigo_compra());
            stmt.setInt(3,Usu.getProducto_codigo());
            stmt.setString(4, Usu.getProducto_nombre());
            stmt.setInt(5, Usu.getPrecio());
            stmt.setInt(6, Usu.getCantidad());
            stmt.setInt(7,Usu.getUsuario_cedula());
            stmt.setString(8,Usu.getFecha());
            
            int result=stmt.executeUpdate();
            
            if(result!=0){
               Respuesta="Insersion Exitosa";
            }
            else {
               Respuesta="Falló";
            }
            
        }
        catch(SQLException ex){
            Respuesta=ex.getMessage();
            System.out.print(Respuesta);
        }
        
    return Respuesta;
    
    }
    

 public ArrayList<tempcompraDAO>  listartempcompra (){
        
    Connection cnn = Conectar.getInstace();
    
       try {
            stmt=cnn.prepareStatement("SELECT * FROM tempcompra");
            Rs = stmt.executeQuery();

            
            while (Rs.next()){
            tempcompraDAO prod = new tempcompraDAO();
            
            prod.setCodigo(
            Rs.getInt("codigo"));
            prod.setProducto_codigo(Rs.getInt("producto_codigo"));
            prod.setProducto_nombre(Rs.getString("producto_nombre"));
            prod.setPrecio(Rs.getInt("precio"));
            prod.setCantidad(Rs.getInt("cantidad"));
            prod.setUsuario_cedula(Rs.getInt("usuario_cedula"));
            
            tempcompraDAO.add(prod);
           
            
            }
            
            
        }
        catch(SQLException ex){
            
             objlogin.setNombre(ex.getMessage());
            
        }
        
    return tempcompraDAO;
    }
 
 
 public ArrayList<tempcompraDAO>  listartempXUSER (int codigo_compra){
        
    Connection cnn = Conectar.getInstace();
    
       try {
            stmt=cnn.prepareStatement("SELECT * FROM tempcompra where codigo_compra =? ");
            stmt.setInt(1, codigo_compra);
         
            Rs = stmt.executeQuery();

            
            while (Rs.next()){
            tempcompraDAO prod = new tempcompraDAO();
            
            prod.setProducto_codigo(Rs.getInt("producto_codigo"));
            prod.setProducto_nombre(Rs.getString("producto_nombre"));
            prod.setPrecio(Rs.getInt("precio"));
            prod.setCantidad(Rs.getInt("cantidad"));
            prod.setUsuario_cedula(Rs.getInt("usuario_cedula"));
            
            tempcompraDAO.add(prod);
           
            
            }
            
            
        }
        catch(SQLException ex){
            
             objlogin.setNombre(ex.getMessage());
            
        }
        
    return tempcompraDAO;
    }
 
  public String eliminar( String Usu ){
    String Respuesta ="";
    Connection cnn = Conectar.getInstace();
        
    
    try {
        
   stmt=cnn.prepareStatement("delete from tempcompra where producto_codigo =?");
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
 
 /////////////////////////// metodo suma ////////
  
  
  
  public String suma (){
            tempcompraDAO proDTO = new tempcompraDAO(); 
            String rta;
       try {
            tempcompraDAO = proDTO.listartempcompra();
           int sumatoria = proDTO.getCantidad()* proDTO.getPrecio();
           int result=stmt.executeUpdate();
           if(result!=0){
                rta="desconto";
            }
            else {
                rta="nodesconto";
            }
            
            }
        catch(SQLException ex){
             rta=ex.getMessage();
        }
        return rta;
        }
    
    
public void sumatoria(){
    tempcompraDAO proDTO = new tempcompraDAO(); 
    tempcompraDAO=proDTO.listartempcompra();
   
}    
    
    
    
}
