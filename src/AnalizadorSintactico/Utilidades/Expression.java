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
            default:
                if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                        || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
                    ScalarExpression.SEXP();
                    EXPRESSION5();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "string, identificador, parentesis de apertura, dato entero, dato float o una variable");
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
    
    private static void EXPRESSION4() {
        if (TokenActual().get_token().equals("Mas") || TokenActual().get_token().equals("Menos")
                || TokenActual().get_token().equals("Multiplicacion") || TokenActual().get_token().equals("Divison")
                || TokenActual().get_token().equals("Modulo") || TokenActual().get_token().equals("Igual") 
                || TokenActual().get_token().equals("AND") || TokenActual().get_token().equals("OR")
                || TokenActual().get_token().equals("NOT") || TokenActual().get_token().equals("Menor")
                || TokenActual().get_token().equals("Mayor") || TokenActual().get_token().equals("MenorIgual")
                || TokenActual().get_token().equals("MayorIgual") || TokenActual().get_token().equals("Diferente") 
                || TokenActual().get_token().equals("ALL") || TokenActual().get_token().equals("ANY")
                || TokenActual().get_token().equals("BETWEEN") || TokenActual().get_token().equals("EXISTS")
                || TokenActual().get_token().equals("IN") || TokenActual().get_token().equals("LIKE")
                || TokenActual().get_token().equals("SOME")) {
            BinaryOperators.BINOPR();
            EXPRESSION();
        }
    }
    
    private static void EXPRESSION5() {
        if (TokenActual().get_token().equals("Mas") || TokenActual().get_token().equals("Menos")
                || TokenActual().get_token().equals("Multiplicacion") || TokenActual().get_token().equals("Divison")
                || TokenActual().get_token().equals("Modulo") || TokenActual().get_token().equals("Igual") 
                || TokenActual().get_token().equals("AND") || TokenActual().get_token().equals("OR")
                || TokenActual().get_token().equals("NOT") || TokenActual().get_token().equals("Menor")
                || TokenActual().get_token().equals("Mayor") || TokenActual().get_token().equals("MenorIgual")
                || TokenActual().get_token().equals("MayorIgual") || TokenActual().get_token().equals("Diferente") 
                || TokenActual().get_token().equals("ALL") || TokenActual().get_token().equals("ANY")
                || TokenActual().get_token().equals("BETWEEN") || TokenActual().get_token().equals("EXISTS")
                || TokenActual().get_token().equals("IN") || TokenActual().get_token().equals("LIKE")
                || TokenActual().get_token().equals("SOME")) {
            EXPRESSION4();
            EXPRESSION5();
        }
    }
    
}
