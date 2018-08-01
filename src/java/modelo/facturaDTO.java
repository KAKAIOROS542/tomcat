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
public class facturaDTO {
   private int codigo;
    private int usuario_cedula;
    private int productos_codigo;
    private String fecha;
    private int cantidad;
    private int valorunit;
    private int iva;
    private int valortotalbruto;
    private int descuento;
    private int valorneto;
  
   public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getUsuario_cedula() {
        return usuario_cedula;
    }

    public void setUsuario_cedula(int usuario_cedula) {
        this.usuario_cedula = usuario_cedula;
    }

    public int getProductos_codigo() {
        return productos_codigo;
    }

    public void setProductos_codigo(int productos_codigo) {
        this.productos_codigo = productos_codigo;
    }


    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getValorunit() {
        return valorunit;
    }

    public void setValorunit(int valorunit) {
        this.valorunit = valorunit;
    }

    public int getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }

    public int getValortotalbruto() {
        return valortotalbruto;
    }

    public void setValortotalbruto(int valortotalbruto) {
        this.valortotalbruto = valortotalbruto;
    }

    public int getDescuento() {
        return descuento;
    }

    public void setDescuento(int descuento) {
        this.descuento = descuento;
    }

    public int getValorneto() {
        return valorneto;
    }

    public void setValorneto(int valorneto) {
        this.valorneto = valorneto;
    }

    
}
