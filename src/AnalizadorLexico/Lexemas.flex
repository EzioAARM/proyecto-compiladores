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
%type MyToken
%init{

%init}
%eof{
    this._existenTokens = false;
%eof}
int = [0-9]
identificador = (([(a-zA-Z)]+[a-zA-Z_0-9]*){1,31})
float = [\d]+[.][\d]*((E|e)+([+]|-)*(\d)+[.]*[\d]*)*
bit = ((0|1)|NULL)+
string = '.*?'
espacios = [\t\r\n ]

%%

{int} {
    MyToken token = new MyToken("entero", yytext(), yyline, yycolumn, yycolumn);
    this._existenTokens = true;
    return token;
}
{identificador} {
    MyToken token = new MyToken("identificador", yytext(), yyline, yycolumn, yycolumn);
    this._existenTokens = true;
    return token;
}
{float} {
    MyToken token = new MyToken("float", yytext(), yyline, yycolumn, yycolumn);
    this._existenTokens = true;
    return token;
}
{bit} {
    MyToken token = new MyToken("booleano", yytext(), yyline, yycolumn, yycolumn);
    this._existenTokens = true;
    return token;
}
{string} {
    MyToken token = new MyToken("cadena", yytext(), yyline, yycolumn, yycolumn);
    this._existenTokens = true;
    return token;
}
{espacios} {
    // No hacer nada
}