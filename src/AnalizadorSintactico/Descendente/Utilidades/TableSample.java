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
public class TableSample {
    
    public static void SAMCL() {
        if (TokenActual().get_token().equals("TABLESAMPLE")) {
            moverToken();
            if (TokenActual().get_token().equals("ParentesisAbrir")) {
                moverToken();
                SAMCL1();
                if (TokenActual().get_token().equals("ParentesisCerrar")) {
                    moverToken();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                }
            } else {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "parentesis de apertura");
            }
        }
    }
    
    private static void SAMCL1() {
        if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
            ScalarExpression.SEXP();
            SAMCL2();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "se esperaba expression");
        }
    }
    
    private static void SAMCL2() {
        switch (TokenActual().get_token()) {
            case "PERCENT":
                moverToken();
                break;
            case "ROWS":
                moverToken();
                break;
        }
    }
    
}
