/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.DML;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import AnalizadorSintactico.Utilidades.ColumnList;
import AnalizadorSintactico.Utilidades.Expression;
import AnalizadorSintactico.Utilidades.ObjectExp;
import AnalizadorSintactico.Utilidades.OutputClause;
import AnalizadorSintactico.Utilidades.ScalarExpression;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class Insert {
    
    public static void INSERT() {
        switch (TokenActual().get_token()) {
            case "INSERT":
                moverToken();
                INSERT1();
                break;
        } 
    }
    
    private static void INSERT1() {
        switch (TokenActual().get_token()) {
            case "TOP":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        ScalarExpression.SEXP();
                        switch (TokenActual().get_token()) {
                            case "ParentesisCerrar":
                                moverToken();
                                INSERT2();
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
            case "INTO":
                INSERT3();
                break;
            case "Identificador":
                INSERT3();
                break;
            
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'TOP', 'INTO' o identificador");
                break;
        }
    }
    
    private static void INSERT2() {
        switch (TokenActual().get_token()) {
            case "PERCENT":
                moverToken();
                break;
        }
        INSERT3();
    }
    
    private static void INSERT3() {
        switch (TokenActual().get_token()) {
            case "INTO":
                moverToken();
                break;
        }
        INSERT4();
    }
    
    private static void INSERT4() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                ObjectExp.OBJECT();
                INSERT5();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void INSERT5() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                ColumnList.COLST();
                break;
        }
        INSERT6();
    }
    
    private static void INSERT6() {
        switch (TokenActual().get_token()) {
            case "OUTPUT":
                OutputClause.OUTCL();
                break;
        }
        INSERT7();
    }
    
    private static void INSERT7() {
        switch (TokenActual().get_token()) {
            case "VALUES":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        INSERT8();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            case "DEFAULT":
                moverToken();
                 switch (TokenActual().get_token()) {
                    case "VALUES":
                        moverToken();
                        INSERT9();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "VALUES");
                        break;
                 }
                break;
            case "SELECT":
                Select.SELECT1();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "column_list, OUTPUT, VALUES, DEFAULT, SELECT");
                break;
        }
    }
    
    private static void INSERT8() {
        INSERT10();
        INSERT11();
    }
    
    private static void INSERT9() {
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
    
    private static void INSERT10() {
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
    
    private static void INSERT11() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                INSERT8();
                break;
            case "ParentesisCerrar":
                moverToken();
                INSERT12();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                break;
        }
    }
    
    private static void INSERT12() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        INSERT8();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                        break;
                }
                break;
            default:
                INSERT9();
                break;
        }
    }
    
}
