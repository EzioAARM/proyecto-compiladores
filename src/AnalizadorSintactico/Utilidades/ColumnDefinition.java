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
public class ColumnDefinition {
    
    public static void COLDEF() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                DataType.DATATYPE();
                COLDEF1();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void COLDEF1() {
        switch (TokenActual().get_token()) {
            case "COLLATE":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        COLDEF2();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                COLDEF2();
                break;
        }
    }
    
    private static void COLDEF2() {
        switch (TokenActual().get_token()) {
            case "NULL":
                moverToken();
                COLDEF3();
                break;
            case "NOT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "NULL":
                        moverToken();
                        COLDEF3();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'NULL'");
                        break;
                }
                break;
            case "IDENTITY":
                moverToken();
                COLDEF6();
                break;
            default:
                COLDEF3();
                break;
        }
    }
    
    private static void COLDEF3() {
        switch (TokenActual().get_token()) {
            case "CONSTRAINT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        COLDEF10();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            case "PRIMARY":
                ColumnConstraint.COLCST();
                COLDEF11();
                break;
            case "UNIQUE":
                ColumnConstraint.COLCST();
                COLDEF11();
                break;
            case "CHECK":
                ColumnConstraint.COLCST();
                COLDEF11();
                break;
            case "FOREIGN":
                ColumnConstraint.COLCST();
                COLDEF11();
                break;
            case "REFERENCES":
                ColumnConstraint.COLCST();
                COLDEF11();
                break;
            default:
                COLDEF4();
                break;
        }
    }
    
    private static void COLDEF4() {
        switch (TokenActual().get_token()) {
            case "DEFAULT":
                moverToken();
                ConstantExpression.CONSTEXP();
                COLDEF5();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'DEFAULT'");
                break;
        }
    }
    
    private static void COLDEF5() {
        switch (TokenActual().get_token()) {
            case "WITH":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "VALUES":
                        moverToken();
                        COLDEF8();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'VALUES'");
                        break;
                }
                break;
            default:
                COLDEF8();
                break;
        }
    }
    
    private static void COLDEF6() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                ScalarExpression.SEXP();
                switch (TokenActual().get_token()) {
                    case "Coma":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "ParentesisCerrar":
                                moverToken();
                                COLDEF7();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "coma");
                        break;
                }
                break;
            default:
                COLDEF7();
                break;
        }
    }
    
    private static void COLDEF7() {
        switch (TokenActual().get_token()) {
            case "NOT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "FOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "REPLICATION":
                                moverToken();
                                COLDEF8();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "'REPLICATION'");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'FOR'");
                        break;
                }
                break;
            default:
                COLDEF8();
                break;
        }
    }
    
    private static void COLDEF8() {
        switch (TokenActual().get_token()) {
            case "ROWGUIDCOL":
                moverToken();
                COLDEF10();
                break;
            default:
                COLDEF10();
                break;
        }
    }
    
    private static void COLDEF10() {
        ColumnConstraint.COLCST();
        COLDEF11();
    }
    
    private static void COLDEF11() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                ColumnConstraint.COLCST();
                COLDEF11();
                break;
        }
    }
    
}
