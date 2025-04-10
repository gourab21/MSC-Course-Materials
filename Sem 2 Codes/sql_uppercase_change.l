%{
#include <stdio.h>
int keyword_count = 0;
%}

 /* Case-insensitive patterns for SQL keywords */
SELECT  [Ss][Ee][Ll][Ee][Cc][Tt]
FROM    [Ff][Rr][Oo][Mm]
WHERE   [Ww][Hh][Ee][Rr][Ee]
INSERT  [Ii][Nn][Ss][Ee][Rr][Tt]

%%

{SELECT}    { printf("Found keyword %d: %s\n", ++keyword_count, yytext); }
{FROM}      { printf("Found keyword %d: %s\n", ++keyword_count, yytext); }
{WHERE}     { printf("Found keyword %d: %s\n", ++keyword_count, yytext); }
{INSERT}    { printf("Found keyword %d: %s\n", ++keyword_count, yytext); }
[ \t\n]+    { /* Ignore whitespace */ }
.           { /* Ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        fprintf(stderr, "Error: Cannot open input file %s\n", argv[1]);
        return 1;
    }

    yyin = input_file;    // Set Lex input to the file
    yylex();             // Process the input
    fclose(input_file);   // Close the file
    
    printf("\nTotal keywords found: %d\n", keyword_count);
    return 0;
}


