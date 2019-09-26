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
public class Utilidades {
    
    public static boolean regresarGramaticaAnterior(String tokenEncontrado, List<String> tiposRequeridos) {
        for (int i = 0; i < tiposRequeridos.size() - 1; i++) {
            if (tiposRequeridos.get(i).equals(tokenEncontrado))
                return true;
        }
        return false;
    }
    
}
