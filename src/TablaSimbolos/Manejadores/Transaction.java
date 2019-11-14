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
public class Transaction {
    private String Nombre;
    private List<Checkpoint> SavePoints;
    public List<Objeto> Contenido;
    private int Id;
    
    public Transaction(int id, String nombre) {
        Nombre = nombre;
        SavePoints = new ArrayList();
        Contenido = new ArrayList();
        Id = id;
    }
    
    public int getId() {
        return Id;
    }
    
    public String getNombre() {
        return Nombre;
    }
    
    public void setNombre(String nombre) {
        Nombre = nombre;
    }
    
    public void addObjeto(Objeto query) {
        Contenido.add(query);
    }
    
}
