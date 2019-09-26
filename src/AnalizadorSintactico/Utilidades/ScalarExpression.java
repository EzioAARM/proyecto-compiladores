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
import static AnalizadorSintactico.Utilidades.Utilidades.regresarGramaticaAnterior;
import java.util.List;


/**
 *
 * @author axel
 */
public class ScalarExpression {

    private boolean CaracterFinal;
    private boolean OmitirError;
    private List<String> Continuacion;
    
    public boolean Analizar(boolean omitirError, List<String> siguientes) {
        OmitirError = omitirError;
        Continuacion = siguientes;
        CaracterFinal = false;
        return SEXP() || CaracterFinal;
    }
    
    public boolean SEXP() {
        if (!getHasError() && OmitirError) {
            if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                    || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
                SEXP3();
                SEXP2();
            } else {
                if (!OmitirError) {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "un número entero o float o una variable o un parentesis de apertura");
                }
            }
        }
        return !getHasError();
    }
    
    public void SEXP2() {
        if (!getHasError() && OmitirError) {
            if (TokenActual().get_token().equals("Mas") || TokenActual().get_token().equals("Menos")) {
                moverToken();
                SEXP3();
                SEXP2();
            }
        }
    }
    
    public void SEXP3() {
        if (!getHasError() && OmitirError) {
            if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                    || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
                SEXP5();
                SEXP4();
            } else {
                if (!OmitirError) {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "un número entero o float o una variable o un parentesis de apertura");
                }
            }
        }
    }
    
    public void SEXP4() {
        if (!getHasError() && OmitirError) {
            if (TokenActual().get_token().equals("Multiplicacion") || TokenActual().get_token().equals("Division")) {
                moverToken();
                SEXP5();
                SEXP4();
            }
        }
    }
    
    public void SEXP5() {
        if (!getHasError() && OmitirError) {
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
            } else {
                if (!OmitirError) {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "un número entero o float o una variable o un parentesis de cierre");
                }
                CaracterFinal = regresarGramaticaAnterior(TokenActual().get_token(), Continuacion);
            }
        }
    }
    
}
