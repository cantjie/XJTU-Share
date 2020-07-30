%{
#include<stdio.h>
int flag=0;
%}
%start AA BB CC
%option noyywrap
%%;
^a	{ECHO;BEGIN AA;}
^b	{ECHO;BEGIN BB;}
^c	{ECHO;BEGIN CC;}
<AA>magic	{printf("first");}
<BB>magic	{printf("second");}
<CC>magic	{printf("third");}
magic	{printf("zero");}
\n|(\t)+|" "+	{ECHO;BEGIN 0;}
%%
int main()
{
	yyin=fopen("text1","r");
	yylex();
}


