/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MiniSql;

import AnalizadorLexico.MyToken;
import static AnalizadorSintactico.AnalizadorSintactico.getHasError;
import javax.swing.JOptionPane;

/**
 *
 * @author axel
 */
public class Errores {
    
    public static StringBuilder Errores = new StringBuilder();
    private static boolean agregado = false;
    
    public static void cambiarEstado() {
        agregado = false;
    }
    
    public static void MensajeExito(String type) {
        Errores.append("\n\nla sentencia " + type + " se analizó con éxito\n");
    }
    
    public static void DevelopErrors(String errorName) {
        Errores.append("\n" + errorName + "\n");
    }
    
    public static void SyntaxError(MyToken tokenError, String esperado) {
        if (getHasError() && !agregado) {
            Errores.append("\n" + "Error en la linea " + tokenError.getFila() + " columna " + tokenError.get_columnaInicial() 
                    + "\n" + "Se encontró " + tokenError.get_token() + " y se esperaba " + esperado);
            agregado = true;
        }
            
    }
    
    public static void SyntaxErrorCup(MyToken tokenError) {
        Errores.append("\n" + "Error en la linea " + tokenError.getFila() + " columna " + tokenError.get_columnaInicial() 
                    + "\n" + "Se encontró " + tokenError.get_token());
    }
    
    public static void EOF(String claseAnalisis) {
        Errores.append("\n" + "se encontró el fin del archivo, el analisis estaba en: " + claseAnalisis);
    }
    
}
