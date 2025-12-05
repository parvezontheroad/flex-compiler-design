%{
#include <stdio.h>
%}

%option noyywrap

%%

[0-9]+                       { printf("NUMBER: %s\n", yytext); }
[0-9]+\.[0-9]+               { printf("DECIMAL: %s\n", yytext); }
char|double|return|void      { printf("KEYWORD: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*       { printf("NAME: %s\n", yytext); }
[ \t\r\n]+                   { /* Ignore whitespace */ }

[+\-*/=<>!]+                 { printf("OPERATORS: %s\n", yytext); }


[\(\)\{\};]                  { printf("BRACKETS: %s\n", yytext); }

.                            { printf("UNDEFINED: %s\n", yytext); }

%%

int main() {
    yyin = fopen("lex.txt", "r");
    yylex();
    return 0;
}
