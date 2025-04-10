PROGRAM :

%{
#include <stdio.h>
#include <string.h>

int longest_word_len = 0;
char longest_word[1000];
int current_word_len = 0;
%}

WORD    [a-zA-Z]+
WHITESPACE [ \t]+
NEWLINE \n

%%

{WORD}      { 
                current_word_len = strlen(yytext); 
                if (current_word_len > longest_word_len) {
                    longest_word_len = current_word_len;
                    strcpy(longest_word, yytext);
                }
            }
{WHITESPACE} { /* Ignore whitespace */ }
{NEWLINE}    { 
                fprintf(yyout, "Longest word: '%s' (length: %d)\n", longest_word, longest_word_len);
                longest_word_len = 0;
                current_word_len = 0;
                longest_word[0] = '\0';
            }
.           { /* Ignore other characters */ }

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

    if (longest_word_len > 0) {
        fprintf(yyout, "Longest word in last line: '%s' (length: %d)\n", longest_word, longest_word_len);
    }

    fclose(input_file);
    fclose(output_file);
    return 0;
}
