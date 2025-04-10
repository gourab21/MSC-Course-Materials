%{
#include <stdio.h>
int comment_count = 0;
%}

%%

"//".*                  { printf("Single-line comment %d: %s\n", ++comment_count, yytext); }
"/*"([^*]|\*+[^*/])*\*+"/"   { printf("Multi-line comment %d: %s\n", ++comment_count, yytext); }
.|\n                    { /* Ignore all other characters */ }

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
    
    printf("\nTotal number of comments found: %d\n", comment_count);
    return 0;
}

