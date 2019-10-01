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
public class ColumnConstraint {
    
    public static void COLCST() {
        COLCST2();
    }
    
    private static void COLCST2() {
        switch (TokenActual().get_token()) {
            case "PRIMARY":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "KEY":
                        moverToken();
                        COLCST3();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'KEY'");
                        break;
                }
                break;
            case "UNIQUE":
                moverToken();
                COLCST3();
                break;
            case "CHECK":
                moverToken();
                COLCST15();
                break;
            case "FOREIGN":
                COLCST7();
                break;
            case "REFERENCES":
                COLCST7();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "tipo de constraint");
                break;
        }
    }
    
    private static void COLCST3() {
        switch (TokenActual().get_token()) {
            case "CLUSTERED":
                moverToken();
                COLCST4();
                break;
            case "NOCLUSTERED":
                moverToken();
                COLCST4();
                break;
            default:
                COLCST4();
                break;
        }
    }
    
    private static void COLCST4() {
        switch (TokenActual().get_token()) {
            case "WITH":
                moverToken();
                COLCST5();
                COLCST6();
                break;
            default:
                COLCST6();
                break;
        }
    }
    
    private static void COLCST5() {
        switch (TokenActual().get_token()) {
            case "FILLFACTOR":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Igual":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "DatoEntero":
                                moverToken();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "dato entero");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "signo igual");
                        break;
                }
                break;
            case "ParentesisAbrir":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "FILLFACTOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Igual":
                                moverToken();
                                switch (TokenActual().get_token()) {
                                    case "DatoEntero":
                                        moverToken();
                                        break;
                                    default:
                                        setHasError(true);
                                        Errores.SyntaxError(TokenActual(), "dato entero");
                                        break;
                                }
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "signo igual");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'FILLFACTOR'");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "arentesis de apertura o 'FILLFACTOR'");
                break;
        }
    }
    
    private static void COLCST6() {
        switch (TokenActual().get_token()) {
            case "ON":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "ParentesisAbrir":
                                moverToken();
                                switch (TokenActual().get_token()) {
                                    case "Identificador":
                                        moverToken();
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
                                        Errores.SyntaxError(TokenActual(), "identificador");
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
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
        }
    }
    
    private static void COLCST7() {
        COLCST8();
        switch (TokenActual().get_token()) {
            case "REFERENCES":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        COLCST9();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'REFERENCES'");
                break;
        }
    }
    
    private static void COLCST8() {
        switch (TokenActual().get_token()) {
            case "FOREIGN":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "KEY":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "ParentesisAbrir":
                                moverToken();
                                switch (TokenActual().get_token()) {
                                    case "Identificador":
                                        moverToken();
                                        switch (TokenActual().get_token()) {
                                            case "ParentesisCerrar":
                                                moverToken();
                                                break;
                                            default:
                                                setHasError(true);
                                                Errores.SyntaxError(TokenActual(), "parentesis de cierre'");
                                                break;
                                        }
                                        break;
                                    default:
                                        setHasError(true);
                                        Errores.SyntaxError(TokenActual(), "identificador");
                                        break;
                                }
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'KEY'");
                        break;
                }
                break;
        }
    }
    
    private static void COLCST9() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        COLCST10();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                COLCST10();
                break;
        }
    }
    
    private static void COLCST10() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "ParentesisCerrar":
                                moverToken();
                                COLCST11();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void COLCST11() {
        switch (TokenActual().get_token()) {
            case "ON":
                moverToken();
                COLCST12();
                COLCST13();
                break;
            case "NOT":
                switch (TokenActual().get_token()) {
                    case "FOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "REPLICATION":
                                moverToken();
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
        }
    }
    
    private static void COLCST12() {
        switch (TokenActual().get_token()) {
            case "DELETE":
                moverToken();
                break;
            case "UPDATE":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "acción");
                break;
        }
    }
    
    private static void COLCST13() {
        switch (TokenActual().get_token()) {
            case "NO":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ACTION":
                        moverToken();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'ACTION'");
                        break;
                }
                break;
            case "CASCADE":
                moverToken();
                break;
            case "SET":
                moverToken();
                COLCST14();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'NO ACTION', 'CASCADE', 'SET NULL|DEFAULT'");
                break;
        }
    }
    
    private static void COLCST14() {
        switch (TokenActual().get_token()) {
            case "NULL":
                moverToken();
                break;
            case "DEFAULT":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'NULL' o 'DEFAULT'");
                break;
        }
    }
    
    private static void COLCST15() {
        switch (TokenActual().get_token()) {
            case "NOT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "FOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "REPLICATION":
                                moverToken();
                                COLCST16();
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
                COLCST16();
                break;
        }
    }
    
    private static void COLCST16() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                Expression.EXPRESSION();
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
    }
    
}
