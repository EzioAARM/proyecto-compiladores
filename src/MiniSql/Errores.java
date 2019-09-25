/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MiniSql;

import AnalizadorLexico.MyToken;
import javax.swing.JOptionPane;

/**
 *
 * @author axel
 */
public class Errores {
    
    public static void DevelopErrors(String errorName) {
        JOptionPane.showMessageDialog(null, errorName, "Error de programador", 0);
    }
    
    public static void DevelopErrors(MyToken tokenError, String esperado) {
        JOptionPane.showMessageDialog(null, "Error en la linea " + tokenError.getFila() + " columna " + tokenError.get_columnaInicial() 
                + ", se encontró " + tokenError.get_lexema() + " y se esperaba" + esperado, "Error sintactico", 0);
    }
    
}
