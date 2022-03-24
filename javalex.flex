%%
%int
%%
"/*"([^*]|"*"+[^/*])*"*"+"/"  { jZero.comment(); }
"//".*\r?\n                   { jZero.comment(); }
[ \t\r\f]+                    { jZero.whitespace(); }
\n                            { jZero.newline(); }
"break"                       { return jZero.scan(parser.BREAK); }
"double"                      { return jZero.scan(parser.DOUBLE); }
"else"                        { return jZero.scan(parser.ELSE); }
"false"                       { return jZero.scan(parser.BOOLLIT); }
"for"                         { return jZero.scan(parser.FOR); }
"if"                          { return jZero.scan(parser.IF); }
"int"                         { return jZero.scan(parser.INT); }
"null"                        { return jZero.scan(parser.NULLVAL); }
"return"                      { return jZero.scan(parser.RETURN); }
"string"                      { return jZero.scan(parser.STRING); }
"true"                        { return jZero.scan(parser.BOOLLIT); }
"bool"                        { return jZero.scan(parser.BOOL); }
"void"                        { return jZero.scan(parser.VOID); }
"while"                       { return jZero.scan(parser.WHILE); }
"class"                       { return jZero.scan(parser.CLASS); }
"static"                      { return jZero.scan(parser.STATIC); }
"public"                      { return jZero.scan(parser.PUBLIC); }
"("                           { return jZero.scan(jZero.ord("(")); }
")"                           { return jZero.scan(jZero.ord(")")); }
"["                           { return jZero.scan(jZero.ord("[")); }
"]"                           { return jZero.scan(jZero.ord("]")); }
"{"                           { return jZero.scan(jZero.ord("{")); }
"}"                           { return jZero.scan(jZero.ord("}")); }
";"                           { return jZero.scan(jZero.ord(";")); }
":"                           { return jZero.scan(jZero.ord(":")); }
"!"                           { return jZero.scan(jZero.ord("!")); }
"*"                           { return jZero.scan(jZero.ord("*")); }
"/"                           { return jZero.scan(jZero.ord("/")); }
"%"                           { return jZero.scan(jZero.ord("%")); }
"+"                           { return jZero.scan(jZero.ord("+")); }
"-"                           { return jZero.scan(jZero.ord("-")); }
"<"                           { return jZero.scan(jZero.ord("<")); }
"<="                          { return jZero.scan(parser.LESSTHANOREQUAL); }
">"                           { return jZero.scan(jZero.ord(">")); }
">="                          { return jZero.scan(parser.GREATERTHANOREQUAL); }
"=="                          { return jZero.scan(parser.ISEQUALTO); }
"!="                          { return jZero.scan(parser.NOTEQUALTO); }
"&&"                          { return jZero.scan(parser.LOGICALAND); }
"||"                          { return jZero.scan(parser.LOGICALOR); }
"="                           { return jZero.scan(jZero.ord("=")); }
"+="                          { return jZero.scan(parser.INCREMENT); }
"-="                          { return jZero.scan(parser.DECREMENT); }
","                           { return jZero.scan(jZero.ord(",")); }
"."                           { return jZero.scan(jZero.ord(".")); }
[a-zA-Z_] [a-zA-Z0-9_]*       { return jZero.scan(parser.IDENTIFIER); }
[0-9]+                        { return jZero.scan(parser.INTLIT); }
[0-9]+"."[0-9]*([eE][+-]?[0-9]+)?   { return jZero.scan(parser.DOUBLELIT); }
[0-9]*"."[0-9]+([eE][+-]?[0-9]+)?   { return jZero.scan(parser.DOUBLELIT); }
([0-9]+)([eE][+-]?([0-9]+))         { return jZero.scan(parser.DOUBLELIT); }
\"([^\"])|(\\.)*\"                  { return jZero.scan(parser.STRINGLIT); }
.                                   { jZero.lexErr("Unrecognized character"); }