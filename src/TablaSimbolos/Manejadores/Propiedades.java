/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TablaSimbolos.Manejadores;

/**
 *
 * @author axel
 */
public class Propiedades<T> {
    
    private String Nombre;
    private String Valor;
    
    public Propiedades(String nombre, String valor) {
        Nombre = nombre;
        Valor = valor;
    }
    
    public String getNombre() {
        return Nombre;
    }
    
    public String getValor() {
        return Valor;
    }
    
    public void setValor(String valor) {
        Valor = valor;
    }
    
}
