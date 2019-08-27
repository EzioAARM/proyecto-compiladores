package AnalizadorLexico;
import java.util.List;
import java.util.ArrayList;
%%
%public
%class Lexemas
%{
    private List<MyToken> Tokens = new ArrayList();

    StringBuffer _cadenaComentario = new StringBuffer();
    private boolean _comentarioActivo = false;

    public List<MyToken> getTokens() {
        return Tokens;
    }

    public boolean comentarioActivo() {
        return this._comentarioActivo;
    }
%}
%line
%column
%char
%state COMENTARIOMULTI
%full
%eofclose
%type List<MyToken>
%eofval{
    return Tokens;
%eofval}
%init{

%init}
int = (\+|\-)?[0-9]+
identificador = (([a-zA-Z]+[a-zA-Z_0-9]*))
float = (\+|\-)?([\d])+[.](([\d])*)?
floatExp = (\+|\-)?([\d])+([.])?([\d])*((E|e)(\+|\-)?([\d])+(([.])?([\d])*)?)
bit = (0|1|NULL)
string = ['][^'\n]*[']|[´][^´\n]*[´]
stringError = ((['][^'\n]*)[^'])|(([´][^´\n]*)[^´])
espacios = [\t\r\n\r ]
comentarioSimple = (--(.*?)*)
suma = (\+)
resta = (\-)
multi = (\*)
division = (\/)
mod = (\%)
menor = (\<)
meIg = (\<\=)
mayor = (\>)
maIg = (\>\=)
asignacion = (\=){1}
igualComp = (\=\=)
diferente = (\!\=)
and = (\&\&)
or = (\|\|)
not = (\!)
endLine = (\;)
coma = (\,)
punto = (\.)
corcheteAbrir = (\[)
corcheteCerrar = (\])
parenAbrir = (\()
parenCerrar = (\))
llaveAbrir = (\{)
llaveCerrar = (\})
doubCorch = (\[\])
doubParen = (\(\))
doubLlave = (\{\})
arroba = (\@)
hast = (\#)
dobHasht = (\#\#)
reservadas = (ADD|ALL|ALTER|AND|ANY|AS|ASC|AUTHORIZATION|BACKUP|BEGIN|BETWEEN|BREAK|BROWSE|BULK|BY|CASCADE|CASE|CHECK|CHECKPOINT|CLOSE|CLUSTERED|COALESCE|COLLATE|COLUMN|COMMIT|COMPUTE|CONSTRAINT|CONTAINS|CONTAINSTABLE|CONTINUE|CONVERT|CREATE|CROSS|CURRENT|CURRENT_DATE|CURRENT_TIME|CURRENT_TIMESTAMP|CURRENT_USER|CURSOR|DATABASE|DBCC|DEALLOCATE|DECLARE|DEFAULT|DELETE|DENY|DESC|DISK|DISTINCT|DISTRIBUTED|DOUBLE|DROP|DUMP|ELSE|END|ERRLVL|ESCAPE|EXCEPT|EXEC|EXECUTE|EXISTS|EXIT|EXTERNAL|FETCH|FILE|FILLFACTOR|FOR|FOREIGN|FREETEXT|FREETEXTTABLE|FROM|FULL|FUNCTION|GOTO|GRANT|GROUP|HAVING|HOLDLOCK|IDENTITY|IDENTITY_INSERT|IDENTITYCOL|IF|IN|INDEX|INNER|INSERT|INTERSECT|INTO|IS|JOIN|KEY|KILL|LEFT|LIKE|LINENO|LOAD|MERGE|NATIONAL|NOCHECK|NOCLUSTERED|NOT|NULL|NULLIF|OF|OFF|OFFSETS|ON|OPEN|OPENDATASOURCE|OPENQUERY|OPENXML|OPTION|OR|ORDER|OUTER|OVER|PERCENT|PIVOT|PLAN|PRECISION|PRIMARY|PRINT|PROC|PROCEDURE|PUBLIC|RAISERROR|READ|READTEXT|RECONFIGURE|REFERENCES|REPLICATION|RESTORE|RESTRICT|RETURN|REVERT|REVOKE|RIGHT|ROLLBACK|ROWCOUNT|ROWGUIDCOL|RULE|SAVE|SCHEMA|SECURITYAUDIT|SELECT|SEMANTICKEYPHRASETABLE|SEMANTICSIMILARITYDETAILSTABLE|SEMANTICSIMILARITYTABLE|SESSION_USER|SET|SETUSER|SHUTDOWN|SOME|STATISTICS|SYSTEM_USER|TABLE|TABLESAMPLE|TEXTSIZE|THEN|TO|TOP|TRAN|TRANSACTION|TRIGGER|TRUNCATE|TRY_CONVERT|TSEQUAL|UNION|UNIQUE|UNPIVOT|UPDATE|UPDATETEXT|USE|USER|VALUES|VARYING|VIEW|WAITFOR|WHEN|WHERE|WHILE|WITH|WITHIN GROUP|WRITETEXT|ABSOLUTE|OVERLAPS|ACTION|PAD|ADA|PARTIAL|PASCAL|EXTRACT|POSITION|ALLOCATE|FALSO|PREPARE|FIRST|PRESERVE|FLOAT|ARE|PRIOR|PRIVILEGES|FORTRAN|ASSERTION|FOUND|AT|REAL|AVG|GET|GLOBAL|RELATIVE|GO|BIT|BIT_LENGTH|BOTH|ROWS|HOUR|CASCADED|SCROLL|IMMEDIATE|SECOND|CAST|SECTION|CATALOG|INCLUDE|CHAR|SESSION|CHAR_LENGTH|INDICATOR|CHARACTER|INITIALLY|CHARACTER_LENGTH|SIZE|INPUT|SMALLINT|INSENSITIVE|SPACE|INT|SQL|COLLATION|INTEGER|SQLCA|SQLCODE|INTERVAL|SQLERROR|CONNECT|SQLSTATE|CONNECTION|SQLWARNING|ISOLATION|SUBSTRING|CONSTRAINTS|SUM|LANGUAGE|CORRESPONDING|LAST|TEMPORARY|COUNT|LEADING|TIME|LEVEL|TIMESTAMP|TIMEZONE_HOUR|LOCAL|TIMEZONE_MINUTE|LOWER|MATCH|TRAILING|MAX|MIN|TRANSLATE|DATE|MINUTE|TRANSLATION|DAY|MODULE|TRIM|MONTH|VERDADERO|DEC|NAMES|DECIMAL|NATURAL|UNKNOWN|NCHAR|DEFERRABLE|NEXT|UPPER|DEFERRED|NO|USAGE|NONE|USING|DESCRIBE|VALUE|DESCRIPTOR|DIAGNOSTICS|NUMERIC|VARCHAR|DISCONNECT|OCTET_LENGTH|DOMAIN|ONLY|WHENEVER|WORK|END-EXEC|WRITE|YEAR|OUTPUT|ZONE|EXCEPTION)

%%
<YYINITIAL> "/*" {
    _cadenaComentario.append(yytext());
    _comentarioActivo = true;
    yybegin(COMENTARIOMULTI);
}
<YYINITIAL> {reservadas} {
    Tokens.add(new MyToken("PalabraReservada", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {int} {
    Tokens.add(new MyToken("DatoEntero", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {float} {
    Tokens.add(new MyToken("DatoFloat", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {floatExp} {
    Tokens.add(new MyToken("DatoFloat", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {bit} {
    Tokens.add(new MyToken("DatoBit", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {string} {
    Tokens.add(new MyToken("DatoString", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {stringError} {
    Tokens.add(new MyToken("StringNoCerrado", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {identificador} {
    if (yytext().length() <= 31) {
        Tokens.add(new MyToken("Identificador", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
    } else {
        Tokens.add(new MyToken("IdentificadorTruncado", yytext(), "Error", yyline + 1, yylength(), yycolumn + 1));
    }
}
<YYINITIAL> {comentarioSimple} {
    Tokens.add(new MyToken("Comentario", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<COMENTARIOMULTI> {
    "*/" {
        _cadenaComentario.append(yytext());
        _comentarioActivo = false;
        yybegin(YYINITIAL);
        Tokens.add(new MyToken("Comentario", _cadenaComentario.toString(), "Token", yyline + 1, yylength(), yycolumn + 1));
        _cadenaComentario = new StringBuffer();
    }
    <<EOF>> {
        Tokens.add(new MyToken("ComentarioNoCerrado", _cadenaComentario.toString(), "Error", yyline + 1, yylength(), yycolumn + 1));
        return Tokens;
    }
    [^"*/"] {
        _cadenaComentario.append(yytext());
    }
}
{suma} {
    Tokens.add(new MyToken("Simbolo.Mas", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{resta} {
    Tokens.add(new MyToken("Simbolo.Menos", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{multi} {
    Tokens.add(new MyToken("Simbolo.Multiplicacion", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{division} {
    Tokens.add(new MyToken("Simbolo.Division", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{mod} {
    Tokens.add(new MyToken("Simbolo.Modulo", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{meIg} {
    Tokens.add(new MyToken("Simbolo.MenorIgual", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{doubCorch} {
    Tokens.add(new MyToken("Simbolo.Corchetes", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{doubLlave} {
    Tokens.add(new MyToken("Simbolo.Llaves", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{doubParen} {
    Tokens.add(new MyToken("Simbolo.Parentesis", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{maIg} {
    Tokens.add(new MyToken("Simbolo.MayorIgual", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{asignacion} {
    Tokens.add(new MyToken("Simbolo.Igual", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{mayor} {
    Tokens.add(new MyToken("Simbolo.Mayor", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{menor} {
    Tokens.add(new MyToken("Simbolo.Menor", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{igualComp} {
    Tokens.add(new MyToken("Simbolo.IgualIgual", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{diferente} {
    Tokens.add(new MyToken("Simbolo.Diferente", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{and} {
    Tokens.add(new MyToken("Simbolo.And", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{or} {
    Tokens.add(new MyToken("Simbolo.Or", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{not} {
    Tokens.add(new MyToken("Simbolo.Not", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{endLine} {
    Tokens.add(new MyToken("Simbolo.PuntoComa", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{coma} {
    Tokens.add(new MyToken("Simbolo.Coma", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{punto} {
    Tokens.add(new MyToken("Simbolo.Punto", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{corcheteAbrir} {
    Tokens.add(new MyToken("Simbolo.CorcheteAbrir", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{corcheteCerrar} {
    Tokens.add(new MyToken("Simbolo.CorcheteCerrar", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{parenAbrir} {
    Tokens.add(new MyToken("Simbolo.ParantesisAbrir", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{parenCerrar} {
    Tokens.add(new MyToken("Simbolo.ParentesisCerrar", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{llaveAbrir} {
    Tokens.add(new MyToken("Simbolo.LlaveAbrir", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{llaveCerrar} {
    Tokens.add(new MyToken("Simbolo.LlaveCerrar", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{arroba} {
    Tokens.add(new MyToken("Simbolo.Arroba", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{dobHasht} {
    Tokens.add(new MyToken("Simbolo.DobleNumeral", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{hast} {
    Tokens.add(new MyToken("Simbolo.Numeral", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {espacios} {
    // No hacer nada
}
[^] {
    Tokens.add(new MyToken("Error", yytext(), "Error", yyline + 1, yylength(), yycolumn + 1));
}