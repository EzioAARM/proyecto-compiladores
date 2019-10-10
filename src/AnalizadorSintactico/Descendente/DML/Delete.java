/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Descendente.DML;

import static AnalizadorSintactico.Descendente.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.Descendente.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.Descendente.AnalizadorSintactico.setHasError;
import AnalizadorSintactico.Descendente.Utilidades.Expression;
import AnalizadorSintactico.Descendente.Utilidades.JoinedTable;
import AnalizadorSintactico.Descendente.Utilidades.ObjectExp;
import AnalizadorSintactico.Descendente.Utilidades.OutputClause;
import AnalizadorSintactico.Descendente.Utilidades.ScalarExpression;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class Delete {
    
    public static void DELETE1() {
        switch (TokenActual().get_token()) {
            case "DELETE":
                moverToken();
                DEL2();
                break;
        }
    }
    
    private static void DEL2() {
        switch (TokenActual().get_token()) {
            case "TOP":
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
                                    DEL3();
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
            default:
                DEL4();
                break;
        }
    }
    
    private static void DEL3() {
        switch (TokenActual().get_token()) {
            case "PERCENT":
                moverToken();
                break;
        }
        DEL4();
    }
    
    private static void DEL4() {
        switch (TokenActual().get_token()) {
            case "FROM":
                moverToken();
                break;
        }
        DEL5();
    }
    
    private static void DEL5() {
        switch (TokenActual().get_token()) {
            case "Arroba":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        DEL6();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            case "Identificador":
                ObjectExp.OBJECT();
                DEL6();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador o arroba");
                break;
        }
    }
    
    private static void DEL6() {
        switch (TokenActual().get_token()) {
            case "OUTPUT":
                OutputClause.OUTCL();
                break;
        }
        DEL7();
    }
    
    private static void DEL7() {
        switch (TokenActual().get_token()) {
            case "FROM":
                moverToken();
                if (TokenActual().get_token().equals("Identificador") || TokenActual().get_token().equals("OPENDATASOURCE") 
                        || TokenActual().get_token().equals("OPENQUERY") || TokenActual().get_token().equals("Arroba")
                        || TokenActual().get_token().equals("ParentesisAbrir")) {
                    JoinedTable.JOINTB();
                    DEL8();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "table_source");
                }
                break;
            default:
                DEL9();
                break;
        }
    }
    
    private static void DEL8() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                if (TokenActual().get_token().equals("Identificador") || TokenActual().get_token().equals("OPENDATASOURCE") 
                        || TokenActual().get_token().equals("OPENQUERY") || TokenActual().get_token().equals("Arroba")
                        || TokenActual().get_token().equals("ParentesisAbrir")) {
                    JoinedTable.JOINTB();
                    DEL8();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "table_source");
                }
                break;
            default:
                DEL9();
                break;
        }
    }
    
    private static void DEL9() {
        switch (TokenActual().get_token()) {
            case "WHERE":
                moverToken();
                Expression.EXPRESSION();
                break;
        }
        DEL10();
    }
    
    private static void DEL10() {
        switch (TokenActual().get_token()) {
            case "PuntoComa":
                moverToken();
                break;
            case "GO":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "fin de instrucción");
                break;
        }
    }
    
}
