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
public class DMLSelectList {
    
    public static void DML() {
        DML2();
        DML3();
    }
    
    private static void DML2() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                ColumnName.COLNAME();
                break;
            default:
                ScalarExpression.SEXP();
                break;
        }
    }
    
    private static void DML3() {
        switch (TokenActual().get_token()) {
            case "AS":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        DML4();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
        }
    }
    
    private static void DML4() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                DML();
                break;
        }
    }
    
}
