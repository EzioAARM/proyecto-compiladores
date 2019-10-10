/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Descendente.DDL;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import AnalizadorSintactico.Descendente.Utilidades.ObjectExp;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class Truncate {
    
    public static void TRUNCATE()
    {
        switch (TokenActual().get_token()) {
            case "TRUNCATE":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "TABLE":
                        moverToken();
                        ObjectExp.OBJECT();
                        TRUNCATE1();
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
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "'TABLE'");
                        break;
                }
                break;
        }
    }    
    
    private static void TRUNCATE1() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        ObjectExp.OBJECT();
                        TRUNCATE1();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
        }
    }
}
