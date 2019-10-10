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
public class Rowset {
    
    public static void ROWSET() {
        switch (TokenActual().get_token()) {
            case "OPENDATASOURCE":
                moverToken();
                if (TokenActual().get_token().equals("ParentesisAbrir")) {
                    moverToken();
                    if (TokenActual().get_token().equals("DatoString")) {
                        moverToken();
                        if (TokenActual().get_token().equals("Coma")) {
                            moverToken();
                            if (TokenActual().get_token().equals("DatoString")) {
                                moverToken();
                                if (TokenActual().get_token().equals("ParentesisCerrar")) {
                                    moverToken();
                                } else {
                                    setHasError(true);
                                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                                }
                            } else {
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "string");
                            }
                        } else {
                            setHasError(true);
                            Errores.SyntaxError(TokenActual(), "coma");
                        }
                    } else {
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "string");
                    }
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                }
                break;
            case "OPENQUERY":
                moverToken();
                if (TokenActual().get_token().equals("ParentesisAbrir")) {
                    moverToken();
                    if (TokenActual().get_token().equals("Identificador")) {
                        moverToken();
                        if (TokenActual().get_token().equals("Coma")) {
                            moverToken();
                            if (TokenActual().get_token().equals("DatoString")) {
                                moverToken();
                                if (TokenActual().get_token().equals("ParentesisCerrar")) {
                                    moverToken();
                                } else {
                                    setHasError(true);
                                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                                }
                            } else {
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "string");
                            }
                        } else {
                            setHasError(true);
                            Errores.SyntaxError(TokenActual(), "coma");
                        }
                    } else {
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                    }
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                }
                break;
        }
    }
    
}
