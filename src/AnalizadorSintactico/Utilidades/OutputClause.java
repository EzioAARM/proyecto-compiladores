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
public class OutputClause {
    
    public static void OUTCL() {
        switch (TokenActual().get_token()) {
            case "OUTPUT":
                moverToken();
                if (TokenActual().get_token().equals("Identificador") || TokenActual().get_token().equals("ParentesisAbrir") 
                        || TokenActual().get_token().equals("DatoEntero") || TokenActual().get_token().equals("DatoFloat") 
                        || TokenActual().get_token().equals("Arroba")) {
                    DMLSelectList.DML();
                    OUTCL1();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "<dml_select_list>");
                }
                break;
        }
    }
    
    private static void OUTCL1() {
        switch (TokenActual().get_token()) {
            case "INTO":
                moverToken();
                OUTCL2();
                break;
        }
    }
    
    private static void OUTCL2() {
        switch (TokenActual().get_token()) {
            case "Arroba":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        OUTCL3();
                        break;
                    default:
                        setHasError(true);
                        Errores.SyntaxError(TokenActual(), "identificador");
                        break;
                }
                break;
            case "Identificador":
                moverToken();
                OUTCL3();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void OUTCL3() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                ColumnList.COLST();
                break;
        }
    }
    
}
