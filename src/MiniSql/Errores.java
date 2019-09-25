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
    
    public static StringBuilder Errores = new StringBuilder();
    
    public static void DevelopErrors(String errorName) {
        Errores.append("\n" + errorName + "\n");
    }
    
    public static void SyntaxError(MyToken tokenError, String esperado) {
        Errores.append("\n" + "Error en la linea " + tokenError.getFila() + " columna " + tokenError.get_columnaInicial() 
                + "\n" + "Se encontró " + tokenError.get_token() + " y se esperaba " + esperado);
    }
    
}
