/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Descendente.DDL;

import static AnalizadorSintactico.Descendente.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.Descendente.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.Descendente.AnalizadorSintactico.setHasError;
import AnalizadorSintactico.Descendente.DML.Select;
import AnalizadorSintactico.Descendente.Utilidades.ColumnDefinition;
import AnalizadorSintactico.Descendente.Utilidades.ObjectExp;
import AnalizadorSintactico.Descendente.Utilidades.TableConstraint;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class Alter {
    
    public static void ALTER() {
        switch (TokenActual().get_token()) {
            case "ALTER":
                moverToken();
                ALTER1();
                break;
        }
    }
    
    private static void ALTER1() {
        switch (TokenActual().get_token()) {
            case "VIEW":
                moverToken();
                ALTER2();
                break;
            case "TABLE":
                moverToken();
                ObjectExp.OBJECT();
                ALTER6();
                break;
            case "USER":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        ALTER17();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            case "DATABASE":
                moverToken();
                ALTER22();
                ALTER23();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "tipo de objeto");
                break;
        }
    }
    
    private static void ALTER2() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                ALTER3();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void ALTER3() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        ALTER4();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                ALTER4();
                break;
        }
    }
    
    private static void ALTER4() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        ALTER5();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            case "AS":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "SELECT":
                        Select.SELECT1();
                        ALTER24();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "select_statement");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'AS'");
                break;
        }
    }
    
    private static void ALTER5() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        ALTER5();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            case "ParentesisCerrar":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "AS":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "SELECT":
                                Select.SELECT1();
                                ALTER24();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "select_statement");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'AS'");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                break;
        }
    }
    
    private static void ALTER6() {
        switch (TokenActual().get_token()) {
            case "ALTER":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "COLUMN":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Identificador":
                                moverToken();
                                ALTER7();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "identificador");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'COLUMN'");
                        break;
                }
                break;
            case "ADD":
                moverToken();
                ALTER15();
                break;
            case "DROP":
                moverToken();
                ALTER18();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'ALTER', 'ADD' o 'DROP'");
                break;
        }
    }
    
    private static void ALTER7() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                ALTER8();
                ALTER9();
                break;
            case "ADD":
                ALTER14();
                break;
            case "DROP":
                ALTER14();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador, 'ADD' o 'DROP'");
                break;
        }
    }
    
    private static void ALTER8() {
        switch (TokenActual().get_token()) {
            case "Punto":
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
                break;
        }
    }
    
    private static void ALTER9() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "DatoEntero":
                        moverToken();
                        ALTER10();
                        switch (TokenActual().get_token()) {
                            case "ParentesisCerrar":
                                moverToken();
                                ALTER11();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "parentesis de cierre");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "dato entero");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                break;
        }
    }
    
    private static void ALTER10() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "DatoEntero":
                        moverToken();
                        break;
                }
                break;
        }
    }
    
    private static void ALTER11() {
        switch (TokenActual().get_token()) {
            case "COLLATE":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        ALTER12();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                ALTER12();
                break;
        }
    }
    
    private static void ALTER12() {
        ALTER13();
    }
    
    private static void ALTER13() {
        switch (TokenActual().get_token()) {
            case "NULL":
                moverToken();
                break;
            case "NOT":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "NULL":
                        moverToken();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'NULL'");
                        break;
                }
                break;
        }
    }
    
    private static void ALTER14() {
        switch (TokenActual().get_token()) {
            case "ROWGUIDCOL":
                moverToken();
                break;
            case "NOT":
                moverToken();
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
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'ROWGUIDCOL' o 'NOT FOR REPLICATION'");
                break;
        }
    }
    
    private static void ALTER15() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                ColumnDefinition.COLDEF();
                ALTER16();
                break;
            case "PRIMARY":
                TableConstraint.TBCST();
                ALTER16();
                break;
            case "UNIQUE":
                TableConstraint.TBCST();
                ALTER16();
                break;
            case "CHECK":
                TableConstraint.TBCST();
                ALTER16();
                break;
            case "FOREIGN":
                TableConstraint.TBCST();
                ALTER16();
                break;
            case "REFERENCES":
                TableConstraint.TBCST();
                ALTER16();
                break;
            case "CONSTRAINT":
                TableConstraint.TBCST();
                ALTER16();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "tipo de constraint o identificador");
                break;
        }
    }
    
    private static void ALTER16() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                ALTER15();
                break;
            default:
                ALTER17();
                break;
        }
    }
    
    private static void ALTER17() {
        switch (TokenActual().get_token()) {
            case "PuntoComa":
                moverToken();
                break;
            case "GO":
                moverToken();
                break;
        }
    }
    
    private static void ALTER18() {
        switch (TokenActual().get_token()) {
            case "CONSTRAINT":
                moverToken();
                ALTER19();
                break;
            case "COLUMN":
                moverToken();
                ALTER19();
                break;
            default:
                ALTER19();
                break;
        }
    }
    
    private static void ALTER19() {
        switch (TokenActual().get_token()) {
            case "IF":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "EXISTS":
                        moverToken();
                        ALTER20();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'EXISTS'");
                        break;
                }
                break;
            default:
                ALTER20();
                break;
        }
    }
    
    private static void ALTER20() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                ALTER21();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void ALTER21() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                ALTER20();
                break;
            default:
                ALTER17();
                break;
        }
    }
    
    private static void ALTER22() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                break;
            case "CURRENT":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void ALTER23() {
        switch (TokenActual().get_token()) {
            case "COLLATE":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        ALTER17();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
        }
    }
    
    private static void ALTER24() {
        switch (TokenActual().get_token()) {
            case "WITH":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "CHECK":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "OPTION":
                                moverToken();
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "'OPTION'");
                                break;
                        }
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'CHECK'");
                        break;
                }
                break;
        }
    }
    
}
