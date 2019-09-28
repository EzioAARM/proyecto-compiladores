/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Utilidades;

import java.util.List;

/**
 *
 * @author axel
 */
public class ConversionFunctions {
    
    private boolean CaracterFinal;
    private boolean OmitirError;
    private List<String> Continuacion;
    
    public boolean Analizar(boolean omitirError, List<String> siguientes) {
        OmitirError = omitirError;
        Continuacion = siguientes;
        CaracterFinal = false;
        return CONV() || CaracterFinal;
    }
    
    public boolean CONV() {
        return true;
    }
}
