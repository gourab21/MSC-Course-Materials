%{
#include <stdio.h>
%}

%%

"//".*                         { fprintf(yyout, "%s", yytext); }  // Single-line comment
"/*"([^*]|\*+[^*/])*\*+"/"     { fprintf(yyout, "%s", yytext); }  // Multi-line comment
\"([^"\\\n]|\\.)*\"            { fprintf(yyout, "%s", yytext); }  // String literal
"float"([^a-zA-Z0-9_])         { fprintf(yyout, "double%c", yytext[5]); } // Replace 'float' and preserve following character
[a-zA-Z_][a-zA-Z0-9_]*         { fprintf(yyout, "%s", yytext); }  // Identifiers
[ \t\n]+                       { fprintf(yyout, "%s", yytext); }  // Whitespace
.                              { fprintf(yyout, "%c", yytext[0]); } // All other single characters

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();  // Lex will read from stdin and write to stdout by default
    return 0;
}

