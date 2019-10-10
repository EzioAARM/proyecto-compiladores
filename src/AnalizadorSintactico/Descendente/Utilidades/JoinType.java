/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Utilidades;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class JoinType {
    
    public static void JOINTYPE() {
        if (TokenActual().get_token().equals("INNER") || TokenActual().get_token().equals("LEFT") 
                || TokenActual().get_token().equals("RIGHT") || TokenActual().get_token().equals("FULL")
                || TokenActual().get_token().equals("JOIN")) {
            JOINTYPE1();
            if (TokenActual().get_token().equals("JOIN")) {
                moverToken();
            } else {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'JOIN'");
            }
        }
    }
    
    private static void JOINTYPE1() {
        if (TokenActual().get_token().equals("INNER")) {
            moverToken();
        } else if (TokenActual().get_token().equals("LEFT") || TokenActual().get_token().equals("RIGHT") 
                || TokenActual().get_token().equals("FULL")) {
            JOINTYPE2();
        }
    }
    
    private static void JOINTYPE2() {
        if (TokenActual().get_token().equals("LEFT") || TokenActual().get_token().equals("RIGHT") 
                || TokenActual().get_token().equals("FULL")) {
            moverToken();
            JOINTYPE3();
        }
    }
    
    private static void JOINTYPE3() {
        if (TokenActual().get_token().equals("OUTER")) {
            moverToken();
        }
    }
    
}
