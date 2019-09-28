/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Utilidades;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import MiniSql.Errores;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.getHasError;
import static AnalizadorSintactico.AnalizadorSintactico.regresarToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import static AnalizadorSintactico.Utilidades.Utilidades.regresarGramaticaAnterior;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author axel
 */
public class AggregateFunctions {
    
    public void AGGFN() {
        switch (TokenActual().get_token()) {
            case "AVG":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        SELAVG();
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
                if (TokenActual().get_token().equals("MIN") || TokenActual().get_token().equals("MAX") || TokenActual().get_token().equals("SUM")) {
                    moverToken();
                    switch (TokenActual().get_token()) {
                        case "ParentesisAbrir":
                            moverToken();
                            SELAGR();
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
                    Errores.SyntaxError(TokenActual(), "función de agregación");
                }
                break;
        }
    }
    
    public void SELAVG() {
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
    
    public void SELAVG1() {
        if (TokenActual().get_token().equals("ALL") || TokenActual().get_token().equals("DISTINCT")) {
            moverToken();
        }
    }
    
    public void SELAVG2() {
        if (TokenActual().get_token().equals("Identificador") ) {
            moverToken();
            SELAVG3();
        } else if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
            //SEXP();
        } else{
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "nombre de columna o scalar expression");
        }
    }
    
    public void SELAVG3() {
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
    
    public void SELCOUNT() {
        if (TokenActual().get_token().equals("ALL") || TokenActual().get_token().equals("DISTINCT") || TokenActual().get_token().equals("Identificador")
                || TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba") || TokenActual().get_token().equals("Multiplicacion")) {
            SELCOUNT1();
            SELCOUNT2();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "'ALL' o 'DISTINCT' o un identificador o una scalar expression");
        }
    }
    
    public void SELCOUNT1() {
        if (TokenActual().get_token().equals("ALL") || TokenActual().get_token().equals("DISTINCT")) {
            moverToken();
        }
    }
    
    public void SELCOUNT2() {
        if (TokenActual().get_token().equals("Identificador")) {
            moverToken();
            SELCOUNT3();
        } else if (TokenActual().get_token().equals("Multiplicacion")) {
            moverToken();
        } else if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
            //SEXP();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "scalar expression");
        }
    }
    
    public void SELCOUNT3() {
        if (TokenActual().get_token().equals("Punto")) {
            moverToken();
            if (TokenActual().get_token().equals("Identificador")) {
                moverToken();
            }
        }
    }
    
    public void SELAGR() {
        if (TokenActual().get_token().equals("ALL") || TokenActual().get_token().equals("DISTINCT") || TokenActual().get_token().equals("Identificador")
                || TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
            SELAGR1();
            SELAGR2();
        }
    }
    
    public void SELAGR1() {
        if (TokenActual().get_token().equals("ALL") || TokenActual().get_token().equals("DISTINCT")) {
            moverToken();
        }
    }
    
    public void SELAGR2() {
        if (TokenActual().get_token().equals("Identificador")) {
            moverToken();
            SELAGR3();
        } else if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
            //SEXP();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "scalar expression");
        }
    }
    
    public void SELAGR3() {
        if (TokenActual().get_token().equals("Punto")) {
            moverToken();
            if (TokenActual().get_token().equals("Identificador")) {
                moverToken();
            }
        }
    }
    
}
