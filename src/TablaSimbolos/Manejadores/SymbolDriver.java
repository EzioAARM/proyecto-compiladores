/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TablaSimbolos.Manejadores;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 *
 * @author axel
 */
public class SymbolDriver {
    
    Stack<Integer> pilaAmbitos = null;
    int id = 0;
    
    List<Ambito> Ambitos = null;
    
    public SymbolDriver() {
        Ambitos = new ArrayList();
        pilaAmbitos = new Stack<Integer>();
    }
    
    public boolean existeObjeto(String objeto, String type) {
        Ambito ambitoActual = Ambitos.get(pilaAmbitos.peek());
        Objeto objetoEncontrado = null;
        for (int i = 0; i < ambitoActual.getContentSize(); i++) {
            if (ambitoActual.Contenido.get(i).getNombre().equals(objeto)) {
                objetoEncontrado = ambitoActual.Contenido.get(i);
                switch (type.toLowerCase()) {
                    case "columna":
                        if (objetoEncontrado instanceof Columna) {
                            return true;
                        }
                        break;
                    case "database":
                        if (objetoEncontrado instanceof Database) {
                            return true;
                        }
                        break;
                    case "funcion":
                        if (objetoEncontrado instanceof Function) {
                            return true;
                        }
                        break;
                    case "index":
                        if (objetoEncontrado instanceof Index) {
                            return true;
                        }
                        break;
                    case "tabla":
                        if (objetoEncontrado instanceof Tabla) {
                            return true;
                        }
                        break;
                    case "tipo de dato":
                        if (objetoEncontrado instanceof TipoDato) {
                            return true;
                        }
                        break;
                    case "usuario":
                        if (objetoEncontrado instanceof Usuario) {
                            return true;
                        }
                        break;
                    case "variable":
                        if (objetoEncontrado instanceof Variable) {
                            return true;
                        }
                        break;
                    case "vista":
                        if (objetoEncontrado instanceof View) {
                            return true;
                        }
                        break;
                    default:
                        return false;
                }
            }
        }
        return false;
    }
    
    public void agregarAmbito(String nombre, String tipo) {
        boolean existe = false;
        int idEncontrado = 0;
        if (tipo.equals("database")) {
            for (int i = 0; i < Ambitos.size(); i++) {
                if (Ambitos.get(i).getNombre().equals(nombre)) {
                    existe = true;
                    idEncontrado = Ambitos.get(i).getId();
                }
            }
            if (!existe) {
               id++;
               Ambitos.add(new Ambito(nombre, tipo, 0, id));
               pilaAmbitos.pop();
               pilaAmbitos.push(id);
               agregarLog("Se creo el ambito " + nombre);
               
            } else {
                pilaAmbitos.pop();
                pilaAmbitos.push(idEncontrado);
                agregarLog("Se encontro el ambito " + nombre);
            }
        } else {
            Ambito tmp = Ambitos.get(pilaAmbitos.peek());
            for (int i = 0; i < tmp.getAmbitoSize(); i++) {
                if (tmp.getNombre().equals(nombre)) {
                    existe = true;
                    idEncontrado = tmp.getId();
                }
                if (!existe) {
                    id++;
                    Ambitos.get(pilaAmbitos.peek()).addAmbito(nombre, tipo, tmp.Nivel + 1, id);
                    pilaAmbitos.push(id);
                    agregarLog("Se creo el ambito " + nombre);
                } else {
                    pilaAmbitos.push(idEncontrado);
                    agregarLog("Se encontro el ambito " + nombre);
                }
            }
        }
    }
    
    public void agregarLog(String mensaje) {
        System.out.println(mensaje);
    }
}
