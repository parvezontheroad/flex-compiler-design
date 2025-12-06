%{
#include <stdio.h>

int keyword_count = 0;
int bracket_count = 0; 
%}

%option noyywrap

%%

[0-9]+                       { printf("NUMBER: %s\n", yytext); }
[0-9]+\.[0-9]+               { printf("DECIMAL: %s\n", yytext); }

char|double|return|void      { 
                                printf("KEYWORD: %s\n", yytext); 
                                keyword_count++;   
                              }

[a-zA-Z_][a-zA-Z0-9_]*       { printf("NAME: %s\n", yytext); }

[ \t\r\n]+                   { }

[+\-*/=<>!]+                 { printf("OPERATORS: %s\n", yytext); }

[\(\)\{\};]                  { 
                                printf("BRACKETS: %s\n", yytext);
                                bracket_count++;
                              }

.                            { printf("UNDEFINED: %s\n", yytext); }

%%

int main() {
    yyin = fopen("lex.txt", "r");
    yylex();

    printf("\nTotal Keywords Found: %d\n", keyword_count);
    printf("Total Brackets Found: %d\n", bracket_count);

    return 0;
}
