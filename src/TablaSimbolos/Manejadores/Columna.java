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
public class Columna extends Objeto {
    
    public Columna(int id, String nombre) {
        super(id, nombre);
    }
    
    @Override
    public String toString() {
        return this.getId() + ", " + this.getNombre();
    }
    
}
