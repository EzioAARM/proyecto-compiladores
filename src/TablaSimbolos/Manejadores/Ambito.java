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
        Transacciones = new ArrayList();
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
    
    public int getTransaction(int id) {
        for (int i = 0; i < Transacciones.size(); i++) {
            if (Transacciones.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
    
    public int getTransaction(String nombre) {
        for (int i = 0; i < Transacciones.size(); i++) {
            if (Transacciones.get(i).getNombre().equals(nombre)) {
                return i;
            }
        }
        return -1;
    }
    
    public Transaction getLastTransaction() {
        return Transacciones.get(Transacciones.size());
    }
    
    public void addTransaction(String nombre) {
        Transacciones.add(new Transaction(Transacciones.size(), nombre));
    }
    
    public void addTransaction() {
        Transacciones.add(new Transaction(Transacciones.size(), ""));
    }
    
    /*
        Sección de ambitos
    */
    
    public void addAmbito(String nombre, String tipo, int  nivel, int id) {
        Ambitos.add(new Ambito(nombre, tipo, nivel, id));
    }
    
    public Ambito getLastAmbito() {
        return Ambitos.get(Ambitos.size());
    }
    
    public Ambito getAmbito(String nombre) {
        for (int i = 0; i < Ambitos.size(); i++) {
            if (Ambitos.get(i).getNombre().equals(nombre)) {
                return Ambitos.get(Ambitos.size());
            }
        }
        return null;
    }
    
    public int getAmbitoSize() {
        return Ambitos.size();
    }
    
    @Override
    public String toString() {
        String ambitoString = Id + ", " + Nombre + ", " + Nivel;
        String variablesString = "/t ID | NOMBRE | TIPO | TAMAÑO MAXIMO | SEED";
        for (int i = 0; i < Variables.size(); i++) {
            variablesString += "/n" + Variables.get(i).toString() + "/n";
        }
        String transaccionesString = "/t ID | NOMBRE /n";
        for (int i = 0; i < Transacciones.size(); i++) {
            transaccionesString += "/t" + Transacciones.get(i).toString() + "/n";
        }
        return ambitoString + "/n Variables" + variablesString + "/n Transacciones" + transaccionesString;
    }
    
}
