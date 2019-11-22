/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TablaSimbolos.Manejadores;

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
public class SymbolDriver extends DriverContainer {
    
    /*
        True --> Error
        False --> Operacion exitosa
    */
    
    List<TipoDato> tiposDato = new ArrayList();
    
    public SymbolDriver() {
        // Crea el ambito de la base de datos master
        id++;
        estructuraServidor.add(new Database(id, "master"));
        agregarAmbito("master", "database");
        
        id++;
        estructuraServidor.add(new Database(id, "dbTest"));
        int dbPos = getDatabase(id);
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "tablaPrueba"));
        id++;
        int tbPos = estructuraServidor.get(dbPos).getTabla("tablaPrueba");
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "columna1")); 
        
        id++;
        estructuraServidor.add(new Database(id, "Motociclismo"));
        dbPos = getDatabase(id);
        
        id++; 
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Carrera"));
        id++;
        tbPos = estructuraServidor.get(dbPos).getTabla("Carrera");
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id,"NombreGP"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id,"Año"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id,"FechaHoraInicio"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id,"NumVueltas"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id,"NombreCircuito"));
        

        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Circuito"));
        id++;
        tbPos = estructuraServidor.get(dbPos).getTabla("Circuito");
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Nombre"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Pais"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Tipo"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Longitud"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Diseñador"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "CONSULTAS_SQL"));
        id++;
        tbPos = estructuraServidor.get(dbPos).getTabla("CONSULTAS_SQL");
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "ID_CONSULTA"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "CONSULTA"));
           
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Escuderia"));
        id++;
        tbPos = estructuraServidor.get(dbPos).getTabla("Escuderia");
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Nombre"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Manager"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "FabricanteMotor"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Sede"));
       
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Piloto"));
        id++;
        tbPos = estructuraServidor.get(dbPos).getTabla("Piloto");
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Codigo"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Nombre"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Nacionalidad"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "FechaNacimiento"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "CarreraDebut"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "NombreEscuderia"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Resultado"));
        id++;
        tbPos = estructuraServidor.get(dbPos).getTabla("Resultado");
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "NombreGP"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "A"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "CodPiloto"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Puesto"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "DistanciaGanador"));
        
  
        
        id++;
        estructuraServidor.add(new Database(id, "Veterinaria"));
        dbPos = getDatabase(id);
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "CalendarioVacunacion"));
        id++;
        tbPos = estructuraServidor.get(dbPos).getTabla("CalendarioVacunacion");
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Fecha"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "Enfermedad"));
        id++;
        estructuraServidor.get(dbPos).tablas.get(tbPos).columnas.add(new Columna(id, "CodigoPaciente"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Cliente"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Clinica"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Consulta"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Diagnostico"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Factura"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "HistorialMedico"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Laboratorio"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Medicina"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "OperacionQuirurgica"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Paciente"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Producto"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Proveedor"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "SuministraFarmacia"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "SuministraTienda"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Tratamiento"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "VentaFarmacia"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "VentaTienda"));
        
        id++;
        estructuraServidor.get(dbPos).tablas.add(new Tabla(id, "Veterinario"));
                
        escribirArchivo("Antes");
    }
    
    public void guardarDatatype(String nombre) {
        for (int i = 0; i < tiposDato.size(); i++) {
            if (tiposDato.get(i).getNombre().equals(nombre)) {
                agregarLog("Se encontro el tipo de dato " + nombre);
            }
        }
        id++;
        tiposDato.add(new TipoDato(id, nombre));
        agregarLog("Se creo el tipo de dato " + nombre);
    }
    
    /*
        INT --> hayParam1 = false y hayParam2 = false
        VARCHAR(10) --> hayParam1 = true y hayParam2 = false
        DECIMAL(5,2) --> hayParam1 = true y hayParam2 = true
    */
    public boolean definirVariable(String nombre, String tipo, int param1, boolean hayParam1, int param2, boolean hayParam2) {
        int varsSize = Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.size();
        for (int i = 0; i < varsSize; i++) {
            if (Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.get(i).getNombre().equals(nombre)) {
                agregarLog("La variable " + nombre + " ya existe");
                return true;
            }
        }
        id++;
        switch (tipo.toLowerCase()) {
            case "varchar":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<String>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "int":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<Integer>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "integer":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<Integer>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "decimal":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<Float>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "float":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<Float>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "bit":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<Boolean>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "date":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<String>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "time":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<String>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "real":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<Integer>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "numeric":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<Float>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "smallint":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<Integer>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "char":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<Character>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
            case "nchar":
                Ambitos.get(getAmbito(pilaAmbitos.peek())).Variables.add(new Variable<String>(id, nombre, tipo, param1, hayParam1, param2, hayParam2));
                break;
        }
        agregarLog("Se creó la variable " + nombre + " de tipo " + tipo);
        return false;
    }
    
    public boolean setVariable(Variable variable) {
        int posActual = getAmbito(pilaAmbitos.peek());
        for (int i = 0; i < Ambitos.get(posActual).Variables.size(); i++) {
            if (Ambitos.get(posActual).Variables.get(i).getNombre().equals(variable.getNombre())) {
                Ambitos.get(posActual).Variables.remove(i);
                variable.asignado = true;
                Ambitos.get(posActual).Variables.add(variable);
                agregarLog("Se cambio el valor de la variable " + variable.getNombre());
                return false;
            }
        }
        agregarLog("La variable " + variable.getNombre() + " no se ha definido");
        return true;
    }
    
    public Variable getVariable(String nombre) {
        int posActual = getAmbito(pilaAmbitos.peek());
        for (int i = 0; i < Ambitos.get(posActual).Variables.size(); i++) {
            if (Ambitos.get(posActual).Variables.get(i).getNombre().equals(nombre)) {
                agregarLog("Se obtuvo la variable " + nombre);
                return Ambitos.get(posActual).Variables.get(i);
            }
        }
        agregarLog("La variable " + nombre + " no existe");
        return null;
    }
    
    public boolean removeVariable(String nombre) {
        int posActual = getAmbito(pilaAmbitos.peek());
        for (int i = 0; i < Ambitos.get(posActual).Variables.size(); i++) {
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
    
    public void salirAmbitoFuncion() {
        pilaAmbitos.pop();
    }
    
    public void agregarAmbito(String nombre, String tipo) {
        if (tipo.equals("database")) {
            if (existeDatabase(nombre)) {
                if (existeAmbito(nombre)) {
                    int pos = getAmbito(nombre);
                    pilaAmbitos.pop();
                    pilaAmbitos.push(Ambitos.get(pos).getId());
                    agregarLog("Se encontro el ambito " + nombre);
                } else {
                    Ambitos.add(new Ambito(nombre, tipo, 0, estructuraServidor.get(getDatabase(nombre)).getId()));
                    if (pilaAmbitos.size() != 0) {
                        pilaAmbitos.pop();
                    }
                    pilaAmbitos.push(estructuraServidor.get(getDatabase(nombre)).getId());
                    agregarLog("Se creo el ambito " + nombre);
                }
            } else {
                agregarLog("La base de datos " + nombre + " no existe");
            }
        } else {
            if (estructuraServidor.get(getDatabase(nombre)).existeFuncion(nombre)) {
                int posPadre = getAmbito(pilaAmbitos.peek());
                int posFn = getAmbito(nombre, posPadre);
                if (posFn != -1) {
                    int dbPos = getDatabase(pilaAmbitos.peek());
                    int fnPos = estructuraServidor.get(dbPos).getFuncion(nombre);
                    int fnId = ((Function) estructuraServidor.get(dbPos).funciones.get(fnPos)).getId();
                    Ambitos.get(posPadre).Ambitos.add(new Ambito(nombre, tipo, 1, fnId));
                    pilaAmbitos.push(fnId);
                    agregarLog("Se creo el ambito " + nombre);
                } else {
                    agregarLog("Se creo el ambito " + nombre);
                }
            } else {
                agregarLog("La funcion " + nombre + " no existe");
            }
        }
    }
    
    public boolean agregarTabla(String nombre) {
        int idDb = Ambitos.get(getAmbito(pilaAmbitos.peek())).getId();
        if (estructuraServidor.get(getDatabase(idDb)).existeTabla(nombre)) {
            agregarLog("La tabla " + nombre + " ya existe en la base de datos actual");
            return true;
        } else {
            id++;
            estructuraServidor.get(getDatabase(idDb)).tablas.add(new Tabla(id, nombre));
            agregarLog("Se creo la tabla " + nombre + " en la base de datos " + estructuraServidor.get(idDb).getNombre());
            return false;
        }
    }
    
    public boolean agregarColumna(String nombre, String tabla) {
        int idDb = Ambitos.get(getAmbito(pilaAmbitos.peek())).getId();
        int posTb = estructuraServidor.get(getDatabase(idDb)).getTabla(tabla);
        if (estructuraServidor.get(getDatabase(idDb)).tablas.get(posTb).existeColumna(nombre)) {
            agregarLog("La columna " + nombre + " ya existe en la tabla " + tabla);
            return true;
        } else {
            id++;
            estructuraServidor.get(getDatabase(idDb)).tablas.get(posTb).columnas.add(new Columna(id, nombre));
            agregarLog("Se creo la columna " + nombre + " en la tabla " + tabla);
            return false;
        }
    }
    
    public boolean truncarTabla(String nombre) {
        int idDb = Ambitos.get(getAmbito(pilaAmbitos.peek())).getId();
        if (estructuraServidor.get(getDatabase(idDb)).existeTabla(nombre)) {
            agregarLog("La tabla " + nombre + " se trunco con exito");
            return false;
        } else {
            agregarLog("La tabla " + nombre + " no existe");
            return true;
        }
    }
    
    public boolean crearTransaccion(String nombre) {
        if (TransaccionActiva != -1) {
            agregarLog("Ya existe una transaccion, intente usando checkpoints");
            return true;
        } else {
            id++;
            Ambitos.get(getAmbito(pilaAmbitos.peek())).Transacciones.add(new Transaction(id, nombre));
            TransaccionActiva = id;
            agregarLog("La transaccion se inicio");
            return false;
        }
    }
    
    public boolean addCheckpoint(String nombre) {
        if (TransaccionActiva != -1) {
            int ambitoPos = getAmbito(pilaAmbitos.peek());
            int posTran = Ambitos.get(ambitoPos).getTransaction(TransaccionActiva);
            int checkpoint = Ambitos.get(ambitoPos).Transacciones.get(posTran).getCheckpoint(nombre);
            if (checkpoint == -1) {
                id++;
                Ambitos.get(ambitoPos).Transacciones.get(posTran).SavePoints.add(new Checkpoint(id, nombre));
                agregarLog("El checkpoint se agrego a la transaccion con id " + TransaccionActiva);
                return false;
            } else {
                agregarLog("El checkpoint con el nombre" + nombre + " ya existe, intente con otro nombre");
                return true;
            }
        } else {
            agregarLog("No hay una transaccion activa, intente usando BEGIN TRANSACTION [transaction_name]");
            return true;
        }
    }
    
    public boolean commitTransaction() {
        if (TransaccionActiva == -1) {
            agregarLog("No hay transaccion para hacer commit");
            return true;
        } else {
            TransaccionActiva = -1;
            agregarLog("Se guardaron los cambios de la transaccion");
            return false;
        }
    }
    
    public boolean commitTransaction(String nombre) {
        if (TransaccionActiva == -1) {
            agregarLog("No hay transaccion para hacer commit");
            return true;
        } else {
            if (nombre.equals("")) {
                return commitTransaction();
            } else {
                int ambitoPos = getAmbito(pilaAmbitos.peek());
                int posTran = Ambitos.get(ambitoPos).getTransaction(TransaccionActiva);
                int checkpoint = Ambitos.get(ambitoPos).Transacciones.get(posTran).getCheckpoint(nombre);
                if (checkpoint == -1) {
                    if (Ambitos.get(ambitoPos).Transacciones.get(posTran).getNombre().equals(nombre)) {
                        TransaccionActiva = -1;
                        agregarLog("Se realizo commit a la transaccion " + nombre);
                        return false;
                    } else {
                        agregarLog("El checkpoint al que desea hacer commit no existe");
                        return true;
                    }
                } else {
                    if (!Ambitos.get(ambitoPos).Transacciones.get(posTran).obtenerStatus(nombre).equals("activa")) {
                        agregarLog("La transaccion ya fue terminada o cancelada");
                        return true;
                    } else {
                        Ambitos.get(ambitoPos).Transacciones.get(posTran).cambiarStatus(nombre, "commited");
                        agregarLog("Se hizo commit al checkpoint " + nombre);
                        return false;
                    }
                }
            }
        }
    }
    
    public boolean rollbackTransaction() {
        if (TransaccionActiva == -1) {
            agregarLog("No hay transaccion para hacer rollback");
            return true;
        } else {
            TransaccionActiva = -1;
            agregarLog("Se revirtieron los cambios de la transaccion");
            return false;
        }
    }
    
    public boolean rollbackTransaction(String nombre) {
        if (TransaccionActiva == -1) {
            agregarLog("No hay transaccion para hacer commit");
            return true;
        } else {
            if (nombre.equals("")) {
                return rollbackTransaction();
            } else {
                int ambitoPos = getAmbito(pilaAmbitos.peek());
                int posTran = Ambitos.get(ambitoPos).getTransaction(TransaccionActiva);
                int checkpoint = Ambitos.get(ambitoPos).Transacciones.get(posTran).getCheckpoint(nombre);
                if (checkpoint == -1) {
                    if (Ambitos.get(ambitoPos).Transacciones.get(posTran).getNombre().equals(nombre)) {
                        TransaccionActiva = -1;
                        agregarLog("Se realizo rollback a la transaccion " + nombre);
                        return false;
                    } else {
                        agregarLog("El checkpoint al que desea hacer rollback no existe");
                        return true;
                    }
                } else {
                    if (!Ambitos.get(ambitoPos).Transacciones.get(posTran).obtenerStatus(nombre).equals("activa")) {
                        agregarLog("La transaccion ya fue terminada o cancelada");
                        return true;
                    } else {
                        Ambitos.get(ambitoPos).Transacciones.get(posTran).cambiarStatus(nombre, "cancelada");
                        agregarLog("Se hizo rollback al checkpoint " + nombre);
                        return false;
                    }
                }
            }
        }
    }
    
    @Override
    public String toString() {
        String estructuraString = "ID DATABASE | NOMBRE DATABASE";
        for (int i = 0; i < estructuraServidor.size(); i++) {
            estructuraString += estructuraServidor.get(i).toString() + "\n";
        }
        String ambitosString = "ID AMBITO | NOMBRE AMBITO | NIVEL PROFUNDIDAD \n";
        for (int i = 0; i < Ambitos.size(); i++) {
            ambitosString += Ambitos.get(i).toString() + "\n";
        }
        return estructuraString + " " + ambitosString;
    }
    
    public void escribirArchivo(String archivo) {
        try {
            FileWriter archivoSalida = new FileWriter("C:\\Users\\David\\Documents\\SalidaCompis\\" + archivo + ".txt");
            PrintWriter pw = new PrintWriter(archivoSalida);
            pw.write(this.toString());
            pw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
}
