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
public class Order {
    
    public static void ORDER() {
        if (TokenActual().get_token().equals("Multiplicacion")) {
            moverToken();
        } else if (TokenActual().get_token().equals("COUNT") || TokenActual().get_token().equals("MIN") 
                || TokenActual().get_token().equals("MAX") || TokenActual().get_token().equals("SUM") 
                || TokenActual().get_token().equals("AVG") || TokenActual().get_token().equals("LOWER") 
                || TokenActual().get_token().equals("UPPER") || TokenActual().get_token().equals("CHAR") 
                || TokenActual().get_token().equals("LEFT") || TokenActual().get_token().equals("TRIM")
                || TokenActual().get_token().equals("NCHAR") || TokenActual().get_token().equals("RIGHT")
                || TokenActual().get_token().equals("SPACE") || TokenActual().get_token().equals("SUBSTRING")
                || TokenActual().get_token().equals("TRANSLATE") || TokenActual().get_token().equals("CURRENT_TIMESTAMP")  
                || TokenActual().get_token().equals("MONTH") || TokenActual().get_token().equals("YEAR") 
                || TokenActual().get_token().equals("SET") || TokenActual().get_token().equals("DAY") 
                || TokenActual().get_token().equals("CAST") || TokenActual().get_token().equals("CONVERT") 
                || TokenActual().get_token().equals("CASE") || TokenActual().get_token().equals("Identificador")
                || TokenActual().get_token().equals("DatoString") || TokenActual().get_token().equals("ParentesisAbrir") 
                || TokenActual().get_token().equals("DatoEntero") || TokenActual().get_token().equals("DatoFloat") 
                || TokenActual().get_token().equals("Arroba")) {
            SelectList.SELIST();
            ORDER1();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "se esperaba expresión para ORDER BY");
        }
    }
    
    private static void ORDER1() {
        switch (TokenActual().get_token()) {
            case "COLLATE":
                ORDER2();
                break;
            case "Coma":
                moverToken();
                ORDER();
                break;
            case "ASC":
                ORDER2();
                break;
            case "DESC":
                ORDER2();
                break;
        }
    }
    
    private static void ORDER2() {
        switch (TokenActual().get_token()) {
            case "COLLATE":
                moverToken();
                ORDER3();
                break;
            case "ASC":
                ORDER4();
                break;
            case "DESC":
                ORDER4();
                break;
        }
    }
    
    private static void ORDER3() {
        switch (TokenActual().get_token()) {
            case "Identificador":
                moverToken();
                break;
            default:
                setHasError(true);
                Errores.SyntaxError(TokenActual(), "identificador");
                break;
        }
    }
    
    private static void ORDER4() {
        switch (TokenActual().get_token()) {
            case "ASC":
                moverToken();
                break;
            case "DESC":
                moverToken();
                break;
        }
    }
    
}
