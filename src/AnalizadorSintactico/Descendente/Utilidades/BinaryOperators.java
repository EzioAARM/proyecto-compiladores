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
import java.util.List;

/**
 *
 * @author axel
 */
public class BinaryOperators {
    
    
    public static void BINOPR() {
        if (TokenActual().get_token().equals("Mas") || TokenActual().get_token().equals("Menos")
                || TokenActual().get_token().equals("Multiplicacion") || TokenActual().get_token().equals("Divison")
                || TokenActual().get_token().equals("Modulo") ) {
            AROPR();
        } else if (TokenActual().get_token().equals("Igual")) {
            ASIGOPR();
        } else if (TokenActual().get_token().equals("AND") || TokenActual().get_token().equals("OR")
                || TokenActual().get_token().equals("NOT")) {
            BITOPR();
        } else if (TokenActual().get_token().equals("Menor")
                || TokenActual().get_token().equals("Mayor") || TokenActual().get_token().equals("MenorIgual")
                || TokenActual().get_token().equals("MayorIgual") || TokenActual().get_token().equals("Diferente")) {
            COMPAREOPR();
        } else if (TokenActual().get_token().equals("BETWEEN") || TokenActual().get_token().equals("IN") 
                || TokenActual().get_token().equals("LIKE")) {
            LOGICOPR();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "operador binario");
        }
    }
    
    public static void AROPR() {
        if (TokenActual().get_token().equals("Mas") || TokenActual().get_token().equals("Menos")
                || TokenActual().get_token().equals("Multiplicacion") || TokenActual().get_token().equals("Divison")
                || TokenActual().get_token().equals("Modulo") ) {
            moverToken();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "operador aritmetico");
        }
    }
    
    public static void ASIGOPR() {
        if (TokenActual().get_token().equals("Igual")) {
            moverToken();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "operador aritmetico");
        }
    }
    
    public static void BITOPR() {
        if (TokenActual().get_token().equals("AND") || TokenActual().get_token().equals("OR")) {
            moverToken();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "operador de bits");
        }
    }
    
    public static void COMPAREOPR() {
        if (TokenActual().get_token().equals("Menor")
                || TokenActual().get_token().equals("Mayor") || TokenActual().get_token().equals("MenorIgual")
                || TokenActual().get_token().equals("MayorIgual") || TokenActual().get_token().equals("Diferente")) {
            moverToken();
        } else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "operador de comparación");
        }
    }
    
    public static void LOGICOPR() {
        if (TokenActual().get_token().equals("IN") || TokenActual().get_token().equals("LIKE")) {
            moverToken();
        } else if (TokenActual().get_token().equals("BETWEEN")) {
            moverToken();
            Expression.EXPRESSION();
        }else {
            setHasError(true);
            Errores.SyntaxError(TokenActual(), "operador lógico");
        }
    }
    
}
