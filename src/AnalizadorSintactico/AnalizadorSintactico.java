/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico;

import AnalizadorLexico.MyToken;
import java.util.List;

/**
 *
 * @author axel
 */
public class AnalizadorSintactico {
    
    private int posicionToken;
    
    public AnalizadorSintactico(List<MyToken> tokens) {
        posicionToken = 0;
    }
    
}
