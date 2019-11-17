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
    
    /*
        True --> Error
        False --> Operacion exitosa
    */
    
    Stack<Integer> pilaAmbitos = null;
    int id = 0;
    
    List<Ambito> Ambitos = null;
    
    public SymbolDriver() {
        Ambitos = new ArrayList();
        pilaAmbitos = new Stack<Integer>();
        agregarAmbito("master", "database");
    }
    
    public boolean actualizarPropiedad(String nombre, String tipo, String propiedad, String valor) {
        for (int i = 0; i < Ambitos.get(pilaAmbitos.size()).Contenido.size() - 1; i++) {
            if (Ambitos.get(pilaAmbitos.size()).Contenido.get(i).getNombre().equals(nombre)) {
                Ambitos.get(pilaAmbitos.size()).Contenido.get(i).changeIfNotEqual(propiedad, valor);
                agregarLog("Se actualizo la propiedad " + propiedad + " con el valor " + valor + " del objeto " + Ambitos.get(pilaAmbitos.size()).Contenido.get(i).getNombre());
                return true;
            }
        }
        agregarLog("El objeto " + nombre + " no se encuentra en el ambito actual");
        return false;
    }
    
    /*
        INT --> hayParam1 = false y hayParam2 = false
        VARCHAR(10) --> hayParam1 = true y hayParam2 = false
        DECIMAL(5,2) --> hayParam1 = true y hayParam2 = true
    */
    public boolean definirVariable(String nombre, String tipo, int param1, boolean hayParam1, int param2, boolean hayParam2) {
        boolean existe = false;
        for (int i = 0; i < Ambitos.get(pilaAmbitos.peek()).Variables.size() - 1; i++) {
            if (Ambitos.get(pilaAmbitos.peek()).Variables.get(i).getNombre().equals(nombre)) {
                existe = true;
                i = Ambitos.get(pilaAmbitos.peek()).Variables.size();
            }
        }
        if (existe) {
            agregarLog("La variable " + nombre + " ya existe");
            return true;
        } else {
            agregarLog("Se creó la variable " + nombre + " de tipo " + tipo);
            id++;
            switch (tipo.toLowerCase()) {
                case "varchar":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<String>(id, nombre));
                    break;
                case "int":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Integer>(id, nombre));
                    break;
                case "integer":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Integer>(id, nombre));
                    break;
                case "decimal":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Float>(id, nombre));
                    break;
                case "float":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Float>(id, nombre));
                    break;
                case "bit":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Boolean>(id, nombre));
                    break;
                case "date":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<String>(id, nombre));
                    break;
                case "time":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<String>(id, nombre));
                    break;
                case "real":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Integer>(id, nombre));
                    break;
                case "numeric":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Float>(id, nombre));
                    break;
                case "smallint":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Integer>(id, nombre));
                    break;
                case "char":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Character>(id, nombre));
                    break;
                case "nchar":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<String>(id, nombre));
                    break;
            }
            
            return false;
        }
    }
    
    public boolean existeObjeto(String objeto, String type) {
        Ambito ambitoActual = Ambitos.get(pilaAmbitos.peek());
        Objeto objetoEncontrado = null;
        for (int i = 0; i < ambitoActual.getContentSize() - 1; i++) {
            if (ambitoActual.Contenido.get(i).getNombre().equals(objeto)) {
                objetoEncontrado = ambitoActual.Contenido.get(i);
                switch (type.toLowerCase()) {
                    case "columna":
                        if (objetoEncontrado instanceof Columna) {
                            agregarLog("Se encontro el tipo " + type);
                            return true;
                        }
                        break;
                    case "database":
                        if (objetoEncontrado instanceof Database) {
                            agregarLog("Se encontro el tipo " + type);
                            return true;
                        }
                        break;
                    case "funcion":
                        if (objetoEncontrado instanceof Function) {
                            agregarLog("Se encontro el tipo " + type);
                            return true;
                        }
                        break;
                    case "index":
                        if (objetoEncontrado instanceof Index) {
                            agregarLog("Se encontro el tipo " + type);
                            return true;
                        }
                        break;
                    case "tabla":
                        if (objetoEncontrado instanceof Tabla) {
                            agregarLog("Se encontro el tipo " + type);
                            return true;
                        }
                        break;
                    case "tipo de dato":
                        if (objetoEncontrado instanceof TipoDato) {
                            agregarLog("Se encontro el tipo " + type);
                            return true;
                        }
                        break;
                    case "usuario":
                        if (objetoEncontrado instanceof Usuario) {
                            agregarLog("Se encontro el tipo " + type);
                            return true;
                        }
                        break;
                    case "variable":
                        if (objetoEncontrado instanceof Variable) {
                            agregarLog("Se encontro el tipo " + type);
                            return true;
                        }
                        break;
                    case "vista":
                        if (objetoEncontrado instanceof View) {
                            agregarLog("Se encontro el tipo " + type);
                            return true;
                        }
                        break;
                    default:
                        agregarLog("El objeto  " + objeto + " no existe");
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
            for (int i = 0; i < Ambitos.size() - 1; i++) {
                if (Ambitos.get(i).getNombre().equals(nombre)) {
                    existe = true;
                    idEncontrado = Ambitos.get(i).getId();
                }
            }
            if (!existe) {
               id++;
               Ambitos.add(new Ambito(nombre, tipo, 0, id));
               if (pilaAmbitos.size() != 0) {
                   pilaAmbitos.pop();
                   pilaAmbitos.push(id);
                   agregarLog("Se creo el ambito " + nombre);
               } else {
                   pilaAmbitos.push(id);
                   agregarLog("Se creo el ambito " + nombre);
               }
            } else {
                pilaAmbitos.pop();
                pilaAmbitos.push(idEncontrado);
                agregarLog("Se encontro el ambito " + nombre);
            }
        } else {
            Ambito tmp = Ambitos.get(pilaAmbitos.peek());
            for (int i = 0; i < tmp.getAmbitoSize() - 1; i++) {
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
