/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Descendente.Utilidades;

import static AnalizadorSintactico.Descendente.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.Descendente.AnalizadorSintactico.moverToken;
import static AnalizadorSintactico.Descendente.AnalizadorSintactico.setHasError;
import MiniSql.Errores;

/**
 *
 * @author axel
 */
public class ColumnName {
    
    public static void COLNAME() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                COLNAME1();
                break;
        }
    }

    private static void COLNAME1() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        break;
                    case "Multiplicacion":
                        moverToken();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador o asterisco");
                        break;
                }
                break;
        }
    }
    
}
