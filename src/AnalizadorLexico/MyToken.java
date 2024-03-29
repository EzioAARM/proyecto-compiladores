/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorLexico;

/**
 *
 * @author axel
 */
public class MyToken {
    String _token;
    String _lexema;
    String _type;
    int _fila;
    int _columnaInicial;
    int _columnaFinal;

    public MyToken (String token, String lexema, String type, int fila, int tamCadena, int columnaInicial) {
        _token = token;
        _lexema = lexema;
        _fila = fila;
        _columnaInicial = columnaInicial;
        _columnaFinal = columnaInicial + tamCadena;
        _type = type;
    }

    /**
     * @return the _type
     */
    public String get_type() {
        return _type;
    }
    
    /**
     * @return the _columnaFinal
     */
    public int get_columnaFinal() {
        return _columnaFinal;
    }

    /**
     * @return the _columnaInicial
     */
    public int get_columnaInicial() {
        return _columnaInicial;
    }
    
    /**
     * @return the fila
     */
    public int getFila() {
        return _fila;
    }

    /**
     * @return the _lexema
     */
    public String get_lexema() {
        return _lexema;
    }

    /**
     * @return the _token
     */
    public String get_token() {
        return _token;
    }

    @Override
    public String toString() {
        switch (this.get_type()) {
            case "Error":
                return "*Error* en la linea: " + this.getFila() + ", columna: " + this.get_columnaInicial() + "\nEl lexema: " + this.get_lexema() + " pertenece al error tipo: " + this.get_token() + "\n";
            case "Advertencia":
                return "*Advertencia* en la linea: " + this.getFila() + ", columna: " + this.get_columnaInicial() + "\nEl lexema: " + this.get_lexema() + " pertenece a la advertencia tipo: " + this.get_token() + "\n";
            default:
                return "Linea: " + this.getFila() + ", columnas: " + this.get_columnaInicial() + "-" + this.get_columnaFinal() + "\nEl lexema: " + this.get_lexema() + " pertenece al token: " + this.get_token() + "\n";
        }
    }
}
