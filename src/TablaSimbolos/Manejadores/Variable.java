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
public class Variable<T> extends Objeto {
    
    public T valor;
    public int Max;
    public int Dec;
    public boolean hayMax;
    public boolean hayDec;
    public String tipoDato;
    public boolean asignado = false;
    
    public Variable(int id, String nombre, String tipo) {
        super(id, nombre);
        tipoDato = tipo;
    }
    
    public Variable(int id, String nombre, String tipo, int param1, boolean hayParam1, int param2, boolean hayParam2) {
        super(id, nombre);
        tipoDato = tipo;
        Max = param1;
        Dec = param2;
        hayMax = hayParam1;
        hayDec = hayParam2;
    }
    
}
