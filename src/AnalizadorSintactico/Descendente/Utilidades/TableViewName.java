/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Descendente.Utilidades;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.AnalizadorSintactico.setHasError;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class TableViewName {
    
    public static void TBVNAME() {
        if (TokenActual().get_token().equals("Identificador")) {
            moverToken();
            TBVNAME1();
        } else if (TokenActual().get_token().equals("FINDELARCHIVO")) {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "identificador");
        }
    }
    
    private static void TBVNAME1() {
        if (TokenActual().get_token().equals("Punto")) {
            moverToken();
            if (TokenActual().get_token().equals("Identificador")) {
                moverToken();
            } else {
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
            }
        }
    }
    
}
