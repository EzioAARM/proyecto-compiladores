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
public class TableSource {
    
    public static void TBSOURCE() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                TableViewName.TBVNAME();
                TBSOURCE1();
                TBSOURCE2();
                break;
            case "OPENDATASOURCE":
                Rowset.ROWSET();
                TBSOURCE1();
                break;
            case "OPENQUERY":
                Rowset.ROWSET();
                TBSOURCE1();
                break;
            case "Arroba":
                moverToken();
                if (TokenActual().get_token().equals("Identificador")) {
                    moverToken();
                    TBSOURCE1();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "identificador");
                }
                break;
        }
    }
    
    private static void TBSOURCE1() {
        switch (TokenActual().get_token()) {
            case "AS":
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
            case "Identificador":
                moverToken();
                break;
        }
    }
    
    private static void TBSOURCE2() {
        if (TokenActual().get_token().equals("TABLESAMPLE")) {
            TableSample.SAMCL();
        }
    }
    
}
