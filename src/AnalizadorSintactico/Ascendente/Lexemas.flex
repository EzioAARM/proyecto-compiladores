package AnalizadorSintactico.Ascendente;
import java_cup.runtime.*;
import java.io.*;
import java.io.FileReader;

%%
%public
%class Lexemas
%type java_cup.runtime.Symbol
%{
    StringBuffer _cadenaComentario = new StringBuffer();
    private boolean _comentarioActivo = false;

    public boolean comentarioActivo() {
        return this._comentarioActivo;
    }

    public Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
%line
%column
%unicode
%cup
%standalone
%char
%function next_token
%state COMENTARIOMULTI
%full
%eofclose
%eofval{
    return symbol(sym.EOF);
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
    return symbol(sym.WITHIN);
} 
<YYINITIAL> {reservadaADD} {
    return symbol(sym.ADD);
}
<YYINITIAL> {reservadaALL} {
    return symbol(sym.ALL);
}
<YYINITIAL> {reservadaALTER} {
    return symbol(sym.ALTER);
}
<YYINITIAL> {reservadaAND} {
    return symbol(sym.AND);
}
<YYINITIAL> {reservadaANY} {
    return symbol(sym.ANY);
}
<YYINITIAL> {reservadaAS} {
    return symbol(sym.AS);
}
<YYINITIAL> {reservadaASC} {
    return symbol(sym.ASC);
}
<YYINITIAL> {reservadaAUTHORIZATION} {
    return symbol(sym.AUTHORIZATION);
}
<YYINITIAL> {reservadaBACKUP} {
    return symbol(sym.BACKUP);
}
<YYINITIAL> {reservadaBEGIN} {
    return symbol(sym.BEGIN);
}
<YYINITIAL> {reservadaBETWEEN} {
    return symbol(sym.BETWEEN);
}
<YYINITIAL> {reservadaBREAK} {
    return symbol(sym.BREAK);
}
<YYINITIAL> {reservadaBROWSE} {
    return symbol(sym.BROWSE);
}
<YYINITIAL> {reservadaBULK} {
    return symbol(sym.BULK);
}
<YYINITIAL> {reservadaBY} {
    return symbol(sym.BY);
}
<YYINITIAL> {reservadaCASCADE} {
    return symbol(sym.CASCADE);
}
<YYINITIAL> {reservadaCASE} {
    return symbol(sym.CASE);
}
<YYINITIAL> {reservadaCHECK} {
    return symbol(sym.CHECK);
}
<YYINITIAL> {reservadaCHECKPOINT} {
    return symbol(sym.CHECKPOINT);
}
<YYINITIAL> {reservadaCLOSE} {
    return symbol(sym.CLOSE);
}
<YYINITIAL> {reservadaCLUSTERED} {
    return symbol(sym.CLUSTERED);
}
<YYINITIAL> {reservadaCOALESCE} {
    return symbol(sym.COALESCE);
}
<YYINITIAL> {reservadaCOLLATE} {
    return symbol(sym.COLLATE);
}
<YYINITIAL> {reservadaCOLUMN} {
    return symbol(sym.COLUMN);
}
<YYINITIAL> {reservadaCOMMIT} {
    return symbol(sym.COMMIT);
}
<YYINITIAL> {reservadaCOMPUTE} {
    return symbol(sym.COMPUTE);
}
<YYINITIAL> {reservadaCONSTRAINT} {
    return symbol(sym.CONSTRAINT);
}
<YYINITIAL> {reservadaCONTAINS} {
    return symbol(sym.CONTAINS);
}
<YYINITIAL> {reservadaCONTAINSTABLE} {
    return symbol(sym.CONTAINSTABLE);
}
<YYINITIAL> {reservadaCONTINUE} {
    return symbol(sym.CONTINUE);
}
<YYINITIAL> {reservadaCONVERT} {
    return symbol(sym.CONVERT);
}
<YYINITIAL> {reservadaCREATE} {
    return symbol(sym.CREATE);
}
<YYINITIAL> {reservadaCROSS} {
    return symbol(sym.CROSS);
}
<YYINITIAL> {reservadaCURRENT} {
    return symbol(sym.CURRENT);
}
<YYINITIAL> {reservadaCURRENT_DATE} {
    return symbol(sym.CURRENT_DATE);
}
<YYINITIAL> {reservadaCURRENT_TIME} {
    return symbol(sym.CURRENT_TIME);
}
<YYINITIAL> {reservadaCURRENT_TIMESTAMP} {
    return symbol(sym.CURRENT_TIMESTAMP);
}
<YYINITIAL> {reservadaCURRENT_USER} {
    return symbol(sym.CURRENT_USER);
}
<YYINITIAL> {reservadaCURSOR} {
    return symbol(sym.CURSOR);
}
<YYINITIAL> {reservadaDATABASE} {
    return symbol(sym.DATABASE);
}
<YYINITIAL> {reservadaDBCC} {
    return symbol(sym.DBCC);
}
<YYINITIAL> {reservadaDEALLOCATE} {
    return symbol(sym.DEALLOCATE);
}
<YYINITIAL> {reservadaDECLARE} {
    return symbol(sym.DECLARE);
}
<YYINITIAL> {reservadaDEFAULT} {
    return symbol(sym.DEFAULT);
}
<YYINITIAL> {reservadaDELETE} {
    return symbol(sym.DELETE);
}
<YYINITIAL> {reservadaDENY} {
    return symbol(sym.DENY);
}
<YYINITIAL> {reservadaDESC} {
    return symbol(sym.DESC);
}
<YYINITIAL> {reservadaDISK} {
    return symbol(sym.DISK);
}
<YYINITIAL> {reservadaDISTINCT} {
    return symbol(sym.DISTINCT);
}
<YYINITIAL> {reservadaDISTRIBUTED} {
    return symbol(sym.DISTRIBUTED);
}
<YYINITIAL> {reservadaDOUBLE} {
    return symbol(sym.DOUBLE);
}
<YYINITIAL> {reservadaDROP} {
    return symbol(sym.DROP);
}
<YYINITIAL> {reservadaDUMP} {
    return symbol(sym.DUMP);
}
<YYINITIAL> {reservadaELSE} {
    return symbol(sym.ELSE);
}
<YYINITIAL> {reservadaEND} {
    return symbol(sym.END);
}
<YYINITIAL> {reservadaERRLVL} {
    return symbol(sym.ERRLVL);
}
<YYINITIAL> {reservadaESCAPE} {
    return symbol(sym.ESCAPE);
}
<YYINITIAL> {reservadaEXCEPT} {
    return symbol(sym.EXCEPT);
}
<YYINITIAL> {reservadaEXEC} {
    return symbol(sym.EXEC);
}
<YYINITIAL> {reservadaEXECUTE} {
    return symbol(sym.EXECUTE);
}
<YYINITIAL> {reservadaEXISTS} {
    return symbol(sym.EXISTS);
}
<YYINITIAL> {reservadaEXIT} {
    return symbol(sym.EXIT);
}
<YYINITIAL> {reservadaEXTERNAL} {
    return symbol(sym.EXTERNAL);
}
<YYINITIAL> {reservadaFETCH} {
    return symbol(sym.FETCH);
}
<YYINITIAL> {reservadaFILE} {
    return symbol(sym.FILE);
}
<YYINITIAL> {reservadaFILLFACTOR} {
    return symbol(sym.FILLFACTOR);
}
<YYINITIAL> {reservadaFOR} {
    return symbol(sym.FOR);
}
<YYINITIAL> {reservadaFOREIGN} {
    return symbol(sym.FOREIGN);
}
<YYINITIAL> {reservadaFREETEXT} {
    return symbol(sym.FREETEXT);
}
<YYINITIAL> {reservadaFREETEXTTABLE} {
    return symbol(sym.FREETEXTTABLE);
}
<YYINITIAL> {reservadaFROM} {
    return symbol(sym.FROM);
}
<YYINITIAL> {reservadaFULL} {
    return symbol(sym.FULL);
}
<YYINITIAL> {reservadaFUNCTION} {
    return symbol(sym.FUNCTION);
}
<YYINITIAL> {reservadaGOTO} {
    return symbol(sym.GOTO);
}
<YYINITIAL> {reservadaGRANT} {
    return symbol(sym.GRANT);
}
<YYINITIAL> {reservadaGROUP} {
    return symbol(sym.GROUP);
}
<YYINITIAL> {reservadaHAVING} {
    return symbol(sym.HAVING);
}
<YYINITIAL> {reservadaHOLDLOCK} {
    return symbol(sym.HOLDLOCK);
}
<YYINITIAL> {reservadaIDENTITY} {
    return symbol(sym.IDENTITY);
}
<YYINITIAL> {reservadaIDENTITY_INSERT} {
    return symbol(sym.IDENTITY_INSERT);
}
<YYINITIAL> {reservadaIDENTITYCOL} {
    return symbol(sym.IDENTITYCOL);
}
<YYINITIAL> {reservadaIF} {
    return symbol(sym.IF);
}
<YYINITIAL> {reservadaIN} {
    return symbol(sym.IN);
}
<YYINITIAL> {reservadaINDEX} {
    return symbol(sym.INDEX);
}
<YYINITIAL> {reservadaINNER} {
    return symbol(sym.INNER);
}
<YYINITIAL> {reservadaINSERT} {
    return symbol(sym.INSERT);
}
<YYINITIAL> {reservadaINTERSECT} {
    return symbol(sym.INTERSECT);
}
<YYINITIAL> {reservadaINTO} {
    return symbol(sym.INTO);
}
<YYINITIAL> {reservadaIS} {
    return symbol(sym.IS);
}
<YYINITIAL> {reservadaJOIN} {
    return symbol(sym.JOIN);
}
<YYINITIAL> {reservadaKEY} {
    return symbol(sym.KEY);
}
<YYINITIAL> {reservadaKILL} {
    return symbol(sym.KILL);
}
<YYINITIAL> {reservadaLEFT} {
    return symbol(sym.LEFT);
}
<YYINITIAL> {reservadaLIKE} {
    return symbol(sym.LIKE);
}
<YYINITIAL> {reservadaLINENO} {
    return symbol(sym.LINENO);
}
<YYINITIAL> {reservadaLOAD} {
    return symbol(sym.LOAD);
}
<YYINITIAL> {reservadaMERGE} {
    return symbol(sym.MERGE);
}
<YYINITIAL> {reservadaNATIONAL} {
    return symbol(sym.NATIONAL);
}
<YYINITIAL> {reservadaNOCHECK} {
    return symbol(sym.NOCHECK);
}
<YYINITIAL> {reservadaNOCLUSTERED} {
    return symbol(sym.NOCLUSTERED);
}
<YYINITIAL> {reservadaNOT} {
    return symbol(sym.NOT);
}
<YYINITIAL> {reservadaNULL} {
    return symbol(sym.NULL);
}
<YYINITIAL> {reservadaNULLIF} {
    return symbol(sym.NULLIF);
}
<YYINITIAL> {reservadaOF} {
    return symbol(sym.OF);
}
<YYINITIAL> {reservadaOFF} {
    return symbol(sym.OFF);
}
<YYINITIAL> {reservadaOFFSETS} {
    return symbol(sym.OFFSETS);
}
<YYINITIAL> {reservadaON} {
    return symbol(sym.ON);
}
<YYINITIAL> {reservadaOPEN} {
    return symbol(sym.OPEN);
}
<YYINITIAL> {reservadaOPENDATASOURCE} {
    return symbol(sym.OPENDATASOURCE);
}
<YYINITIAL> {reservadaOPENQUERY} {
    return symbol(sym.OPENQUERY);
}
<YYINITIAL> {reservadaOPENXML} {
    return symbol(sym.OPENXML);
}
<YYINITIAL> {reservadaOPTION} {
    return symbol(sym.OPTION);
}
<YYINITIAL> {reservadaOR} {
    return symbol(sym.OR);
}
<YYINITIAL> {reservadaORDER} {
    return symbol(sym.ORDER);
}
<YYINITIAL> {reservadaOUTER} {
    return symbol(sym.OUTER);
}
<YYINITIAL> {reservadaOVER} {
    return symbol(sym.OVER);
}
<YYINITIAL> {reservadaPERCENT} {
    return symbol(sym.PERCENT);
}
<YYINITIAL> {reservadaPIVOT} {
    return symbol(sym.PIVOT);
}
<YYINITIAL> {reservadaPLAN} {
    return symbol(sym.PLAN);
}
<YYINITIAL> {reservadaPRECISION} {
    return symbol(sym.PRECISION);
}
<YYINITIAL> {reservadaPRIMARY} {
    return symbol(sym.PRIMARY);
}
<YYINITIAL> {reservadaPRINT} {
    return symbol(sym.PRINT);
}
<YYINITIAL> {reservadaPROC} {
    return symbol(sym.PROC);
}
<YYINITIAL> {reservadaPROCEDURE} {
    return symbol(sym.PROCEDURE);
}
<YYINITIAL> {reservadaPUBLIC} {
    return symbol(sym.PUBLIC);
}
<YYINITIAL> {reservadaRAISERROR} {
    return symbol(sym.RAISERROR);
}
<YYINITIAL> {reservadaREAD} {
    return symbol(sym.READ);
}
<YYINITIAL> {reservadaREADTEXT} {
    return symbol(sym.READTEXT);
}
<YYINITIAL> {reservadaRECONFIGURE} {
    return symbol(sym.RECONFIGURE);
}
<YYINITIAL> {reservadaREFERENCES} {
    return symbol(sym.REFERENCES);
}
<YYINITIAL> {reservadaREPLICATION} {
    return symbol(sym.REPLICATION);
}
<YYINITIAL> {reservadaRESTORE} {
    return symbol(sym.RESTORE);
}
<YYINITIAL> {reservadaRESTRICT} {
    return symbol(sym.RESTRICT);
}
<YYINITIAL> {reservadaRETURN} {
    return symbol(sym.RETURN);
}
<YYINITIAL> {reservadaREVERT} {
    return symbol(sym.REVERT);
}
<YYINITIAL> {reservadaREVOKE} {
    return symbol(sym.REVOKE);
}
<YYINITIAL> {reservadaRIGHT} {
    return symbol(sym.RIGHT);
}
<YYINITIAL> {reservadaROLLBACK} {
    return symbol(sym.ROLLBACK);
}
<YYINITIAL> {reservadaROWCOUNT} {
    return symbol(sym.ROWCOUNT);
}
<YYINITIAL> {reservadaROWGUIDCOL} {
    return symbol(sym.ROWGUIDCOL);
}
<YYINITIAL> {reservadaRULE} {
    return symbol(sym.RULE);
}
<YYINITIAL> {reservadaSAVE} {
    return symbol(sym.SAVE);
}
<YYINITIAL> {reservadaSCHEMA} {
    return symbol(sym.SCHEMA);
}
<YYINITIAL> {reservadaSECURITYAUDIT} {
    return symbol(sym.SECURITYAUDIT);
}
<YYINITIAL> {reservadaSELECT} {
    return symbol(sym.SELECT);
}
<YYINITIAL> {reservadaSEMANTICKEYPHRASETABLE} {
    return symbol(sym.SEMANTICKEYPHRASETABLE);
}
<YYINITIAL> {reservadaSEMANTICSIMILARITYDETAILSTABLE} {
    return symbol(sym.SEMANTICSIMILARITYDETAILSTABLE);
}
<YYINITIAL> {reservadaSEMANTICSIMILARITYTABLE} {
    return symbol(sym.SEMANTICSIMILARITYTABLE);
}
<YYINITIAL> {reservadaSESSION_USER} {
    return symbol(sym.SESSION_USER);
}
<YYINITIAL> {reservadaSET} {
    return symbol(sym.SET);
}
<YYINITIAL> {reservadaSETUSER} {
    return symbol(sym.SETUSER);
}
<YYINITIAL> {reservadaSHUTDOWN} {
    return symbol(sym.SHUTDOWN);
}
<YYINITIAL> {reservadaSOME} {
    return symbol(sym.SOME);
}
<YYINITIAL> {reservadaSTATISTICS} {
    return symbol(sym.STATISTICS);
}
<YYINITIAL> {reservadaSYSTEM_USER} {
    return symbol(sym.SYSTEM_USER);
}
<YYINITIAL> {reservadaTABLE} {
    return symbol(sym.TABLE);
}
<YYINITIAL> {reservadaTABLESAMPLE} {
    return symbol(sym.TABLESAMPLE);
}
<YYINITIAL> {reservadaTEXTSIZE} {
    return symbol(sym.TEXTSIZE);
}
<YYINITIAL> {reservadaTHEN} {
    return symbol(sym.THEN);
}
<YYINITIAL> {reservadaTO} {
    return symbol(sym.TO);
}
<YYINITIAL> {reservadaTOP} {
    return symbol(sym.TOP);
}
<YYINITIAL> {reservadaTRAN} {
    return symbol(sym.TRAN);
}
<YYINITIAL> {reservadaTRANSACTION} {
    return symbol(sym.TRANSACTION);
}
<YYINITIAL> {reservadaTRIGGER} {
    return symbol(sym.TRIGGER);
}
<YYINITIAL> {reservadaTRUNCATE} {
    return symbol(sym.TRUNCATE);
}
<YYINITIAL> {reservadaTRY_CONVERT} {
    return symbol(sym.TRY_CONVERT);
}
<YYINITIAL> {reservadaTSEQUAL} {
    return symbol(sym.TSEQUAL);
}
<YYINITIAL> {reservadaUNION} {
    return symbol(sym.UNION);
}
<YYINITIAL> {reservadaUNIQUE} {
    return symbol(sym.UNIQUE);
}
<YYINITIAL> {reservadaUNPIVOT} {
    return symbol(sym.UNPIVOT);
}
<YYINITIAL> {reservadaUPDATE} {
    return symbol(sym.UPDATE);
}
<YYINITIAL> {reservadaUPDATETEXT} {
    return symbol(sym.UPDATETEXT);
}
<YYINITIAL> {reservadaUSE} {
    return symbol(sym.USE);
}
<YYINITIAL> {reservadaUSER} {
    return symbol(sym.USER);
}
<YYINITIAL> {reservadaVALUES} {
    return symbol(sym.VALUES);
}
<YYINITIAL> {reservadaVARYING} {
    return symbol(sym.VARYING);
}
<YYINITIAL> {reservadaVIEW} {
    return symbol(sym.VIEW);
}
<YYINITIAL> {reservadaWAITFOR} {
    return symbol(sym.WAITFOR);
}
<YYINITIAL> {reservadaWHEN} {
    return symbol(sym.WHEN);
}
<YYINITIAL> {reservadaWHERE} {
    return symbol(sym.WHERE);
}
<YYINITIAL> {reservadaWHILE} {
    return symbol(sym.WHILE);
}
<YYINITIAL> {reservadaWITH} {
    return symbol(sym.WITH);
}
<YYINITIAL> {reservadaWRITETEXT} {
    return symbol(sym.WRITETEXT);
}
<YYINITIAL> {reservadaABSOLUTE} {
    return symbol(sym.ABSOLUTE);
}
<YYINITIAL> {reservadaOVERLAPS} {
    return symbol(sym.OVERLAPS);
}
<YYINITIAL> {reservadaACTION} {
    return symbol(sym.ACTION);
}
<YYINITIAL> {reservadaPAD} {
    return symbol(sym.PAD);
}
<YYINITIAL> {reservadaADA} {
    return symbol(sym.ADA);
}
<YYINITIAL> {reservadaPARTIAL} {
    return symbol(sym.PARTIAL);
}
<YYINITIAL> {reservadaPASCAL} {
    return symbol(sym.PASCAL);
}
<YYINITIAL> {reservadaEXTRACT} {
    return symbol(sym.EXTRACT);
}
<YYINITIAL> {reservadaPOSITION} {
    return symbol(sym.POSITION);
}
<YYINITIAL> {reservadaALLOCATE} {
    return symbol(sym.ALLOCATE);
}
<YYINITIAL> {reservadaFALSO} {
    return symbol(sym.FALSO);
}
<YYINITIAL> {reservadaPREPARE} {
    return symbol(sym.PREPARE);
}
<YYINITIAL> {reservadaFIRST} {
    return symbol(sym.FIRST);
}
<YYINITIAL> {reservadaPRESERVE} {
    return symbol(sym.PRESERVE);
}
<YYINITIAL> {reservadaFLOAT} {
    return symbol(sym.FLOAT);
}
<YYINITIAL> {reservadaARE} {
    return symbol(sym.ARE);
}
<YYINITIAL> {reservadaPRIOR} {
    return symbol(sym.PRIOR);
}
<YYINITIAL> {reservadaPRIVILEGES} {
    return symbol(sym.PRIVILEGES);
}
<YYINITIAL> {reservadaFORTRAN} {
    return symbol(sym.FORTRAN);
}
<YYINITIAL> {reservadaASSERTION} {
    return symbol(sym.ASSERTION);
}
<YYINITIAL> {reservadaFOUND} {
    return symbol(sym.FOUND);
}
<YYINITIAL> {reservadaAT} {
    return symbol(sym.AT);
}
<YYINITIAL> {reservadaREAL} {
    return symbol(sym.REAL);
}
<YYINITIAL> {reservadaAVG} {
    return symbol(sym.AVG);
}
<YYINITIAL> {reservadaGET} {
    return symbol(sym.GET);
}
<YYINITIAL> {reservadaGLOBAL} {
    return symbol(sym.GLOBAL);
}
<YYINITIAL> {reservadaRELATIVE} {
    return symbol(sym.RELATIVE);
}
<YYINITIAL> {reservadaGO} {
    return symbol(sym.GO);
}
<YYINITIAL> {reservadaBIT} {
    return symbol(sym.BIT);
}
<YYINITIAL> {reservadaBIT_LENGTH} {
    return symbol(sym.BIT_LENGTH);
}
<YYINITIAL> {reservadaBOTH} {
    return symbol(sym.BOTH);
}
<YYINITIAL> {reservadaROWS} {
    return symbol(sym.ROWS);
}
<YYINITIAL> {reservadaHOUR} {
    return symbol(sym.HOUR);
}
<YYINITIAL> {reservadaCASCADED} {
    return symbol(sym.CASCADED);
}
<YYINITIAL> {reservadaSCROLL} {
    return symbol(sym.SCROLL);
}
<YYINITIAL> {reservadaIMMEDIATE} {
    return symbol(sym.IMMEDIATE);
}
<YYINITIAL> {reservadaSECOND} {
    return symbol(sym.SECOND);
}
<YYINITIAL> {reservadaCAST} {
    return symbol(sym.CAST);
}
<YYINITIAL> {reservadaSECTION} {
    return symbol(sym.SECTION);
}
<YYINITIAL> {reservadaCATALOG} {
    return symbol(sym.CATALOG);
}
<YYINITIAL> {reservadaINCLUDE} {
    return symbol(sym.INCLUDE);
}
<YYINITIAL> {reservadaCHAR} {
    return symbol(sym.CHAR);
}
<YYINITIAL> {reservadaSESSION} {
    return symbol(sym.SESSION);
}
<YYINITIAL> {reservadaCHAR_LENGTH} {
    return symbol(sym.CHAR_LENGTH);
}
<YYINITIAL> {reservadaINDICATOR} {
    return symbol(sym.INDICATOR);
}
<YYINITIAL> {reservadaCHARACTER} {
    return symbol(sym.CHARACTER);
}
<YYINITIAL> {reservadaINITIALLY} {
    return symbol(sym.INITIALLY);
}
<YYINITIAL> {reservadaCHARACTER_LENGTH} {
    return symbol(sym.CHARACTER_LENGTH);
}
<YYINITIAL> {reservadaSIZE} {
    return symbol(sym.SIZE);
}
<YYINITIAL> {reservadaINPUT} {
    return symbol(sym.INPUT);
}
<YYINITIAL> {reservadaSMALLINT} {
    return symbol(sym.SMALLINT);
}
<YYINITIAL> {reservadaINSENSITIVE} {
    return symbol(sym.INSENSITIVE);
}
<YYINITIAL> {reservadaSPACE} {
    return symbol(sym.SPACE);
}
<YYINITIAL> {reservadaINT} {
    return symbol(sym.INT);
}
<YYINITIAL> {reservadaSQL} {
    return symbol(sym.SQL);
}
<YYINITIAL> {reservadaCOLLATION} {
    return symbol(sym.COLLATION);
}
<YYINITIAL> {reservadaINTEGER} {
    return symbol(sym.INTEGER);
}
<YYINITIAL> {reservadaSQLCA} {
    return symbol(sym.SQLCA);
}
<YYINITIAL> {reservadaSQLCODE} {
    return symbol(sym.SQLCODE);
}
<YYINITIAL> {reservadaINTERVAL} {
    return symbol(sym.INTERVAL);
}
<YYINITIAL> {reservadaSQLERROR} {
    return symbol(sym.SQLERROR);
}
<YYINITIAL> {reservadaCONNECT} {
    return symbol(sym.CONNECT);
}
<YYINITIAL> {reservadaSQLSTATE} {
    return symbol(sym.SQLSTATE);
}
<YYINITIAL> {reservadaCONNECTION} {
    return symbol(sym.CONNECTION);
}
<YYINITIAL> {reservadaSQLWARNING} {
    return symbol(sym.SQLWARNING);
}
<YYINITIAL> {reservadaISOLATION} {
    return symbol(sym.ISOLATION);
}
<YYINITIAL> {reservadaSUBSTRING} {
    return symbol(sym.SUBSTRING);
}
<YYINITIAL> {reservadaCONSTRAINTS} {
    return symbol(sym.CONSTRAINTS);
}
<YYINITIAL> {reservadaSUM} {
    return symbol(sym.SUM);
}
<YYINITIAL> {reservadaLANGUAGE} {
    return symbol(sym.LANGUAGE);
}
<YYINITIAL> {reservadaCORRESPONDING} {
    return symbol(sym.CORRESPONDING);
}
<YYINITIAL> {reservadaLAST} {
    return symbol(sym.LAST);
}
<YYINITIAL> {reservadaTEMPORARY} {
    return symbol(sym.TEMPORARY);
}
<YYINITIAL> {reservadaCOUNT} {
    return symbol(sym.COUNT);
}
<YYINITIAL> {reservadaLEADING} {
    return symbol(sym.LEADING);
}
<YYINITIAL> {reservadaTIME} {
    return symbol(sym.TIME);
}
<YYINITIAL> {reservadaLEVEL} {
    return symbol(sym.LEVEL);
}
<YYINITIAL> {reservadaTIMESTAMP} {
    return symbol(sym.TIMESTAMP);
}
<YYINITIAL> {reservadaTIMEZONE_HOUR} {
    return symbol(sym.TIMEZONE_HOUR);
}
<YYINITIAL> {reservadaLOCAL} {
    return symbol(sym.LOCAL);
}
<YYINITIAL> {reservadaTIMEZONE_MINUTE} {
    return symbol(sym.TIMEZONE_MINUTE);
}
<YYINITIAL> {reservadaLOWER} {
    return symbol(sym.LOWER);
}
<YYINITIAL> {reservadaMATCH} {
    return symbol(sym.MATCH);
}
<YYINITIAL> {reservadaTRAILING} {
    return symbol(sym.TRAILING);
}
<YYINITIAL> {reservadaMAX} {
    return symbol(sym.MAX);
}
<YYINITIAL> {reservadaMIN} {
    return symbol(sym.MIN);
}
<YYINITIAL> {reservadaTRANSLATE} {
    return symbol(sym.TRANSLATE);
}
<YYINITIAL> {reservadaDATE} {
    return symbol(sym.DATE);
}
<YYINITIAL> {reservadaMINUTE} {
    return symbol(sym.MINUTE);
}
<YYINITIAL> {reservadaTRANSLATION} {
    return symbol(sym.TRANSLATION);
}
<YYINITIAL> {reservadaDAY} {
    return symbol(sym.DAY);
}
<YYINITIAL> {reservadaMODULE} {
    return symbol(sym.MODULE);
}
<YYINITIAL> {reservadaTRIM} {
    return symbol(sym.TRIM);
}
<YYINITIAL> {reservadaMONTH} {
    return symbol(sym.MONTH);
}
<YYINITIAL> {reservadaVERDADERO} {
    return symbol(sym.VERDADERO);
}
<YYINITIAL> {reservadaDEC} {
    return symbol(sym.DEC);
}
<YYINITIAL> {reservadaNAMES} {
    return symbol(sym.NAMES);
}
<YYINITIAL> {reservadaDECIMAL} {
    return symbol(sym.DECIMAL);
}
<YYINITIAL> {reservadaNATURAL} {
    return symbol(sym.NATURAL);
}
<YYINITIAL> {reservadaUNKNOWN} {
    return symbol(sym.UNKNOWN);
}
<YYINITIAL> {reservadaNCHAR} {
    return symbol(sym.NCHAR);
}
<YYINITIAL> {reservadaDEFERRABLE} {
    return symbol(sym.DEFERRABLE);
}
<YYINITIAL> {reservadaNEXT} {
    return symbol(sym.NEXT);
}
<YYINITIAL> {reservadaUPPER} {
    return symbol(sym.UPPER);
}
<YYINITIAL> {reservadaDEFERRED} {
    return symbol(sym.DEFERRED);
}
<YYINITIAL> {reservadaNO} {
    return symbol(sym.NO);
}
<YYINITIAL> {reservadaUSAGE} {
    return symbol(sym.USAGE);
}
<YYINITIAL> {reservadaNONE} {
    return symbol(sym.NONE);
}
<YYINITIAL> {reservadaUSING} {
    return symbol(sym.USING);
}
<YYINITIAL> {reservadaDESCRIBE} {
    return symbol(sym.DESCRIBE);
}
<YYINITIAL> {reservadaVALUE} {
    return symbol(sym.VALUE);
}
<YYINITIAL> {reservadaDESCRIPTOR} {
    return symbol(sym.DESCRIPTOR);
}
<YYINITIAL> {reservadaDIAGNOSTICS} {
    return symbol(sym.DIAGNOSTICS);
}
<YYINITIAL> {reservadaNUMERIC} {
    return symbol(sym.NUMERIC);
}
<YYINITIAL> {reservadaVARCHAR} {
    return symbol(sym.VARCHAR);
}
<YYINITIAL> {reservadaDISCONNECT} {
    return symbol(sym.DISCONNECT);
}
<YYINITIAL> {reservadaOCTET_LENGTH} {
    return symbol(sym.OCTET_LENGTH);
}
<YYINITIAL> {reservadaDOMAIN} {
    return symbol(sym.DOMAIN);
}
<YYINITIAL> {reservadaONLY} {
    return symbol(sym.ONLY);
}
<YYINITIAL> {reservadaWHENEVER} {
    return symbol(sym.WHENEVER);
}
<YYINITIAL> {reservadaWORK} {
    return symbol(sym.WORK);
}
<YYINITIAL> {reservadaENDEXEC} {
    return symbol(sym.ENDEXEC);
}
<YYINITIAL> {reservadaWRITE} {
    return symbol(sym.WRITE);
}
<YYINITIAL> {reservadaYEAR} {
    return symbol(sym.YEAR);
}
<YYINITIAL> {reservadaOUTPUT} {
    return symbol(sym.OUTPUT);
}
<YYINITIAL> {reservadaZONE} {
    return symbol(sym.ZONE);
}
<YYINITIAL> {reservadaEXCEPTION} {
    return symbol(sym.EXCEPTION);
}
<YYINITIAL> {int} {
    return symbol(sym.DatoEntero);
}
<YYINITIAL> {float} {
    return symbol(sym.DatoFloat);
}
<YYINITIAL> {floatExp} {
    return symbol(sym.DatoFloat);
}
<YYINITIAL> {bit} {
    return symbol(sym.DatoBit);
}
<YYINITIAL> {string} {
    return symbol(sym.DatoString);
}
<YYINITIAL> {stringError} {
    return symbol(sym.StringNoCerrado);
}
<YYINITIAL> {identificador} {
    if (yytext().length() <= 31) {
        return symbol(sym.Identificador);
    } else {
        
    }
}
<YYINITIAL> {comentarioSimple} {
    
}
<COMENTARIOMULTI> {
    ([*])+[/] {
        _cadenaComentario.append(yytext());
        _comentarioActivo = false;
        yybegin(YYINITIAL);
        _cadenaComentario = new StringBuffer();
    }
    <<EOF>> {
        
    }
    . {
        _cadenaComentario.append(yytext());
    }
    \n {
        _cadenaComentario.append(yytext());
    }
}
{suma} {
    return symbol(sym.Mas);
}
{resta} {
    return symbol(sym.Menos);
}
{multi} {
    return symbol(sym.Multiplicacion);
}
{division} {
    return symbol(sym.Division);
}
{mod} {
    return symbol(sym.Modulo);
}
{meIg} {
    return symbol(sym.MenorIgual);
}
{doubCorch} {
    return symbol(sym.Corchetes);
}
{doubLlave} {
    return symbol(sym.Llaves);
}
{doubParen} {
    return symbol(sym.Parentesis);
}
{maIg} {
    return symbol(sym.MayorIgual);
}
{asignacion} {
    return symbol(sym.Igual);
}
{mayor} {
    return symbol(sym.Mayor);
}
{menor} {
    return symbol(sym.Menor);
}
{igualComp} {
    return symbol(sym.IgualIgual);
}
{diferente} {
    return symbol(sym.Diferente);
}
{and} {
    return symbol(sym.And);
}
{or} {
    return symbol(sym.Or);
}
{not} {
    return symbol(sym.Not);
}
{endLine} {
    return symbol(sym.PuntoComa);
}
{coma} {
    return symbol(sym.Coma);
}
{punto} {
    return symbol(sym.Punto);
}
{corcheteAbrir} {
    return symbol(sym.CorcheteAbrir);
}
{corcheteCerrar} {
    return symbol(sym.CorcheteCerrar);
}
{parenAbrir} {
    return symbol(sym.ParentesisAbrir);
}
{parenCerrar} {
    return symbol(sym.ParentesisCerrar);
}
{llaveAbrir} {
    return symbol(sym.LlaveAbrir);
}
{llaveCerrar} {
    return symbol(sym.LlaveCerrar);
}
{arroba} {
    return symbol(sym.Arroba);
}
{dobHasht} {
    return symbol(sym.DobleNumeral);
}
{hast} {
    return symbol(sym.Numeral);
}
<YYINITIAL> {tab} {
    
}
<YYINITIAL> {carrete} {
    
}
<YYINITIAL> {salto} {
    
}
<YYINITIAL> {espacio} {
    
}
[^] {
    
}