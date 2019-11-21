/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MiniSql;

import TablaSimbolos.Manejadores.SymbolDriver;
import java.io.File;

/**
 *
 * @author axel
 */
public class MiniSql {
    
    public static SymbolDriver Manejador = null;
    
    public static File ubicacionArchivo;
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Principal formPrincipal = new Principal();
        formPrincipal.setVisible(true);
    }
    
}
