/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.DML;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import AnalizadorSintactico.Utilidades.Expression;
import AnalizadorSintactico.Utilidades.JoinedTable;
import AnalizadorSintactico.Utilidades.Order;
import AnalizadorSintactico.Utilidades.ScalarExpression;
import AnalizadorSintactico.Utilidades.SearchCondition;
import AnalizadorSintactico.Utilidades.SelectList;
import MiniSql.Errores;


/**
 *
 * @author axel
 */
public class Select {
    
    public static void SELECT1() {
        switch (TokenActual().get_token()) {
            case "SELECT":
                moverToken();
                SELECT2();
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
                break;
        }
    }
    
    private static void SELECT2() {
        SELECT3();
        SELECT4();
    }
    
    private static void SELECT3() {
        switch (TokenActual().get_token()) {
            case "ALL":
                moverToken();
                break;
            case "DISTINCT":
                moverToken();
                break;
        }
    }
    
    private static void SELECT4() {
        switch (TokenActual().get_token()) {
            case "TOP":
                moverToken();
                SELECT5();
                break;
            default:
                SELECT7();
                break;
        }
    }
    
    private static void SELECT5() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                ScalarExpression.SEXP();
                switch (TokenActual().get_token()) {
                    case "ParentesisCerrar":
                        moverToken();
                        SELECT6();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                break;
        }
    }
    
    private static void SELECT6() {
        switch (TokenActual().get_token()) {
            case "PERCENT":
                moverToken();
                break;
        }
        SELECT7();
    }
    
    private static void SELECT7() {
        if (TokenActual().get_token().equals("COUNT") || TokenActual().get_token().equals("MIN") 
                || TokenActual().get_token().equals("MAX") || TokenActual().get_token().equals("SUM") 
                || TokenActual().get_token().equals("AVG") || TokenActual().get_token().equals("LOWER") 
                || TokenActual().get_token().equals("UPPER") || TokenActual().get_token().equals("CHAR") 
                || TokenActual().get_token().equals("LEFT") || TokenActual().get_token().equals("TRIM")
                || TokenActual().get_token().equals("NCHAR") || TokenActual().get_token().equals("RIGHT")
                || TokenActual().get_token().equals("SPACE") || TokenActual().get_token().equals("SUBSTRING")
                || TokenActual().get_token().equals("TRANSLATE") || TokenActual().get_token().equals("CURRENT_TIMESTAMP")  
                || TokenActual().get_token().equals("MONTH") || TokenActual().get_token().equals("YEAR") 
                || TokenActual().get_token().equals("SET") || TokenActual().get_token().equals("DAY") 
                || TokenActual().get_token().equals("CAST") || TokenActual().get_token().equals("CONVERT") 
                || TokenActual().get_token().equals("CASE") || TokenActual().get_token().equals("Identificador")
                || TokenActual().get_token().equals("DatoString") || TokenActual().get_token().equals("ParentesisAbrir") 
                || TokenActual().get_token().equals("DatoEntero") || TokenActual().get_token().equals("DatoFloat") 
                || TokenActual().get_token().equals("Arroba") || TokenActual().get_token().equals("Multiplicacion")) {
            SelectList.SELIST();
            SELECT19();
            SELECT8();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "select list");
        }
    }
    
    private static void SELECT8() {
        switch (TokenActual().get_token()) {
            case "INTO":
                moverToken();
                SELECT9();
                break;
            default:
                SELECT11();
                break;
        }
    }
    
    private static void SELECT9() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                SELECT10();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "nombre de tabla");
                break;
        }
    }
    
    private static void SELECT10() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        SELECT11();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                SELECT11();
                break;
        }
    }
    
    private static void SELECT11() {
        switch (TokenActual().get_token()) {
            case "FROM":
                moverToken();
                if (TokenActual().get_token().equals("Identificador") || TokenActual().get_token().equals("OPENDATASOURCE") 
                        || TokenActual().get_token().equals("OPENQUERY") || TokenActual().get_token().equals("Arroba")
                        || TokenActual().get_token().equals("ParentesisAbrir")) {
                    JoinedTable.JOINTB();
                    SELECT12();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "table source");
                }
                break;
            default:
                SELECT12();
                break;
        }
    }
    
    private static void SELECT12() {
        switch (TokenActual().get_token()) {
            case "WHERE":
                moverToken();
                Expression.EXPRESSION();
                SELECT13();
                break;
            default:
                SELECT13();
                break;
        }
    }
    
    private static void SELECT13() {
        switch (TokenActual().get_token()) {
            case "GROUP":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "BY":
                        moverToken();
                        SelectList.SELIST();
                        SELECT19();
                        SELECT18();
                        SELECT14();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'BY'");
                        break;
                }
                break;
            default:
                SELECT14();
                break;
        }
    }
    
    private static void SELECT14() {
        switch (TokenActual().get_token()) {
            case "HAVING":
                moverToken();
                SearchCondition.SEARCHC();
                SELECT15();
                break;
            default:
                SELECT15();
                break;
        }
    }
    
    private static void SELECT15() {
        switch (TokenActual().get_token()) {
            case "ORDER":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "BY":
                        moverToken();
                        Order.ORDER();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'BY'");
                        break;
                }
                break;
        }
    }
    
    private static void SELECT18() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                Expression.EXPRESSION();
                SELECT18();
                break;
        }
    }
    
    private static void SELECT19() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                SelectList.SELIST();
                SELECT19();
                break;
        }
    }
}
