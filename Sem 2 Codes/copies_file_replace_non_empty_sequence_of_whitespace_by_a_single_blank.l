%{
#include <stdio.h>
%}

%%

[ \t\n]+    { printf(" "); }    /* Replace one or more whitespace chars with single space */
.           { printf("%c", yytext[0]); }    /* Print any other character as is */

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
