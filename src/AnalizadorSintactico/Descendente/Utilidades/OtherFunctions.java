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
public class OtherFunctions {
    
    public static void OTHFN() {
        switch (TokenActual().get_token()) {
            case "NEXT":
                moverToken();
                if (TokenActual().get_token().equals("VALUE")) {
                    moverToken();
                    if (TokenActual().get_token().equals("FOR")) {
                        moverToken();
                        if (TokenActual().get_token().equals("Identificador")) {
                            moverToken();
                            OTHFN1();
                        } else {
                            setHasError(true);
                            Errores.SyntaxError(TokenActual(), "'FOR'");
                        }
                    } else {
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'VALUE'");
                    }
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "'NEXT'");
                }
                break;
            case "SYSTEM_USER":
                moverToken();
                break;
            case "SESSION_USER":
                moverToken();
                break;
            case "NULLIF":
                moverToken();
                if (TokenActual().get_token().equals("ParentesisAbrir")) {
                    moverToken();
                    Expression.EXPRESSION();
                    if (TokenActual().get_token().equals("Coma")) {
                        moverToken();
                        Expression.EXPRESSION();
                        if (TokenActual().get_token().equals("ParentesisCerrar")) {
                            moverToken();
                        } else {
                            setHasError(true);
                            Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                        }
                    } else {
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "una coma");
                    }
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "función");
                break;
        }
    }
    
    private static void OTHFN1() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                if (TokenActual().get_token().equals("Identificador")) {
                    moverToken();
                    OTHFN2();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "identificador");
                }
                break;
            default:
                OTHFN2();
                break;
        }
    }
    
    private static void OTHFN2() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                if (TokenActual().get_token().equals("Identificador")) {
                    moverToken();
                    OTHFN3();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "identificador");
                }
                break;
            default:
                OTHFN3();
                break;
        }
    }
    
    private static void OTHFN3() {
        if (TokenActual().get_token().equals("OVER")) {
            moverToken();
            if (TokenActual().get_token().equals("ORDER")) {
                moverToken();
                if (TokenActual().get_token().equals("BY")) {
                    moverToken();
                    Order.ORDER();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "'BY'");
                }
            } else {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'ORDER'");
            }
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "'OVER'");
        }
    }
    
}
