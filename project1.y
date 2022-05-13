%{
#include<stdlib.h>
#define YYERROR_VERBOSE 1
void yyerror(char* err);
%}


%token KEYWORD NUMBER WHITESPACE DOT

%%
S : A { printf("\nThese Sentences are Valid. \n\n"); exit(0); }
;
A : E E D | E G Q
;
D : F A | K
;
K : A
;
E : KEYWORD WHITESPACE 
;
G : KEYWORD
;
F : NUMBER WHITESPACE
;
Q : DOT | 
;
%%

void yyerror(char *err) {
printf("Error: Invalid sentence");
exit(1);
}

int main() {
printf("Enter sentences to calculate simple interest:\n");
yyparse();
}