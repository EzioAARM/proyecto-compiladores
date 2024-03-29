/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Descendente.Utilidades;

import MiniSql.Errores;
import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.getHasError;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import java.util.List;


/**
 *
 * @author axel
 */
public class ScalarExpression {

    
    /* <scalar_expression> */
    
    public static void SEXP() {
        if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
            SEXP3();
            SEXP2();
        }
    }
    
    private static void SEXP2() {
        if (TokenActual().get_token().equals("Mas") || TokenActual().get_token().equals("Menos")) {
            moverToken();
            SEXP3();
            SEXP2();
        }
    }
    
    private static void SEXP3() {
        if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
            SEXP5();
            SEXP4();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "parentesis de apertura, dato entero, dato float o una variable");
        }
    }
    
    private static void SEXP4() {
        if (TokenActual().get_token().equals("Multiplicacion") || TokenActual().get_token().equals("Division")) {
            moverToken();
            SEXP5();
            SEXP4();
        }
    }
    
    private static void SEXP5() {
        if (TokenActual().get_token().equals("ParentesisAbrir")) {
            moverToken();
            SEXP();
            if (!TokenActual().get_token().equals("ParentesisCerrar")) {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
            } else {
                moverToken();
            }
        } else if (TokenActual().get_token().equals("DatoEntero") || TokenActual().get_token().equals("DatoFloat")) {
            moverToken();
        } else if (TokenActual().get_token().equals("Arroba")) {
            moverToken();
            if (TokenActual().get_token().equals("Identificador")){
                moverToken();
            } else {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "nombre de variable");
            }
        } else if (TokenActual().get_token().equals("FINDELARCHIVO")) {
            setHasError(true);
            Errores.EOF("ScalarExpression.java");
        }
    }
    
    
}
