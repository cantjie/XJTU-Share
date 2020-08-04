%{
#include <stdio.h>
int chars, words, rows,maxColumn=0,columns;
%}
%option yylineno
%%
[ \t]                  
\n         {
             rows++;
             if(maxColumn<columns){
                maxColumn=columns;
             }
             columns=0;
           } 
[^ \t\n]+  {
             words++;
             chars+=yyleng;
             columns+=yyleng;
            }
%%
int main()
{
	yyin=fopen("test.cl","r");
	yylex();
    printf("chars=%d, words=%d, rows=%d, columns=%d\n", chars, words, rows ,maxColumn);
   return 0;
}

