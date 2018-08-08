/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;


import java.sql.*;

/**
 *
 * @author SENA
 */
public class Conectar {
    
     static Connection cnn;

    private Conectar() {
    }

    private static void conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); 
            cnn = DriverManager.getConnection("jdbc:mysql://172.30.131.58:3306/concesionario?autoReconnect=true", "asdf", "asdf"); 
        } catch (SQLException e) {  
          System.out.println("Error de MySQL: " + e.getMessage()); 
        }  catch (Exception e) {
          System.out.println("Error inesperado: " + e.getMessage());
        }
    }

    public static Connection getInstace() {
        if (cnn == null) {
            conectar();
        }
        return cnn;
    }

}
