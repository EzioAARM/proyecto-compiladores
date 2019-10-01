/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.DDL;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import AnalizadorSintactico.Utilidades.ObjectExp;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class Drop {
    
    public static void DROP() {
        switch (TokenActual().get_token()) {
            case "DROP":
                moverToken();
                DROP2();
                DROP1();
                DROP10();
                break;
        }
    }
    
    private static void DROP1() {
        switch (TokenActual().get_token()) {
            case "TABLE":
                moverToken();
                DROP3();
                break;
            case "DATABASE":
                moverToken();
                DROP5();
                break;
            case "USER":
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
            case "VIEW":
                moverToken();
                DROP3();
                break;
            case "INDEX":
                moverToken();
                DROP7();
                break;
        }
    }
    
    private static void DROP2() {
        switch (TokenActual().get_token()) {
            case "IF":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "EXISTS":
                        moverToken();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'EXISTS'");
                        break;
                }
                break;
        }
    }
    
    private static void DROP3() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                ObjectExp.OBJECT();
                DROP4();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void DROP4() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        DROP3();
                        break;
                    case "DROP":
                        DROP();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
        }
    }
    
    private static void DROP5() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                DROP6();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void DROP6() {
        switch (TokenActual().get_token()) {
            case ",":
                moverToken();
                DROP5();
                break;
        }
    }
    
    private static void DROP7() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                DROP8();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void DROP8() {
        switch (TokenActual().get_token()) {
            case "ON":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        ObjectExp.OBJECT();
                        break;
                    default:
                        
                        break;
                }
                break;
            case "Punto":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        DROP9();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "punto o 'ON'");
                break;
        }
    }
    
    private static void DROP9() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        break;
                }
                break;
        }
    }
    
    private static void DROP10() {
        switch (TokenActual().get_token()) {
            case "PuntoComa":
                moverToken();
                break;
            case "GO":
                moverToken();
                break;
            case "Coma":
                moverToken();
                DROP();
                break;
        }
    }
    
}
