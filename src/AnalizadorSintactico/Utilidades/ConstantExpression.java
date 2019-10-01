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
public class ConstantExpression {
    
    public static void CONSTEXP() {
        switch (TokenActual().get_token()) {
            case "Arroba":
                moverToken();
                switch (TokenActual().get_token()) {
                    case "Identificador":
                        moverToken();
                        break;
                    default:
                        
                        break;
                }
                break;
            case "Identificador":
                moverToken();
                break;
            case "DatoEntero":
                moverToken();
                break;
            case "DatoFloat":
                moverToken();
                break;
            case "DatoString":
                moverToken();
                break;
        }
    }
    
}
