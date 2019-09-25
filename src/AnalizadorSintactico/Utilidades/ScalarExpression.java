/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorSintactico.Utilidades;

/**
 *
 * @author axel
 */
public class ScalarExpression {
    
    
    public boolean Analizar() {
        return SEXP();
    }
    
    public boolean SEXP() {
        switch (AnalizadorSintactico.AnalizadorSintactico.TokenActual().get_token()) {
            case "Simbolo.ParentesisAbrir":
                AnalizadorSintactico.AnalizadorSintactico.moverToken();
                return SEXP3();
            case "DatoEntero":
                AnalizadorSintactico.AnalizadorSintactico.moverToken();
                return SEXP3();
            case "DatoFloat":
                AnalizadorSintactico.AnalizadorSintactico.moverToken();
                return SEXP3();
            case "Simbolo.Arroba":
                AnalizadorSintactico.AnalizadorSintactico.moverToken();
                return SEXP3();
            case "Simbolo.Mas":
                AnalizadorSintactico.AnalizadorSintactico.moverToken();
                return SEXP2();
            case "Simbolo.Menos":
                AnalizadorSintactico.AnalizadorSintactico.moverToken();
                return SEXP2();
            default:
                // Agregar funciones de agregación
                return false;
        }
    }
    
    public boolean SEXP2() {
        switch (AnalizadorSintactico.AnalizadorSintactico.TokenActual().get_token()) {
            case "Simbolo.Mas":
                return SEXP2();
            case "Simbolo.Menos":
                return SEXP2();
            default:
                return SEXP3();
        }
    }
    
    public boolean SEXP3() {
        switch (AnalizadorSintactico.AnalizadorSintactico.TokenActual().get_token()) {
            case "Simbolo.ParentesisAbrir":
                return SEXP3();
            case "DatoEntero":
                return SEXP3();
            case "DatoFloat":
                return SEXP3();
            case "Simbolo.Arroba":
                return SEXP3();
            case "Simbolo.Multiplicacion":
                return SEXP3();
            case "Simbolo.Division":
                return SEXP3();
        }
    }
    
    public boolean SEXP4() {
        
    }
    
}
