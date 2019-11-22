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
public class Tabla extends Objeto {
    
    public List<Columna> columnas = new ArrayList();
    public List<Index> indices = new ArrayList();
    
    public Tabla(int id, String nombre) {
        super(id, nombre);
    }
    
    public boolean existeColumna(String nombre) {
        for (int i  = 0; i < columnas.size(); i++) {
            if (columnas.get(i).getNombre().equals(nombre)) {
                return true;
            }
        }
        return false;
    }
    
    public int getColumna(String nombre) {
        for (int i  = 0; i < columnas.size(); i++) {
            if (columnas.get(i).getNombre().equals(nombre)) {
                return i;
            }
        }
        return -1;
    }
    
    @Override
    public String toString() {
        String columnasString = "\t ID | NOMBRE \n";
        for (int i = 0; i < columnas.size(); i++) {
            columnasString += "\t" + columnas.get(i).toString();
        }
        return this.getId() + ", " + this.getNombre() + "\n" + columnasString;
    }
    
}
