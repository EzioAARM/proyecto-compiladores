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
public class AggregateFunctions {
    
    public boolean Analizar() {
        if (!getHasError())
            return AGGFN();
        return false;
    }
    
    public boolean AGGFN() {
        if (!getHasError()) {
            switch (TokenActual().get_token()) {
                case "AVG":
                    moverToken();
                    switch (TokenActual().get_token()) {
                        case "ParentesisAbrir":
                            moverToken();
                            SELAVG();
                            moverToken();
                            if (!TokenActual().get_token().equals("ParentesisCerrar")) {
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                            }
                            break;
                        default:
                            setHasError(true);
                            Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                            break;
                    }
                    break;
                case "COUNT":
                    moverToken();
                    switch (TokenActual().get_token()) {
                        case "ParentesisAbrir":
                            moverToken();
                            SELCOUNT();
                            moverToken();
                            if (!TokenActual().get_token().equals("ParentesisCerrar")) {
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                            }
                            break;
                        default:
                            setHasError(true);
                            Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                            break;
                    }
                    break;
                default:
                    if (TokenActual().get_token().equals("MAX") || TokenActual().get_token().equals("MIN") || TokenActual().get_token().equals("SUM")) {
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "ParentesisAbrir":
                                moverToken();
                                SELAGR();
                                moverToken();
                                if (!TokenActual().get_token().equals("ParentesisCerrar")) {
                                    setHasError(true);
                                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                                }
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                                break;
                        }
                    } else {
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "funcion de agregacion");
                    }
                    break;
            }
            
        }
        return getHasError();
    }
    
    public void SELAVG() {
        if (!getHasError()) {
            if (TokenActual().get_token().equals("ALL") || TokenActual().get_token().equals("DISTINCT") || TokenActual().get_token().equals("Identificador")
                    || TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                    || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
                SELAVG1();
                SELAVG2();
            } else {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'ALL', 'DISTINCT', nombre de columna o scalar expression");
            }
        }
    }
    
    public void SELAVG1() {
        if (!getHasError()) {
            if (TokenActual().get_token().equals("ALL") || TokenActual().get_token().equals("DISTINCT")) {
                moverToken();
            }      
        }
    }
    
    public void SELAVG2() {
        if (!getHasError()) {
            if (TokenActual().get_token().equals("Identificador")) {
                moverToken();
                SELAVG3();
            } else {
                ScalarExpression sexp = new ScalarExpression();
                if (sexp.Analizar()) {
                    SELAVG1();
                    SELAVG2();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "scalar expression");
                }
            }
        }
    }
    
    public void SELAVG3() {
        if (!getHasError()) {
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
    }
    
    public void SELCOUNT() {
        if (!getHasError()) {
            
        }
    }
    
    public void SELCOUNT1() {
        if (!getHasError()) {
            
        }
    }
    
    public void SELCOUNT2() {
        if (!getHasError()) {
            
        }
    }
    
    public void SELCOUNT3() {
        if (!getHasError()) {
            
        }
    }
    
    public void SELAGR() {
        if (!getHasError()) {
            
        }
    }
    
    public void SELAGR1() {
        if (!getHasError()) {
            
        }
    }
    
    public void SELAGR2() {
        if (!getHasError()) {
            
        }
    }
    
    public void SELAGR3() {
        if (!getHasError()) {
            
        }
    }
    
}
