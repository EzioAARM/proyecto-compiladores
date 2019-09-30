/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico;

import AnalizadorLexico.MyToken;
import AnalizadorSintactico.DML.Select;
import AnalizadorSintactico.Utilidades.AggregateFunctions;
import AnalizadorSintactico.Utilidades.ScalarExpression;
import MiniSql.Errores;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author axel
 */
public class AnalizadorSintactico {
    
    // Variable que indica si se debe seguir analizando o no
    private static boolean continuarAnalisis = true;
    
    // Guarda si existe error en algún punto de la expresión analizada
    private static boolean hasError;
    
    // Tokens por analizar
    private static List<MyToken> TokensAnalizar;
    
    // Tokens analizados
    private static List<MyToken> TokensAnalizados;
    
    // Bandera de inicialización
    private static boolean esObjeto = false;
    
    public AnalizadorSintactico(List<MyToken> tokens) {
        TokensAnalizados = new ArrayList();
        TokensAnalizar = new ArrayList();
        for (int i = 0; i < tokens.size(); i++) {
            if (!tokens.get(i).get_type().equals("Separador") && !tokens.get(i).get_type().equals("Espacio") 
                    && !tokens.get(i).get_type().equals("Comentario") && !tokens.get(i).get_type().equals("Advertencia")) {
                TokensAnalizar.add(tokens.get(i));
            }
        }
        esObjeto = true;
        Select.SELECT1();
        setHasError(false);
        Errores.cambiarEstado();
    }
    
    public static void moverToken() {
        if (getHasError()) {
            
            while (!TokenActual().get_token().equals("GO") && !TokenActual().get_token().equals("PuntoComa") && !TokenActual().get_token().equals("FINDELARCHIVO")) {
                TokensAnalizados.add(TokensAnalizar.get(0));
                TokensAnalizar.remove(0);
            }
            if (TokenActual().get_token().equals("FINDELARCHIVO")) {
                Errores.cambiarEstado();
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "fin de instrucción");
                continuarAnalisis = false;
            }
        } else {
            if (esObjeto) {
                TokensAnalizados.add(TokensAnalizar.get(0));
                TokensAnalizar.remove(0);
            } else {
                Errores.DevelopErrors("No se inicializó la clase \"AnalizadorSintactico\"");
            }
        }
    }
    
    public static void regresarToken() {
        if (esObjeto) {
            TokensAnalizar.add(0, TokensAnalizados.get(TokensAnalizados.size() - 1));
            TokensAnalizados.remove(TokensAnalizados.size() - 1);
        } else {
            Errores.DevelopErrors("No se inicializó la clase \"AnalizadorSintactico\"");
        }
    }
    
    public static MyToken TokenActual() {
        return TokensAnalizar.get(0);
    }
    
    public static boolean getHasError() {
        return hasError;
    }
    
    public static void setHasError(boolean value) {
        hasError = value;
    }
    
}
