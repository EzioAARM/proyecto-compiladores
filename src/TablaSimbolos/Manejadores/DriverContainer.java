/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TablaSimbolos.Manejadores;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 *
 * @author axel
 */
public class DriverContainer {
    
    List<Database> estructuraServidor = new ArrayList();
    
    Stack<Integer> pilaAmbitos = new Stack();
    
    int TransaccionActiva = -1;
    
    int id = 0;
    
    List<Ambito> Ambitos = new ArrayList();
    
    protected int getAmbito(String nombre) {
        for (int i = 0; i < Ambitos.size(); i++) {
            if (Ambitos.get(i).getNombre().equals(nombre)) {
                return i;
            }
        }
        return -1;
    }
    
    protected int getAmbito(String nombre, int pos) {
        for (int i = 0; i < Ambitos.get(pos).Ambitos.size(); i++) {
            if (Ambitos.get(pos).Ambitos.get(i).getNombre().equals(nombre)) {
                return i;
            }
        }
        return -1;
    }
    
    protected int getAmbito(int id) {
        for (int i = 0; i < Ambitos.size(); i++) {
            if (Ambitos.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
    
    protected int getAmbito(int id, int pos) {
        for (int i = 0; i < Ambitos.get(pos).Ambitos.size(); i++) {
            if (Ambitos.get(pos).Ambitos.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
    
    protected boolean existeAmbito(String nombre) {
        for (int i = 0; i < Ambitos.size(); i++) {
            if (Ambitos.get(i).getNombre().equals(nombre)) {
                return true;
            }
        }
        return false;
    }
    
    protected boolean existeDatabase(String nombre) {
        for (int i = 0; i < estructuraServidor.size(); i++) {
            if (estructuraServidor.get(i).getNombre().equals(nombre)) {
                return true;
            }
        }
        return false;
    }
    
    protected int getDatabase(String nombre) {
        for (int i = 0; i < estructuraServidor.size(); i++) {
            if (estructuraServidor.get(i).getNombre().equals(nombre)) {
                return i;
            }
        }
        return -1;
    }
    
    protected int getDatabase(int id) {
        for (int i = 0; i < estructuraServidor.size(); i++) {
            if (estructuraServidor.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
    
    public void agregarLog(String mensaje) {
        System.out.println(mensaje);
    }
    
}
