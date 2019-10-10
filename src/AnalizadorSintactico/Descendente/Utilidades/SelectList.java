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
public class SelectList {
    
    public static void SELIST() {
        SELIST1();
    }
    
    private static void SELIST1() {
        if (TokenActual().get_token().equals("Multiplicacion")) {
            moverToken();
        } else if (TokenActual().get_token().equals("COUNT") || TokenActual().get_token().equals("MIN") 
                || TokenActual().get_token().equals("MAX") || TokenActual().get_token().equals("SUM") 
                || TokenActual().get_token().equals("AVG")) {
            AggregateFunctions.AGGFN();
            SELIST5();
        } else if (TokenActual().get_token().equals("LOWER") || TokenActual().get_token().equals("TRANSLATE") 
                || TokenActual().get_token().equals("UPPER") || TokenActual().get_token().equals("CHAR") 
                || TokenActual().get_token().equals("LEFT") || TokenActual().get_token().equals("TRIM")
                || TokenActual().get_token().equals("NCHAR") || TokenActual().get_token().equals("RIGHT")
                || TokenActual().get_token().equals("SPACE") || TokenActual().get_token().equals("SUBSTRING")) {
            StringFunctions.STRFN();
            SELIST5();
        } else if (TokenActual().get_token().equals("CURRENT_TIMESTAMP") || TokenActual().get_token().equals("DAY") 
                || TokenActual().get_token().equals("MONTH") || TokenActual().get_token().equals("YEAR") 
                || TokenActual().get_token().equals("SET")) {
            DateFunctions.DTFN();
            SELIST5();
        } else if (TokenActual().get_token().equals("CAST") || TokenActual().get_token().equals("CONVERT")) {
            ConversionFunctions.CONV();
            SELIST5();
        } else if (TokenActual().get_token().equals("CASE")) {
            CaseWhen.CASEW();
            SELIST5();
        } else if (TokenActual().get_token().equals("Identificador")) {
            moverToken();
            SELIST2();
            SELIST5();
        } else if (TokenActual().get_token().equals("DatoString") || TokenActual().get_token().equals("ParentesisAbrir") 
                || TokenActual().get_token().equals("DatoEntero") || TokenActual().get_token().equals("DatoFloat") 
                || TokenActual().get_token().equals("Arroba")) {
            Expression.EXPRESSION();
            SELIST5();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "se esperaba expresión para select");
        }
    }
    
    private static void SELIST2() {
        switch (TokenActual().get_token()) {
            case "Punto":
                moverToken();
                SELIST3();
                break;
            case "Igual":
                moverToken();
                SELIST6();
                break;
        }
    }
    
    private static void SELIST3() {
        switch (TokenActual().get_token()) {
            case "Multiplicacion":
                moverToken();
                break;
            case "Identificador":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "asterisco o identificador");
                break;
        }
    }
    
    private static void SELIST5() {
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
    
    private static void SELIST6() {
        Expression.EXPRESSION();
    }
    
}
