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
    public List<Checkpoint> SavePoints;
    private int Id;
    
    public Transaction(int id, String nombre) {
        Nombre = nombre;
        SavePoints = new ArrayList();
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
    
    public int getCheckpoint(String nombre) {
        for (int i = 0; i < SavePoints.size(); i++) {
            if (SavePoints.get(i).getNombre().equals(nombre)) {
                return i;
            }
        }
        return -1;
    }
    
    public int getCheckpoint(int id) {
        for (int i = 0; i < SavePoints.size(); i++) {
            if (SavePoints.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
    
    public String obtenerStatus(String nombre) {
        for (int i = 0; i < SavePoints.size(); i++) {
            if (SavePoints.get(i).getNombre().equals(nombre)) {
                return SavePoints.get(i).statusSaved;
            }
        }
        return "";
    }
    
    public boolean cambiarStatus(String nombre, String status) {
        for (int i = 0; i < SavePoints.size(); i++) {
            if (SavePoints.get(i).getNombre().equals(nombre)) {
                if (SavePoints.get(i).statusSaved.equals("activa")) {
                    SavePoints.get(i).statusSaved = status;
                    return true;
                } else {
                    return false;
                }
            }
        }
        return false;
    }
    
}
