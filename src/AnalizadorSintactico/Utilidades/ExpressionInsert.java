/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Utilidades;

import static AnalizadorSintactico.AnalizadorSintactico.TokenActual;
import static AnalizadorSintactico.AnalizadorSintactico.moverToken;

/**
 *
 * @author axel
 */
public class ExpressionInsert {
    
    public static void INSEXPR() {
        if (TokenActual().get_token().equals("ParentesisAbrir") || TokenActual().get_token().equals("DatoEntero") 
                || TokenActual().get_token().equals("DatoFloat") || TokenActual().get_token().equals("Arroba")) {
            ScalarExpression.SEXP();
        } else if (TokenActual().get_token().equals("DatoString") || TokenActual().get_token().equals("DatoBit")) {
            moverToken();
        }
    }
    
}
