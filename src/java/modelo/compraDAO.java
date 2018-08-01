/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;

/**
 *
 * @author andres
 */

import  java.sql.* ;
import java.util.ArrayList;
import static modelo.Conectar.cnn;

public class compraDAO extends compraDTO{
    
PreparedStatement stmt = null;
ResultSet Rs = null; 

compraDTO objlogin = new compraDTO();

ArrayList<compraDAO>compraDAO = new ArrayList();
ArrayList<compraDAO>arreglocompra =new ArrayList<compraDAO>();

public String ingresarcompra( compraDTO pro ){
    String Respuesta ="";
    Connection cnn = Conectar.getInstace();
        
    
    try {
            stmt=cnn.prepareStatement("INSERT INTO compra values (?,?,?,?,?)");
            stmt.setInt(1,pro.getCodigo());
            stmt.setInt(2, pro.getUsuario_cedula());
            stmt.setString(3, pro.getFecha());
            stmt.setInt(4, pro.getValortotalbruto());
            stmt.setString(5, pro.getPago());
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



//////////////////listar compra/////////////////
public ArrayList<compraDAO>  listarcompra (){
        
    Connection cnn = Conectar.getInstace();
    
       try {
            stmt=cnn.prepareStatement("SELECT * FROM compra");
            Rs = stmt.executeQuery();

            
            while (Rs.next()){
            compraDAO prod = new compraDAO();
            prod.setCodigo(Rs.getInt("codigo"));
            prod.setUsuario_cedula(Rs.getInt("usuario_cedula"));
            prod.setFecha(Rs.getString("fecha"));
            prod.setValortotalbruto(Rs.getInt("valortotalbruto"));
            prod.setPago(Rs.getString("pago"));
            
           compraDAO.add(prod);
           
            
            }
            
            
        }
        catch(SQLException ex){
          
           ex.printStackTrace();  
            
        }
        
    return compraDAO;
    }




//////////////////listar compra por usuario/////////////////
public ArrayList<compraDAO>  listarcompracedula ( int cedula){
        
    Connection cnn = Conectar.getInstace();
    
       try {
            stmt=cnn.prepareStatement("SELECT * FROM compra where usuario_cedula =? ");
            stmt.setInt(1, cedula);
            Rs = stmt.executeQuery();
            while (Rs.next()){
            compraDAO prod = new compraDAO();
            prod.setCodigo(Rs.getInt("codigo"));
            prod.setUsuario_cedula(Rs.getInt("usuario_cedula"));
            prod.setFecha(Rs.getString("fecha"));
            prod.setValortotalbruto(Rs.getInt("valortotalbruto"));
            prod.setPago(Rs.getString("pago"));
            
           compraDAO.add(prod);
           
            
            }
            
            
        }
        catch(SQLException ex){
          
           ex.printStackTrace();  
            
        }
        
    return compraDAO;
    }





 public ArrayList<compraDAO> buscarcompra(String cedula){ 
 Connection cnn = Conectar.getInstace();
 try {
            stmt=cnn.prepareStatement("SELECT * FROM compra  WHERE usuario_cedula LIKE  '"+cedula+"%' ORDER BY 'codigo'");
            Rs = stmt.executeQuery();
            while (Rs.next()){
            compraDAO objl = new compraDAO();
            objl.setCodigo(Rs.getInt("codigo"));
            objl.setUsuario_cedula(Rs.getInt("usuario_cedula"));
            objl.setFecha(Rs.getString("fecha"));
            objl.setValortotalbruto(Rs.getInt("valortotalbruto"));
            objl.setPago(Rs.getString("pago"));
            arreglocompra.add(objl);
            }}
            catch(SQLException ex){
            ex.printStackTrace();
            }
                
           return arreglocompra;
           }
 
 
 
 
 
 
 public String modcompra(compraDAO usu){
     String rta ;
     try{
         
         stmt=cnn.prepareStatement("UPDATE compra SET   "+ "usuario_cedula = ?, fecha =  ?, valortotalbruto =  ?,pago=? , "
                    + "where codigo = ?");
              
            stmt.setInt(1,usu.getUsuario_cedula()); 
            stmt.setString(2, usu.getFecha());
            stmt.setInt(3, usu.getValortotalbruto());
            stmt.setString(4, usu.getPago());
            stmt.setInt(5,usu.getCodigo()); 
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
 //////////////////////////////////////////////////////////////////////////////////
 
 
 public String modcom (compraDTO usu){
        String rta;
        try {
            stmt=cnn.prepareStatement("UPDATE compra SET   "+"usuario_cedula = ?,"
                    + " fecha =  ?, valortotalbruto =  ?,pago=? , "
                    + "where codigo = ?");
            stmt.setInt(1,usu.getUsuario_cedula());
            stmt.setString(2, usu.getFecha());
            stmt.setInt(3, usu.getValortotalbruto());
            stmt.setString(4,usu.getPago()); 
            stmt.setInt(5, usu.getCodigo());
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

    public String estado(int idcompra,String estado) {
      String rta;
        try {
            stmt=cnn.prepareStatement("UPDATE compra SET pago=? where codigo=?");
            stmt.setString(1,estado);
            stmt.setInt(2, idcompra);
            
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
            
        } return rta; }
     
 
 
 
}