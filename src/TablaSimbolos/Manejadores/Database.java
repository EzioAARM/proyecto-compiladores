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
public class Database extends Objeto {
    
    public List<Tabla> tablas = new ArrayList();
    public List<View> vistas = new ArrayList();
    public List<Usuario> usuario = new ArrayList();
    public List<Function> funciones = new ArrayList();
    
    public Database(int id, String nombre) {
        super(id, nombre);
    }
    
    public boolean existeFuncion(String nombre) {
        for (int i  = 0; i < funciones.size(); i++) {
            if (funciones.get(i).getNombre().equals(nombre)) {
                return true;
            }
        }
        return false;
    }
    
    public int getFuncion(String nombre) {
        for (int i  = 0; i < funciones.size(); i++) {
            if (funciones.get(i).getNombre().equals(nombre)) {
                return i;
            }
        }
        return -1;
    }
    
    public boolean existeTabla(String nombre) {
        for (int i  = 0; i < tablas.size(); i++) {
            if (tablas.get(i).getNombre().equals(nombre)) {
                return true;
            }
        }
        return false;
    }
    
    public int getTabla(String nombre) {
        for (int i  = 0; i < tablas.size(); i++) {
            if (tablas.get(i).getNombre().equals(nombre)) {
                return i;
            }
        }
        return -1;
    }
    
    @Override
    public String toString() {
        String tablasString = "\t ID | NOMBRE \n";
        for (int i = 0; i < tablas.size(); i++) {
            tablasString += "\t" + tablas.get(i).toString() + "\n";
        }
        return this.getId() + ", " + this.getNombre() + "\n" + tablasString;
    }
}
