%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	#include "y.tab.h";
%}
Keyword "principal"|"is"|"rate"|"of"|"interest"|"time"|"SI"|"then"
Digit   [0-9]+
Int     {Digit}+
eos     "."
ws      [ \t\n]
%%
{Keyword} {printf("Keyword - %s\n",yytext);return KEYWORD;}
{Int}     {printf("Integer - %s\n",yytext);return NUMBER;}
{eos}     {printf("End of sentence - %s\n",yytext);return DOT;}
{ws}      {return WHITESPACE;}
.         {printf("Invalid Token : %s\n",yytext); return *yytext;}
%%

int yywrap()
{return 1;}