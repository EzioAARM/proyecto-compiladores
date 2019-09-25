/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Utilidades;

import MiniSql.Errores;
import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.getHasError;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;


/**
 *
 * @author axel
 */
public class ScalarExpression {

    
    public boolean Analizar() {
        if (!getHasError())
            return SEXP();
        return false;
    }
    
    public boolean SEXP() {
        SEXP3();
        SEXP2();
        return getHasError();
    }
    
    public void SEXP2() {
        if (!getHasError()) {
            if (TokenActual().get_token().equals("Mas") || TokenActual().get_token().equals("Menos")) {
                moverToken();
                SEXP3();
                SEXP2();
            }
        }
    }
    
    public void SEXP3() {
        if (!getHasError()) {
            if (TokenActual().get_token().equals("Multiplicacion") || TokenActual().get_token().equals("Division")) {
                moverToken();
                SEXP4();
                SEXP3();
            } else {
                if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                        || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba"))
                    SEXP4();
                if (TokenActual().get_token().equals("Multiplicacion") || TokenActual().get_token().equals("Division")) {
                    moverToken();
                    SEXP3();
                }
            }
        }
    }
    
    public void SEXP4() {
        if (!getHasError()) {
            if (TokenActual().get_token().equals("ParentesisAbrir")) {
                moverToken();
                SEXP();
                if (!TokenActual().get_token().equals("ParentesisCerrar")) {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
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
            } else {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "un número entero o float o una variable o un parentesis de cierre");
            }
        }
    }
    
}
