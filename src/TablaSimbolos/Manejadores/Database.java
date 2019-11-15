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
    
    List<Tabla>  tabla = new ArrayList();
    
    public Database(int id, String nombre) {
        super(id, nombre);
    }
    
}
