/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

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
public class facturaDAO extends facturaDTO {
PreparedStatement stmt = null;
ResultSet Rs = null;
ArrayList<facturaDAO>facturaDAO = new ArrayList();
    

public String ingresarfactura( facturaDAO fac ){
    String Respuesta ="";
    Connection cnn = Conectar.getInstace();
        
    
    try {
        
        
        
        
            stmt=cnn.prepareStatement("INSERT INTO factura values (?,?,?,?,?,?,?,?,?,?)");
            stmt.setInt(1, fac.getCodigo());
            stmt.setInt(2, fac.getUsuario_cedula());
            stmt.setInt(3, fac.getProductos_codigo());
            stmt.setString(4, fac.getFecha());
            stmt.setInt(5, fac.getCantidad());
            stmt.setInt(6, fac.getValorunit());
            stmt.setInt(7, fac.getIva());
            stmt.setInt(8, fac.getValortotalbruto());
            stmt.setInt(9, fac.getDescuento());
            stmt.setInt(10, fac.getValorneto());
            
            
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
           
        }
        
    return Respuesta;
    
    }
///// listar factura ////

public ArrayList<facturaDAO>  listarfactura (){
        
    Connection cnn = Conectar.getInstace();
    
       try {
            stmt=cnn.prepareStatement("SELECT * FROM factura");
            Rs = stmt.executeQuery();

            
            while (Rs.next()){
            facturaDAO fact = new facturaDAO();
            fact.setCodigo(Rs.getInt("codigo"));
            fact.setUsuario_cedula(Rs.getInt("usuario_cedula"));
            fact.setProductos_codigo(Rs.getInt("productos_codigo"));
            fact.setFecha(Rs.getString("fecha"));
            fact.setCantidad(Rs.getInt("cantidad"));
            fact.setValorunit(Rs.getInt("valorunit"));
            fact.setIva(Rs.getInt("iva"));
            fact.setValortotalbruto(Rs.getInt("valortotalbruto"));
            fact.setDescuento(Rs.getInt("descuento"));
            fact.setValorneto(Rs.getInt("valorneto"));
            facturaDAO.add(fact);
           
            
            }
            
            
        }
        catch(SQLException ex){
           
        }
        
    return facturaDAO;
    }
 
 
 //// eliminar//
 
 public String eliminarfactura( String Usu ){
    String Respuesta ="";
    Connection cnn = Conectar.getInstace();
        
    
    try {
        
   stmt=cnn.prepareStatement("delete from factura where codigo =?");
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
    public facturaDTO consultarfactura (String actualizar){
            facturaDTO factDTO = new facturaDTO();   
       try {
            stmt=cnn.prepareStatement("SELECT * FROM `factura` WHERE `codigo`=?");
            stmt.setInt(1, Integer.parseInt(actualizar));
            Rs =stmt.executeQuery();
            while(Rs.next()){
             
             factDTO.setCodigo(Rs.getInt(1));
             factDTO.setUsuario_cedula(Rs.getInt(2));
             factDTO.setProductos_codigo(Rs.getInt(3));
             factDTO.setFecha(Rs.getString(4));
             factDTO.setCantidad(Rs.getInt(5));
             factDTO.setValorunit(Rs.getInt(6));
             factDTO.setIva(Rs.getInt(7));
             factDTO.setValortotalbruto(Rs.getInt(8));
             factDTO.setDescuento(Rs.getInt(9));
             factDTO.setValorneto(Rs.getInt(10));
            }
            }
        catch(SQLException ex){
            String rta=ex.getMessage();
        }
        return factDTO ;
        }
   ///////// uptade /////////
     public String modfactura (facturaDTO usu){
        String rta;
        try {
            stmt=cnn.prepareStatement("UPDATE factura SET   "
                    + "usuario_cedula = ?, productos_codigo =  ?, fecha =  ?,cantidad =  ?,valorunit =  ?,iva =  ?,valortotalbruto =  ?,descuento =  ?,valorneto =  ? where codigo = ?");
            
            
            stmt.setInt(1,usu.getUsuario_cedula());
            stmt.setInt(2, usu.getProductos_codigo());
            stmt.setString(3, usu.getFecha());
            stmt.setInt(4, usu.getCantidad());
            stmt.setInt(5, usu.getValorunit());
            stmt.setInt(6, usu.getIva());
            stmt.setInt(7, usu.getValortotalbruto());
            stmt.setInt(8, usu.getDescuento());
            stmt.setInt(9, usu.getValorneto());
           stmt.setInt(10,usu.getCodigo()); 
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
     
 
 
 

}
