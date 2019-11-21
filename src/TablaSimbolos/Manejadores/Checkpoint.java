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
    private int Id;
    public String statusSaved;
    
    public Checkpoint(int id, String nombre) {
        Nombre = nombre;
        Id = id;
        statusSaved = "activa";
    }
    
    public int getId() {
        return Id;
    }
    
    public String getNombre() {
        return Nombre;
    }
}
