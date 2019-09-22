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
espacios = [\t]|[\r]|[\n]|[\r]|[ ]
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
    Tokens.add(new MyToken("reservada.WITHIN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
} 
<YYINITIAL> {reservadaADD} {
    Tokens.add(new MyToken("reservada.ADD", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaALL} {
    Tokens.add(new MyToken("reservada.ALL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaALTER} {
    Tokens.add(new MyToken("reservada.ALTER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAND} {
    Tokens.add(new MyToken("reservada.AND", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaANY} {
    Tokens.add(new MyToken("reservada.ANY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAS} {
    Tokens.add(new MyToken("reservada.AS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaASC} {
    Tokens.add(new MyToken("reservada.ASC", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAUTHORIZATION} {
    Tokens.add(new MyToken("reservada.AUTHORIZATION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBACKUP} {
    Tokens.add(new MyToken("reservada.BACKUP", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBEGIN} {
    Tokens.add(new MyToken("reservada.BEGIN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBETWEEN} {
    Tokens.add(new MyToken("reservada.BETWEEN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBREAK} {
    Tokens.add(new MyToken("reservada.BREAK", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBROWSE} {
    Tokens.add(new MyToken("reservada.BROWSE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBULK} {
    Tokens.add(new MyToken("reservada.BULK", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBY} {
    Tokens.add(new MyToken("reservada.BY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCASCADE} {
    Tokens.add(new MyToken("reservada.CASCADE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCASE} {
    Tokens.add(new MyToken("reservada.CASE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHECK} {
    Tokens.add(new MyToken("reservada.CHECK", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHECKPOINT} {
    Tokens.add(new MyToken("reservada.CHECKPOINT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCLOSE} {
    Tokens.add(new MyToken("reservada.CLOSE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCLUSTERED} {
    Tokens.add(new MyToken("reservada.CLUSTERED", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOALESCE} {
    Tokens.add(new MyToken("reservada.COALESCE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOLLATE} {
    Tokens.add(new MyToken("reservada.COLLATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOLUMN} {
    Tokens.add(new MyToken("reservada.COLUMN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOMMIT} {
    Tokens.add(new MyToken("reservada.COMMIT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOMPUTE} {
    Tokens.add(new MyToken("reservada.COMPUTE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONSTRAINT} {
    Tokens.add(new MyToken("reservada.CONSTRAINT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONTAINS} {
    Tokens.add(new MyToken("reservada.CONTAINS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONTAINSTABLE} {
    Tokens.add(new MyToken("reservada.CONTAINSTABLE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONTINUE} {
    Tokens.add(new MyToken("reservada.CONTINUE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONVERT} {
    Tokens.add(new MyToken("reservada.CONVERT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCREATE} {
    Tokens.add(new MyToken("reservada.CREATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCROSS} {
    Tokens.add(new MyToken("reservada.CROSS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT} {
    Tokens.add(new MyToken("reservada.CURRENT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_DATE} {
    Tokens.add(new MyToken("reservada.CURRENT_DATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_TIME} {
    Tokens.add(new MyToken("reservada.CURRENT_TIME", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_TIMESTAMP} {
    Tokens.add(new MyToken("reservada.CURRENT_TIMESTAMP", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_USER} {
    Tokens.add(new MyToken("reservada.CURRENT_USER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCURSOR} {
    Tokens.add(new MyToken("reservada.CURSOR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDATABASE} {
    Tokens.add(new MyToken("reservada.DATABASE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDBCC} {
    Tokens.add(new MyToken("reservada.DBCC", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEALLOCATE} {
    Tokens.add(new MyToken("reservada.DEALLOCATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDECLARE} {
    Tokens.add(new MyToken("reservada.DECLARE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEFAULT} {
    Tokens.add(new MyToken("reservada.DEFAULT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDELETE} {
    Tokens.add(new MyToken("reservada.DELETE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDENY} {
    Tokens.add(new MyToken("reservada.DENY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDESC} {
    Tokens.add(new MyToken("reservada.DESC", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDISK} {
    Tokens.add(new MyToken("reservada.DISK", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDISTINCT} {
    Tokens.add(new MyToken("reservada.DISTINCT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDISTRIBUTED} {
    Tokens.add(new MyToken("reservada.DISTRIBUTED", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDOUBLE} {
    Tokens.add(new MyToken("reservada.DOUBLE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDROP} {
    Tokens.add(new MyToken("reservada.DROP", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDUMP} {
    Tokens.add(new MyToken("reservada.DUMP", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaELSE} {
    Tokens.add(new MyToken("reservada.ELSE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEND} {
    Tokens.add(new MyToken("reservada.END", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaERRLVL} {
    Tokens.add(new MyToken("reservada.ERRLVL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaESCAPE} {
    Tokens.add(new MyToken("reservada.ESCAPE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXCEPT} {
    Tokens.add(new MyToken("reservada.EXCEPT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXEC} {
    Tokens.add(new MyToken("reservada.EXEC", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXECUTE} {
    Tokens.add(new MyToken("reservada.EXECUTE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXISTS} {
    Tokens.add(new MyToken("reservada.EXISTS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXIT} {
    Tokens.add(new MyToken("reservada.EXIT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXTERNAL} {
    Tokens.add(new MyToken("reservada.EXTERNAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFETCH} {
    Tokens.add(new MyToken("reservada.FETCH", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFILE} {
    Tokens.add(new MyToken("reservada.FILE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFILLFACTOR} {
    Tokens.add(new MyToken("reservada.FILLFACTOR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFOR} {
    Tokens.add(new MyToken("reservada.FOR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFOREIGN} {
    Tokens.add(new MyToken("reservada.FOREIGN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFREETEXT} {
    Tokens.add(new MyToken("reservada.FREETEXT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFREETEXTTABLE} {
    Tokens.add(new MyToken("reservada.FREETEXTTABLE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFROM} {
    Tokens.add(new MyToken("reservada.FROM", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFULL} {
    Tokens.add(new MyToken("reservada.FULL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFUNCTION} {
    Tokens.add(new MyToken("reservada.FUNCTION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGOTO} {
    Tokens.add(new MyToken("reservada.GOTO", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGRANT} {
    Tokens.add(new MyToken("reservada.GRANT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGROUP} {
    Tokens.add(new MyToken("reservada.GROUP", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaHAVING} {
    Tokens.add(new MyToken("reservada.HAVING", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaHOLDLOCK} {
    Tokens.add(new MyToken("reservada.HOLDLOCK", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIDENTITY} {
    Tokens.add(new MyToken("reservada.IDENTITY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIDENTITY_INSERT} {
    Tokens.add(new MyToken("reservada.IDENTITY_INSERT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIDENTITYCOL} {
    Tokens.add(new MyToken("reservada.IDENTITYCOL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIF} {
    Tokens.add(new MyToken("reservada.IF", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIN} {
    Tokens.add(new MyToken("reservada.IN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINDEX} {
    Tokens.add(new MyToken("reservada.INDEX", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINNER} {
    Tokens.add(new MyToken("reservada.INNER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINSERT} {
    Tokens.add(new MyToken("reservada.INSERT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINTERSECT} {
    Tokens.add(new MyToken("reservada.INTERSECT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINTO} {
    Tokens.add(new MyToken("reservada.INTO", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIS} {
    Tokens.add(new MyToken("reservada.IS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaJOIN} {
    Tokens.add(new MyToken("reservada.JOIN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaKEY} {
    Tokens.add(new MyToken("reservada.KEY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaKILL} {
    Tokens.add(new MyToken("reservada.KILL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLEFT} {
    Tokens.add(new MyToken("reservada.LEFT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLIKE} {
    Tokens.add(new MyToken("reservada.LIKE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLINENO} {
    Tokens.add(new MyToken("reservada.LINENO", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLOAD} {
    Tokens.add(new MyToken("reservada.LOAD", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMERGE} {
    Tokens.add(new MyToken("reservada.MERGE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNATIONAL} {
    Tokens.add(new MyToken("reservada.NATIONAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNOCHECK} {
    Tokens.add(new MyToken("reservada.NOCHECK", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNOCLUSTERED} {
    Tokens.add(new MyToken("reservada.NOCLUSTERED", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNOT} {
    Tokens.add(new MyToken("reservada.NOT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNULL} {
    Tokens.add(new MyToken("reservada.NULL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNULLIF} {
    Tokens.add(new MyToken("reservada.NULLIF", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOF} {
    Tokens.add(new MyToken("reservada.OF", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOFF} {
    Tokens.add(new MyToken("reservada.OFF", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOFFSETS} {
    Tokens.add(new MyToken("reservada.OFFSETS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaON} {
    Tokens.add(new MyToken("reservada.ON", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPEN} {
    Tokens.add(new MyToken("reservada.OPEN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPENDATASOURCE} {
    Tokens.add(new MyToken("reservada.OPENDATASOURCE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPENQUERY} {
    Tokens.add(new MyToken("reservada.OPENQUERY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPENXML} {
    Tokens.add(new MyToken("reservada.OPENXML", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOPTION} {
    Tokens.add(new MyToken("reservada.OPTION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOR} {
    Tokens.add(new MyToken("reservada.OR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaORDER} {
    Tokens.add(new MyToken("reservada.ORDER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOUTER} {
    Tokens.add(new MyToken("reservada.OUTER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOVER} {
    Tokens.add(new MyToken("reservada.OVER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPERCENT} {
    Tokens.add(new MyToken("reservada.PERCENT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPIVOT} {
    Tokens.add(new MyToken("reservada.PIVOT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPLAN} {
    Tokens.add(new MyToken("reservada.PLAN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRECISION} {
    Tokens.add(new MyToken("reservada.PRECISION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRIMARY} {
    Tokens.add(new MyToken("reservada.PRIMARY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRINT} {
    Tokens.add(new MyToken("reservada.PRINT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPROC} {
    Tokens.add(new MyToken("reservada.PROC", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPROCEDURE} {
    Tokens.add(new MyToken("reservada.PROCEDURE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPUBLIC} {
    Tokens.add(new MyToken("reservada.PUBLIC", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRAISERROR} {
    Tokens.add(new MyToken("reservada.RAISERROR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREAD} {
    Tokens.add(new MyToken("reservada.READ", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREADTEXT} {
    Tokens.add(new MyToken("reservada.READTEXT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRECONFIGURE} {
    Tokens.add(new MyToken("reservada.RECONFIGURE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREFERENCES} {
    Tokens.add(new MyToken("reservada.REFERENCES", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREPLICATION} {
    Tokens.add(new MyToken("reservada.REPLICATION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRESTORE} {
    Tokens.add(new MyToken("reservada.RESTORE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRESTRICT} {
    Tokens.add(new MyToken("reservada.RESTRICT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRETURN} {
    Tokens.add(new MyToken("reservada.RETURN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREVERT} {
    Tokens.add(new MyToken("reservada.REVERT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREVOKE} {
    Tokens.add(new MyToken("reservada.REVOKE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRIGHT} {
    Tokens.add(new MyToken("reservada.RIGHT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaROLLBACK} {
    Tokens.add(new MyToken("reservada.ROLLBACK", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaROWCOUNT} {
    Tokens.add(new MyToken("reservada.ROWCOUNT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaROWGUIDCOL} {
    Tokens.add(new MyToken("reservada.ROWGUIDCOL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRULE} {
    Tokens.add(new MyToken("reservada.RULE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSAVE} {
    Tokens.add(new MyToken("reservada.SAVE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSCHEMA} {
    Tokens.add(new MyToken("reservada.SCHEMA", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSECURITYAUDIT} {
    Tokens.add(new MyToken("reservada.SECURITYAUDIT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSELECT} {
    Tokens.add(new MyToken("reservada.SELECT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSEMANTICKEYPHRASETABLE} {
    Tokens.add(new MyToken("reservada.SEMANTICKEYPHRASETAB", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSEMANTICSIMILARITYDETAILSTABLE} {
    Tokens.add(new MyToken("reservada.SEMANTICSIMILARITYDE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSEMANTICSIMILARITYTABLE} {
    Tokens.add(new MyToken("reservada.SEMANTICSIMILARITYTA", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSESSION_USER} {
    Tokens.add(new MyToken("reservada.SESSION_USER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSET} {
    Tokens.add(new MyToken("reservada.SET", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSETUSER} {
    Tokens.add(new MyToken("reservada.SETUSER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSHUTDOWN} {
    Tokens.add(new MyToken("reservada.SHUTDOWN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSOME} {
    Tokens.add(new MyToken("reservada.SOME", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSTATISTICS} {
    Tokens.add(new MyToken("reservada.STATISTICS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSYSTEM_USER} {
    Tokens.add(new MyToken("reservada.SYSTEM_USER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTABLE} {
    Tokens.add(new MyToken("reservada.TABLE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTABLESAMPLE} {
    Tokens.add(new MyToken("reservada.TABLESAMPLE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTEXTSIZE} {
    Tokens.add(new MyToken("reservada.TEXTSIZE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTHEN} {
    Tokens.add(new MyToken("reservada.THEN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTO} {
    Tokens.add(new MyToken("reservada.TO", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTOP} {
    Tokens.add(new MyToken("reservada.TOP", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRAN} {
    Tokens.add(new MyToken("reservada.TRAN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRANSACTION} {
    Tokens.add(new MyToken("reservada.TRANSACTION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRIGGER} {
    Tokens.add(new MyToken("reservada.TRIGGER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRUNCATE} {
    Tokens.add(new MyToken("reservada.TRUNCATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRY_CONVERT} {
    Tokens.add(new MyToken("reservada.TRY_CONVERT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTSEQUAL} {
    Tokens.add(new MyToken("reservada.TSEQUAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUNION} {
    Tokens.add(new MyToken("reservada.UNION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUNIQUE} {
    Tokens.add(new MyToken("reservada.UNIQUE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUNPIVOT} {
    Tokens.add(new MyToken("reservada.UNPIVOT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUPDATE} {
    Tokens.add(new MyToken("reservada.UPDATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUPDATETEXT} {
    Tokens.add(new MyToken("reservada.UPDATETEXT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUSE} {
    Tokens.add(new MyToken("reservada.USE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUSER} {
    Tokens.add(new MyToken("reservada.USER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVALUES} {
    Tokens.add(new MyToken("reservada.VALUES", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVARYING} {
    Tokens.add(new MyToken("reservada.VARYING", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVIEW} {
    Tokens.add(new MyToken("reservada.VIEW", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWAITFOR} {
    Tokens.add(new MyToken("reservada.WAITFOR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWHEN} {
    Tokens.add(new MyToken("reservada.WHEN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWHERE} {
    Tokens.add(new MyToken("reservada.WHERE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWHILE} {
    Tokens.add(new MyToken("reservada.WHILE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWITH} {
    Tokens.add(new MyToken("reservada.WITH", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWRITETEXT} {
    Tokens.add(new MyToken("reservada.WRITETEXT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaABSOLUTE} {
    Tokens.add(new MyToken("reservada.ABSOLUTE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOVERLAPS} {
    Tokens.add(new MyToken("reservada.OVERLAPS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaACTION} {
    Tokens.add(new MyToken("reservada.ACTION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPAD} {
    Tokens.add(new MyToken("reservada.PAD", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaADA} {
    Tokens.add(new MyToken("reservada.ADA", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPARTIAL} {
    Tokens.add(new MyToken("reservada.PARTIAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPASCAL} {
    Tokens.add(new MyToken("reservada.PASCAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXTRACT} {
    Tokens.add(new MyToken("reservada.EXTRACT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPOSITION} {
    Tokens.add(new MyToken("reservada.POSITION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaALLOCATE} {
    Tokens.add(new MyToken("reservada.ALLOCATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFALSO} {
    Tokens.add(new MyToken("reservada.FALSO", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPREPARE} {
    Tokens.add(new MyToken("reservada.PREPARE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFIRST} {
    Tokens.add(new MyToken("reservada.FIRST", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRESERVE} {
    Tokens.add(new MyToken("reservada.PRESERVE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFLOAT} {
    Tokens.add(new MyToken("reservada.FLOAT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaARE} {
    Tokens.add(new MyToken("reservada.ARE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRIOR} {
    Tokens.add(new MyToken("reservada.PRIOR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaPRIVILEGES} {
    Tokens.add(new MyToken("reservada.PRIVILEGES", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFORTRAN} {
    Tokens.add(new MyToken("reservada.FORTRAN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaASSERTION} {
    Tokens.add(new MyToken("reservada.ASSERTION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaFOUND} {
    Tokens.add(new MyToken("reservada.FOUND", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAT} {
    Tokens.add(new MyToken("reservada.AT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaREAL} {
    Tokens.add(new MyToken("reservada.REAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaAVG} {
    Tokens.add(new MyToken("reservada.AVG", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGET} {
    Tokens.add(new MyToken("reservada.GET", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGLOBAL} {
    Tokens.add(new MyToken("reservada.GLOBAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaRELATIVE} {
    Tokens.add(new MyToken("reservada.RELATIVE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaGO} {
    Tokens.add(new MyToken("reservada.GO", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBIT} {
    Tokens.add(new MyToken("reservada.BIT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBIT_LENGTH} {
    Tokens.add(new MyToken("reservada.BIT_LENGTH", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaBOTH} {
    Tokens.add(new MyToken("reservada.BOTH", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaROWS} {
    Tokens.add(new MyToken("reservada.ROWS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaHOUR} {
    Tokens.add(new MyToken("reservada.HOUR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCASCADED} {
    Tokens.add(new MyToken("reservada.CASCADED", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSCROLL} {
    Tokens.add(new MyToken("reservada.SCROLL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaIMMEDIATE} {
    Tokens.add(new MyToken("reservada.IMMEDIATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSECOND} {
    Tokens.add(new MyToken("reservada.SECOND", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCAST} {
    Tokens.add(new MyToken("reservada.CAST", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSECTION} {
    Tokens.add(new MyToken("reservada.SECTION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCATALOG} {
    Tokens.add(new MyToken("reservada.CATALOG", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINCLUDE} {
    Tokens.add(new MyToken("reservada.INCLUDE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHAR} {
    Tokens.add(new MyToken("reservada.CHAR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSESSION} {
    Tokens.add(new MyToken("reservada.SESSION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHAR_LENGTH} {
    Tokens.add(new MyToken("reservada.CHAR_LENGTH", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINDICATOR} {
    Tokens.add(new MyToken("reservada.INDICATOR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHARACTER} {
    Tokens.add(new MyToken("reservada.CHARACTER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINITIALLY} {
    Tokens.add(new MyToken("reservada.INITIALLY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCHARACTER_LENGTH} {
    Tokens.add(new MyToken("reservada.CHARACTER_LENGTH", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSIZE} {
    Tokens.add(new MyToken("reservada.SIZE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINPUT} {
    Tokens.add(new MyToken("reservada.INPUT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSMALLINT} {
    Tokens.add(new MyToken("reservada.SMALLINT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINSENSITIVE} {
    Tokens.add(new MyToken("reservada.INSENSITIVE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSPACE} {
    Tokens.add(new MyToken("reservada.SPACE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINT} {
    Tokens.add(new MyToken("reservada.INT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQL} {
    Tokens.add(new MyToken("reservada.SQL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOLLATION} {
    Tokens.add(new MyToken("reservada.COLLATION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINTEGER} {
    Tokens.add(new MyToken("reservada.INTEGER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLCA} {
    Tokens.add(new MyToken("reservada.SQLCA", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLCODE} {
    Tokens.add(new MyToken("reservada.SQLCODE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaINTERVAL} {
    Tokens.add(new MyToken("reservada.INTERVAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLERROR} {
    Tokens.add(new MyToken("reservada.SQLERROR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONNECT} {
    Tokens.add(new MyToken("reservada.CONNECT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLSTATE} {
    Tokens.add(new MyToken("reservada.SQLSTATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONNECTION} {
    Tokens.add(new MyToken("reservada.CONNECTION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSQLWARNING} {
    Tokens.add(new MyToken("reservada.SQLWARNING", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaISOLATION} {
    Tokens.add(new MyToken("reservada.ISOLATION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSUBSTRING} {
    Tokens.add(new MyToken("reservada.SUBSTRING", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCONSTRAINTS} {
    Tokens.add(new MyToken("reservada.CONSTRAINTS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaSUM} {
    Tokens.add(new MyToken("reservada.SUM", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLANGUAGE} {
    Tokens.add(new MyToken("reservada.LANGUAGE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCORRESPONDING} {
    Tokens.add(new MyToken("reservada.CORRESPONDING", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLAST} {
    Tokens.add(new MyToken("reservada.LAST", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTEMPORARY} {
    Tokens.add(new MyToken("reservada.TEMPORARY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaCOUNT} {
    Tokens.add(new MyToken("reservada.COUNT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLEADING} {
    Tokens.add(new MyToken("reservada.LEADING", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTIME} {
    Tokens.add(new MyToken("reservada.TIME", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLEVEL} {
    Tokens.add(new MyToken("reservada.LEVEL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTIMESTAMP} {
    Tokens.add(new MyToken("reservada.TIMESTAMP", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTIMEZONE_HOUR} {
    Tokens.add(new MyToken("reservada.TIMEZONE_HOUR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLOCAL} {
    Tokens.add(new MyToken("reservada.LOCAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTIMEZONE_MINUTE} {
    Tokens.add(new MyToken("reservada.TIMEZONE_MINUTE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaLOWER} {
    Tokens.add(new MyToken("reservada.LOWER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMATCH} {
    Tokens.add(new MyToken("reservada.MATCH", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRAILING} {
    Tokens.add(new MyToken("reservada.TRAILING", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMAX} {
    Tokens.add(new MyToken("reservada.MAX", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMIN} {
    Tokens.add(new MyToken("reservada.MIN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRANSLATE} {
    Tokens.add(new MyToken("reservada.TRANSLATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDATE} {
    Tokens.add(new MyToken("reservada.DATE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMINUTE} {
    Tokens.add(new MyToken("reservada.MINUTE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRANSLATION} {
    Tokens.add(new MyToken("reservada.TRANSLATION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDAY} {
    Tokens.add(new MyToken("reservada.DAY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMODULE} {
    Tokens.add(new MyToken("reservada.MODULE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaTRIM} {
    Tokens.add(new MyToken("reservada.TRIM", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaMONTH} {
    Tokens.add(new MyToken("reservada.MONTH", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVERDADERO} {
    Tokens.add(new MyToken("reservada.VERDADERO", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEC} {
    Tokens.add(new MyToken("reservada.DEC", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNAMES} {
    Tokens.add(new MyToken("reservada.NAMES", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDECIMAL} {
    Tokens.add(new MyToken("reservada.DECIMAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNATURAL} {
    Tokens.add(new MyToken("reservada.NATURAL", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUNKNOWN} {
    Tokens.add(new MyToken("reservada.UNKNOWN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNCHAR} {
    Tokens.add(new MyToken("reservada.NCHAR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEFERRABLE} {
    Tokens.add(new MyToken("reservada.DEFERRABLE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNEXT} {
    Tokens.add(new MyToken("reservada.NEXT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUPPER} {
    Tokens.add(new MyToken("reservada.UPPER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDEFERRED} {
    Tokens.add(new MyToken("reservada.DEFERRED", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNO} {
    Tokens.add(new MyToken("reservada.NO", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUSAGE} {
    Tokens.add(new MyToken("reservada.USAGE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNONE} {
    Tokens.add(new MyToken("reservada.NONE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaUSING} {
    Tokens.add(new MyToken("reservada.USING", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDESCRIBE} {
    Tokens.add(new MyToken("reservada.DESCRIBE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVALUE} {
    Tokens.add(new MyToken("reservada.VALUE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDESCRIPTOR} {
    Tokens.add(new MyToken("reservada.DESCRIPTOR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDIAGNOSTICS} {
    Tokens.add(new MyToken("reservada.DIAGNOSTICS", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaNUMERIC} {
    Tokens.add(new MyToken("reservada.NUMERIC", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaVARCHAR} {
    Tokens.add(new MyToken("reservada.VARCHAR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDISCONNECT} {
    Tokens.add(new MyToken("reservada.DISCONNECT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOCTET_LENGTH} {
    Tokens.add(new MyToken("reservada.OCTET_LENGTH", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaDOMAIN} {
    Tokens.add(new MyToken("reservada.DOMAIN", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaONLY} {
    Tokens.add(new MyToken("reservada.ONLY", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWHENEVER} {
    Tokens.add(new MyToken("reservada.WHENEVER", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWORK} {
    Tokens.add(new MyToken("reservada.WORK", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaENDEXEC} {
    Tokens.add(new MyToken("reservada.ENDEXEC", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaWRITE} {
    Tokens.add(new MyToken("reservada.WRITE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaYEAR} {
    Tokens.add(new MyToken("reservada.YEAR", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaOUTPUT} {
    Tokens.add(new MyToken("reservada.OUTPUT", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaZONE} {
    Tokens.add(new MyToken("reservada.ZONE", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<YYINITIAL> {reservadaEXCEPTION} {
    Tokens.add(new MyToken("reservada.EXCEPTION", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
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
        Tokens.add(new MyToken("IdentificadorTruncado", yytext().substring(0, 31), "Advertencia", yyline + 1, 31, yycolumn + 1));
    }
}
<YYINITIAL> {comentarioSimple} {
    Tokens.add(new MyToken("Comentario", yytext(), "Token", yyline + 1, yylength(), yycolumn + 1));
}
<COMENTARIOMULTI> {
    ([*])+[/] {
        _cadenaComentario.append(yytext());
        _comentarioActivo = false;
        yybegin(YYINITIAL);
        Tokens.add(new MyToken("Comentario", _cadenaComentario.toString(), "Token", yyline + 1, yylength(), yycolumn + 1));
        _cadenaComentario = new StringBuffer();
    }
    <<EOF>> {
        Tokens.add(new MyToken("ComentarioNoCerrado", _cadenaComentario.toString(), "Error", yyline + 1, yylength(), yycolumn + 1));
        yybegin(YYINITIAL);
    }
    . {
        _cadenaComentario.append(yytext());
    }
    \n {
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