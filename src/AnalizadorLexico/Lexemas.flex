package AnalizadorLexico;
%%
%public
%class Lexemas
%{
    private boolean _existenTokens = false;

    public boolean existenTokens() {
        return this._existenTokens;
    }
%}
%line
%column
%type MyToken
%init{

%init}
%eof{
    this._existenTokens = false;
%eof}
int = (\+|\-)?[0-9]
identificador = (([a-zA-Z]+[a-zA-Z_0-9]*))
float = (\+|\-)?([\d])+[.](([\d])*)?
floatExp = (\+|\-)?([\d])+([.])?([\d])*((E|e)(\+|\-)?([\d])+(([.])?([\d])*)?)
bit = (0|1|NULL)+
string = ['][^'\n]*[']|[´][^´\n]*[´]
stringError = ['].*[^']
espacios = [\t\r\n ]
comentarioSimple = (--([^]*?)*)
comentarioMultilinea = [\/\*]([^]|\n)*[\*\/]
simbolo = [\+]|[\-]|[\*]|[/]|[\%]|[\<]|[\<\=]|[\>]|[\>\=]|[\=]|[\=\=]|[\!\=]|[\&\&]|[\|\|]|[\!]|[\;]|[\,]|[\.]|[\[]|[\]]|[\(]|[\)]|[\{]|[\}]|[\[\]]|[\(\)]|[\{\}]|[\@]|[\#]|[\#\#]
reservadas = (ADD|ALL|ALTER|AND|ANY|AS|ASC|AUTHORIZATION|BACKUP|BEGIN|BETWEEN|BREAK|BROWSE|BULK|BY|CASCADE|CASE|CHECK|CHECKPOINT|CLOSE|CLUSTERED|COALESCE|COLLATE|COLUMN|COMMIT|COMPUTE|CONSTRAINT|CONTAINS|CONTAINSTABLE|CONTINUE|CONVERT|CREATE|CROSS|CURRENT|CURRENT_DATE|CURRENT_TIME|CURRENT_TIMESTAMP|CURRENT_USER|CURSOR|DATABASE|DBCC|DEALLOCATE|DECLARE|DEFAULT|DELETE|DENY|DESC|DISK|DISTINCT|DISTRIBUTED|DOUBLE|DROP|DUMP|ELSE|END|ERRLVL|ESCAPE|EXCEPT|EXEC|EXECUTE|EXISTS|EXIT|EXTERNAL|FETCH|FILE|FILLFACTOR|FOR|FOREIGN|FREETEXT|FREETEXTTABLE|FROM|FULL|FUNCTION|GOTO|GRANT|GROUP|HAVING|HOLDLOCK|IDENTITY|IDENTITY_INSERT|IDENTITYCOL|IF|IN|INDEX|INNER|INSERT|INTERSECT|INTO|IS|JOIN|KEY|KILL|LEFT|LIKE|LINENO|LOAD|MERGE|NATIONAL|NOCHECK|NOCLUSTERED|NOT|NULL|NULLIF|OF|OFF|OFFSETS|ON|OPEN|OPENDATASOURCE|OPENQUERY|OPENXML|OPTION|OR|ORDER|OUTER|OVER|PERCENT|PIVOT|PLAN|PRECISION|PRIMARY|PRINT|PROC|PROCEDURE|PUBLIC|RAISERROR|READ|READTEXT|RECONFIGURE|REFERENCES|REPLICATION|RESTORE|RESTRICT|RETURN|REVERT|REVOKE|RIGHT|ROLLBACK|ROWCOUNT|ROWGUIDCOL|RULE|SAVE|SCHEMA|SECURITYAUDIT|SELECT|SEMANTICKEYPHRASETABLE|SEMANTICSIMILARITYDETAILSTABLE|SEMANTICSIMILARITYTABLE|SESSION_USER|SET|SETUSER|SHUTDOWN|SOME|STATISTICS|SYSTEM_USER|TABLE|TABLESAMPLE|TEXTSIZE|THEN|TO|TOP|TRAN|TRANSACTION|TRIGGER|TRUNCATE|TRY_CONVERT|TSEQUAL|UNION|UNIQUE|UNPIVOT|UPDATE|UPDATETEXT|USE|USER|VALUES|VARYING|VIEW|WAITFOR|WHEN|WHERE|WHILE|WITH|WITHIN GROUP|WRITETEXT|ABSOLUTE|OVERLAPS|ACTION|PAD|ADA|PARTIAL|PASCAL|EXTRACT|POSITION|ALLOCATE|FALSO|PREPARE|FIRST|PRESERVE|FLOAT|ARE|PRIOR|PRIVILEGES|FORTRAN|ASSERTION|FOUND|AT|REAL|AVG|GET|GLOBAL|RELATIVE|GO|BIT|BIT_LENGTH|BOTH|ROWS|HOUR|CASCADED|SCROLL|IMMEDIATE|SECOND|CAST|SECTION|CATALOG|INCLUDE|CHAR|SESSION|CHAR_LENGTH|INDICATOR|CHARACTER|INITIALLY|CHARACTER_LENGTH|SIZE|INPUT|SMALLINT|INSENSITIVE|SPACE|INT|SQL|COLLATION|INTEGER|SQLCA|SQLCODE|INTERVAL|SQLERROR|CONNECT|SQLSTATE|CONNECTION|SQLWARNING|ISOLATION|SUBSTRING|CONSTRAINTS|SUM|LANGUAGE|CORRESPONDING|LAST|TEMPORARY|COUNT|LEADING|TIME|LEVEL|TIMESTAMP|TIMEZONE_HOUR|LOCAL|TIMEZONE_MINUTE|LOWER|MATCH|TRAILING|MAX|MIN|TRANSLATE|DATE|MINUTE|TRANSLATION|DAY|MODULE|TRIM|MONTH|VERDADERO|DEC|NAMES|DECIMAL|NATURAL|UNKNOWN|NCHAR|DEFERRABLE|NEXT|UPPER|DEFERRED|NO|USAGE|NONE|USING|DESCRIBE|VALUE|DESCRIPTOR|DIAGNOSTICS|NUMERIC|VARCHAR|DISCONNECT|OCTET_LENGTH|DOMAIN|ONLY|WHENEVER|WORK|END-EXEC|WRITE|YEAR|OUTPUT|ZONE|EXCEPTION)

%%
{reservadas} {
    MyToken token = new MyToken("PalabraReservada", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{int} {
    MyToken token = new MyToken("DatoEntero", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{float} {
    MyToken token = new MyToken("DatoFloat", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{floatExp} {
    MyToken token = new MyToken("DatoFloat", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{bit} {
    MyToken token = new MyToken("DatoBit", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{string} {
    MyToken token = new MyToken("DatoString", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{stringError} {
    MyToken token = new MyToken("ErrorString", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{identificador} {
    if (yytext().length() <= 31) {
        MyToken token = new MyToken("Identificador", yytext(), yyline, yylength(), yycolumn);
        this._existenTokens = true;
        return token;
    } else {
        MyToken token = new MyToken("IdentificadorTruncado", yytext(), yyline, yylength(), yycolumn);
        this._existenTokens = true;
        return token;
    }
}
{comentarioSimple} {
    MyToken token = new MyToken("Comentario", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{comentarioMultilinea} {
    MyToken token = new MyToken("Comentario", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{simbolo} {
    MyToken token = new MyToken("Simbolo", yytext(), yyline, yylength(), yycolumn);
    this._existenTokens = true;
    return token;
}
{espacios} {
    // No hacer nada
}