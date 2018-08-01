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
public class compraDTO {
   
 private int usuario_cedula;
private int codigo;
private String fecha;
private int valortotalbruto;
private String pago;

    public int getUsuario_cedula() {
        return usuario_cedula;
    }

    public void setUsuario_cedula(int usuario_cedula) {
        this.usuario_cedula = usuario_cedula;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getValortotalbruto() {
        return valortotalbruto;
    }

    public void setValortotalbruto(int valortotalbruto) {
        this.valortotalbruto = valortotalbruto;
    }

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
    }

    
    
    
}
