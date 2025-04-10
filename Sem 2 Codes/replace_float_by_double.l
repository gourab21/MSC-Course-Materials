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

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <input_file> <output_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        fprintf(stderr, "Error: Cannot open input file %s\n", argv[1]);
        return 1;
    }

    FILE *output_file = fopen(argv[2], "w");
    if (!output_file) {
        fprintf(stderr, "Error: Cannot open output file %s\n", argv[2]);
        fclose(input_file);
        return 1;
    }

    yyin = input_file;
    yyout = output_file;
    yylex();

    fclose(input_file);
    fclose(output_file);
    return 0;
}

