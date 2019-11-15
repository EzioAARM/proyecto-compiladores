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
public class SymbolDriver {
    
    int id = 0;
    
    List<Ambito> Ambitos = new ArrayList();
    
    public Objeto buscar(String nombre) {
        return null;
    }
    
    public void agregarAmbito(String nombre, String tipo) {
        id++;
       Ambitos.add(new Ambito(nombre, tipo, 0, id));
    }
}
