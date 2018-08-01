/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;

/**
 *
 * @author Cat Savage
 */
public class BackupDAO {
    
    Connection con;
    public BackupDAO() {
        this.con=Conectar.getInstace();
    }
   
   public String generarBak(String fecha){
       String msj="";
       //String executeCmd = "C:\\xampp\\mysql\\bin\\mysqldump -u sgeAdmin -pmikecat1422 sge > \"C:\\Users\\Cat Savage\\Dropbox\\NetBeansProjects\\sge\\web\\SGE\\Backup's\\sge"+fecha+".sql\"";
       //String executeCmd = "C:\\xampp\\mysql\\bin\\mysqldump -u sgeAdmin -p mikecat1422 sge > \"D:\\\\Mike\\\\Dropbox\\\\NetBeansProjects\\\\sge\\\\web\\\\SGE\\\\Backup's\\sge"+fecha+".sql\"";
       //String executeCmd = "C:\\xampp\\mysql\\bin\\mysqldump -u sgeAdmin -pmikecat1422 sge > \"C:\\Backup's\\sge"+fecha+".sql\"";
       String executeCmd = "C:\\xampp\\mysql\\bin\\mysqldump --opt --u root daja>\"C:\\xampp\\mysql\\bin\\backup\\copia.sql"+fecha+"\"";
       Process runtimeProcess;
        try {
 
            runtimeProcess = Runtime.getRuntime().exec("cmd /c "+executeCmd);
            int processComplete = runtimeProcess.waitFor();
            //agregar la tabla historial de backup en la base de datos y averiguar hilos
            if (processComplete == 0) {
                msj="Backup creado satisfactoriamente";
                
            } else {
                msj="No se pudo generar el backup";
                //msj=executeCmd;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            msj=ex.getMessage();
        }
     return msj; 
   }
    
}
