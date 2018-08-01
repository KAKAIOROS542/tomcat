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
public class tempcompraDTO {
   private int codigo;
   private int codigo_compra;
   private int producto_codigo;
   private String producto_nombre;
   private int precio;
   private int cantidad;
   private int usuario_cedula;
   private String fecha;
   
    public int getCodigo_compra() {
        return codigo_compra;
    }

    public void setCodigo_compra(int codigo_compra) {
        this.codigo_compra = codigo_compra;
    }


    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getUsuario_cedula() {
        return usuario_cedula;
    }

    public void setUsuario_cedula(int usuario_cedula) {
        this.usuario_cedula = usuario_cedula;
    }
    

    public String getProducto_nombre() {
        return producto_nombre;
    }

    public void setProducto_nombre(String producto_nombre) {
        this.producto_nombre = producto_nombre;
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
   

    public int getProducto_codigo() {
        return producto_codigo;
    }

    public void setProducto_codigo(int producto_codigo) {
        this.producto_codigo = producto_codigo;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
}
