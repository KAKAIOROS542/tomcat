/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;


import  java.sql.* ;
import java.util.ArrayList;
import static modelo.Conectar.cnn;

public class productoDAO extends productoDTO{
    
    
PreparedStatement stmt = null;
ResultSet Rs = null;

usuarioDTO objlogin = new usuarioDTO();
ArrayList<productoDAO>productoDAO = new ArrayList();

ArrayList<productoDTO> producto = new ArrayList<productoDTO>();

    public String ingresarproducto( productoDTO pro ){
    String Respuesta ="";
    Connection cnn = Conectar.getInstace();
        
    
    try {
            stmt=cnn.prepareStatement("INSERT INTO productos values (?,?,?,?,?,?)");
            stmt.setInt(1, pro.getCodigo());
            stmt.setString(2, pro.getNombre());
            stmt.setInt(3, pro.getPrecioventa());
            stmt.setInt(4, pro.getUltprecio());
            stmt.setString(5, pro.getDescripcion());
            stmt.setInt(6, pro.getNumeroexistencias());
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
 public ArrayList<productoDAO>  listarproducto (){
        
    Connection cnn = Conectar.getInstace();
    
       try {
            stmt=cnn.prepareStatement("SELECT * FROM productos");
            Rs = stmt.executeQuery();

            
            while (Rs.next()){
            productoDAO prod = new productoDAO();
            prod.setCodigo(Rs.getInt("codigo"));
            prod.setNombre(Rs.getString("nombre"));
            prod.setPrecioventa(Rs.getInt("precioventa"));
            prod.setUltprecio(Rs.getInt("ultprecio"));
            prod.setDescripcion(Rs.getString("descripcion"));
            prod.setNumeroexistencias(Rs.getInt("numeroexistencias"));
            
            productoDAO.add(prod);
           
            
            }
            
            
        }
        catch(SQLException ex){
            
            objlogin.setNombre(ex.getMessage());
            
        }
        
    return productoDAO;
    }
 
 
 
 
 //// eliminar//
 
 public String eliminar( String Usu ){
    String Respuesta ="";
    Connection cnn = Conectar.getInstace();
        
    
    try {
        
   stmt=cnn.prepareStatement("delete from productos where codigo =?");
   stmt.setString(1, Usu);
                       
   int result=stmt.executeUpdate();
            
            if(result!=0){
                Respuesta="elimacion exitosa";
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
    public productoDTO ConsultarUno (String actualizar){
            productoDTO proDTO = new productoDTO();   
       try {
            stmt=cnn.prepareStatement("SELECT * FROM `productos` WHERE `codigo`=?");
            stmt.setInt(1, Integer.parseInt(actualizar));
            Rs =stmt.executeQuery();
            while(Rs.next()){
             
             proDTO.setCodigo(Rs.getInt(1));
             proDTO.setNombre(Rs.getString(2));
             proDTO.setPrecioventa(Rs.getInt(3));
             proDTO.setUltprecio(Rs.getInt(4));
             proDTO.setDescripcion(Rs.getString(5));
             proDTO.setNumeroexistencias(Rs.getInt(6));
            }
            }
        catch(SQLException ex){
            String rta=ex.getMessage();
        }
        return proDTO ;
        }
    /////////////// DESCONTAR /////////////////////////////////////////////////
    public String descontar1 (int pos){
            productoDAO proDTO = new productoDAO(); 
            String rta;
       try {
           productoDAO = proDTO.listarproducto();
           proDTO = productoDAO.get(pos);
           
           int actual = proDTO.getNumeroexistencias();
           actual = actual-pos;
           
            stmt=cnn.prepareStatement("update productos set numeroexistencias=? where codigo =?");
            stmt.setInt(1, actual);
            stmt.setInt(2, proDTO.getCodigo());
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
 
 ////// actualizar 2 /////////////////////////////////////////////////////////////////////////////  
   public String modproducto (productoDTO usu){
        String rta;
        try {
            stmt=cnn.prepareStatement("UPDATE productos SET   "
                    + "nombre = ?, precioventa =  ?, ultprecio =  ?, descripcion=?,  numeroexistencias=?  where codigo = ?");
            
            
            stmt.setString(1,usu.getNombre());
            stmt.setInt(2, usu.getPrecioventa());
            stmt.setInt(3, usu.getUltprecio());
            stmt.setString(4, usu.getDescripcion());
            stmt.setInt(5, usu.getNumeroexistencias());
            stmt.setInt(6,usu.getCodigo()); 
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
     
   public ArrayList<productoDAO>buscarproducto(String nom){
   ArrayList <productoDAO> productos=new ArrayList();
   Connection cnn = Conectar.getInstace();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM productos  WHERE nombre LIKE  '"+nom+"%' ORDER BY 'nombre' , 'codigo' ASC");
            
            Rs = stmt.executeQuery();

            
           while (Rs.next()){
            productoDAO objl = new productoDAO();
            objl.setCodigo(Rs.getInt("codigo"));
            objl.setNombre(Rs.getString("nombre"));
            objl.setPrecioventa(Rs.getInt("precioventa"));
            objl.setUltprecio(Rs.getInt("ultprecio"));
            objl.setDescripcion(Rs.getString("descripcion"));
            objl.setNumeroexistencias(Rs.getInt("numeroexistencias"));
            productos.add(objl);
            }
            }
        catch(SQLException ex){
            objlogin.setNombre(ex.getMessage());
            
            }
        
       return productos;
            }
   
   
   
   
   
   
   
   /////////////////////////////////////////////////////////////////////////////////////////
  public void descontarproducto (int codigo,int cantidad){
            
       try {
             productoDAO proDTO = new productoDAO(); 
//            String rta;
             productoDAO = proDTO.listarproducto();
////           proDTO = productoDAO.get(cantidad);
//
              cantidad =  proDTO.getNumeroexistencias()- cantidad;
           
           Statement estado = cnn.createStatement();
           ResultSet resultado =estado.executeQuery("update productos set numeroexistencias='"+cantidad+"' where codigo = '"+codigo+"'");
           
//            stmt=cnn.prepareStatement(");
//            stmt.setInt(1, cantidad);
//            stmt.setInt(2, codigo);
//            int result=stmt.executeUpdate();
//            
//            if(result!=0){
//                rta="desconto";
//            }
//            else {
//                rta="nodesconto";
//            }
            
            }
        catch(SQLException ex){
        }
       
            }

    public String descontar(int idproducto, int cantidad) {
      
    String respues="";
    productoDAO producto = new productoDAO();
    producto=producto.escoger(idproducto);
    int descuento= producto.getNumeroexistencias()-cantidad;
    
    try {
          
           
            stmt=cnn.prepareStatement("update productos set numeroexistencias=? where codigo =?");
            stmt.setInt(1, descuento);
            stmt.setInt(2, idproducto);
            int result=stmt.executeUpdate();
            
            
            
            if(result!=0){
                respues="desconto";
            }
            else {
                respues="nodesconto";
            }
            
            }
        catch(SQLException ex){
             respues=ex.getMessage();
        }
    
    return respues;
    }

    
    
    
   public productoDAO escoger(int idproducto) {
     Connection cnn = Conectar.getInstace();
    productoDAO prod = new productoDAO();
       try {
            stmt=cnn.prepareStatement("SELECT * FROM productos where codigo=?");
            stmt.setInt(1, idproducto);
            Rs = stmt.executeQuery();

            
            if (Rs.next()){
            
            prod.setCodigo(Rs.getInt("codigo"));
            prod.setNombre(Rs.getString("nombre"));
            prod.setPrecioventa(Rs.getInt("precioventa"));
            prod.setUltprecio(Rs.getInt("ultprecio"));
            prod.setDescripcion(Rs.getString("descripcion"));
            prod.setNumeroexistencias(Rs.getInt("numeroexistencias"));
            
        
            
            }else{ prod.setCodigo(0);
            prod.setNombre("nulo"); }
            
            
        }
        catch(SQLException ex){
            
         prod.setCodigo(22222);
            prod.setNombre(ex.getMessage());
            
        }
        
    return prod;}
}
   
   
   
   
   
            
   
   

  
    

