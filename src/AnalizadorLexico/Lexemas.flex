package AnalizadorLexico;
%%
%public
%class Lexemas
%{
    private boolean _existenTokens = false;
    StringBuffer _cadenaComentario = new StringBuffer();
    private boolean _comentarioActivo = false;

    public boolean comentarioActivo() {
        return this._comentarioActivo;
    }

    public boolean existenTokens() {
        return this._existenTokens;
    }
%}
%line
%column
%char
%state COMENTARIOMULTI
%full
%eofclose
%type MyToken
%init{

%init}
%eof{
    this._existenTokens = false;
%eof}
int = (\+|\-)?[0-9]+
identificador = (([a-zA-Z]+[a-zA-Z_0-9]*))
float = (\+|\-)?([\d])+[.](([\d])*)?
floatExp = (\+|\-)?([\d])+([.])?([\d])*((E|e)(\+|\-)?([\d])+(([.])?([\d])*)?)
bit = (0|1|NULL)?
string = ['][^'\n]*[']|[´][^´\n]*[´]
stringError = ((['][^'\n]*)[^'])|(([´][^´\n]*)[^´])
espacios = [\t\r\n ]
comentarioSimple = (--([^]*?)*)
suma = [\+]
resta = [\-]
multi = [\*]
division = [/]
mod = [\%]
menor = [\<]
meIg = [\<\=]
mayor = [\>]
maIg = [\>\=]
asignacion = [\=]
igualComp = [\=\=]
diferente = [\!\=]
and = [\&\&]
or = [\|\|]
not = [\!]
endLine = [\;]
coma = [\,]
punto = [\.]
corcheteAbrir = [\[]
corcheteCerrar = [\]]
parenAbrir = [\(]
parenCerrar = [\)]
llaveAbrir = [\{]
llaveCerrar = [\}]
doubCorch = [\[\]]
doubParen = [\(\)]
doubLlave = [\{\}]
arroba = [\@]
hast = [\#]
dobHasht = [\#\#]
reservadas = (ADD|ALL|ALTER|AND|ANY|AS|ASC|AUTHORIZATION|BACKUP|BEGIN|BETWEEN|BREAK|BROWSE|BULK|BY|CASCADE|CASE|CHECK|CHECKPOINT|CLOSE|CLUSTERED|COALESCE|COLLATE|COLUMN|COMMIT|COMPUTE|CONSTRAINT|CONTAINS|CONTAINSTABLE|CONTINUE|CONVERT|CREATE|CROSS|CURRENT|CURRENT_DATE|CURRENT_TIME|CURRENT_TIMESTAMP|CURRENT_USER|CURSOR|DATABASE|DBCC|DEALLOCATE|DECLARE|DEFAULT|DELETE|DENY|DESC|DISK|DISTINCT|DISTRIBUTED|DOUBLE|DROP|DUMP|ELSE|END|ERRLVL|ESCAPE|EXCEPT|EXEC|EXECUTE|EXISTS|EXIT|EXTERNAL|FETCH|FILE|FILLFACTOR|FOR|FOREIGN|FREETEXT|FREETEXTTABLE|FROM|FULL|FUNCTION|GOTO|GRANT|GROUP|HAVING|HOLDLOCK|IDENTITY|IDENTITY_INSERT|IDENTITYCOL|IF|IN|INDEX|INNER|INSERT|INTERSECT|INTO|IS|JOIN|KEY|KILL|LEFT|LIKE|LINENO|LOAD|MERGE|NATIONAL|NOCHECK|NOCLUSTERED|NOT|NULL|NULLIF|OF|OFF|OFFSETS|ON|OPEN|OPENDATASOURCE|OPENQUERY|OPENXML|OPTION|OR|ORDER|OUTER|OVER|PERCENT|PIVOT|PLAN|PRECISION|PRIMARY|PRINT|PROC|PROCEDURE|PUBLIC|RAISERROR|READ|READTEXT|RECONFIGURE|REFERENCES|REPLICATION|RESTORE|RESTRICT|RETURN|REVERT|REVOKE|RIGHT|ROLLBACK|ROWCOUNT|ROWGUIDCOL|RULE|SAVE|SCHEMA|SECURITYAUDIT|SELECT|SEMANTICKEYPHRASETABLE|SEMANTICSIMILARITYDETAILSTABLE|SEMANTICSIMILARITYTABLE|SESSION_USER|SET|SETUSER|SHUTDOWN|SOME|STATISTICS|SYSTEM_USER|TABLE|TABLESAMPLE|TEXTSIZE|THEN|TO|TOP|TRAN|TRANSACTION|TRIGGER|TRUNCATE|TRY_CONVERT|TSEQUAL|UNION|UNIQUE|UNPIVOT|UPDATE|UPDATETEXT|USE|USER|VALUES|VARYING|VIEW|WAITFOR|WHEN|WHERE|WHILE|WITH|WITHIN GROUP|WRITETEXT|ABSOLUTE|OVERLAPS|ACTION|PAD|ADA|PARTIAL|PASCAL|EXTRACT|POSITION|ALLOCATE|FALSO|PREPARE|FIRST|PRESERVE|FLOAT|ARE|PRIOR|PRIVILEGES|FORTRAN|ASSERTION|FOUND|AT|REAL|AVG|GET|GLOBAL|RELATIVE|GO|BIT|BIT_LENGTH|BOTH|ROWS|HOUR|CASCADED|SCROLL|IMMEDIATE|SECOND|CAST|SECTION|CATALOG|INCLUDE|CHAR|SESSION|CHAR_LENGTH|INDICATOR|CHARACTER|INITIALLY|CHARACTER_LENGTH|SIZE|INPUT|SMALLINT|INSENSITIVE|SPACE|INT|SQL|COLLATION|INTEGER|SQLCA|SQLCODE|INTERVAL|SQLERROR|CONNECT|SQLSTATE|CONNECTION|SQLWARNING|ISOLATION|SUBSTRING|CONSTRAINTS|SUM|LANGUAGE|CORRESPONDING|LAST|TEMPORARY|COUNT|LEADING|TIME|LEVEL|TIMESTAMP|TIMEZONE_HOUR|LOCAL|TIMEZONE_MINUTE|LOWER|MATCH|TRAILING|MAX|MIN|TRANSLATE|DATE|MINUTE|TRANSLATION|DAY|MODULE|TRIM|MONTH|VERDADERO|DEC|NAMES|DECIMAL|NATURAL|UNKNOWN|NCHAR|DEFERRABLE|NEXT|UPPER|DEFERRED|NO|USAGE|NONE|USING|DESCRIBE|VALUE|DESCRIPTOR|DIAGNOSTICS|NUMERIC|VARCHAR|DISCONNECT|OCTET_LENGTH|DOMAIN|ONLY|WHENEVER|WORK|END-EXEC|WRITE|YEAR|OUTPUT|ZONE|EXCEPTION)

%%
<YYINITIAL> "/*" {
    _cadenaComentario.append(yytext());
    _comentarioActivo = true;
    yybegin(COMENTARIOMULTI);
}
<YYINITIAL> {reservadas} {
    MyToken token = new MyToken("PalabraReservada", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
<YYINITIAL> {int} {
    MyToken token = new MyToken("DatoEntero", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
<YYINITIAL> {float} {
    MyToken token = new MyToken("DatoFloat", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
<YYINITIAL> {floatExp} {
    MyToken token = new MyToken("DatoFloat", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
<YYINITIAL> {bit} {
    MyToken token = new MyToken("DatoBit", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
<YYINITIAL> {string} {
    MyToken token = new MyToken("DatoString", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
<YYINITIAL> {stringError} {
    MyToken token = new MyToken("StringNoCerrado", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
<YYINITIAL> {identificador} {
    if (yytext().length() <= 31) {
        MyToken token = new MyToken("Identificador", yytext(), yyline + 1, yylength(), yycolumn + 1);
        this._existenTokens = true;
        return token;
    } else {
        MyToken token = new MyToken("IdentificadorTruncado", yytext(), yyline + 1, yylength(), yycolumn + 1);
        this._existenTokens = true;
        return token;
    }
}
<YYINITIAL> {comentarioSimple} {
    MyToken token = new MyToken("Comentario", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
<COMENTARIOMULTI> {
    "*/" {
        _cadenaComentario.append(yytext());
        _comentarioActivo = false;
        yybegin(YYINITIAL);
        MyToken token = new MyToken("ComentarioMultiLinea", _cadenaComentario.toString(), yyline + 1, yylength(), yycolumn + 1);
        this._existenTokens = true;
        return token;
    }
    <<EOF>> {
        MyToken token = new MyToken("ComentarioNoCerrado", _cadenaComentario.toString(), yyline + 1, yylength(), yycolumn + 1);
        return token;
    }
    [^"*/"] {
        _cadenaComentario.append(yytext());
    }
}
{suma} {
    MyToken token = new MyToken("Simbolo.Mas", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{resta} {
    MyToken token = new MyToken("Simbolo.Menos", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{multi} {
    MyToken token = new MyToken("Simbolo.Multiplicacion", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{division} {
    MyToken token = new MyToken("Simbolo.Division", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{mod} {
    MyToken token = new MyToken("Simbolo.Modulo", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{meIg} {
    MyToken token = new MyToken("Simbolo.MenorIgual", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{doubCorch} {
    MyToken token = new MyToken("Simbolo.Corchetes", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{doubLlave} {
    MyToken token = new MyToken("Simbolo.Llaves", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{doubParen} {
    MyToken token = new MyToken("Simbolo.Parentesis", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{maIg} {
    MyToken token = new MyToken("Simbolo.MayorIgual", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{asignacion} {
    MyToken token = new MyToken("Simbolo.Igual", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{mayor} {
    MyToken token = new MyToken("Simbolo.Mayor", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{menor} {
    MyToken token = new MyToken("Simbolo.Menor", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{igualComp} {
    MyToken token = new MyToken("Simbolo.IgualIgual", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{diferente} {
    MyToken token = new MyToken("Simbolo.Diferente", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{and} {
    MyToken token = new MyToken("Simbolo.And", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{or} {
    MyToken token = new MyToken("Simbolo.Or", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{not} {
    MyToken token = new MyToken("Simbolo.Not", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{endLine} {
    MyToken token = new MyToken("Simbolo.PuntoComa", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{coma} {
    MyToken token = new MyToken("Simbolo.Coma", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{punto} {
    MyToken token = new MyToken("Simbolo.Punto", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{corcheteAbrir} {
    MyToken token = new MyToken("Simbolo.CorcheteAbrir", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{corcheteCerrar} {
    MyToken token = new MyToken("Simbolo.CorcheteCerrar", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{parenAbrir} {
    MyToken token = new MyToken("Simbolo.ParantesisAbrir", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{parenCerrar} {
    MyToken token = new MyToken("Simbolo.ParentesisCerrar", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{llaveAbrir} {
    MyToken token = new MyToken("Simbolo.LlaveAbrir", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{llaveCerrar} {
    MyToken token = new MyToken("Simbolo.LlaveCerrar", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{arroba} {
    MyToken token = new MyToken("Simbolo.Arroba", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{dobHasht} {
    MyToken token = new MyToken("Simbolo.DobleNumeral", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
{hast} {
    MyToken token = new MyToken("Simbolo.Numeral", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}
<YYINITIAL> {espacios} {
    // No hacer nada
}
[^] {
    MyToken token = new MyToken("Error", yytext(), yyline + 1, yylength(), yycolumn + 1);
    this._existenTokens = true;
    return token;
}