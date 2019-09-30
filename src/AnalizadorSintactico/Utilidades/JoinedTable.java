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
public class JoinedTable {
    
    public static void JOINTB() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                TableSource.TBSOURCE();
                JOINTB1();
                break;
            case "OPENDATASOURCE":
                TableSource.TBSOURCE();
                JOINTB1();
                break;
            case "OPENQUERY":
                TableSource.TBSOURCE();
                JOINTB1();
                break;
            case "Arroba":
                TableSource.TBSOURCE();
                JOINTB1();
                break;
            case "ParentesisAbrir":
                moverToken();
                JOINTB();
                if (TokenActual().get_token().equals("ParentesisCerrar")) {
                    moverToken();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                }
                break;
        }
    }
    
    private static void JOINTB1() {
        switch (TokenActual().get_token()) {
            case "CROSS":
                moverToken();
                switch (TokenActual().get_token()){
                    case "JOIN":
                        moverToken();
                        JOINTB4();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'JOIN'");
                        break;
                }
                break;
            default:
                if (TokenActual().get_token().equals("INNER") || TokenActual().get_token().equals("LEFT") 
                || TokenActual().get_token().equals("RIGHT") || TokenActual().get_token().equals("FULL")
                || TokenActual().get_token().equals("JOIN")) {
                    JoinType.JOINTYPE();
                    JOINTB3();
                }
                break;
        }
    }
    
    private static void JOINTB2() {
        switch (TokenActual().get_token()) {
            case "CROSS":
                moverToken();
                switch (TokenActual().get_token()){
                    case "JOIN":
                        moverToken();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'JOIN'");
                        break;
                }
                break;
            default:
                if (TokenActual().get_token().equals("INNER") || TokenActual().get_token().equals("LEFT") 
                || TokenActual().get_token().equals("RIGHT") || TokenActual().get_token().equals("FULL")
                || TokenActual().get_token().equals("JOIN")) {
                    JoinType.JOINTYPE();
                    JOINTB3();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "sentencia join");
                }
                break;
        }
    }
    
    private static void JOINTB3() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                TableSource.TBSOURCE();
                switch (TokenActual().get_token()) {
                    case "ON":
                        moverToken();
                        Expression.EXPRESSION();
                        JOINTB4();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'ON'");
                        break;
                }
                break;
            case "OPENDATASOURCE":
                TableSource.TBSOURCE();
                switch (TokenActual().get_token()) {
                    case "ON":
                        moverToken();
                        Expression.EXPRESSION();
                        JOINTB4();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'ON'");
                        break;
                }
                break;
            case "OPENQUERY":
                TableSource.TBSOURCE();
                switch (TokenActual().get_token()) {
                    case "ON":
                        moverToken();
                        Expression.EXPRESSION();
                        JOINTB4();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'ON'");
                        break;
                }
                break;
            case "Arroba":
                TableSource.TBSOURCE();
                switch (TokenActual().get_token()) {
                    case "ON":
                        moverToken();
                        Expression.EXPRESSION();
                        JOINTB4();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'ON'");
                        break;
                }
                break;
            case "ParentesisAbrir":
                moverToken();
                JOINTB();
                if (TokenActual().get_token().equals("ParentesisCerrar")) {
                    moverToken();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "table_source o parentesis");
                break;
        }
    }
    
    private static void JOINTB4() {
        if (TokenActual().get_token().equals("INNER") || TokenActual().get_token().equals("LEFT") 
                || TokenActual().get_token().equals("RIGHT") || TokenActual().get_token().equals("FULL")
                || TokenActual().get_token().equals("JOIN") || TokenActual().get_token().equals("CROSS")) {
            JOINTB2();
        }
    }
    
}
