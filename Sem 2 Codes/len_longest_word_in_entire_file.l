

%{
#include <stdio.h>
#include <string.h>

int current_word_len = 0;
int file_longest_word_len = 0;
char file_longest_word[1000];
%}

WORD       [a-zA-Z]+
WHITESPACE [ \t\n]+

%%

{WORD}      { 
                current_word_len = strlen(yytext); 
                if (current_word_len > file_longest_word_len) {
                    file_longest_word_len = current_word_len;
                    strcpy(file_longest_word, yytext);
                }
            }
{WHITESPACE} { /* Ignore whitespace */ }
.            { /* Ignore other characters */ }

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

    if (file_longest_word_len > 0) {
        fprintf(yyout, "Longest word in file: '%s' (length: %d)\n", file_longest_word, file_longest_word_len);
    } else {
        fprintf(yyout, "No valid word found in the file.\n");
    }

    fclose(input_file);
    fclose(output_file);
    return 0;
}

*/
