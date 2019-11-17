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
        // Crea el ambito de la base de datos master
        agregarAmbito("master", "database");
        // Crea el ambito de la base de datos dbtest1
        agregarAmbito("dbtest1", "database");
        // Agrega las tablas miTb1, miTb2, miTb3 en la base de datos dbtest1
        agregarTabla("miTb1");
        agregarColumna("col1", "miTb1");
        agregarColumna("col2", "miTb1");
        agregarColumna("col3", "miTb1");
        agregarColumna("col4", "miTb1");
        agregarColumna("col5", "miTb1");
        agregarTabla("miTb2");
        agregarColumna("col1", "miTb2");
        agregarColumna("col2", "miTb2");
        agregarColumna("col3", "miTb2");
        agregarColumna("col4", "miTb2");
        agregarColumna("col5", "miTb2");
        agregarTabla("miTb3");
        agregarColumna("col1", "miTb3");
        agregarColumna("col2", "miTb3");
        agregarColumna("col3", "miTb3");
        agregarColumna("col4", "miTb3");
        agregarColumna("col5", "miTb3");
        // Crea el ambito de la base de datos dbtest2
        agregarAmbito("dbtest2", "database");
        // Agrega las tablas miTb1, miTb2, miTb3 en la base de datos dbtest2
        agregarTabla("miTb1");
        agregarColumna("col1", "miTb1");
        agregarColumna("col2", "miTb1");
        agregarColumna("col3", "miTb1");
        agregarColumna("col4", "miTb1");
        agregarColumna("col5", "miTb1");
        agregarTabla("miTb2");
        agregarColumna("col1", "miTb2");
        agregarColumna("col2", "miTb2");
        agregarColumna("col3", "miTb2");
        agregarColumna("col4", "miTb2");
        agregarColumna("col5", "miTb2");
        agregarTabla("miTb3");
        agregarColumna("col1", "miTb3");
        agregarColumna("col2", "miTb3");
        agregarColumna("col3", "miTb3");
        agregarColumna("col4", "miTb3");
        agregarColumna("col5", "miTb3");
        // Crea el ambito de la base de datos dbtest3
        agregarAmbito("dbtest3", "database");
        // Agrega las tablas miTb1, miTb2, miTb3 en la base de datos dbtest3
        agregarTabla("miTb1");
        agregarColumna("col1", "miTb1");
        agregarColumna("col2", "miTb1");
        agregarColumna("col3", "miTb1");
        agregarColumna("col4", "miTb1");
        agregarColumna("col5", "miTb1");
        agregarTabla("miTb2");
        agregarColumna("col1", "miTb2");
        agregarColumna("col2", "miTb2");
        agregarColumna("col3", "miTb2");
        agregarColumna("col4", "miTb2");
        agregarColumna("col5", "miTb2");
        agregarTabla("miTb3");
        agregarColumna("col1", "miTb3");
        agregarColumna("col2", "miTb3");
        agregarColumna("col3", "miTb3");
        agregarColumna("col4", "miTb3");
        agregarColumna("col5", "miTb3");
    }
    
    public boolean propiedadColumna(String nombre, String tabla, String propiedad, String valor) {
        int ambitoPos = getAmbitoPos(pilaAmbitos.peek());
        for (int i = 0; i < Ambitos.get(ambitoPos).Contenido.size(); i++) {
            if (Ambitos.get(ambitoPos).Contenido.get(i).getNombre().equals(tabla)) {
                for (int j = 0; j < ((Tabla) Ambitos.get(ambitoPos).Contenido.get(i)).columnas.size(); j++) {
                    if (((Tabla) Ambitos.get(ambitoPos).Contenido.get(i)).columnas.get(j).hayPropiedad(propiedad)) {
                        ((Tabla) Ambitos.get(ambitoPos).Contenido.get(i)).columnas.get(j).changeIfNotEqual(propiedad, valor);
                    } else {
                        ((Tabla) Ambitos.get(ambitoPos).Contenido.get(i)).columnas.get(j).propiedades.add(new Propiedades(propiedad, valor));
                    }
                }
            }
        }
        return false;
    }
    
    private int getAmbitoPos(int id) {
        for (int i = 0; i < Ambitos.size() - 1; i++) {
            if (Ambitos.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
    
    public boolean setVariable(Variable variable) {
        int posActual = getAmbitoPos(pilaAmbitos.peek());
        for (int i = 0; i < Ambitos.get(posActual).Variables.size() - 1; i++) {
            if (Ambitos.get(posActual).Variables.get(i).getNombre().equals(variable.getNombre())) {
                Ambitos.get(posActual).Variables.remove(i);
                Ambitos.get(posActual).Variables.add(variable);
                agregarLog("Se cambio el valor de la variable " + variable.getNombre());
                return false;
            }
        }
        agregarLog("La variable " + variable.getNombre() + " no se ha definido");
        return true;
    }
    
    public Variable getVariable(String nombre) {
        int posActual = getAmbitoPos(pilaAmbitos.peek());
        for (int i = 0; i < Ambitos.get(posActual).Variables.size() - 1; i++) {
            if (Ambitos.get(posActual).Variables.get(i).getNombre().equals(nombre)) {
                agregarLog("Se obtuvo la variable " + nombre);
                return Ambitos.get(posActual).Variables.get(i);
            }
        }
        agregarLog("La variable " + nombre + " no existe");
        return null;
    }
    
    public boolean removeVariable(String nombre) {
        int posActual = getAmbitoPos(pilaAmbitos.peek());
        for (int i = 0; i < Ambitos.get(posActual).Variables.size() - 1; i++) {
            if (Ambitos.get(posActual).Variables.get(i).getNombre().equals(nombre)) {
                Ambitos.get(posActual).Variables.remove(i);
                i = Ambitos.get(posActual).Variables.size();
                agregarLog("La variable " + nombre + " se elimino");
                return false;
            }
        }
        agregarLog("La variable " + nombre + " se intento eliminar pero no existe");
        return true;
    }
    
    public boolean agregarTabla(String nombre) {
        int posActual = getAmbitoPos(pilaAmbitos.peek());
        boolean existe = false;
        for (int i = 0; i < Ambitos.get(posActual).Contenido.size() - 1; i++) {
            if (Ambitos.get(posActual).Contenido.get(i) instanceof Tabla) {
                if (Ambitos.get(posActual).Contenido.get(i).getNombre().equals(nombre)) {
                    existe = true;
                    i = Ambitos.get(posActual).Contenido.size();
                }
            } 
        }
        if (existe) {
            agregarLog("La tabla " + nombre + " ya existe en la base de datos " + Ambitos.get(posActual).getNombre());
            return true;
        } else {
            id++;
            Ambitos.get(posActual).Contenido.add(new Tabla(id, nombre));
            agregarLog("Se creo la tabla " + nombre + " en la base de datos " + Ambitos.get(posActual).getNombre());
            return false;
        }
    }
    
    public boolean agregarColumna(String nombre, String tabla) {
        int posActual = getAmbitoPos(pilaAmbitos.peek());
        boolean existeTb = false;
        boolean existeCol = false;
        int tablePos = 0;
        for (int i = 0; i < Ambitos.get(posActual).Contenido.size() - 1; i++) {
            if (Ambitos.get(posActual).Contenido.get(i) instanceof Tabla) {
                if (Ambitos.get(posActual).Contenido.get(i).getNombre().equals(nombre)) {
                    existeTb = true;
                    tablePos = i;
                    i = Ambitos.get(posActual).Contenido.size();
                }
            }
        }
        if (existeTb) {
            for (int i = 0; i < ((Tabla) Ambitos.get(posActual).Contenido.get(tablePos)).columnas.size(); i++) {
                if (((Tabla) Ambitos.get(posActual).Contenido.get(tablePos)).columnas.get(i).getNombre().equals(nombre)) {
                    existeCol = true;
                    i = ((Tabla) Ambitos.get(posActual).Contenido.get(tablePos)).columnas.size();
                }
            }
            if (existeCol) {
                return true;
            } else {
                id++;
                ((Tabla) Ambitos.get(posActual).Contenido.get(tablePos)).columnas.add(new Columna(id, nombre));
                return false;
            }
        } else {
            agregarLog("La tabla " + tabla + " a la que desea agregar la columna " + nombre + " no existe");
            return true;
        }
    }
    
    /*
        INT --> hayParam1 = false y hayParam2 = false
        VARCHAR(10) --> hayParam1 = true y hayParam2 = false
        DECIMAL(5,2) --> hayParam1 = true y hayParam2 = true
    */
    public boolean definirVariable(String nombre, String tipo, int param1, boolean hayParam1, int param2, boolean hayParam2) {
        boolean existe = false;
        for (int i = 0; i < Ambitos.get(getAmbitoPos(pilaAmbitos.peek())).Variables.size() - 1; i++) {
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
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<String>(id, nombre, tipo));
                    break;
                case "int":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Integer>(id, nombre, tipo));
                    break;
                case "integer":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Integer>(id, nombre, tipo));
                    break;
                case "decimal":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Float>(id, nombre, tipo));
                    break;
                case "float":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Float>(id, nombre, tipo));
                    break;
                case "bit":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Boolean>(id, nombre, tipo));
                    break;
                case "date":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<String>(id, nombre, tipo));
                    break;
                case "time":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<String>(id, nombre, tipo));
                    break;
                case "real":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Integer>(id, nombre, tipo));
                    break;
                case "numeric":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Float>(id, nombre, tipo));
                    break;
                case "smallint":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Integer>(id, nombre, tipo));
                    break;
                case "char":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<Character>(id, nombre, tipo));
                    break;
                case "nchar":
                    Ambitos.get(pilaAmbitos.peek()).Variables.add(new Variable<String>(id, nombre, tipo));
                    break;
            }
            return false;
        }
    }
    
    public boolean existeObjeto(String objeto, String type) {
        Ambito ambitoActual = Ambitos.get(getAmbitoPos(pilaAmbitos.peek()));
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
