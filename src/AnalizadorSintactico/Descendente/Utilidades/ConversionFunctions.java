/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Descendente.Utilidades;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class ConversionFunctions {
    
    public static void CONV() {
        switch (TokenActual().get_token()) {
            case "CAST":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        CONV1();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "CONVERT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        CONV2();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "funcion de conversión");
                break;
        }
    }
    
    private static void CONV1() {
        Expression.EXPRESSION();
        if (TokenActual().get_token().equals("AS")) {
            moverToken();
            DataType.DATATYPE();
            CONV3();
        }
    }
    
    private static void CONV2() {
        DataType.DATATYPE();
        CONV3();
        CONV4();
    }
    
    private static void CONV3() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "DatoEntero":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "ParentesisCerrar":
                                moverToken();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "dato entero");
                        break;
                }
                break;
        }
    }
    
    private static void CONV4() {
        if (TokenActual().get_token().equals("Coma")) {
            moverToken();
            Expression.EXPRESSION();
            CONV5();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "una coma");
        }
    }
    
    private static void CONV5() {
        switch (TokenActual().get_token()) {
            case "ParentesisCerrar":
                moverToken();
                break;
            case "Coma":
                moverToken();
                ScalarExpression.SEXP();
                if (TokenActual().get_token().equals("ParentesisCerrar")) {
                    moverToken();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                }
                break;
        }
    }
    
}
