%{
#include <stdio.h>
#include <string.h>
%}

/* Define keywords */
KEYWORD    "int"|"float"|"if"|"else"|"while"|"return"|"void"|"char"|"for"|"do"|"break"|"continue"|"switch"|"case"|"default"|"static"|"const"|"struct"|"typedef"
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*

%%

{KEYWORD}    { printf("Keyword: %s\n", yytext); }
{IDENTIFIER} { printf("Identifier: %s\n", yytext); }

[ \t\n]+    ;  /* Ignore whitespace */
.           ;  /* Ignore other characters */

%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error opening file");
            return 1;
        }
        yyin = file;
    }
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

