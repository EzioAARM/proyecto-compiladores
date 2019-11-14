/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TablaSimbolos.Manejadores;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author axel
 */
public class Checkpoint {
    
    private String Nombre;
    public List<Objeto> Contenido;
    
    public Checkpoint(String nombre) {
        Nombre = nombre;
        Contenido = new ArrayList();
    }
    
    public String getNombre() {
        return Nombre;
    }
    
    public void addObjeto(Objeto query) {
        Contenido.add(query);
    }
}
