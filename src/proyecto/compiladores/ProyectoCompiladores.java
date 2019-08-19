/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto.compiladores;

import AnalizadorLexico.MyToken;
import java.io.BufferedReader;
import java.io.FileReader;

/**
 *
 * @author axel
 */
public class ProyectoCompiladores {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            String archivoAnalizado = args[0];
            BufferedReader buffered = new BufferedReader(new FileReader(archivoAnalizado));
            Lexemas analizadorFlex = new Lexemas(buffered);
            while (true) {
                MyToken token = analizadorFlex.yylex();
                if (!analizadorFlex.existenTokens()) break;
                System.out.println(token.toString());
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }
    
}
