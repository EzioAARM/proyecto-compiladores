/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Descendente.DML;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
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
public class Update {
    
    public static void UPDATE() {
        switch (TokenActual().get_token()) {
            case "UPDATE":
                moverToken();
                UPDATE1();
                break;
        }
    }
    
    private static void UPDATE1() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                UPDATE3();
                break;
            case "Arroba":
                UPDATE3();
                break;
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
                                    UPDATE2();
                                    UPDATE3();
                                    break;
                                default:
                                    setHasError(true);
                                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                                    break;
                            }
                        } else {
                            setHasError(true);
                            Errores.SyntaxError(TokenActual(), "parentesis de apertura, dato entero, dato float o variable");
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
                Errores.SyntaxError(TokenActual(), "'TOP', objeto o variable");
                break;
        }
    }
    
    private static void UPDATE2() {
        switch (TokenActual().get_token()) {
            case "PERCENT":
                moverToken();
                break;
        }
    }
    
    private static void UPDATE3() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                ObjectExp.OBJECT();
                UPDATE4();
                break;
            case "Arroba":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        UPDATE4();
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "objeto o variable");
                break;
        }
    }
    
    private static void UPDATE4() {
        switch (TokenActual().get_token()) {
            case "SET":
                moverToken();
                UPDATE5();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'SET'");
                break;
        }
    }
    
    private static void UPDATE5() {
        UPDATE6();
        UPDATE11();
    }
    
    private static void UPDATE6() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                UPDATE7();
                break;
            case "Arroba":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Igual":
                                moverToken();
                                UPDATE10();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "signo igual");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "nombre de variable");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador o variable");
                break;
        }
    }
    
    private static void UPDATE7() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                UPDATE8();
                break;
            case "Igual":
                moverToken();
                UPDATE9();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "punto o igual");
                break;
        }
    }
    
    private static void UPDATE8() {
        System.out.print(TokenActual().get_token());
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Igual":
                        moverToken();
                        UPDATE10();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "signo igual");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void UPDATE9() {
        switch (TokenActual().get_token()) {
            case "DEFAULT":
                moverToken();
                break;
            case "NULL":
                moverToken();
                break;
            default:
                Expression.EXPRESSION();
                break;
        }
    }
    
    private static void UPDATE10() {
        Expression.EXPRESSION();
    }
    
    private static void UPDATE11() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                UPDATE5();
                break;
            default:
                UPDATE12();
                UPDATE15();
                break;
        }
    }
    
    private static void UPDATE12() {
        switch (TokenActual().get_token()) {
            case "OUTPUT":
                OutputClause.OUTCL();
                break;
        }
        UPDATE16();
    }
    
    private static void UPDATE16() {
        switch (TokenActual().get_token()) {
            case "FROM":
                moverToken();
                UPDATE13();
                break;
        }
        UPDATE17();
    }
    
    private static void UPDATE17() {
        switch (TokenActual().get_token()) {
            case "WHERE":
                moverToken();
                Expression.EXPRESSION();
                break;
        }
            
    }
    
    private static void UPDATE13() {
        if (TokenActual().get_token().equals("Identificador") || TokenActual().get_token().equals("OPENDATASOURCE") 
                || TokenActual().get_token().equals("OPENQUERY") || TokenActual().get_token().equals("Arroba")
                || TokenActual().get_token().equals("ParentesisAbrir")) {
            JoinedTable.JOINTB();
            UPDATE14();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "table_source");
        }
    }
    
    private static void UPDATE14() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                UPDATE13();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "table_source");
                break;
        }
    }
    
    private static void UPDATE15() {
        switch (TokenActual().get_token()) {
            case "GO":
                moverToken();
                break;
            case "PuntoComa":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "fin de instrucción");
                break;
        }
    }
    
}
