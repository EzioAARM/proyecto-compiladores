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
public abstract class Objeto {
    
    private String Nombre;
    private int Id;
    public List<Propiedades> propiedades;
    
    public Objeto(int id, String nombre) {
        Nombre = nombre;
        Id = id;
        propiedades = new ArrayList();
    }
    
    public String getNombre() {
        return Nombre;
    }
    
    public void setNombre(String nombre) {
        Nombre = nombre;
    }
    
    public int getId() {
        return Id;
    }
    
    public void setId(int id) {
        Id = id;
    }
    
    public boolean hayPropiedad(String propiedad) {
        for (int i = 0; i < propiedades.size() - 1; i++) {
            if (propiedades.get(i).getNombre().equals(propiedad)) {
                return true;
            }
        }
        return false;
    }
    
    public void changeIfNotEqual(String propiedad, String valor) {
        for (int i = 0; i < propiedades.size() - 1; i++) {
            if (!propiedades.get(i).getNombre().equals(propiedad)) {
                propiedades.get(i).setValor(valor);
            }
        }
    }
    
}
