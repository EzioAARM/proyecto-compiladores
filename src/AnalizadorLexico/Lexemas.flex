package AnalizadorLexico;
import java.util.List;
import java.util.ArrayList;
%%
%public
%class Lexemas
%{
    private int cadenaTest = 0;

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
    Tokens.add(new MyToken("FINDELARCHIVO", yytext(), "Final", yyline + 1, yylength(), yycolumn + 1));
    return Tokens;
%eofval}
%init{

%init}
int = (\+|\-)?[0-9]+
identificador = (([a-zA-Z]+[a-zA-Z_0-9]*))
float = (\+|\-)?([\d])+[.](([\d])*)?
floatExp = (\+|\-)?([\d])+([.])(([\d])*)?((E|e)(\+|\-)?([\d])+(([.])?([\d])*)?)
bit = (0|1|NULL)
string = ['][^'\n]*[']|[´][^´\n]*[´]
stringError = ((['][^'\n]*)[^'])|(([´][^´\n]*)[^´])
tab = [\t]
carrete = [\r]
salto = [\n]
espacio = [ ]
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
reservadaADD = (ADD)
reservadaALL = (ALL)
reservadaALTER = (ALTER)
reservadaAND = (AND)
reservadaANY = (ANY)
reservadaAS = (AS)
reservadaASC = (ASC)
reservadaAUTHORIZATION = (AUTHORIZATION)
reservadaBACKUP = (BACKUP)
reservadaBEGIN = (BEGIN)
reservadaBETWEEN = (BETWEEN)
reservadaBREAK = (BREAK)
reservadaBROWSE = (BROWSE)
reservadaBULK = (BULK)
reservadaBY = (BY)
reservadaCASCADE = (CASCADE)
reservadaCASE = (CASE)
reservadaCHECK = (CHECK)
reservadaCHECKPOINT = (CHECKPOINT)
reservadaCLOSE = (CLOSE)
reservadaCLUSTERED = (CLUSTERED)
reservadaCOALESCE = (COALESCE)
reservadaCOLLATE = (COLLATE)
reservadaCOLUMN = (COLUMN)
reservadaCOMMIT = (COMMIT)
reservadaCOMPUTE = (COMPUTE)
reservadaCONSTRAINT = (CONSTRAINT)
reservadaCONTAINS = (CONTAINS)
reservadaCONTAINSTABLE = (CONTAINSTABLE)
reservadaCONTINUE = (CONTINUE)
reservadaCONVERT = (CONVERT)
reservadaCREATE = (CREATE)
reservadaCROSS = (CROSS)
reservadaCURRENT = (CURRENT)
reservadaCURRENT_DATE = (CURRENT_DATE)
reservadaCURRENT_TIME = (CURRENT_TIME)
reservadaCURRENT_TIMESTAMP = (CURRENT_TIMESTAMP)
reservadaCURRENT_USER = (CURRENT_USER)
reservadaCURSOR = (CURSOR)
reservadaDATABASE = (DATABASE)
reservadaDBCC = (DBCC)
reservadaDEALLOCATE = (DEALLOCATE)
reservadaDECLARE = (DECLARE)
reservadaDEFAULT = (DEFAULT)
reservadaDELETE = (DELETE)
reservadaDENY = (DENY)
reservadaDESC = (DESC)
reservadaDISK = (DISK)
reservadaDISTINCT = (DISTINCT)
reservadaDISTRIBUTED = (DISTRIBUTED)
reservadaDOUBLE = (DOUBLE)
reservadaDROP = (DROP)
reservadaDUMP = (DUMP)
reservadaELSE = (ELSE)
reservadaEND = (END)
reservadaERRLVL = (ERRLVL)
reservadaESCAPE = (ESCAPE)
reservadaEXCEPT = (EXCEPT)
reservadaEXEC = (EXEC)
reservadaEXECUTE = (EXECUTE)
reservadaEXISTS = (EXISTS)
reservadaEXIT = (EXIT)
reservadaEXTERNAL = (EXTERNAL)
reservadaFETCH = (FETCH)
reservadaFILE = (FILE)
reservadaFILLFACTOR = (FILLFACTOR)
reservadaFOR = (FOR)
reservadaFOREIGN = (FOREIGN)
reservadaFREETEXT = (FREETEXT)
reservadaFREETEXTTABLE = (FREETEXTTABLE)
reservadaFROM = (FROM)
reservadaFULL = (FULL)
reservadaFUNCTION = (FUNCTION)
reservadaGOTO = (GOTO)
reservadaGRANT = (GRANT)
reservadaGROUP = (GROUP)
reservadaHAVING = (HAVING)
reservadaHOLDLOCK = (HOLDLOCK)
reservadaIDENTITY = (IDENTITY)
reservadaIDENTITY_INSERT = (IDENTITY_INSERT)
reservadaIDENTITYCOL = (IDENTITYCOL)
reservadaIF = (IF)
reservadaIN = (IN)
reservadaINDEX = (INDEX)
reservadaINNER = (INNER)
reservadaINSERT = (INSERT)
reservadaINTERSECT = (INTERSECT)
reservadaINTO = (INTO)
reservadaIS = (IS)
reservadaJOIN = (JOIN)
reservadaKEY = (KEY)
reservadaKILL = (KILL)
reservadaLEFT = (LEFT)
reservadaLIKE = (LIKE)
reservadaLINENO = (LINENO)
reservadaLOAD = (LOAD)
reservadaMERGE = (MERGE)
reservadaNATIONAL = (NATIONAL)
reservadaNOCHECK = (NOCHECK)
reservadaNOCLUSTERED = (NOCLUSTERED)
reservadaNOT = (NOT)
reservadaNULL = (NULL)
reservadaNULLIF = (NULLIF)
reservadaOF = (OF)
reservadaOFF = (OFF)
reservadaOFFSETS = (OFFSETS)
reservadaON = (ON)
reservadaOPEN = (OPEN)
reservadaOPENDATASOURCE = (OPENDATASOURCE)
reservadaOPENQUERY = (OPENQUERY)
reservadaOPENXML = (OPENXML)
reservadaOPTION = (OPTION)
reservadaOR = (OR)
reservadaORDER = (ORDER)
reservadaOUTER = (OUTER)
reservadaOVER = (OVER)
reservadaPERCENT = (PERCENT)
reservadaPIVOT = (PIVOT)
reservadaPLAN = (PLAN)
reservadaPRECISION = (PRECISION)
reservadaPRIMARY = (PRIMARY)
reservadaPRINT = (PRINT)
reservadaPROC = (PROC)
reservadaPROCEDURE = (PROCEDURE)
reservadaPUBLIC = (PUBLIC)
reservadaRAISERROR = (RAISERROR)
reservadaREAD = (READ)
reservadaREADTEXT = (READTEXT)
reservadaRECONFIGURE = (RECONFIGURE)
reservadaREFERENCES = (REFERENCES)
reservadaREPLICATION = (REPLICATION)
reservadaRESTORE = (RESTORE)
reservadaRESTRICT = (RESTRICT)
reservadaRETURN = (RETURN)
reservadaREVERT = (REVERT)
reservadaREVOKE = (REVOKE)
reservadaRIGHT = (RIGHT)
reservadaROLLBACK = (ROLLBACK)
reservadaROWCOUNT = (ROWCOUNT)
reservadaROWGUIDCOL = (ROWGUIDCOL)
reservadaRULE = (RULE)
reservadaSAVE = (SAVE)
reservadaSCHEMA = (SCHEMA)
reservadaSECURITYAUDIT = (SECURITYAUDIT)
reservadaSELECT = (SELECT)
reservadaSEMANTICKEYPHRASETABLE = (SEMANTICKEYPHRASETABLE)
reservadaSEMANTICSIMILARITYDETAILSTABLE = (SEMANTICSIMILARITYDETAILSTABLE)
reservadaSEMANTICSIMILARITYTABLE = (SEMANTICSIMILARITYTABLE)
reservadaSESSION_USER = (SESSION_USER)
reservadaSET = (SET)
reservadaSETUSER = (SETUSER)
reservadaSHUTDOWN = (SHUTDOWN)
reservadaSOME = (SOME)
reservadaSTATISTICS = (STATISTICS)
reservadaSYSTEM_USER = (SYSTEM_USER)
reservadaTABLE = (TABLE)
reservadaTABLESAMPLE = (TABLESAMPLE)
reservadaTEXTSIZE = (TEXTSIZE)
reservadaTHEN = (THEN)
reservadaTO = (TO)
reservadaTOP = (TOP)
reservadaTRAN = (TRAN)
reservadaTRANSACTION = (TRANSACTION)
reservadaTRIGGER = (TRIGGER)
reservadaTRUNCATE = (TRUNCATE)
reservadaTRY_CONVERT = (TRY_CONVERT)
reservadaTSEQUAL = (TSEQUAL)
reservadaUNION = (UNION)
reservadaUNIQUE = (UNIQUE)
reservadaUNPIVOT = (UNPIVOT)
reservadaUPDATE = (UPDATE)
reservadaUPDATETEXT = (UPDATETEXT)
reservadaUSE = (USE)
reservadaUSER = (USER)
reservadaVALUES = (VALUES)
reservadaVARYING = (VARYING)
reservadaVIEW = (VIEW)
reservadaWAITFOR = (WAITFOR)
reservadaWHEN = (WHEN)
reservadaWHERE = (WHERE)
reservadaWHILE = (WHILE)
reservadaWITH = (WITH)
reservadaWITHIN = (WITHIN)
reservadaWRITETEXT = (WRITETEXT)
reservadaABSOLUTE = (ABSOLUTE)
reservadaOVERLAPS = (OVERLAPS)
reservadaACTION = (ACTION)
reservadaPAD = (PAD)
reservadaADA = (ADA)
reservadaPARTIAL = (PARTIAL)
reservadaPASCAL = (PASCAL)
reservadaEXTRACT = (EXTRACT)
reservadaPOSITION = (POSITION)
reservadaALLOCATE = (ALLOCATE)
reservadaFALSO = (FALSO)
reservadaPREPARE = (PREPARE)
reservadaFIRST = (FIRST)
reservadaPRESERVE = (PRESERVE)
reservadaFLOAT = (FLOAT)
reservadaARE = (ARE)
reservadaPRIOR = (PRIOR)
reservadaPRIVILEGES = (PRIVILEGES)
reservadaFORTRAN = (FORTRAN)
reservadaASSERTION = (ASSERTION)
reservadaFOUND = (FOUND)
reservadaAT = (AT)
reservadaREAL = (REAL)
reservadaAVG = (AVG)
reservadaGET = (GET)
reservadaGLOBAL = (GLOBAL)
reservadaRELATIVE = (RELATIVE)
reservadaGO = (GO)
reservadaBIT = (BIT)
reservadaBIT_LENGTH = (BIT_LENGTH)
reservadaBOTH = (BOTH)
reservadaROWS = (ROWS)
reservadaHOUR = (HOUR)
reservadaCASCADED = (CASCADED)
reservadaSCROLL = (SCROLL)
reservadaIMMEDIATE = (IMMEDIATE)
reservadaSECOND = (SECOND)
reservadaCAST = (CAST)
reservadaSECTION = (SECTION)
reservadaCATALOG = (CATALOG)
reservadaINCLUDE = (INCLUDE)
reservadaCHAR = (CHAR)
reservadaSESSION = (SESSION)
reservadaCHAR_LENGTH = (CHAR_LENGTH)
reservadaINDICATOR = (INDICATOR)
reservadaCHARACTER = (CHARACTER)
reservadaINITIALLY = (INITIALLY)
reservadaCHARACTER_LENGTH = (CHARACTER_LENGTH)
reservadaSIZE = (SIZE)
reservadaINPUT = (INPUT)
reservadaSMALLINT = (SMALLINT)
reservadaINSENSITIVE = (INSENSITIVE)
reservadaSPACE = (SPACE)
reservadaINT = (INT)
reservadaSQL = (SQL)
reservadaCOLLATION = (COLLATION)
reservadaINTEGER = (INTEGER)
reservadaSQLCA = (SQLCA)
reservadaSQLCODE = (SQLCODE)
reservadaINTERVAL = (INTERVAL)
reservadaSQLERROR = (SQLERROR)
reservadaCONNECT = (CONNECT)
reservadaSQLSTATE = (SQLSTATE)
reservadaCONNECTION = (CONNECTION)
reservadaSQLWARNING = (SQLWARNING)
reservadaISOLATION = (ISOLATION)
reservadaSUBSTRING = (SUBSTRING)
reservadaCONSTRAINTS = (CONSTRAINTS)
reservadaSUM = (SUM)
reservadaLANGUAGE = (LANGUAGE)
reservadaCORRESPONDING = (CORRESPONDING)
reservadaLAST = (LAST)
reservadaTEMPORARY = (TEMPORARY)
reservadaCOUNT = (COUNT)
reservadaLEADING = (LEADING)
reservadaTIME = (TIME)
reservadaLEVEL = (LEVEL)
reservadaTIMESTAMP = (TIMESTAMP)
reservadaTIMEZONE_HOUR = (TIMEZONE_HOUR)
reservadaLOCAL = (LOCAL)
reservadaTIMEZONE_MINUTE = (TIMEZONE_MINUTE)
reservadaLOWER = (LOWER)
reservadaMATCH = (MATCH)
reservadaTRAILING = (TRAILING)
reservadaMAX = (MAX)
reservadaMIN = (MIN)
reservadaTRANSLATE = (TRANSLATE)
reservadaDATE = (DATE)
reservadaMINUTE = (MINUTE)
reservadaTRANSLATION = (TRANSLATION)
reservadaDAY = (DAY)
reservadaMODULE = (MODULE)
reservadaTRIM = (TRIM)
reservadaMONTH = (MONTH)
reservadaVERDADERO = (VERDADERO)
reservadaDEC = (DEC)
reservadaNAMES = (NAMES)
reservadaDECIMAL = (DECIMAL)
reservadaNATURAL = (NATURAL)
reservadaUNKNOWN = (UNKNOWN)
reservadaNCHAR = (NCHAR)
reservadaDEFERRABLE = (DEFERRABLE)
reservadaNEXT = (NEXT)
reservadaUPPER = (UPPER)
reservadaDEFERRED = (DEFERRED)
reservadaNO = (NO)
reservadaUSAGE = (USAGE)
reservadaNONE = (NONE)
reservadaUSING = (USING)
reservadaDESCRIBE = (DESCRIBE)
reservadaVALUE = (VALUE)
reservadaDESCRIPTOR = (DESCRIPTOR)
reservadaDIAGNOSTICS = (DIAGNOSTICS)
reservadaNUMERIC = (NUMERIC)
reservadaVARCHAR = (VARCHAR)
reservadaDISCONNECT = (DISCONNECT)
reservadaOCTET_LENGTH = (OCTET_LENGTH)
reservadaDOMAIN = (DOMAIN)
reservadaONLY = (ONLY)
reservadaWHENEVER = (WHENEVER)
reservadaWORK = (WORK)
reservadaENDEXEC = (END-EXEC)
reservadaWRITE = (WRITE)
reservadaYEAR = (YEAR)
reservadaOUTPUT = (OUTPUT)
reservadaZONE = (ZONE)
reservadaEXCEPTION = (EXCEPTION)
%%
<YYINITIAL> [/]([*])+(.) {
    _cadenaComentario.append(yytext());
    _comentarioActivo = true;
    yybegin(COMENTARIOMULTI);
}
<YYINITIAL> {reservadaWITHIN} {
    Tokens.add(new MyToken("WITHIN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
} 
<YYINITIAL> {reservadaADD} {
    Tokens.add(new MyToken("ADD", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaALL} {
    Tokens.add(new MyToken("ALL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaALTER} {
    Tokens.add(new MyToken("ALTER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAND} {
    Tokens.add(new MyToken("AND", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaANY} {
    Tokens.add(new MyToken("ANY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAS} {
    Tokens.add(new MyToken("AS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaASC} {
    Tokens.add(new MyToken("ASC", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAUTHORIZATION} {
    Tokens.add(new MyToken("AUTHORIZATION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBACKUP} {
    Tokens.add(new MyToken("BACKUP", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBEGIN} {
    Tokens.add(new MyToken("BEGIN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBETWEEN} {
    Tokens.add(new MyToken("BETWEEN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBREAK} {
    Tokens.add(new MyToken("BREAK", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBROWSE} {
    Tokens.add(new MyToken("BROWSE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBULK} {
    Tokens.add(new MyToken("BULK", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBY} {
    Tokens.add(new MyToken("BY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCASCADE} {
    Tokens.add(new MyToken("CASCADE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCASE} {
    Tokens.add(new MyToken("CASE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHECK} {
    Tokens.add(new MyToken("CHECK", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHECKPOINT} {
    Tokens.add(new MyToken("CHECKPOINT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCLOSE} {
    Tokens.add(new MyToken("CLOSE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCLUSTERED} {
    Tokens.add(new MyToken("CLUSTERED", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOALESCE} {
    Tokens.add(new MyToken("COALESCE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOLLATE} {
    Tokens.add(new MyToken("COLLATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOLUMN} {
    Tokens.add(new MyToken("COLUMN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOMMIT} {
    Tokens.add(new MyToken("COMMIT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOMPUTE} {
    Tokens.add(new MyToken("COMPUTE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONSTRAINT} {
    Tokens.add(new MyToken("CONSTRAINT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONTAINS} {
    Tokens.add(new MyToken("CONTAINS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONTAINSTABLE} {
    Tokens.add(new MyToken("CONTAINSTABLE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONTINUE} {
    Tokens.add(new MyToken("CONTINUE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONVERT} {
    Tokens.add(new MyToken("CONVERT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCREATE} {
    Tokens.add(new MyToken("CREATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCROSS} {
    Tokens.add(new MyToken("CROSS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT} {
    Tokens.add(new MyToken("CURRENT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_DATE} {
    Tokens.add(new MyToken("CURRENT_DATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_TIME} {
    Tokens.add(new MyToken("CURRENT_TIME", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_TIMESTAMP} {
    Tokens.add(new MyToken("CURRENT_TIMESTAMP", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_USER} {
    Tokens.add(new MyToken("CURRENT_USER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURSOR} {
    Tokens.add(new MyToken("CURSOR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDATABASE} {
    Tokens.add(new MyToken("DATABASE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDBCC} {
    Tokens.add(new MyToken("DBCC", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEALLOCATE} {
    Tokens.add(new MyToken("DEALLOCATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDECLARE} {
    Tokens.add(new MyToken("DECLARE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEFAULT} {
    Tokens.add(new MyToken("DEFAULT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDELETE} {
    Tokens.add(new MyToken("DELETE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDENY} {
    Tokens.add(new MyToken("DENY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDESC} {
    Tokens.add(new MyToken("DESC", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDISK} {
    Tokens.add(new MyToken("DISK", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDISTINCT} {
    Tokens.add(new MyToken("DISTINCT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDISTRIBUTED} {
    Tokens.add(new MyToken("DISTRIBUTED", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDOUBLE} {
    Tokens.add(new MyToken("DOUBLE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDROP} {
    Tokens.add(new MyToken("DROP", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDUMP} {
    Tokens.add(new MyToken("DUMP", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaELSE} {
    Tokens.add(new MyToken("ELSE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEND} {
    Tokens.add(new MyToken("END", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaERRLVL} {
    Tokens.add(new MyToken("ERRLVL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaESCAPE} {
    Tokens.add(new MyToken("ESCAPE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXCEPT} {
    Tokens.add(new MyToken("EXCEPT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXEC} {
    Tokens.add(new MyToken("EXEC", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXECUTE} {
    Tokens.add(new MyToken("EXECUTE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXISTS} {
    Tokens.add(new MyToken("EXISTS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXIT} {
    Tokens.add(new MyToken("EXIT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXTERNAL} {
    Tokens.add(new MyToken("EXTERNAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFETCH} {
    Tokens.add(new MyToken("FETCH", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFILE} {
    Tokens.add(new MyToken("FILE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFILLFACTOR} {
    Tokens.add(new MyToken("FILLFACTOR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFOR} {
    Tokens.add(new MyToken("FOR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFOREIGN} {
    Tokens.add(new MyToken("FOREIGN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFREETEXT} {
    Tokens.add(new MyToken("FREETEXT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFREETEXTTABLE} {
    Tokens.add(new MyToken("FREETEXTTABLE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFROM} {
    Tokens.add(new MyToken("FROM", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFULL} {
    Tokens.add(new MyToken("FULL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFUNCTION} {
    Tokens.add(new MyToken("FUNCTION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGOTO} {
    Tokens.add(new MyToken("GOTO", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGRANT} {
    Tokens.add(new MyToken("GRANT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGROUP} {
    Tokens.add(new MyToken("GROUP", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaHAVING} {
    Tokens.add(new MyToken("HAVING", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaHOLDLOCK} {
    Tokens.add(new MyToken("HOLDLOCK", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIDENTITY} {
    Tokens.add(new MyToken("IDENTITY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIDENTITY_INSERT} {
    Tokens.add(new MyToken("IDENTITY_INSERT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIDENTITYCOL} {
    Tokens.add(new MyToken("IDENTITYCOL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIF} {
    Tokens.add(new MyToken("IF", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIN} {
    Tokens.add(new MyToken("IN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINDEX} {
    Tokens.add(new MyToken("INDEX", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINNER} {
    Tokens.add(new MyToken("INNER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINSERT} {
    Tokens.add(new MyToken("INSERT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINTERSECT} {
    Tokens.add(new MyToken("INTERSECT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINTO} {
    Tokens.add(new MyToken("INTO", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIS} {
    Tokens.add(new MyToken("IS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaJOIN} {
    Tokens.add(new MyToken("JOIN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaKEY} {
    Tokens.add(new MyToken("KEY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaKILL} {
    Tokens.add(new MyToken("KILL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLEFT} {
    Tokens.add(new MyToken("LEFT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLIKE} {
    Tokens.add(new MyToken("LIKE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLINENO} {
    Tokens.add(new MyToken("LINENO", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLOAD} {
    Tokens.add(new MyToken("LOAD", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMERGE} {
    Tokens.add(new MyToken("MERGE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNATIONAL} {
    Tokens.add(new MyToken("NATIONAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNOCHECK} {
    Tokens.add(new MyToken("NOCHECK", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNOCLUSTERED} {
    Tokens.add(new MyToken("NOCLUSTERED", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNOT} {
    Tokens.add(new MyToken("NOT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNULL} {
    Tokens.add(new MyToken("NULL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNULLIF} {
    Tokens.add(new MyToken("NULLIF", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOF} {
    Tokens.add(new MyToken("OF", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOFF} {
    Tokens.add(new MyToken("OFF", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOFFSETS} {
    Tokens.add(new MyToken("OFFSETS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaON} {
    Tokens.add(new MyToken("ON", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPEN} {
    Tokens.add(new MyToken("OPEN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPENDATASOURCE} {
    Tokens.add(new MyToken("OPENDATASOURCE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPENQUERY} {
    Tokens.add(new MyToken("OPENQUERY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPENXML} {
    Tokens.add(new MyToken("OPENXML", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPTION} {
    Tokens.add(new MyToken("OPTION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOR} {
    Tokens.add(new MyToken("OR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaORDER} {
    Tokens.add(new MyToken("ORDER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOUTER} {
    Tokens.add(new MyToken("OUTER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOVER} {
    Tokens.add(new MyToken("OVER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPERCENT} {
    Tokens.add(new MyToken("PERCENT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPIVOT} {
    Tokens.add(new MyToken("PIVOT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPLAN} {
    Tokens.add(new MyToken("PLAN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRECISION} {
    Tokens.add(new MyToken("PRECISION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRIMARY} {
    Tokens.add(new MyToken("PRIMARY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRINT} {
    Tokens.add(new MyToken("PRINT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPROC} {
    Tokens.add(new MyToken("PROC", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPROCEDURE} {
    Tokens.add(new MyToken("PROCEDURE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPUBLIC} {
    Tokens.add(new MyToken("PUBLIC", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRAISERROR} {
    Tokens.add(new MyToken("RAISERROR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREAD} {
    Tokens.add(new MyToken("READ", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREADTEXT} {
    Tokens.add(new MyToken("READTEXT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRECONFIGURE} {
    Tokens.add(new MyToken("RECONFIGURE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREFERENCES} {
    Tokens.add(new MyToken("REFERENCES", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREPLICATION} {
    Tokens.add(new MyToken("REPLICATION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRESTORE} {
    Tokens.add(new MyToken("RESTORE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRESTRICT} {
    Tokens.add(new MyToken("RESTRICT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRETURN} {
    Tokens.add(new MyToken("RETURN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREVERT} {
    Tokens.add(new MyToken("REVERT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREVOKE} {
    Tokens.add(new MyToken("REVOKE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRIGHT} {
    Tokens.add(new MyToken("RIGHT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaROLLBACK} {
    Tokens.add(new MyToken("ROLLBACK", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaROWCOUNT} {
    Tokens.add(new MyToken("ROWCOUNT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaROWGUIDCOL} {
    Tokens.add(new MyToken("ROWGUIDCOL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRULE} {
    Tokens.add(new MyToken("RULE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSAVE} {
    Tokens.add(new MyToken("SAVE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSCHEMA} {
    Tokens.add(new MyToken("SCHEMA", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSECURITYAUDIT} {
    Tokens.add(new MyToken("SECURITYAUDIT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSELECT} {
    Tokens.add(new MyToken("SELECT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSEMANTICKEYPHRASETABLE} {
    Tokens.add(new MyToken("SEMANTICKEYPHRASETAB", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSEMANTICSIMILARITYDETAILSTABLE} {
    Tokens.add(new MyToken("SEMANTICSIMILARITYDE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSEMANTICSIMILARITYTABLE} {
    Tokens.add(new MyToken("SEMANTICSIMILARITYTA", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSESSION_USER} {
    Tokens.add(new MyToken("SESSION_USER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSET} {
    Tokens.add(new MyToken("SET", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSETUSER} {
    Tokens.add(new MyToken("SETUSER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSHUTDOWN} {
    Tokens.add(new MyToken("SHUTDOWN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSOME} {
    Tokens.add(new MyToken("SOME", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSTATISTICS} {
    Tokens.add(new MyToken("STATISTICS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSYSTEM_USER} {
    Tokens.add(new MyToken("SYSTEM_USER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTABLE} {
    Tokens.add(new MyToken("TABLE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTABLESAMPLE} {
    Tokens.add(new MyToken("TABLESAMPLE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTEXTSIZE} {
    Tokens.add(new MyToken("TEXTSIZE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTHEN} {
    Tokens.add(new MyToken("THEN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTO} {
    Tokens.add(new MyToken("TO", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTOP} {
    Tokens.add(new MyToken("TOP", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRAN} {
    Tokens.add(new MyToken("TRAN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRANSACTION} {
    Tokens.add(new MyToken("TRANSACTION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRIGGER} {
    Tokens.add(new MyToken("TRIGGER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRUNCATE} {
    Tokens.add(new MyToken("TRUNCATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRY_CONVERT} {
    Tokens.add(new MyToken("TRY_CONVERT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTSEQUAL} {
    Tokens.add(new MyToken("TSEQUAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUNION} {
    Tokens.add(new MyToken("UNION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUNIQUE} {
    Tokens.add(new MyToken("UNIQUE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUNPIVOT} {
    Tokens.add(new MyToken("UNPIVOT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUPDATE} {
    Tokens.add(new MyToken("UPDATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUPDATETEXT} {
    Tokens.add(new MyToken("UPDATETEXT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUSE} {
    Tokens.add(new MyToken("USE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUSER} {
    Tokens.add(new MyToken("USER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVALUES} {
    Tokens.add(new MyToken("VALUES", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVARYING} {
    Tokens.add(new MyToken("VARYING", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVIEW} {
    Tokens.add(new MyToken("VIEW", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWAITFOR} {
    Tokens.add(new MyToken("WAITFOR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWHEN} {
    Tokens.add(new MyToken("WHEN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWHERE} {
    Tokens.add(new MyToken("WHERE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWHILE} {
    Tokens.add(new MyToken("WHILE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWITH} {
    Tokens.add(new MyToken("WITH", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWRITETEXT} {
    Tokens.add(new MyToken("WRITETEXT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaABSOLUTE} {
    Tokens.add(new MyToken("ABSOLUTE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOVERLAPS} {
    Tokens.add(new MyToken("OVERLAPS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaACTION} {
    Tokens.add(new MyToken("ACTION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPAD} {
    Tokens.add(new MyToken("PAD", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaADA} {
    Tokens.add(new MyToken("ADA", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPARTIAL} {
    Tokens.add(new MyToken("PARTIAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPASCAL} {
    Tokens.add(new MyToken("PASCAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXTRACT} {
    Tokens.add(new MyToken("EXTRACT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPOSITION} {
    Tokens.add(new MyToken("POSITION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaALLOCATE} {
    Tokens.add(new MyToken("ALLOCATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFALSO} {
    Tokens.add(new MyToken("FALSO", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPREPARE} {
    Tokens.add(new MyToken("PREPARE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFIRST} {
    Tokens.add(new MyToken("FIRST", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRESERVE} {
    Tokens.add(new MyToken("PRESERVE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFLOAT} {
    Tokens.add(new MyToken("FLOAT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaARE} {
    Tokens.add(new MyToken("ARE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRIOR} {
    Tokens.add(new MyToken("PRIOR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRIVILEGES} {
    Tokens.add(new MyToken("PRIVILEGES", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFORTRAN} {
    Tokens.add(new MyToken("FORTRAN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaASSERTION} {
    Tokens.add(new MyToken("ASSERTION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFOUND} {
    Tokens.add(new MyToken("FOUND", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAT} {
    Tokens.add(new MyToken("AT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREAL} {
    Tokens.add(new MyToken("REAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAVG} {
    Tokens.add(new MyToken("AVG", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGET} {
    Tokens.add(new MyToken("GET", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGLOBAL} {
    Tokens.add(new MyToken("GLOBAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRELATIVE} {
    Tokens.add(new MyToken("RELATIVE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGO} {
    Tokens.add(new MyToken("GO", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBIT} {
    Tokens.add(new MyToken("BIT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBIT_LENGTH} {
    Tokens.add(new MyToken("BIT_LENGTH", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBOTH} {
    Tokens.add(new MyToken("BOTH", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaROWS} {
    Tokens.add(new MyToken("ROWS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaHOUR} {
    Tokens.add(new MyToken("HOUR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCASCADED} {
    Tokens.add(new MyToken("CASCADED", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSCROLL} {
    Tokens.add(new MyToken("SCROLL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIMMEDIATE} {
    Tokens.add(new MyToken("IMMEDIATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSECOND} {
    Tokens.add(new MyToken("SECOND", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCAST} {
    Tokens.add(new MyToken("CAST", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSECTION} {
    Tokens.add(new MyToken("SECTION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCATALOG} {
    Tokens.add(new MyToken("CATALOG", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINCLUDE} {
    Tokens.add(new MyToken("INCLUDE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHAR} {
    Tokens.add(new MyToken("CHAR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSESSION} {
    Tokens.add(new MyToken("SESSION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHAR_LENGTH} {
    Tokens.add(new MyToken("CHAR_LENGTH", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINDICATOR} {
    Tokens.add(new MyToken("INDICATOR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHARACTER} {
    Tokens.add(new MyToken("CHARACTER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINITIALLY} {
    Tokens.add(new MyToken("INITIALLY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHARACTER_LENGTH} {
    Tokens.add(new MyToken("CHARACTER_LENGTH", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSIZE} {
    Tokens.add(new MyToken("SIZE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINPUT} {
    Tokens.add(new MyToken("INPUT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSMALLINT} {
    Tokens.add(new MyToken("SMALLINT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINSENSITIVE} {
    Tokens.add(new MyToken("INSENSITIVE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSPACE} {
    Tokens.add(new MyToken("SPACE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINT} {
    Tokens.add(new MyToken("INT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQL} {
    Tokens.add(new MyToken("SQL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOLLATION} {
    Tokens.add(new MyToken("COLLATION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINTEGER} {
    Tokens.add(new MyToken("INTEGER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLCA} {
    Tokens.add(new MyToken("SQLCA", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLCODE} {
    Tokens.add(new MyToken("SQLCODE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINTERVAL} {
    Tokens.add(new MyToken("INTERVAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLERROR} {
    Tokens.add(new MyToken("SQLERROR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONNECT} {
    Tokens.add(new MyToken("CONNECT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLSTATE} {
    Tokens.add(new MyToken("SQLSTATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONNECTION} {
    Tokens.add(new MyToken("CONNECTION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLWARNING} {
    Tokens.add(new MyToken("SQLWARNING", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaISOLATION} {
    Tokens.add(new MyToken("ISOLATION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSUBSTRING} {
    Tokens.add(new MyToken("SUBSTRING", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONSTRAINTS} {
    Tokens.add(new MyToken("CONSTRAINTS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSUM} {
    Tokens.add(new MyToken("SUM", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLANGUAGE} {
    Tokens.add(new MyToken("LANGUAGE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCORRESPONDING} {
    Tokens.add(new MyToken("CORRESPONDING", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLAST} {
    Tokens.add(new MyToken("LAST", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTEMPORARY} {
    Tokens.add(new MyToken("TEMPORARY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOUNT} {
    Tokens.add(new MyToken("COUNT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLEADING} {
    Tokens.add(new MyToken("LEADING", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTIME} {
    Tokens.add(new MyToken("TIME", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLEVEL} {
    Tokens.add(new MyToken("LEVEL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTIMESTAMP} {
    Tokens.add(new MyToken("TIMESTAMP", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTIMEZONE_HOUR} {
    Tokens.add(new MyToken("TIMEZONE_HOUR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLOCAL} {
    Tokens.add(new MyToken("LOCAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTIMEZONE_MINUTE} {
    Tokens.add(new MyToken("TIMEZONE_MINUTE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLOWER} {
    Tokens.add(new MyToken("LOWER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMATCH} {
    Tokens.add(new MyToken("MATCH", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRAILING} {
    Tokens.add(new MyToken("TRAILING", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMAX} {
    Tokens.add(new MyToken("MAX", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMIN} {
    Tokens.add(new MyToken("MIN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRANSLATE} {
    Tokens.add(new MyToken("TRANSLATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDATE} {
    Tokens.add(new MyToken("DATE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMINUTE} {
    Tokens.add(new MyToken("MINUTE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRANSLATION} {
    Tokens.add(new MyToken("TRANSLATION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDAY} {
    Tokens.add(new MyToken("DAY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMODULE} {
    Tokens.add(new MyToken("MODULE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRIM} {
    Tokens.add(new MyToken("TRIM", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMONTH} {
    Tokens.add(new MyToken("MONTH", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVERDADERO} {
    Tokens.add(new MyToken("VERDADERO", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEC} {
    Tokens.add(new MyToken("DEC", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNAMES} {
    Tokens.add(new MyToken("NAMES", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDECIMAL} {
    Tokens.add(new MyToken("DECIMAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNATURAL} {
    Tokens.add(new MyToken("NATURAL", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUNKNOWN} {
    Tokens.add(new MyToken("UNKNOWN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNCHAR} {
    Tokens.add(new MyToken("NCHAR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEFERRABLE} {
    Tokens.add(new MyToken("DEFERRABLE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNEXT} {
    Tokens.add(new MyToken("NEXT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUPPER} {
    Tokens.add(new MyToken("UPPER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEFERRED} {
    Tokens.add(new MyToken("DEFERRED", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNO} {
    Tokens.add(new MyToken("NO", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUSAGE} {
    Tokens.add(new MyToken("USAGE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNONE} {
    Tokens.add(new MyToken("NONE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUSING} {
    Tokens.add(new MyToken("USING", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDESCRIBE} {
    Tokens.add(new MyToken("DESCRIBE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVALUE} {
    Tokens.add(new MyToken("VALUE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDESCRIPTOR} {
    Tokens.add(new MyToken("DESCRIPTOR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDIAGNOSTICS} {
    Tokens.add(new MyToken("DIAGNOSTICS", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNUMERIC} {
    Tokens.add(new MyToken("NUMERIC", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVARCHAR} {
    Tokens.add(new MyToken("VARCHAR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDISCONNECT} {
    Tokens.add(new MyToken("DISCONNECT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOCTET_LENGTH} {
    Tokens.add(new MyToken("OCTET_LENGTH", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDOMAIN} {
    Tokens.add(new MyToken("DOMAIN", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaONLY} {
    Tokens.add(new MyToken("ONLY", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWHENEVER} {
    Tokens.add(new MyToken("WHENEVER", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWORK} {
    Tokens.add(new MyToken("WORK", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaENDEXEC} {
    Tokens.add(new MyToken("ENDEXEC", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWRITE} {
    Tokens.add(new MyToken("WRITE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaYEAR} {
    Tokens.add(new MyToken("YEAR", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOUTPUT} {
    Tokens.add(new MyToken("OUTPUT", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaZONE} {
    Tokens.add(new MyToken("ZONE", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXCEPTION} {
    Tokens.add(new MyToken("EXCEPTION", yytext(), "Reservada", yyline + 1, yylength(), yycolumn + 1));
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
    Tokens.add(new MyToken("StringNoCerrado", yytext(), "Error", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {identificador} {
    if (yytext().length() <= 31) {
        Tokens.add(new MyToken("Identificador", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
    } else {
        Tokens.add(new MyToken("IdentificadorTruncado", yytext().substring(0, 31), "Advertencia", yyline + 1, 31, yycolumn + 1));
    }
}
<YYINITIAL> {comentarioSimple} {
    Tokens.add(new MyToken("Comentario", yytext(), "Comentario", yyline + 1, yylength(), yycolumn + 1));
}
<COMENTARIOMULTI> {
    ([*])+[/] {
        _cadenaComentario.append(yytext());
        _comentarioActivo = false;
        yybegin(YYINITIAL);
        Tokens.add(new MyToken("Comentario", _cadenaComentario.toString(), "Comentario", yyline + 1, yylength(), yycolumn + 1));
        _cadenaComentario = new StringBuffer();
    }
    <<EOF>> {
        Tokens.add(new MyToken("ComentarioNoCerrado", _cadenaComentario.toString(), "Error", yyline + 1, yylength(), yycolumn + 1));
        return Tokens;
    }
    . {
        _cadenaComentario.append(yytext());
    }
    \n {
        _cadenaComentario.append(yytext());
    }
}
{suma} {
    Tokens.add(new MyToken("Mas", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{resta} {
    Tokens.add(new MyToken("Menos", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{multi} {
    Tokens.add(new MyToken("Multiplicacion", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{division} {
    Tokens.add(new MyToken("Division", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{mod} {
    Tokens.add(new MyToken("Modulo", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{meIg} {
    Tokens.add(new MyToken("MenorIgual", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{doubCorch} {
    Tokens.add(new MyToken("Corchetes", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{doubLlave} {
    Tokens.add(new MyToken("Llaves", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{doubParen} {
    Tokens.add(new MyToken("Parentesis", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{maIg} {
    Tokens.add(new MyToken("MayorIgual", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{asignacion} {
    Tokens.add(new MyToken("Igual", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{mayor} {
    Tokens.add(new MyToken("Mayor", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{menor} {
    Tokens.add(new MyToken("Menor", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{igualComp} {
    Tokens.add(new MyToken("IgualIgual", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{diferente} {
    Tokens.add(new MyToken("Diferente", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{and} {
    Tokens.add(new MyToken("And", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{or} {
    Tokens.add(new MyToken("Or", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{not} {
    Tokens.add(new MyToken("Not", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{endLine} {
    Tokens.add(new MyToken("PuntoComa", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{coma} {
    Tokens.add(new MyToken("Coma", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{punto} {
    Tokens.add(new MyToken("Punto", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{corcheteAbrir} {
    Tokens.add(new MyToken("CorcheteAbrir", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{corcheteCerrar} {
    Tokens.add(new MyToken("CorcheteCerrar", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{parenAbrir} {
    Tokens.add(new MyToken("ParentesisAbrir", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{parenCerrar} {
    Tokens.add(new MyToken("ParentesisCerrar", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{llaveAbrir} {
    Tokens.add(new MyToken("LlaveAbrir", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{llaveCerrar} {
    Tokens.add(new MyToken("LlaveCerrar", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{arroba} {
    Tokens.add(new MyToken("Arroba", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{dobHasht} {
    Tokens.add(new MyToken("DobleNumeral", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
{hast} {
    Tokens.add(new MyToken("Numeral", yytext(), "Simbolo", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {tab} {
    Tokens.add(new MyToken("Tabulacion", yytext(), "Separador", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {carrete} {
    Tokens.add(new MyToken("Carrete", yytext(), "Separador", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {salto} {
    Tokens.add(new MyToken("Salto", yytext(), "Separador", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {espacio} {
    Tokens.add(new MyToken("Espacio", yytext(), "Separador", yyline + 1, yylength(), yycolumn + 1));
}
[^] {
    Tokens.add(new MyToken("Error", yytext(), "Error", yyline + 1, yylength(), yycolumn + 1));
}