/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico;

import AnalizadorLexico.MyToken;
import AnalizadorSintactico.Utilidades.ScalarExpression;
import MiniSql.Errores;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author axel
 */
public class AnalizadorSintactico {
    
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
        ScalarExpression test = new ScalarExpression();
        test.Analizar();
    }
    
    public static void moverToken() {
        if (esObjeto) {
            TokensAnalizados.add(TokensAnalizar.get(0));
            TokensAnalizar.remove(0);
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
