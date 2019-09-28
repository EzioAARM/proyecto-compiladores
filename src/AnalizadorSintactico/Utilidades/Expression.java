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
public class Expression {
    
    public static void EXPRESSION() {
        switch (TokenActual().get_token()) {
            case "DatoString":
                moverToken();
                EXPRESSION5();
                break;
            case "Identificador":
                moverToken();
                EXPRESSION1();
                EXPRESSION5();
                break;
            case "ParentesisAbrir":
                moverToken();
                EXPRESSION();
                switch (TokenActual().get_token()) {
                    case "ParentesisCerrar":
                        moverToken();
                        EXPRESSION5();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "parentesis cerrar");
                        break;
                }
                break;
            case "Mas":
                moverToken();
                EXPRESSION2();
                EXPRESSION();
                break;
            case "Menos":
                moverToken();
                EXPRESSION2();
                EXPRESSION();
                break;
            default:
                if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                        || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
                    ScalarExpression.SEXP();
                    EXPRESSION5();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "string, identificador, signo más, signo menos, parentesis de apertura, dato entero, dato float o una variable");
                }
                break;
        }
    }
    
    private static void EXPRESSION1() {
        if (TokenActual().get_token().equals("Punto")) {
            moverToken();
            if (TokenActual().get_token().equals("Identificador")) {
                moverToken();
            } else {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
            }
        }
    }
    
    private static void EXPRESSION2() {
        if (TokenActual().get_token().equals("Mas") || TokenActual().get_token().equals("Menos")) {
            EXPRESSION3();
            EXPRESSION();
        }
    }
    
    private static void EXPRESSION3() {
        if (TokenActual().get_token().equals("Mas") || TokenActual().get_token().equals("Menos")) {
            moverToken();
        }
    }
    
    private static void EXPRESSION4() {
        
    }
    
    private static void EXPRESSION5() {
        
    }
    
}
