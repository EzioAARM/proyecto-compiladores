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
    
    private List<Transaction> Transacciones;
    private String Nombre;
    public List<Objeto> Contenido;
    private List<Ambito> Ambitos;
    private int Id;
    private int Nivel = 0;
    
    public Ambito(int id, String nombre, int nivel) {
        Contenido = new ArrayList();
        Ambitos = new ArrayList();
        Nombre = nombre;
        Id = id;
        Nivel = nivel;
    }
    
    public Ambito(String nombre, String tipoAmbito, int nivel) {
        Contenido = new ArrayList();
        Ambitos = new ArrayList();
        Nombre = nombre;
        Nivel = nivel;
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
    
    public void addObjeto(Objeto query) {
        Contenido.add(query);
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
    
    public void addAmbito(String nombre) {
        Ambitos.add(new Ambito(Ambitos.size() - 1, nombre, Nivel + 1));
    }
    
    public void addAmbito() {
        Ambitos.add(new Ambito(Ambitos.size() - 1, "", Nivel + 1));
    }
    
    public Ambito getLastAmbito() {
        return Ambitos.get(Ambitos.size() - 1);
    }
    
    public Ambito getAmbito(int id) {
        for (int i = 0; i < Ambitos.size() - 1; i++) {
            if (Ambitos.get(i).getId() == id) {
                return Ambitos.get(Ambitos.size() - 1);
            }
        }
        return null;
    }
    
    public Ambito getAmbito(String nombre) {
        for (int i = 0; i < Ambitos.size() - 1; i++) {
            if (Ambitos.get(i).getNombre().equals(nombre)) {
                return Ambitos.get(Ambitos.size() - 1);
            }
        }
        return null;
    }
    
}
