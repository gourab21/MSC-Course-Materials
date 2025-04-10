%{
#include <stdio.h>
int number_count = 0;
%}

DIGIT   [0-9]
NUMBER  -?{DIGIT}+

%%

{NUMBER}    { 
                number_count++;
                printf("Integer %d: %s\n", number_count, yytext); 
            }
[ \t\n]+    { /* Ignore whitespace */ }
.           { /* Ignore all other characters */ }

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

    yyin = input_file;
    yylex();
    fclose(input_file);
    
    printf("\nTotal integers found: %d\n", number_count);
    return 0;
}
