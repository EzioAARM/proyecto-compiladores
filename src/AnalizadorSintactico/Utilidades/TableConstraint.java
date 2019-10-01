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
public class TableConstraint {
    
    public static void TBCST() {
        TBCST1();
        TBCST2();
    }
    
    private static void TBCST1() {
        switch (TokenActual().get_token()) {
            case "CONSTRAINT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        break;
                    case "CorcheteAbrir":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Identificador":
                                moverToken();
                                switch (TokenActual().get_token()) {
                                    case "CorcheteCerrar":
                                        moverToken();
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
                break;
        }
    }
    
    private static void TBCST2() {
        switch (TokenActual().get_token()) {
            case "PRIMARY":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "KEY":
                        moverToken();
                        TBCST24();
                        TBCST3();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'KEY'");
                        break;
                }
                break;
            case "UNIQUE":
                moverToken();
                TBCST3();
                break;
            case "CHECK":
                moverToken();
                TBCST15();
                break;
            case "FOREIGN":
                TBCST7();
                break;
            case "REFERENCES":
                TBCST7();
                break;
            case "CONNECTION":
                moverToken();
                TBCST17();
                break;
            case "DEFAULT":
                moverToken();
                TBCST18();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "tipo de constraint");
                break;
        }
    }
    
    private static void TBCST3() {
        switch (TokenActual().get_token()) {
            case "CLUSTERED":
                moverToken();
                TBCST4();
                break;
            case "NOCLUSTERED":
                moverToken();
                TBCST4();
                break;
            default:
                TBCST4();
                break;
        }
    }
    
    private static void TBCST4() {
        switch (TokenActual().get_token()) {
            case "WITH":
                moverToken();
                TBCST5();
                TBCST6();
                break;
            default:
                TBCST6();
                break;
        }
    }
    
    private static void TBCST5() {
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
    
    private static void TBCST6() {
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
    
    private static void TBCST7() {
        TBCST8();
        switch (TokenActual().get_token()) {
            case "REFERENCES":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        TBCST9();
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
    
    private static void TBCST8() {
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
                                        while (TokenActual().get_token().equals("Coma")) {
                                            moverToken();
                                            switch (TokenActual().get_token()) {
                                                case "Identificador":
                                                    moverToken();
                                                    break;
                                                default:
                                                    setHasError(true);
                                                    Errores.SyntaxError(TokenActual(), "identificador");
                                                    break;
                                            }
                                        }
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
    
    private static void TBCST9() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        TBCST10();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                TBCST10();
                break;
        }
    }
    
    private static void TBCST10() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        while (TokenActual().get_token().equals("Coma")) {
                            moverToken();
                            switch (TokenActual().get_token()) {
                                case "Identificador":
                                    moverToken();
                                    break;
                                default:
                                    setHasError(true);
                                    Errores.SyntaxError(TokenActual(), "identificador");
                                    break;
                            }
                        }
                        switch (TokenActual().get_token()) {
                            case "ParentesisCerrar":
                                moverToken();
                                TBCST11();
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
    }
    
    private static void TBCST11() {
        switch (TokenActual().get_token()) {
            case "ON":
                moverToken();
                TBCST12();
                TBCST13();
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
    
    private static void TBCST12() {
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
    
    private static void TBCST13() {
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
                TBCST14();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'NO ACTION', 'CASCADE', 'SET NULL|DEFAULT'");
                break;
        }
    }
    
    private static void TBCST14() {
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
    
    private static void TBCST15() {
        switch (TokenActual().get_token()) {
            case "NOT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "FOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "REPLICATION":
                                moverToken();
                                TBCST16();
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
                TBCST16();
                break;
        }
    }
    
    private static void TBCST16() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                Expression.EXPRESSION();
                switch (TokenActual().get_token()) {
                    case "ParentesisCerrar":
                        moverToken();
                        TBCST21();
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
    
    private static void TBCST17() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                TBCST19();
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
    
    private static void TBCST18() {
        switch (TokenActual().get_token()) {
            case "Arroba":
                ConstantExpression.CONSTEXP();
                switch (TokenActual().get_token()) {
                    case "FOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Identificador":
                                moverToken();
                                TBCST23();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "identificador");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'FOR'");
                        break;
                }
                break;
            case "Identificador":
                ConstantExpression.CONSTEXP();
                switch (TokenActual().get_token()) {
                    case "FOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Identificador":
                                moverToken();
                                TBCST23();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "identificador");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'FOR'");
                        break;
                }
                break;
            case "DatoEntero":
                ConstantExpression.CONSTEXP();
                switch (TokenActual().get_token()) {
                    case "FOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Identificador":
                                moverToken();
                                TBCST23();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "identificador");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'FOR'");
                        break;
                }
                break;
            case "DatoFloat":
                ConstantExpression.CONSTEXP();
                switch (TokenActual().get_token()) {
                    case "FOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Identificador":
                                moverToken();
                                TBCST23();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "identificador");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'FOR'");
                        break;
                }
                break;
            case "DatoString":
                ConstantExpression.CONSTEXP();
                switch (TokenActual().get_token()) {
                    case "FOR":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Identificador":
                                moverToken();
                                TBCST23();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "identificador");
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
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "constant_expression");
                break;
        }
    }
    
    private static void TBCST19() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "TO":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Identificador":
                                moverToken();
                                TBCST20();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "identificador");
                                break;
                        }
                        break;
                    default:
                        TBCST20();
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void TBCST20() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                TBCST19();
                break;
        }
    }
    
    private static void TBCST21() {
        switch (TokenActual().get_token()) {
            case "ON":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "DELETE":
                        moverToken();
                        TBCST22();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'DELETE'");
                        break;
                }
                break;
        }
    }
    
    private static void TBCST22() {
        switch (TokenActual().get_token()) {
            case "NO":
                moverToken();
                switch (TokenActual().get_token())  {
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
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'CASCADE' o 'NO ACTION'");
                break;
        }
    }
    
    private static void TBCST23() {
        switch (TokenActual().get_token()) {
            case "WITH":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "VALUES":
                        moverToken();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "VALUES");
                        break;
                }
                break;
        }
    }
    
    private static void TBCST24() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        TBCST25();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
        }
    }
    
    private static void TBCST25() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        TBCST25();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            case "ParentesisCerrar":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                break;
        }
    }
    
}
