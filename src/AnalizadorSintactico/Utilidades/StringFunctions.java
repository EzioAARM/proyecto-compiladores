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
public class StringFunctions {
    
    public static void STRFN() {
        switch (TokenActual().get_token()) {
            case "LOWER":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        STRFN1();
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
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "TRANSLATE":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        STRFN1();
                        switch (TokenActual().get_token()) {
                            case "Coma":
                                moverToken();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "coma");
                                break;
                        }
                        STRFN1();
                        switch (TokenActual().get_token()) {
                            case "Coma":
                                moverToken();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "coma");
                                break;
                        }
                        STRFN1();
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
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "UPPER":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        STRFN1();
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
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "CHAR":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
                            ScalarExpression.SEXP();
                            switch (TokenActual().get_token()) {
                                case "ParentesisCerrar":
                                    moverToken();
                                    break;
                                default:
                                    setHasError(true);
                                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                                    break;
                            }
                        } else {
                            setHasError(true);
                            Errores.SyntaxError(TokenActual(), "scalar expression");
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "LEFT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        STRFN1();
                        switch (TokenActual().get_token()) {
                            case "Coma":
                                moverToken();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "coma");
                                break;
                        }
                        ScalarExpression.SEXP();
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
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "TRIM":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        STRFN1();
                        STRFN2();
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
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "NCHAR":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        ScalarExpression.SEXP();
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
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "RIGHT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        STRFN1();
                        switch (TokenActual().get_token()) {
                            case "Coma":
                                moverToken();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "coma");
                                break;
                        }
                        ScalarExpression.SEXP();
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
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "SPACE":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        ScalarExpression.SEXP();
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
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "SUBSTRING":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        STRFN1();
                        switch (TokenActual().get_token()) {
                            case "Coma":
                                moverToken();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "coma");
                                break;
                        }
                        ScalarExpression.SEXP();
                        switch (TokenActual().get_token()) {
                            case "Coma":
                                moverToken();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "coma");
                                break;
                        }
                        ScalarExpression.SEXP();
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
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "función de cadena");
                break;
        }
    }
    
    private static void STRFN1() {
        switch (TokenActual().get_token()) {
            case "Arroba":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            case "Identificador":
                moverToken();
                break;
            case "DatoString":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "variable, nombre de columa o dato string");
                break;
        }
    }
    
    private static void STRFN2() {
        if (TokenActual().get_token().equals("FROM")) {
            moverToken();
            if (TokenActual().get_token().equals("Arroba") || TokenActual().get_token().equals("Identificador") || TokenActual().get_token().equals("DatoString")) {
                STRFN1();
            }
        }
        
    }
    
}
