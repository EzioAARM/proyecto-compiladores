/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Descendente.Utilidades;

import static AnalizadorSintactico.Descendente.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.Descendente.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.Descendente.AnalizadorSintactico.setHasError;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class CaseWhen {
    
    public static void CASEW() {
        if (TokenActual().get_token().equals("CASE")) {
            moverToken();
            CASEW1();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "'CASE'");
        }
    }
    
    private static void CASEW1() {
        if (TokenActual().get_token().equals("WHEN")) {
            CASEW2();
        } else {
            Expression.EXPRESSION();
            CASEW2();
        }
    }
    
    private static void CASEW2() {
        if (TokenActual().get_token().equals("WHEN")) {
            moverToken();
            Expression.EXPRESSION();
            if (TokenActual().get_token().equals("THEN")) {
                moverToken();
                Expression.EXPRESSION();
                CASEW3();
            } else {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'THEN'");
            }
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "'WHEN'");
        }
    }
    
    private static void CASEW3() {
        switch (TokenActual().get_token()) {
            case "WHEN":
                CASEW2();
                break;
            case "ELSE":
                moverToken();
                Expression.EXPRESSION();
                if (TokenActual().get_token().equals("END")) {
                    moverToken();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "'END'");
                }
                break;
            case "END":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'END'");
                break;
        }
    }
    
}
