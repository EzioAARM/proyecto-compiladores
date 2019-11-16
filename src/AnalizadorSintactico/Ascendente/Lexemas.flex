package AnalizadorSintactico.Ascendente;
import java_cup.runtime.*;
import java.io.*;
import java.io.FileReader;
import AnalizadorLexico.MyToken;

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
%char
%function next_token
%state COMENTARIOMULTI
%full
%eofclose
%eofval{
    return symbol(sym.EOF, new MyToken("FinArchivo", "Fin", "EOF", yyline + 1, yylength() + 1, yycolumn + 1));
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
reservadaRETURNS = (RETURNS)


reservadasENCRYPTION_TYPE = (ENCRYPTION_TYPE)
reservadasPERSISTED = (PERSISTED)
reservadasHIDDEN = (HIDDEN)
reservadasMASKED = (MASKED)
reservadasSWITCH = (SWITCH)
reservadasENABLE = (ENABLE)
reservadasONLINE = (ONLINE)
reservadasOFFLINE = (OFFLINE)
reservadasGENERATED = (GENERATED)
reservadasALWAYS = (ALWAYS)
reservadasROW = (ROW)
reservadasSTART = (START)
reservadasPERIOD = (PERIOD)
reservadasSYSTEM_TIME = (SYSTEM_TIME)
reservadasPAD_INDEX = (PAD_INDEX)
reservadasSTATISTICS_INCREMENTAL = (STATISTICS_INCREMENTAL)
reservadasCOMPRESSION_DELAY = (COMPRESSION_DELAY)
reservadasDATA_COMPRESSION = (DATA_COMPRESSION)
reservadasPAGE = (PAGE)
reservadasCOLUMNSTORE = (COLUMNSTORE)
reservadasCOLUMNSTORE_ARCHIVE = (COLUMNSTORE_ARCHIVE)
reservadasCHANGE_TRACKING = (CHANGE_TRACKING)
reservadasTRACK_COLUMNS_UPDATED = (TRACK_COLUMNS_UPDATED)
reservadasSYSTEM_VERSIONING = (SYSTEM_VERSIONING)
reservadasFILESTREAM_ON = (FILESTREAM_ON)
reservadasHISTORY_TABLE = (HISTORY_TABLE)
reservadasDATA_CONSISTENCY_CHECK = (DATA_CONSISTENCY_CHECK)
reservadasHISTORY_RETENTION_PERIOD = (HISTORY_RETENTION_PERIOD)
reservadasINFINITE = (INFINITE)
reservadasDAYS = (DAYS)
reservadasWEEKS = (WEEKS)
reservadasMONTHS = (MONTHS)
reservadasYEARS = (YEARS)
reservadasWEEK = (WEEK)
reservadasLOCK_ESCALATION = (LOCK_ESCALATION)
reservadasAUTO = (AUTO)
reservadasFILETABLE_NAMESPACE = (FILETABLE_NAMESPACE)
reservadasFILETABLE_DIRECTORY = (FILETABLE_DIRECTORY)
reservadasREMOTE_DATA_ARCHIVE = (REMOTE_DATA_ARCHIVE)
reservadasOFF_WITHOUT_DATA_RECOVERY = (OFF_WITHOUT_DATA_RECOVERY)
reservadasMIGRATION_STATE = (MIGRATION_STATE)
reservadasFILTER_PREDICATE = (FILTER_PREDICATE)
reservadasINBOUND = (INBOUND)
reservadasOUTBOUND = (OUTBOUND)
reservadasPAUSED = (PAUSED)
reservadasMOVE = (MOVE)


%%
<YYINITIAL> [/]([*])+(.) {
    _cadenaComentario.append(yytext());
    _comentarioActivo = true;
    yybegin(COMENTARIOMULTI);
}
<YYINITIAL> {reservadaWITHIN} {
    return symbol(sym.WITHIN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
} 
<YYINITIAL> {reservadaADD} {
    return symbol(sym.ADD, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaALL} {
    return symbol(sym.ALL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaALTER} {
    return symbol(sym.ALTER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaAND} {
    return symbol(sym.AND, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaANY} {
    return symbol(sym.ANY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaAS} {
    return symbol(sym.AS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaASC} {
    return symbol(sym.ASC, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaAUTHORIZATION} {
    return symbol(sym.AUTHORIZATION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBACKUP} {
    return symbol(sym.BACKUP, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBEGIN} {
    return symbol(sym.BEGIN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBETWEEN} {
    return symbol(sym.BETWEEN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBREAK} {
    return symbol(sym.BREAK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBROWSE} {
    return symbol(sym.BROWSE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBULK} {
    return symbol(sym.BULK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBY} {
    return symbol(sym.BY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCASCADE} {
    return symbol(sym.CASCADE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCASE} {
    return symbol(sym.CASE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCHECK} {
    return symbol(sym.CHECK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCHECKPOINT} {
    return symbol(sym.CHECKPOINT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCLOSE} {
    return symbol(sym.CLOSE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCLUSTERED} {
    return symbol(sym.CLUSTERED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCOALESCE} {
    return symbol(sym.COALESCE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCOLLATE} {
    return symbol(sym.COLLATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCOLUMN} {
    return symbol(sym.COLUMN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCOMMIT} {
    return symbol(sym.COMMIT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCOMPUTE} {
    return symbol(sym.COMPUTE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCONSTRAINT} {
    return symbol(sym.CONSTRAINT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCONTAINS} {
    return symbol(sym.CONTAINS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCONTAINSTABLE} {
    return symbol(sym.CONTAINSTABLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCONTINUE} {
    return symbol(sym.CONTINUE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCONVERT} {
    return symbol(sym.CONVERT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCREATE} {
    return symbol(sym.CREATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCROSS} {
    return symbol(sym.CROSS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT} {
    return symbol(sym.CURRENT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_DATE} {
    return symbol(sym.CURRENT_DATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_TIME} {
    return symbol(sym.CURRENT_TIME, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_TIMESTAMP} {
    return symbol(sym.CURRENT_TIMESTAMP, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCURRENT_USER} {
    return symbol(sym.CURRENT_USER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCURSOR} {
    return symbol(sym.CURSOR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDATABASE} {
    return symbol(sym.DATABASE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDBCC} {
    return symbol(sym.DBCC, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDEALLOCATE} {
    return symbol(sym.DEALLOCATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDECLARE} {
    return symbol(sym.DECLARE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDEFAULT} {
    return symbol(sym.DEFAULT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDELETE} {
    return symbol(sym.DELETE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDENY} {
    return symbol(sym.DENY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDESC} {
    return symbol(sym.DESC, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDISK} {
    return symbol(sym.DISK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDISTINCT} {
    return symbol(sym.DISTINCT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDISTRIBUTED} {
    return symbol(sym.DISTRIBUTED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDOUBLE} {
    return symbol(sym.DOUBLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDROP} {
    return symbol(sym.DROP, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDUMP} {
    return symbol(sym.DUMP, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaELSE} {
    return symbol(sym.ELSE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaEND} {
    return symbol(sym.END, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaERRLVL} {
    return symbol(sym.ERRLVL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaESCAPE} {
    return symbol(sym.ESCAPE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaEXCEPT} {
    return symbol(sym.EXCEPT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaEXEC} {
    return symbol(sym.EXEC, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaEXECUTE} {
    return symbol(sym.EXECUTE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaEXISTS} {
    return symbol(sym.EXISTS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaEXIT} {
    return symbol(sym.EXIT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaEXTERNAL} {
    return symbol(sym.EXTERNAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFETCH} {
    return symbol(sym.FETCH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFILE} {
    return symbol(sym.FILE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFILLFACTOR} {
    return symbol(sym.FILLFACTOR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFOR} {
    return symbol(sym.FOR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFOREIGN} {
    return symbol(sym.FOREIGN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFREETEXT} {
    return symbol(sym.FREETEXT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFREETEXTTABLE} {
    return symbol(sym.FREETEXTTABLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFROM} {
    return symbol(sym.FROM, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFULL} {
    return symbol(sym.FULL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFUNCTION} {
    return symbol(sym.FUNCTION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaGOTO} {
    return symbol(sym.GOTO, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaGRANT} {
    return symbol(sym.GRANT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaGROUP} {
    return symbol(sym.GROUP, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaHAVING} {
    return symbol(sym.HAVING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaHOLDLOCK} {
    return symbol(sym.HOLDLOCK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaIDENTITY} {
    return symbol(sym.IDENTITY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaIDENTITY_INSERT} {
    return symbol(sym.IDENTITY_INSERT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaIDENTITYCOL} {
    return symbol(sym.IDENTITYCOL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaIF} {
    return symbol(sym.IF, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaIN} {
    return symbol(sym.IN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINDEX} {
    return symbol(sym.INDEX, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINNER} {
    return symbol(sym.INNER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINSERT} {
    return symbol(sym.INSERT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINTERSECT} {
    return symbol(sym.INTERSECT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINTO} {
    return symbol(sym.INTO, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaIS} {
    return symbol(sym.IS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaJOIN} {
    return symbol(sym.JOIN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaKEY} {
    return symbol(sym.KEY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaKILL} {
    return symbol(sym.KILL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLEFT} {
    return symbol(sym.LEFT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLIKE} {
    return symbol(sym.LIKE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLINENO} {
    return symbol(sym.LINENO, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLOAD} {
    return symbol(sym.LOAD, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaMERGE} {
    return symbol(sym.MERGE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNATIONAL} {
    return symbol(sym.NATIONAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNOCHECK} {
    return symbol(sym.NOCHECK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNOCLUSTERED} {
    return symbol(sym.NOCLUSTERED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNOT} {
    return symbol(sym.NOT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNULL} {
    return symbol(sym.NULL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNULLIF} {
    return symbol(sym.NULLIF, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOF} {
    return symbol(sym.OF, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOFF} {
    return symbol(sym.OFF, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOFFSETS} {
    return symbol(sym.OFFSETS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaON} {
    return symbol(sym.ON, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOPEN} {
    return symbol(sym.OPEN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOPENDATASOURCE} {
    return symbol(sym.OPENDATASOURCE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOPENQUERY} {
    return symbol(sym.OPENQUERY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOPENXML} {
    return symbol(sym.OPENXML, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOPTION} {
    return symbol(sym.OPTION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOR} {
    return symbol(sym.OR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaORDER} {
    return symbol(sym.ORDER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOUTER} {
    return symbol(sym.OUTER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOVER} {
    return symbol(sym.OVER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPERCENT} {
    return symbol(sym.PERCENT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPIVOT} {
    return symbol(sym.PIVOT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPLAN} {
    return symbol(sym.PLAN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPRECISION} {
    return symbol(sym.PRECISION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPRIMARY} {
    return symbol(sym.PRIMARY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPRINT} {
    return symbol(sym.PRINT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPROC} {
    return symbol(sym.PROC, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPROCEDURE} {
    return symbol(sym.PROCEDURE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPUBLIC} {
    return symbol(sym.PUBLIC, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaRAISERROR} {
    return symbol(sym.RAISERROR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaREAD} {
    return symbol(sym.READ, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaREADTEXT} {
    return symbol(sym.READTEXT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaRECONFIGURE} {
    return symbol(sym.RECONFIGURE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaREFERENCES} {
    return symbol(sym.REFERENCES, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaREPLICATION} {
    return symbol(sym.REPLICATION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaRESTORE} {
    return symbol(sym.RESTORE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaRESTRICT} {
    return symbol(sym.RESTRICT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaRETURN} {
    return symbol(sym.RETURN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaREVERT} {
    return symbol(sym.REVERT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaREVOKE} {
    return symbol(sym.REVOKE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaRIGHT} {
    return symbol(sym.RIGHT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaROLLBACK} {
    return symbol(sym.ROLLBACK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaROWCOUNT} {
    return symbol(sym.ROWCOUNT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaROWGUIDCOL} {
    return symbol(sym.ROWGUIDCOL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaRULE} {
    return symbol(sym.RULE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSAVE} {
    return symbol(sym.SAVE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSCHEMA} {
    return symbol(sym.SCHEMA, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSECURITYAUDIT} {
    return symbol(sym.SECURITYAUDIT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSELECT} {
    return symbol(sym.SELECT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSEMANTICKEYPHRASETABLE} {
    return symbol(sym.SEMANTICKEYPHRASETABLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSEMANTICSIMILARITYDETAILSTABLE} {
    return symbol(sym.SEMANTICSIMILARITYDETAILSTABLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSEMANTICSIMILARITYTABLE} {
    return symbol(sym.SEMANTICSIMILARITYTABLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSESSION_USER} {
    return symbol(sym.SESSION_USER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSET} {
    return symbol(sym.SET, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSETUSER} {
    return symbol(sym.SETUSER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSHUTDOWN} {
    return symbol(sym.SHUTDOWN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSOME} {
    return symbol(sym.SOME, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSTATISTICS} {
    return symbol(sym.STATISTICS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSYSTEM_USER} {
    return symbol(sym.SYSTEM_USER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTABLE} {
    return symbol(sym.TABLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTABLESAMPLE} {
    return symbol(sym.TABLESAMPLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTEXTSIZE} {
    return symbol(sym.TEXTSIZE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTHEN} {
    return symbol(sym.THEN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTO} {
    return symbol(sym.TO, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTOP} {
    return symbol(sym.TOP, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTRAN} {
    return symbol(sym.TRAN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTRANSACTION} {
    return symbol(sym.TRANSACTION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTRIGGER} {
    return symbol(sym.TRIGGER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTRUNCATE} {
    return symbol(sym.TRUNCATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTRY_CONVERT} {
    return symbol(sym.TRY_CONVERT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTSEQUAL} {
    return symbol(sym.TSEQUAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUNION} {
    return symbol(sym.UNION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUNIQUE} {
    return symbol(sym.UNIQUE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUNPIVOT} {
    return symbol(sym.UNPIVOT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUPDATE} {
    return symbol(sym.UPDATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUPDATETEXT} {
    return symbol(sym.UPDATETEXT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUSE} {
    return symbol(sym.USE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUSER} {
    return symbol(sym.USER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaVALUES} {
    return symbol(sym.VALUES, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaVARYING} {
    return symbol(sym.VARYING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaVIEW} {
    return symbol(sym.VIEW, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaWAITFOR} {
    return symbol(sym.WAITFOR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaWHEN} {
    return symbol(sym.WHEN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaWHERE} {
    return symbol(sym.WHERE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaWHILE} {
    return symbol(sym.WHILE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaWITH} {
    return symbol(sym.WITH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaWRITETEXT} {
    return symbol(sym.WRITETEXT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaABSOLUTE} {
    return symbol(sym.ABSOLUTE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOVERLAPS} {
    return symbol(sym.OVERLAPS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaACTION} {
    return symbol(sym.ACTION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPAD} {
    return symbol(sym.PAD, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaADA} {
    return symbol(sym.ADA, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPARTIAL} {
    return symbol(sym.PARTIAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPASCAL} {
    return symbol(sym.PASCAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaEXTRACT} {
    return symbol(sym.EXTRACT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPOSITION} {
    return symbol(sym.POSITION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaALLOCATE} {
    return symbol(sym.ALLOCATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFALSO} {
    return symbol(sym.FALSO, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPREPARE} {
    return symbol(sym.PREPARE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFIRST} {
    return symbol(sym.FIRST, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPRESERVE} {
    return symbol(sym.PRESERVE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFLOAT} {
    return symbol(sym.FLOAT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaARE} {
    return symbol(sym.ARE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPRIOR} {
    return symbol(sym.PRIOR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaPRIVILEGES} {
    return symbol(sym.PRIVILEGES, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFORTRAN} {
    return symbol(sym.FORTRAN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaASSERTION} {
    return symbol(sym.ASSERTION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaFOUND} {
    return symbol(sym.FOUND, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaAT} {
    return symbol(sym.AT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaREAL} {
    return symbol(sym.REAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaAVG} {
    return symbol(sym.AVG, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaGET} {
    return symbol(sym.GET, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaGLOBAL} {
    return symbol(sym.GLOBAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaRELATIVE} {
    return symbol(sym.RELATIVE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaGO} {
    return symbol(sym.GO, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBIT} {
    return symbol(sym.BIT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBIT_LENGTH} {
    return symbol(sym.BIT_LENGTH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaBOTH} {
    return symbol(sym.BOTH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaROWS} {
    return symbol(sym.ROWS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaHOUR} {
    return symbol(sym.HOUR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCASCADED} {
    return symbol(sym.CASCADED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSCROLL} {
    return symbol(sym.SCROLL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaIMMEDIATE} {
    return symbol(sym.IMMEDIATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSECOND} {
    return symbol(sym.SECOND, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCAST} {
    return symbol(sym.CAST, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSECTION} {
    return symbol(sym.SECTION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCATALOG} {
    return symbol(sym.CATALOG, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINCLUDE} {
    return symbol(sym.INCLUDE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCHAR} {
    return symbol(sym.CHAR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSESSION} {
    return symbol(sym.SESSION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCHAR_LENGTH} {
    return symbol(sym.CHAR_LENGTH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINDICATOR} {
    return symbol(sym.INDICATOR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCHARACTER} {
    return symbol(sym.CHARACTER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINITIALLY} {
    return symbol(sym.INITIALLY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCHARACTER_LENGTH} {
    return symbol(sym.CHARACTER_LENGTH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSIZE} {
    return symbol(sym.SIZE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINPUT} {
    return symbol(sym.INPUT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSMALLINT} {
    return symbol(sym.SMALLINT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINSENSITIVE} {
    return symbol(sym.INSENSITIVE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSPACE} {
    return symbol(sym.SPACE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINT} {
    return symbol(sym.INT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSQL} {
    return symbol(sym.SQL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCOLLATION} {
    return symbol(sym.COLLATION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINTEGER} {
    return symbol(sym.INTEGER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSQLCA} {
    return symbol(sym.SQLCA, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSQLCODE} {
    return symbol(sym.SQLCODE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaINTERVAL} {
    return symbol(sym.INTERVAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSQLERROR} {
    return symbol(sym.SQLERROR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCONNECT} {
    return symbol(sym.CONNECT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSQLSTATE} {
    return symbol(sym.SQLSTATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCONNECTION} {
    return symbol(sym.CONNECTION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSQLWARNING} {
    return symbol(sym.SQLWARNING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaISOLATION} {
    return symbol(sym.ISOLATION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSUBSTRING} {
    return symbol(sym.SUBSTRING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCONSTRAINTS} {
    return symbol(sym.CONSTRAINTS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaSUM} {
    return symbol(sym.SUM, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLANGUAGE} {
    return symbol(sym.LANGUAGE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCORRESPONDING} {
    return symbol(sym.CORRESPONDING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLAST} {
    return symbol(sym.LAST, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTEMPORARY} {
    return symbol(sym.TEMPORARY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaCOUNT} {
    return symbol(sym.COUNT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLEADING} {
    return symbol(sym.LEADING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTIME} {
    return symbol(sym.TIME, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLEVEL} {
    return symbol(sym.LEVEL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTIMESTAMP} {
    return symbol(sym.TIMESTAMP, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTIMEZONE_HOUR} {
    return symbol(sym.TIMEZONE_HOUR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLOCAL} {
    return symbol(sym.LOCAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTIMEZONE_MINUTE} {
    return symbol(sym.TIMEZONE_MINUTE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaLOWER} {
    return symbol(sym.LOWER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaMATCH} {
    return symbol(sym.MATCH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTRAILING} {
    return symbol(sym.TRAILING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaMAX} {
    return symbol(sym.MAX, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaMIN} {
    return symbol(sym.MIN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTRANSLATE} {
    return symbol(sym.TRANSLATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDATE} {
    return symbol(sym.DATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaMINUTE} {
    return symbol(sym.MINUTE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTRANSLATION} {
    return symbol(sym.TRANSLATION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDAY} {
    return symbol(sym.DAY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaMODULE} {
    return symbol(sym.MODULE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaTRIM} {
    return symbol(sym.TRIM, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaMONTH} {
    return symbol(sym.MONTH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaVERDADERO} {
    return symbol(sym.VERDADERO, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDEC} {
    return symbol(sym.DEC, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNAMES} {
    return symbol(sym.NAMES, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDECIMAL} {
    return symbol(sym.DECIMAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNATURAL} {
    return symbol(sym.NATURAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUNKNOWN} {
    return symbol(sym.UNKNOWN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNCHAR} {
    return symbol(sym.NCHAR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDEFERRABLE} {
    return symbol(sym.DEFERRABLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNEXT} {
    return symbol(sym.NEXT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUPPER} {
    return symbol(sym.UPPER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDEFERRED} {
    return symbol(sym.DEFERRED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNO} {
    return symbol(sym.NO, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUSAGE} {
    return symbol(sym.USAGE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNONE} {
    return symbol(sym.NONE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaUSING} {
    return symbol(sym.USING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDESCRIBE} {
    return symbol(sym.DESCRIBE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaVALUE} {
    return symbol(sym.VALUE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDESCRIPTOR} {
    return symbol(sym.DESCRIPTOR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDIAGNOSTICS} {
    return symbol(sym.DIAGNOSTICS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaNUMERIC} {
    return symbol(sym.NUMERIC, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaVARCHAR} {
    return symbol(sym.VARCHAR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDISCONNECT} {
    return symbol(sym.DISCONNECT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOCTET_LENGTH} {
    return symbol(sym.OCTET_LENGTH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaDOMAIN} {
    return symbol(sym.DOMAIN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaONLY} {
    return symbol(sym.ONLY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaWHENEVER} {
    return symbol(sym.WHENEVER, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaWORK} {
    return symbol(sym.WORK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaENDEXEC} {
    return symbol(sym.ENDEXEC, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaWRITE} {
    return symbol(sym.WRITE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaYEAR} {
    return symbol(sym.YEAR, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaOUTPUT} {
    return symbol(sym.OUTPUT, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaZONE} {
    return symbol(sym.ZONE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaEXCEPTION} {
    return symbol(sym.EXCEPTION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {reservadaRETURNS} {
    return symbol(sym.RETURNS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
}




<YYINITIAL> {reservadasENCRYPTION_TYPE}
     {
         return symbol(sym.{ENCRYPTION_TYPE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasPERSISTED}
     {
         return symbol(sym.{PERSISTED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasHIDDEN}
     {
         return symbol(sym.{HIDDEN, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasMASKED}
     {
         return symbol(sym.{MASKED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasSWITCH}
     {
         return symbol(sym.{SWITCH, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasENABLE}
     {
         return symbol(sym.{ENABLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasONLINE}
     {
         return symbol(sym.{ONLINE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasOFFLINE}
     {
         return symbol(sym.{OFFLINE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasGENERATED}
     {
         return symbol(sym.{GENERATED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasALWAYS}
     {
         return symbol(sym.{ALWAYS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasROW}
     {
         return symbol(sym.{ROW, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasSTART}
     {
         return symbol(sym.{START, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasPERIOD}
     {
         return symbol(sym.{PERIOD, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasSYSTEM_TIME}
     {
         return symbol(sym.{SYSTEM_TIME, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasPAD_INDEX}
     {
         return symbol(sym.{PAD_INDEX, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasSTATISTICS_INCREMENTAL}
     {
         return symbol(sym.{STATISTICS_INCREMENTAL, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasCOMPRESSION_DELAY}
     {
         return symbol(sym.{COMPRESSION_DELAY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasDATA_COMPRESSION}
     {
         return symbol(sym.{DATA_COMPRESSION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasPAGE}
     {
         return symbol(sym.{PAGE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasCOLUMNSTORE}
     {
         return symbol(sym.{COLUMNSTORE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasCOLUMNSTORE_ARCHIVE}
     {
         return symbol(sym.{COLUMNSTORE_ARCHIVE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasCHANGE_TRACKING}
     {
         return symbol(sym.{CHANGE_TRACKING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasTRACK_COLUMNS_UPDATED}
     {
         return symbol(sym.{TRACK_COLUMNS_UPDATED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasSYSTEM_VERSIONING}
     {
         return symbol(sym.{SYSTEM_VERSIONING, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasFILESTREAM_ON}
     {
         return symbol(sym.{FILESTREAM_ON, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasHISTORY_TABLE}
     {
         return symbol(sym.{HISTORY_TABLE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasDATA_CONSISTENCY_CHECK}
     {
         return symbol(sym.{DATA_CONSISTENCY_CHECK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasHISTORY_RETENTION_PERIOD}
     {
         return symbol(sym.{HISTORY_RETENTION_PERIOD, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasINFINITE}
     {
         return symbol(sym.{INFINITE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasDAYS}
     {
         return symbol(sym.{DAYS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasWEEKS}
     {
         return symbol(sym.{WEEKS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasMONTHS}
     {
         return symbol(sym.{MONTHS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasYEARS}
     {
         return symbol(sym.{YEARS, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasWEEK}
     {
         return symbol(sym.{WEEK, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasLOCK_ESCALATION}
     {
         return symbol(sym.{LOCK_ESCALATION, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasAUTO}
     {
         return symbol(sym.{AUTO, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasFILETABLE_NAMESPACE}
     {
         return symbol(sym.{FILETABLE_NAMESPACE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasFILETABLE_DIRECTORY}
     {
         return symbol(sym.{FILETABLE_DIRECTORY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasREMOTE_DATA_ARCHIVE}
     {
         return symbol(sym.{REMOTE_DATA_ARCHIVE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasOFF_WITHOUT_DATA_RECOVERY}
     {
         return symbol(sym.{OFF_WITHOUT_DATA_RECOVERY, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasMIGRATION_STATE}
     {
         return symbol(sym.{MIGRATION_STATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasFILTER_PREDICATE}
     {
         return symbol(sym.{FILTER_PREDICATE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasINBOUND}
     {
         return symbol(sym.{INBOUND, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasOUTBOUND}
     {
         return symbol(sym.{OUTBOUND, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasPAUSED}
     {
         return symbol(sym.{PAUSED, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }
<YYINITIAL> {reservadasMOVE}
     {
         return symbol(sym.{MOVE, new MyToken(yytext(), yytext(), "Reservada", yyline + 1, yylength() + 1, yycolumn + 1));
     }



<YYINITIAL> {int} {
    return symbol(sym.DatoEntero, new MyToken("DatoEntero", yytext(), "Token", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {bit} {
    return symbol(sym.DatoBit, new MyToken("DatoBit", yytext(), "Token", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {float} {
    return symbol(sym.DatoFloat, new MyToken("DatoFloat", yytext(), "Token", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {floatExp} {
    return symbol(sym.DatoFloat, new MyToken("DatoFloat", yytext(), "Token", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {string} {
    return symbol(sym.DatoString, new MyToken("DatoString", yytext(), "Token", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {stringError} {
    return symbol(sym.StringNoCerrado, new MyToken("StringNoCerrado", yytext(), "Error", yyline + 1, yylength() + 1, yycolumn + 1));
}
<YYINITIAL> {identificador} {
    if (yytext().length() <= 31) {
        return symbol(sym.Identificador, new MyToken("Identificador", yytext(), "Token", yyline + 1, yylength() + 1, yycolumn + 1));
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
    return symbol(sym.Mas, new MyToken("Mas", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{resta} {
    return symbol(sym.Menos, new MyToken("Menos", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{multi} {
    return symbol(sym.Multiplicacion, new MyToken("Multiplicacion", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{division} {
    return symbol(sym.Division, new MyToken("Division", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{mod} {
    return symbol(sym.Modulo, new MyToken("Modulo", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{meIg} {
    return symbol(sym.MenorIgual, new MyToken("MenorIgual", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{doubCorch} {
    return symbol(sym.Corchetes, new MyToken("Corchetes", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{doubLlave} {
    return symbol(sym.Llaves, new MyToken("Llaves", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{doubParen} {
    return symbol(sym.Parentesis, new MyToken("Parentesis", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{maIg} {
    return symbol(sym.MayorIgual, new MyToken("MayorIgual", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{asignacion} {
    return symbol(sym.Igual, new MyToken("Igual", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{mayor} {
    return symbol(sym.Mayor, new MyToken("Mayor", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{menor} {
    return symbol(sym.Menor, new MyToken("Menor", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{igualComp} {
    return symbol(sym.IgualIgual, new MyToken("IgualIgual", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{diferente} {
    return symbol(sym.Diferente, new MyToken("Diferente", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{and} {
    return symbol(sym.And, new MyToken("And", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{or} {
    return symbol(sym.Or, new MyToken("Or", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{not} {
    return symbol(sym.Not, new MyToken("Not", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{endLine} {
    return symbol(sym.PuntoComa, new MyToken("PuntoComa", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{coma} {
    return symbol(sym.Coma, new MyToken("Coma", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{punto} {
    return symbol(sym.Punto, new MyToken("Punto", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{corcheteAbrir} {
    return symbol(sym.CorcheteAbrir, new MyToken("CorcheteAbrir", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{corcheteCerrar} {
    return symbol(sym.CorcheteCerrar, new MyToken("CorcheteAbrir", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{parenAbrir} {
    return symbol(sym.ParentesisAbrir, new MyToken("ParentesisAbrir", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{parenCerrar} {
    return symbol(sym.ParentesisCerrar, new MyToken("ParentesisCerrar", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{llaveAbrir} {
    return symbol(sym.LlaveAbrir, new MyToken("LlaveAbrir", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{llaveCerrar} {
    return symbol(sym.LlaveCerrar, new MyToken("LlaveCerrar", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{arroba} {
    return symbol(sym.Arroba, new MyToken("Arroba", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{hast} {
    return symbol(sym.Numeral, new MyToken("Numeral", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
}
{dobHasht} {
    return symbol(sym.DobleNumeral, new MyToken("DobleNumeral", yytext(), "Simbolo", yyline + 1, yylength() + 1, yycolumn + 1));
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
    //return symbol(sym.Error, new MyToken("ErrorInesperado", yytext(), "Error", yyline + 1, yylength() + 1, yycolumn + 1));
}