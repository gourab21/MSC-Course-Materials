%{
#include <stdio.h>
#include <ctype.h>

// Function to check if a character is a vowel
int isVowel(char c) {
    c = tolower(c);
    return (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u');
}
%}

WORD        [a-zA-Z]+
WHITESPACE  [ \t\n]+

%%

{WORD}      {
                if (isVowel(yytext[0])) {
                    fprintf(yyout, "%sing", yytext);  // Vowel: add "ing"
                } else {
                    fprintf(yyout, "%sly", yytext);   // Consonant: add "ly"
                }
            }
{WHITESPACE} { fprintf(yyout, "%s", yytext); }  // Preserve whitespace
.            { fprintf(yyout, "%c", yytext[0]); }  // Copy non-letters unchanged

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

    yyin = input_file;    // Set input file
    yyout = output_file;  // Set output file
    yylex();             // Process the input

    fclose(input_file);
    fclose(output_file);
    return 0;
}

