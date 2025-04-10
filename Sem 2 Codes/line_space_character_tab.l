%{
#include <stdio.h>

int line_count = 0, space_count = 0, char_count = 0, tab_count = 0;
%}

%%
\n      { line_count++; char_count++; }
[ ]     { space_count++; char_count++; }
\t      { tab_count++; char_count++; }
.       { char_count++; }

%%

int main() {
    printf("Enter text (Ctrl+D to end input on Linux/Mac, Ctrl+Z on Windows):\n");
    yylex();
    printf("Lines: %d\nSpaces: %d\nTabs: %d\nCharacters: %d\n", line_count, space_count, tab_count, char_count);
    return 0;
}

int yywrap() {
    return 1;
}
