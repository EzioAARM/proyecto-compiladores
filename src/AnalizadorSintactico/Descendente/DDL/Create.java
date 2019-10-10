/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.DDL;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import AnalizadorSintactico.DML.Select;
import AnalizadorSintactico.Utilidades.ColumnDefinition;
import AnalizadorSintactico.Utilidades.ObjectExp;
import AnalizadorSintactico.Utilidades.TableConstraint;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class Create {
    
    public static void CREATE() {
        switch (TokenActual().get_token()) {
            case "CREATE":
                moverToken();
                CREATE1();
                CREATE21();
                break;
        }
    }
    
    private static void CREATE1() {
        switch (TokenActual().get_token()) {
            case "DATABASE":
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
            case "TABLE":
                moverToken();
                CREATE11();
                break;
            case "USER":
                moverToken();
                break;
            case "UNIQUE":
                CREATE2();
                CREATE4();
                break;
            case "CLUSTERED":
                CREATE3();
                CREATE4();
                break;
            case "NOCLUSTERED":
                CREATE3();
                CREATE4();
                break;
            case "INDEX":
                CREATE4();
                break;
            case "OR":
                CREATE14();
                CREATE15();
                break;
            case "VIEW":
                CREATE15();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "tipo de objeto");
                break;
        }
    }
    
    private static void CREATE2() {
        switch (TokenActual().get_token()) {
            case "UNIQUE":
                moverToken();
                CREATE3();
                break;
            default:
                CREATE3();
                break;
        }
    }
    
    private static void CREATE3() {
        switch (TokenActual().get_token()) {
            case "CLUSTERED":
                moverToken();
                break;
            case "NOCLUSTERED":
                moverToken();
                break;
        }
    }
    
    private static void CREATE4() {
        switch (TokenActual().get_token()) {
            case "INDEX":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "ON":
                                moverToken();
                                switch (TokenActual().get_token()) {
                                    case "Identificador":
                                        ObjectExp.OBJECT();
                                        CREATE5();
                                        break;
                                    default:
                                        setHasError(true);
                                        Errores.SyntaxError(TokenActual(), "identificador");
                                        break;
                                }
                                break;
                            default:
                                setHasError(true);
                                Errores.SyntaxError(TokenActual(), "'ON'");
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
    
    private static void CREATE5() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                CREATE6();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "parentesis de apertura");
                break;
        }
    }
    
    private static void CREATE6() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                CREATE7();
                CREATE8();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void CREATE7() {
        switch (TokenActual().get_token()) {
            case "ASC":
                moverToken();
                break;
            case "DESC":
                moverToken();
                break;
        }
    }
    
    private static void CREATE8() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                CREATE6();
                break;
            default:
                CREATE9();
                break;
        }
    }
    
    private static void CREATE9() {
        switch (TokenActual().get_token()) {
            case "INCLUDE":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        switch (TokenActual().get_token()) {
                            case "Identificador":
                                moverToken();
                                CREATE10();
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
        }
    }
    
    private static void CREATE10() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        CREATE10();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
        }
    }
    
    private static void CREATE11() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                ObjectExp.OBJECT();
                switch (TokenActual().get_token()) {
                    case "ParentesisAbrir":
                        moverToken();
                        CREATE12();
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
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void CREATE12() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                ColumnDefinition.COLDEF();
                CREATE13();
                break;
            default:
                TableConstraint.TBCST();
                CREATE13();
                break;
        }
    }
    
    private static void CREATE13() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                CREATE12();
                break;
        }
    }
    
    private static void CREATE14() {
        switch (TokenActual().get_token()) {
            case "OR":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "ALTER":
                        moverToken();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'ALTER'");
                        break;
                }
                break;
        }
    }
    
    private static void CREATE15() {
        switch (TokenActual().get_token()) {
            case "VIEW":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        CREATE16();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "'VIEW'");
                break;
        }
    }
    
    private static void CREATE16() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        CREATE17();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                CREATE17();
                break;
        }
    }
    
    private static void CREATE17() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        CREATE18();
                        switch (TokenActual().get_token()) {
                            case "ParentesisCerrar":
                                moverToken();
                                CREATE19();
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
                CREATE19();
                break;
        }
    }
    
    private static void CREATE18() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        CREATE18();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
        }
    }
    
    private static void CREATE19() {
        switch (TokenActual().get_token()) {
            case "AS":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "SELECT":
                        Select.SELECT1();
                        CREATE20();
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
    
    private static void CREATE20() {
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
    
    private static void CREATE21() {
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
