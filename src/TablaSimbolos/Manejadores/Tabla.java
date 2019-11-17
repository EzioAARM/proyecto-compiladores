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
    
    public List<Columna> columnas = null;
    
    public Tabla(int id, String nombre) {
        super(id, nombre);
        columnas = new ArrayList();
    }
    
}
