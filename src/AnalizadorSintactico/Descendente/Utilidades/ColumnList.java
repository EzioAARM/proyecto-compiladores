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
public class ColumnList {
    
    public static void COLST() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                COLST1();
                break;
        }
    }
    
    private static void COLST1() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                COLST2();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void COLST2() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                COLST1();
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
