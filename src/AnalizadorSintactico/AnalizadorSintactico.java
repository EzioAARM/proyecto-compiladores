/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico;

import AnalizadorLexico.MyToken;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author axel
 */
public class AnalizadorSintactico {
    
    private int posicionToken;
    private List<MyToken> Tokens;
    
    public AnalizadorSintactico(List<MyToken> tokens) {
        posicionToken = 0;
        Tokens = new ArrayList();
        for (int i = 0; i < tokens.size(); i++) {
            if (!tokens.get(i).get_type().equals("Error") || !tokens.get(i).get_type().equals("Separador") 
                    || !tokens.get(i).get_type().equals("Comentario") || !tokens.get(i).get_type().equals("Advertencia")) {
                Tokens.add(tokens.get(i));
            }
        }
    }
    
}
