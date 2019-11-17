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
public class Ambito {
    
    private int Id;
    public int Nivel = 0;
    private String Nombre;
    
    public List<Transaction> Transacciones;
    public List<Ambito> Ambitos;
    public List<Variable> Variables;
    
    public Ambito(String nombre, String tipoAmbito, int nivel, int id) {
        Ambitos = new ArrayList();
        Id = id;
        Nombre = nombre;
        Nivel = nivel;
        Variables = new ArrayList();
        if (tipoAmbito.equals("use")) {
            Transacciones = new ArrayList();
        }
    }
    
    public String getNombre() {
        return Nombre;
    }
    
    public int getId() {
        return Id;
    }
    
    /*
        Seccion de transacciones
    */
    
    public Transaction getTransaction(int id) {
        for (int i = 0; i < Transacciones.size(); i++) {
            if (Transacciones.get(i).getId() == id) {
                return Transacciones.get(i);
            }
        }
        return null;
    }
    
    public Transaction getTransaction(String nombre) {
        for (int i = 0; i < Transacciones.size(); i++) {
            if (Transacciones.get(i).getNombre().equals(nombre)) {
                return Transacciones.get(i);
            }
        }
        return null;
    }
    
    public Transaction getLastTransaction() {
        return Transacciones.get(Transacciones.size() - 1);
    }
    
    public void addTransaction(String nombre) {
        Transacciones.add(new Transaction(Transacciones.size(), nombre));
    }
    
    public void addTransaction() {
        Transacciones.add(new Transaction(Transacciones.size() - 1, ""));
    }
    
    /*
        Sección de ambitos
    */
    
    public void addAmbito(String nombre, String tipo, int  nivel, int id) {
        Ambitos.add(new Ambito(nombre, tipo, nivel, id));
    }
    
    public Ambito getLastAmbito() {
        return Ambitos.get(Ambitos.size() - 1);
    }
    
    public Ambito getAmbito(String nombre) {
        for (int i = 0; i < Ambitos.size() - 1; i++) {
            if (Ambitos.get(i).getNombre().equals(nombre)) {
                return Ambitos.get(Ambitos.size() - 1);
            }
        }
        return null;
    }
    
    public int getAmbitoSize() {
        return Ambitos.size();
    }
    
}
