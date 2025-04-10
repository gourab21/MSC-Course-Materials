%{
#include <stdio.h>
#include <stdlib.h>

// Function to check if a number is prime
int isPrime(int num) {
    if (num <= 1) return 0;  // 0 and 1 are not prime
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) return 0;  // Not prime if divisible
    }
    return 1;  // Prime if no divisors found
}
%}

DIGIT   [0-9]
NUMBER  {DIGIT}+

%%

{NUMBER}    { 
                int num = atoi(yytext);  // Convert string to integer
                if (isPrime(num)) {
                    printf("%d is a prime number\n", num);
                } else {
                    printf("%d is not a prime number\n", num);
                }
            }
[ \t\n]+    { /* Ignore whitespace */ }
.           { printf("Invalid input: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a number to check if it's prime (Ctrl+D to exit):\n");
    yylex();
    return 0;
}

