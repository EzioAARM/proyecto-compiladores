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
public class DataType {
    
    public static void DATATYPE() {
        if (TokenActual().get_token().equals("Identificador")) {
            moverToken();
            DATATYPE2();
        } else if (TokenActual().get_token().equals("BIT") || TokenActual().get_token().equals("INT")
                || TokenActual().get_token().equals("INTEGER") || TokenActual().get_token().equals("FLOAT")
                || TokenActual().get_token().equals("VARCHAR") || TokenActual().get_token().equals("DATE")
                || TokenActual().get_token().equals("REAL") || TokenActual().get_token().equals("DECIMAL")
                || TokenActual().get_token().equals("NUMERIC") || TokenActual().get_token().equals("SMALLINT")
                || TokenActual().get_token().equals("TIME") || TokenActual().get_token().equals("CHAR")
                || TokenActual().get_token().equals("NCHAR")) {
            DATATYPE3();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "tipo de dato");
        }
    }
    
    private static void DATATYPE2() {
        if (TokenActual().get_token().equals("Punto")) {
            moverToken();
            if (TokenActual().get_token().equals("Identificador")) {
                moverToken();
            }
        }
    }
    
    private static void DATATYPE3() {
        moverToken();
        DATATYPE4();
    }
    
    private static void DATATYPE4() {
        switch (TokenActual().get_token()) {
            case "ParentesisAbrir":
                moverToken();
                if (TokenActual().get_token().equals("DatoEntero")) {  
                    moverToken();
                    DATATYPE5();
                }
                break;
        }
    }
    
    private static void DATATYPE5() {
        switch (TokenActual().get_token()) {
            case "Coma":
                moverToken();
                if (TokenActual().get_token().equals("DatoEntero")) {
                    moverToken();
                } else {
                    setHasError(true);
                    Errores.SyntaxError(TokenActual(), "numero entero");
                }
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
